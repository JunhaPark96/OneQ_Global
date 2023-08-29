package com.kopo.hanaglobal.hana_global.web.controller;

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
        System.out.println("현재 멤버는 " + member.toString());
        List<Account> accountList = accountService.findAccountByMemberId(member.getUserSeq());
        for (Account account : accountList){
            System.out.println(account.toString());
        }
        model.addAttribute("accountList", accountList);
        return "account_details";
    }
}
