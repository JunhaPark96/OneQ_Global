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
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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

//        Wallet walletKRW = walletService.findWalletByUserSeqAndCurrencyCode(member.getUserSeq(), "KRW");
        List<Wallet> walletList = walletService.findWalletByMemberId(member.getUserSeq());
        model.addAttribute("walletList", walletList);

        List<ExchangeRate> exchangeRateList = exchangeService.getExchangeRate();
//        for (ExchangeRate e : exchangeRateList){
//            System.out.println("오늘의 환율은 " + e);
//        }
        model.addAttribute("exchangeList", exchangeRateList);
        return "remittance/remittance";
    }

    @PostMapping("selectCountryAndPayment")
    public ResponseEntity<Map<String, String>> selectCountryAndPayment
            (@RequestParam("selectedCountry") String country, @RequestParam("selectedPaymentMethod") String payment){
        Map<String, String> responseMap = new HashMap<>();
        responseMap.put("selectedCountry", country);
        responseMap.put("selectedPaymentMethod", payment);
        System.out.println("선택된 국가와 결제방식은 : " + country + " " + payment);
        return ResponseEntity.ok().body(responseMap);
    }

//    @PostMapping("/verifyAccount")
//    public ResponseEntity<Map<String, Object>> verifyAccount(
//            @RequestParam("account_password") String accountPassword,
//            @RequestParam("account_no") String accountNo,
//            @RequestParam("account_balance") String balance) {
//
//        Map<String, Object> response = new HashMap<>();
//        // ... 비밀번호와 계좌 잔액 확인 로직
//        boolean isPasswordCorrect = ...;  // 비밀번호 확인 로직
//        boolean isBalanceSufficient = ...;  // 계좌 잔액 확인 로직
//
//        if (isPasswordCorrect && isBalanceSufficient) {
//            response.put("success", true);
//        } else {
//            response.put("success", false);
//            response.put("errorMessage", "The password is incorrect or the account balance is insufficient.");
//        }
//        return ResponseEntity.ok().body(response);
//    }



    @PostMapping("/selectAccountInfo")
    public ResponseEntity<Map<String, String>> selectAccountInfo(
            @RequestParam("recipientName") String recipientName,
            @RequestParam("address") String address,
            @RequestParam("routingNo") String routingNo,
            @RequestParam("accountNo") String accountNo) {

        Map<String, String> responseMap = new HashMap<>();
        responseMap.put("success", "true");
        responseMap.put("recipientName", recipientName);
        responseMap.put("address", address);
        responseMap.put("routingNo", routingNo);
        responseMap.put("accountNo", accountNo);

        // Optionally, log or process the received information
        System.out.println("Received account info: " + responseMap.toString());

        return ResponseEntity.ok().body(responseMap);
    }

    @PostMapping("/selectPaymentPlaceInfo")
    public ResponseEntity<Map<String, String>> selectPaymentPlaceInfo(
            @RequestParam("recipientName") String recipientName,
            @RequestParam("address") String address,
            @RequestParam("paymentPlace") String paymentPlace) {

        Map<String, String> responseMap = new HashMap<>();
        responseMap.put("success", "true");
        responseMap.put("recipientName", recipientName);
        responseMap.put("address", address);
        responseMap.put("paymentPlace", paymentPlace);

        // Optionally, log or process the received information
        System.out.println("Received payment place info: " + responseMap.toString());

        return ResponseEntity.ok().body(responseMap);
    }
}
