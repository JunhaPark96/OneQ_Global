package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.dto.request.CurrencyRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;
import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.ExchangeService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@SessionAttributes("currentMember")
public class ExchangeController {
    private AccountService accountService;
    private MemberService memberService;
    private WalletService walletService;
    private ExchangeService exchangeService;

    @Autowired
    public ExchangeController(AccountService accountService, MemberService memberService, WalletService walletService, ExchangeService exchangeService) {
        this.accountService = accountService;
        this.memberService = memberService;
        this.walletService = walletService;
        this.exchangeService = exchangeService;
    }

    @PostMapping("/exchange")
    @ResponseBody
    public List<ExchangeRateHistDTO> getExchangeRateHist(@RequestBody ExchangeRateHistRequestDTO requestDTO) {
        List<ExchangeRateHistDTO> exchangeRateHistList = exchangeService.getExchangeRateHist(requestDTO);
        return exchangeRateHistList;
    }

    @PostMapping("/exchange/lastSixMonths")
    @ResponseBody
    public List<ExchangeRateHistDTO> getExchangeRateForLastSixMonths(@RequestBody CurrencyRequestDTO request) {
        List<ExchangeRateHistDTO> exchangeRateHistList = exchangeService.getExchangeRateForLastSixMonths(request);
        for (ExchangeRateHistDTO e : exchangeRateHistList) {
            System.out.println("최근 6개월간 내역은: " + e.toString());
        }
        return exchangeRateHistList;
    }

    @GetMapping("/doExchange")
    public String doExchange(){
        return "/wallet/doExchange";
    }

}