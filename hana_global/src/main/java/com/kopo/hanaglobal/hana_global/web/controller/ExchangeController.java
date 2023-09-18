package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.dto.request.AutoExchangeDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.CurrencyRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;
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
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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

    //    navbar에서 환전 페이지 이동 시
//    @GetMapping("/doExchange")
//    public String doExchange(@ModelAttribute("currentMember") Member member, @RequestParam("currency") String currencyCode, Model model) {
//        List<Account> accountList = accountService.findAccountByMemberId(member.getUserSeq());
//        model.addAttribute("accountList", accountList);
//        model.addAttribute("defaultCurrency", currencyCode);
////        for (Account account : accountList){
////            System.out.println(account.toString());
////        }
//
////        List<Wallet> walletList = walletService.findWalletByMemberId(member.getUserSeq());
//        // 원화 통화 가져오기
//        Wallet walletKRW = walletService.findWalletByUserSeqAndCurrencyCode(member.getUserSeq(), "KRW");
//        model.addAttribute("walletKRW", walletKRW);
//        System.out.println(walletKRW.toString());
//
//        // 최신 환율 불러오기
//        List<ExchangeRate> exchangeRateList = exchangeService.getExchangeRate();
//        model.addAttribute("exchangeList", exchangeRateList);
////        for (ExchangeRate e : exchangeRateList){
////            System.out.println(e.toString());
////        }
//        return "/wallet/doExchange";
//    }
    @GetMapping("/doExchange")
    public String doExchange(
            @ModelAttribute("currentMember") Member member,
            @RequestParam(value = "selectedCurrency", required = false) String selectedCurrency,
            Model model) {

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

        return "/wallet/doExchange";
    }


    // myWallet 페이지에서 특정 통화클릭 후 페이지 이동 시


    // 원화에서 다른나라 통화로 환전
    @PostMapping("/walletInfo")
    public String fromKRWtoFCExchange(@ModelAttribute("currentMember") Member member,
                                      @RequestParam String walletSeq,
                                      @RequestParam String walletPw,
                                      @RequestParam String sourceCurrencyCode,
                                      @RequestParam Integer foreignAmount,
                                      @RequestParam Integer krwAmount,
                                      @RequestParam String sourceCurrencyName,
                                      Model model) {
        // 환전 서비스 메서드 호출
        walletService.doExchange(walletSeq, sourceCurrencyCode, walletPw, krwAmount, foreignAmount, sourceCurrencyName);


        // 월렛 페이지로 이동
        List<Wallet> walletList = walletService.findWalletByMemberId(member.getUserSeq());
        model.addAttribute("walletList", walletList);
        return "/wallet/walletInfo";
    }

    @PostMapping("/autoExchange")
    public String handleAutoExchange(@ModelAttribute("currentMember") Member member, @ModelAttribute AutoExchangeDTO autoExchangeDTO){
        walletService.insertAutoExchange(autoExchangeDTO);

        return "/wallet/walletInfo";
    }
}