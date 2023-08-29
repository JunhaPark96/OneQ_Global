package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.dto.response.MemberAccDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AccountController {
    private AccountService accountService;
    private MemberService memberService;

    @Autowired
    public AccountController(AccountService accountService, MemberService memberService){
        this.accountService = accountService;
        this.memberService = memberService;
    }

//    @GetMapping("myAccount")
//    public String getAccountInfo(HttpSession session, Model model){
//        String memberId = (String) session.getAttribute("id");
//        MemberAccDTO memberAccDTO = accountService.
//        return accountService.findAccountByMemberId(memberId);
//    }

//    @PostMapping("/myAccount")
//    public String getAccountInfo(HttpSession session, Model model) {
//        Member member = (Member)session.getAttribute("currentMember");
//        System.out.println("현재 멤버는 " + member.toString());
//        List<MemberAccDTO> memberAccDTOList = accountService.findMemberAccounts(member.getUserSeq());
//        for (MemberAccDTO memberAccDTO : memberAccDTOList){
//            System.out.println(memberAccDTO.toString());
//        }
//        model.addAttribute("memberAccDTO", memberAccDTOList);
//        return "myAccount";
//    }

    @GetMapping("/accountInfo")
    public String AccountInfo(HttpSession session, Model model) {
        Member member = (Member)session.getAttribute("currentMember");
        System.out.println("현재 멤버는 " + member.toString());
        List<MemberAccDTO> memberAccDTOList = accountService.findMemberAccounts(member.getUserSeq());
        for (MemberAccDTO memberAccDTO : memberAccDTOList){
            System.out.println("멤버의 계좌 정보는 " + memberAccDTO.toString());
        }
        model.addAttribute("memberAccDTO", memberAccDTOList);
        return "myAccount";
    }
}
