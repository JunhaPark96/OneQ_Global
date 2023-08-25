package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.repository.MemberRepository;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.MemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MemberController {
    private MemberService memberService;
    @GetMapping("/boardlist")
    public ModelAndView getMemberAll(){
        ModelAndView mav = new ModelAndView("/boardlist");
        List<Member> memberList = memberService.getMemberAll();
        mav.addObject("memberList", memberList);
        return mav;
    }

    // 회원가입 페이지
    @GetMapping("/signup")
    public String signUp(Model model){
        model.addAttribute("Member", new Member());
        System.out.println("회원가입 페이지 이동");
        return "member/signUp";
    }
    // 로그인 모달
    /*@GetMapping("/signin")
    public String signIn(Model model){
        model.addAttribute("Member", new Member());
        System.out.println("회원가입 페이지 이동");
        return "member/signIn";
    }*/
}
