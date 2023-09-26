package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.ExchangeRate;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.entity.Wallet;
import com.kopo.hanaglobal.hana_global.web.mapping.CountryCurrencyMapping;
import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.ExchangeService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
@SessionAttributes("currentMember")
public class RemittanceController {
    private AccountService accountService;
    private MemberService memberService;
    private WalletService walletService;
    private ExchangeService exchangeService;

    @Autowired
    public RemittanceController(AccountService accountService, MemberService memberService, WalletService walletService, ExchangeService exchangeService) {
        this.accountService = accountService;
        this.memberService = memberService;
        this.walletService = walletService;
        this.exchangeService = exchangeService;
    }

    @GetMapping("/remittance")
    public String transfer(@ModelAttribute("currentMember") Member member,
                           @RequestParam(value = "selectedCurrency", required = false) String selectedCurrency,
                           Model model) {
        System.out.println("remittance 페이지");
        List<Account> accountList = accountService.findAccountByMemberId(member.getUserSeq());
        model.addAttribute("accountList", accountList);

        String defaultCurrencyCode = CountryCurrencyMapping.getCurrencyCodeByCountryCode(member.getCountrySP());

        if (selectedCurrency != null && !selectedCurrency.trim().isEmpty()) {
            // 사용자가 특정 외화 월렛을 선택한 경우, 해당 통화를 기본 통화로 설정
            defaultCurrencyCode = selectedCurrency;
        }
        System.out.println("통화는 " + defaultCurrencyCode);

        model.addAttribute("defaultCurrencyCode", defaultCurrencyCode);

        Wallet walletKRW = walletService.findWalletByUserSeqAndCurrencyCode(member.getUserSeq(), "KRW");
        model.addAttribute("walletKRW", walletKRW);

        List<ExchangeRate> exchangeRateList = exchangeService.getExchangeRate();
        model.addAttribute("exchangeList", exchangeRateList);
        return "remittance/remittance";
    }
}
