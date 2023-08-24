package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/boardlist")
    public ModelAndView getMemberAll(){
        ModelAndView mav = new ModelAndView("/boardlist");
        List<Member> memberList = memberService.getMemberAll();
        mav.addObject("memberList", memberList);
        return mav;
    }
}
