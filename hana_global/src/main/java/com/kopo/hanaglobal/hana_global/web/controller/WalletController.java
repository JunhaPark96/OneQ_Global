package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.entity.Wallet;
import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@SessionAttributes("currentMember")
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
        System.out.println("wallet 자동 충전 페이지입니다");
        return "/wallet/topUp";
    }

    @GetMapping("/walletInfo")
    public String walletInfo(@ModelAttribute("currentMember")Member member, Model model){
        System.out.println("현재 멤버는 : " + member.toString());
        List<Wallet> walletList = walletService.findWalletByMemberId(member.getUserSeq());
        for (Wallet w : walletList){
            System.out.println("wallet 정보는: " + w.toString());
        }
        model.addAttribute("walletList", walletList);
        return "/wallet/walletInfo";
    }
    @PostMapping("loadWallet")
    @ResponseBody
    public ResponseEntity loadWallet(@ModelAttribute("currentMember") Member member, @RequestParam("loadAmount") Integer loadAmount, @RequestParam("walletPasswd") String walletPasswd){
        try {
            walletService.loadWallet(member.getUserSeq(), loadAmount, walletPasswd);
            return ResponseEntity.ok().body("충전 성공!");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
}
