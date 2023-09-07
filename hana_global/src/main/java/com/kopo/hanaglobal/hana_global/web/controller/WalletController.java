package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
//@SessionAttributes("currentMember")
public class WalletController {
    private AccountService accountService;
    private MemberService memberService;
    private WalletService walletService;

    @Autowired
    public WalletController(AccountService accountService, MemberService memberService, WalletService walletService) {
        this.accountService = accountService;
        this.memberService = memberService;
        this.walletService = walletService;
    }

    @GetMapping("/topUp")
    public String getWalletInfo(){
        System.out.println("wallet 충전 페이지입니다");
        return "/wallet/topUp";
    }

}
