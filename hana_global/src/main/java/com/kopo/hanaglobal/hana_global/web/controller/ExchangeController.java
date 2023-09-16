package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.dto.request.CurrencyRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.ExchangeRate;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.entity.Wallet;
import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.ExchangeService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

//    navbar에서 환전 페이지 이동 시
    @GetMapping("/doExchange")
    public String doExchange(@ModelAttribute("currentMember")Member member, Model model){
        List<Account> accountList = accountService.findAccountByMemberId(member.getUserSeq());
        model.addAttribute("accountList", accountList);
//        for (Account account : accountList){
//            System.out.println(account.toString());
//        }

//        List<Wallet> walletList = walletService.findWalletByMemberId(member.getUserSeq());
        // 원화 통화 가져오기
        Wallet walletKRW = walletService.findWalletByUserSeqAndCurrencyCode(member.getUserSeq(), "KRW");
        model.addAttribute("walletKRW", walletKRW);
        System.out.println(walletKRW.toString());

        // 최신 환율 불러오기
        List<ExchangeRate> exchangeRateList = exchangeService.getExchangeRate();
        model.addAttribute("exchangeList", exchangeRateList);
        for (ExchangeRate e : exchangeRateList){
            System.out.println(e.toString());
        }
        return "/wallet/doExchange";
    }

    // myWallet 페이지에서 특정 통화클릭 후 페이지 이동 시


    // 원화에서 다른나라 통화로 환전
    @PostMapping("/walletInfo")
    public String fromKRWtoFCExchange(
            @RequestParam String senderAccountNo,
            @RequestParam String account_password,
            @RequestParam String foreignCurrency,  // You might need to adjust the type or parameter name based on your frontend
            @RequestParam String krwAmount,  // You might need to adjust the type or parameter name based on your frontend
            Model model) {

        // 1. 패스워드 확인
        if (!walletService.checkPassword(senderAccountNo, account_password)) {
            model.addAttribute("errorMessage", "Invalid password.");
            return "/wallet/error";  // You might want to redirect to an error page
        }

        // 2. 계좌 또는 머니에서 원화 차감
        if (!accountService.deductAmount(senderAccountNo, krwAmount)) {
            model.addAttribute("errorMessage", "Insufficient funds in account or wallet.");
            return "/wallet/error";
        }

        // 3. wallet에 해당 통화가 없으면 추가, 있으면 충전
        walletService.addOrUpdateCurrencyToWallet(senderAccountNo, foreignCurrency);

        // 4. 머니에 돈이 있으면 충전, 없으면 연동된 계좌에서 확인 후, 있으면 충전, 없으면 거절.
        if (!walletService.rechargeWallet(senderAccountNo, krwAmount)) {
            if (!accountService.deductAmountFromLinkedAccount(senderAccountNo, krwAmount)) {
                model.addAttribute("errorMessage", "Insufficient funds in linked account.");
                return "/wallet/error";
            }
        }

        return "/wallet/walletInfo";
    }
}