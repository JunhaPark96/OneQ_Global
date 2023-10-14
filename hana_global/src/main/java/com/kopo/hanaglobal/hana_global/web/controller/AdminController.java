package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.entity.Wallet;
import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.ExchangeService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;
import java.util.stream.Collectors;

@Controller
@SessionAttributes("currentMember")
public class AdminController {
    private MemberService memberService;
    private AccountService accountService;
    private WalletService walletService;
    private ExchangeService exchangeService;

    @Autowired
    public AdminController(MemberService memberService, AccountService accountService, WalletService walletService, ExchangeService exchangeService) {
        this.memberService = memberService;
        this.accountService = accountService;
        this.walletService = walletService;
        this.exchangeService = exchangeService;
    }

    @GetMapping("/userManagement")
    public String getUserManagement(Model model) {
        List<Member> memberList = memberService.getMemberAll();
        Map<Integer, Account> firstAccountForMembers = new HashMap<>();
        Map<String, Integer> countryMemberCounts = new HashMap<>();  // 국가별 회원 수를 저장할 맵
        for (Member member : memberList) {
            // 멤버의 국가별로 카운트 증가
            System.out.println("회원 국가는 " + member.getNationality());
            countryMemberCounts.put(member.getNationality(), countryMemberCounts.getOrDefault(member.getNationality(), 0) + 1);
            Account firstAccount = accountService.findFirstAccountByMemberId(member.getUserSeq());
            firstAccountForMembers.put(member.getUserSeq(), firstAccount);
            System.out.println(firstAccountForMembers.toString());
        }
        List<Map.Entry<String, Integer>> list = new ArrayList<>(countryMemberCounts.entrySet());
        // 국가별 회원 수를 value 기반으로 내림차순 정렬하고 상위 4개만 선택
        countryMemberCounts = countryMemberCounts.entrySet()
                .stream()
                .sorted((entry1, entry2) -> entry2.getValue().compareTo(entry1.getValue())) // 내림차순 정렬
                .limit(4) // 상위 4개 항목만 선택
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        Map.Entry::getValue,
                        (oldValue, newValue) -> oldValue,
                        LinkedHashMap::new // 순서 보장
                ));
        // 국가별 회원 수 상위 4개의 나라와 그들의 회원 수 출력
        for (Map.Entry<String, Integer> entry : countryMemberCounts.entrySet()) {
            System.out.println("Country: " + entry.getKey() + ", Members: " + entry.getValue());
        }
//        for (Member m : memberList){
//            System.out.println(m.toString());
//        }
        List<Account> accountList = accountService.getAccountAll();
        model.addAttribute("accountList", accountList);
        model.addAttribute("memberList", memberList);
        model.addAttribute("firstAccountForMembers", firstAccountForMembers);
        model.addAttribute("countryMemberCounts", countryMemberCounts);  // 국가별 회원 수를 모델에 추가
        return "admin/userManagement";
    }

    @PostMapping("approveMember")
    public ResponseEntity<Map<String, String>> approveMember(@RequestParam("userSeq") int userSeq) {
        Map<String, String> response = new HashMap<>();
        try {
            memberService.approveMember(userSeq);
            response.put("success", "true");
//            response.put("message", "Successfully approved!");
            response.put("message", "성공적으로 승인되었습니다!");
            // 권한을 승인하면 월렛도 자동생성
            Account account = accountService.findAccountByUserSeq(userSeq);
            walletService.createNewWallet(userSeq, account.getAcNo(), "123456");
            Wallet wallet = walletService.findWalletByUserSeqAndCurrencyCode(userSeq, "KRW");
            System.out.println("월렛정보는: " + wallet.toString());
        } catch (Exception e){
            response.put("success", "false");
//            response.put("message", "Failed to approve due to an exception.");
            response.put("message", "승인에 실패했습니다.");
        }
        return ResponseEntity.ok(response);
    }

}
