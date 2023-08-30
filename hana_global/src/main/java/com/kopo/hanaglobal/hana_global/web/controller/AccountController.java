package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.dto.response.AccountHistoryResponseDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.MemberAccDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes("currentMember")
public class AccountController {
    private AccountService accountService;
    private MemberService memberService;

    @Autowired
    public AccountController(AccountService accountService, MemberService memberService){
        this.accountService = accountService;
        this.memberService = memberService;
    }

    @GetMapping("/accountInfo")
    public String AccountInfo(@ModelAttribute("currentMember") Member member, Model model) {
//        Member member = (Member)session.getAttribute("currentMember");
        System.out.println("현재 멤버는 " + member.toString());
        List<MemberAccDTO> memberAccDTOList = accountService.findMemberAccounts(member.getUserSeq());
        for (MemberAccDTO memberAccDTO : memberAccDTOList){
            System.out.println("멤버의 계좌 정보는 " + memberAccDTO.toString());
        }
        model.addAttribute("memberAccDTO", memberAccDTOList);
        return "myAccount";
    }

    @GetMapping("/accountDetail")
    public String AccountDetail(@ModelAttribute("currentMember") Member member, Model model) {
//        Member member = (Member)session.getAttribute("currentMember");
//        System.out.println("현재 멤버는 " + member.toString());
        List<Account> accountList = accountService.findAccountByMemberId(member.getUserSeq());
        for (Account account : accountList){
            System.out.println(account.toString());
        }
        model.addAttribute("accountList", accountList);
        return "account_details";
    }

    @PostMapping("/accountDetail")
    @ResponseBody
    public List<AccountHistoryResponseDTO> getAccountDetail(
            @RequestParam("inqStrDt") String inqStrDt,
            @RequestParam("inqEndDt") String inqEndDt,
            @RequestParam("transactionType") String transactionType,
            @RequestParam("withdrawAccountNo") String withdrawAccountNo) {

        // Get the transaction history
        List<AccountHistoryResponseDTO> accHistoryList = accountService.getTransactionHistoryByAcNo(withdrawAccountNo);

        // Filter the transaction history by inqStrDt, inqEndDt and transactionType
        List<AccountHistoryResponseDTO> filteredList = new ArrayList<>();
//        System.out.println(inqStrDt);
//        System.out.println(inqEndDt);
        for (AccountHistoryResponseDTO a : accHistoryList) {
//            System.out.println("시작날짜" + a.getTradeDate().compareTo(inqStrDt));
//            System.out.println("종료날짜" + a.getTradeDate().compareTo(inqEndDt));
            System.out.println(transactionType);
            if (a.getTradeDate().compareTo(inqStrDt) >= 0 && a.getTradeDate().compareTo(inqEndDt) <= 0) {
                if (transactionType.equals("ALL") || a.getTransactionType().equals(transactionType)) {
//                    System.out.println("필터링된 거래내역" + a.toString());
                    filteredList.add(a);
                }
            }
        }

        // Return the filtered transaction history
        return filteredList;
    }

    @GetMapping("/accountTransfer")
    public String AccountTransfer(@ModelAttribute("currentMember") Member member, Model model) {
        System.out.println("현재 멤버는 " + member.toString());
        List<Account> accountList = accountService.findAccountByMemberId(member.getUserSeq());
        for (Account account : accountList){
            System.out.println(account.toString());
        }
        model.addAttribute("accountList", accountList);
        return "account_transfer";
    }

    @PostMapping("/accountTransfer")
    @ResponseBody
    public String transferProcess(
            @RequestParam("senderAccountNo") String senderAccountNo,
            @RequestParam("recipientAccountNo") String recipientAccountNo,
            @RequestParam("transfer_amount") Integer transfer_amount){

//        이체 기능
        try {
            accountService.accountTransfer(senderAccountNo, recipientAccountNo, transfer_amount);
            return "redirect:/transferComplete";
        } catch (Exception e) {
            e.printStackTrace();
            return "이체 실패: " + e.getMessage();
        }
    }

    @GetMapping("/transferComplete")
    public String transferComplete() {
        System.out.println("transfer완료 페이지");
        return "transferComplete";
    }
}
