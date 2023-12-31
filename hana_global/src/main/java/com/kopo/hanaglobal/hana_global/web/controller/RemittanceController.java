package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.Util.EmailService;
import com.kopo.hanaglobal.hana_global.web.dto.request.EmailDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.RemittanceDTO;
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

import java.math.BigDecimal;
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
    private EmailService emailService;

    @Autowired
    public RemittanceController(AccountService accountService, MemberService memberService, WalletService walletService, ExchangeService exchangeService, EmailService emailService) {
        this.accountService = accountService;
        this.memberService = memberService;
        this.walletService = walletService;
        this.exchangeService = exchangeService;
        this.emailService = emailService;
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
            (@RequestParam("selectedCountry") String country, @RequestParam("selectedPaymentMethod") String payment) {
        Map<String, String> responseMap = new HashMap<>();
        responseMap.put("selectedCountry", country);
        responseMap.put("selectedPaymentMethod", payment);
        System.out.println("선택된 국가와 결제방식은 : " + country + " " + payment);
        return ResponseEntity.ok().body(responseMap);
    }

    @PostMapping("/selectAccountInfo")
    public ResponseEntity<Map<String, String>> selectAccountInfo(
            @ModelAttribute RemittanceDTO remittanceDTO,
            @RequestParam("selectedCountry") String country) {

        String address = remittanceDTO.getAddress();
        String bankCode = remittanceDTO.getBankCode();
        String currencyCode = remittanceDTO.getCurrencyCode();
        Integer receivableAmount = remittanceDTO.getReceivableAmount();
        String recipient = remittanceDTO.getRecipient();
        String recipientAc = remittanceDTO.getRecipientAc();
        Integer remitAmount = remittanceDTO.getRemitAmount();
        String sender = remittanceDTO.getSender();
        String senderAc = remittanceDTO.getSenderAc();
        int walletSeq = remittanceDTO.getWalletSeq();

        System.out.println("주소는 " + address + " 은행코드는 " + bankCode + " 통화코드는 "
                + currencyCode + " 보낸외화금액은 " + receivableAmount + " 수령인은 "
                + recipient + " 수령인계좌번호는 " + recipientAc
                + " 보낸송금원화금액은 " + remitAmount + " 송금인은 " + sender + " 송금계좌는 " + senderAc + " 월렛번호는 " + walletSeq);


        // html 요소에 보여줄 데이터
        Map<String, String> responseMap = new HashMap<>();
        responseMap.put("success", "true");
        responseMap.put("currencyCode", remittanceDTO.getCurrencyCode());
        responseMap.put("receivableAmount", String.valueOf(remittanceDTO.getReceivableAmount()));
        responseMap.put("recipient", remittanceDTO.getRecipient());
        responseMap.put("country", country);
        responseMap.put("senderAc", remittanceDTO.getSenderAc());
        System.out.println("Received account info: " + responseMap.toString());
        return ResponseEntity.ok().body(responseMap);
    }

    @PostMapping("/selectPaymentPlaceInfo")
    public ResponseEntity<Map<String, String>> selectPaymentPlaceInfo(
            @ModelAttribute RemittanceDTO remittanceDTO) {

        int walletSeq = remittanceDTO.getWalletSeq();
        String sender = remittanceDTO.getSender();
        String recipient = remittanceDTO.getRecipient();
        String senderAc = remittanceDTO.getSenderAc();
        String recipientAc = remittanceDTO.getRecipientAc();
        Integer remitAmount = remittanceDTO.getRemitAmount();
        Integer receivableAmount = remittanceDTO.getReceivableAmount();
        String address = remittanceDTO.getAddress();
        String currencyCode = remittanceDTO.getCurrencyCode();
        String bankCode = remittanceDTO.getBankCode();
        String countryName = remittanceDTO.getCountryName();
        String paymentPlace = remittanceDTO.getPaymentPlace();

        System.out.println("주소는 " + address + " 은행코드는 " + bankCode + " 통화코드는 "
                + currencyCode + " 보낸외화금액은 " + receivableAmount + " 수령인은 "
                + recipient + " 수령인계좌번호는 " + recipientAc
                + " 보낸송금원화금액은 " + remitAmount + " 송금인은 " + sender + " 송금계좌는 " + senderAc + " 월렛번호는 " + walletSeq
                + " 나라이름은 " + countryName + " 수취장소는 " + paymentPlace);

        // 선택한 월렛에서 금액 차감
        // 해외송금 데이터 넣기
        walletService.doRemittance(remittanceDTO);

        Map<String, String> responseMap = new HashMap<>();
        responseMap.put("success", "true");
        responseMap.put("currencyCode", remittanceDTO.getCurrencyCode());
        responseMap.put("receivableAmount", String.valueOf(remittanceDTO.getReceivableAmount()));
        responseMap.put("recipient", remittanceDTO.getRecipient());
        responseMap.put("country", countryName);
        responseMap.put("senderAc", remittanceDTO.getSenderAc());
        responseMap.put("paymentPlace", paymentPlace);
        System.out.println("Received account info: " + responseMap.toString());

        return ResponseEntity.ok().body(responseMap);
    }

    @GetMapping("/remittanceTrace")
    public String remittanceTrance(@ModelAttribute("currentMember") Member member, Model model) {
        List<Wallet> walletList = walletService.findWalletByMemberId(member.getUserSeq());
        Map<Integer, List<RemittanceDTO>> remittanceMap = new HashMap<>();

        for (Wallet e : walletList) {
            List<RemittanceDTO> remittanceDTOList = walletService.getRemittanceListByWalletSeq(e.getWalletSeq());
            remittanceMap.put(e.getWalletSeq(), remittanceDTOList);
        }

        model.addAttribute("walletList", walletList);
        model.addAttribute("remittanceMap", remittanceMap);

        return "/remittance/remittanceTrace";
    }


    @PostMapping("/send-email")
    public String sendEmail(@RequestBody EmailDTO emailRequest) {
        emailService.sendEmail(emailRequest.getTo(), emailRequest.getSubject(), emailRequest.getContent());
        return "/remittance/remittanceTrace";
    }

    @GetMapping("/deliveryService")
    public String deliveryService(){
        return "/remittance/deliveryService";
    }

    @GetMapping("/deliveryComplete")
    public String deliveryComplete(){
        return "/remittance/deliveryComplete";
    }
}
