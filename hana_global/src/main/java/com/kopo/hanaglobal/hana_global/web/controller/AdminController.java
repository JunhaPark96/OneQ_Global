package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.ExchangeService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            countryMemberCounts.put(member.getNationality(), countryMemberCounts.getOrDefault(member.getNationality(), 0) + 1);

            Account firstAccount = accountService.findFirstAccountByMemberId(member.getUserSeq());
            firstAccountForMembers.put(member.getUserSeq(), firstAccount);
            System.out.println(firstAccountForMembers.toString());
        }
//        for (Member m : memberList){
//            System.out.println(m.toString());
//        }

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
            response.put("message", "Successfully approved!");
        } catch (Exception e){
            response.put("success", "false");
            response.put("message", "Failed to approve due to an exception.");
        }
        return ResponseEntity.ok(response);
    }

}
