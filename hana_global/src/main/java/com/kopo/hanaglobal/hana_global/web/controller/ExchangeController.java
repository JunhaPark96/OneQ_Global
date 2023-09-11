package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;
import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
@SessionAttributes("currentMember")
public class ExchangeController {
    private AccountService accountService;
    private MemberService memberService;
    private WalletService walletService;

    @Autowired
    public ExchangeController(AccountService accountService, MemberService memberService, WalletService walletService) {
        this.accountService = accountService;
        this.memberService = memberService;
        this.walletService = walletService;
    }

    @PostMapping("exchange")
    @ResponseBody
    public List<ExchangeRateHistDTO> getExchangeRateHist(@RequestBody ExchangeRateHistRequestDTO requestDTO){
        return null;
    }
}
