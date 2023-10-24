package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.dto.request.AutoExchangeDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.CurrencyRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.WalletHistoryDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.ExchangeRate;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.entity.Wallet;
import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.ExchangeService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.Period;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes("currentMember")
public class WalletController {
    private AccountService accountService;
    private MemberService memberService;
    private WalletService walletService;
    private ExchangeService exchangeService;

    @Autowired
    public WalletController(AccountService accountService, MemberService memberService, WalletService walletService, ExchangeService exchangeService) {
        this.accountService = accountService;
        this.memberService = memberService;
        this.walletService = walletService;
        this.exchangeService = exchangeService;
    }

    @GetMapping("/topUp")
    public String getWalletInfo() {
        System.out.println("wallet 자동 충전 페이지입니다");
        return "/wallet/topUp";
    }

    @GetMapping("/walletInfo")
    public String walletInfo(@ModelAttribute("currentMember") Member member, Model model) {
        Wallet wallet = walletService.findWalletByUserSeqAndCurrencyCode(member.getUserSeq(), "KRW");
        model.addAttribute("selectedWallet", wallet);
        // 최초의 월렛 비밀번호 설정
        if("000000".equals(wallet.getWalletPw())) {
            model.addAttribute("showPasswordModal", true);
        }

        System.out.println("현재 멤버는 : " + member.toString());
        List<Wallet> walletList = walletService.findWalletByMemberId(member.getUserSeq());
        for (Wallet w : walletList) {
            System.out.println("wallet 정보는: " + w.toString());
        }
        model.addAttribute("walletList", walletList);
        return "/wallet/walletInfo";
    }

    @PostMapping("loadWallet")
    @ResponseBody
    public ResponseEntity loadWallet(@ModelAttribute("currentMember") Member member, @RequestParam("loadAmount") Integer loadAmount, @RequestParam("walletPasswd") String walletPasswd) {
        try {
            walletService.loadWallet(member.getUserSeq(), loadAmount, walletPasswd);
            return ResponseEntity.ok().body("Load Success!");
        } catch (Exception e) {
            if(e.getMessage().equals("간편비밀번호가 틀렸습니다.")) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Incorrect quick password.");
            }
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @GetMapping("/recurExchange")
    public String getSelectedWallet(@ModelAttribute("currentMember") Member member, @RequestParam("currency") String currencyCode, Model model) {
        // 선택한 통화코드의 wallet 불러오기
        Wallet wallet = walletService.findWalletByUserSeqAndCurrencyCode(member.getUserSeq(), currencyCode);
        model.addAttribute("selectedWallet", wallet);
        // 하나월렛 불러오기
        Wallet walletKRW = walletService.findWalletByUserSeqAndCurrencyCode(member.getUserSeq(), "KRW");
        model.addAttribute("walletKRW", walletKRW);
        // 해당 통화 현재 환율 가져오기
        ExchangeRate exchangeRate = exchangeService.getExchangeRateByCurrency(currencyCode);
        model.addAttribute("currencyCode", exchangeRate);

        CurrencyRequestDTO requestDTO = new CurrencyRequestDTO(currencyCode);
        model.addAttribute("lowestRateThreeMonths", exchangeService.getExchangeRateForPeriod(requestDTO, Period.ofMonths(3)));
        model.addAttribute("lowestRateLastMonth", exchangeService.getExchangeRateForPeriod(requestDTO, Period.ofMonths(1)));
        model.addAttribute("lowestRateLastWeek", exchangeService.getExchangeRateForPeriod(requestDTO, Period.ofWeeks(1)));

        // 환율 그래프용 날짜
        LocalDate currentDate = LocalDate.now();
        model.addAttribute("currentDate", currentDate);
        return "/wallet/recurExchange"; // recurExchange.jsp 페이지로 이동
    }

    // 환율 새로고침
    @GetMapping("/getLatestExchangeRate")
    public ResponseEntity<Map<String, Object>> getExchangeRate(@ModelAttribute("currentMember") Member member, @RequestParam("currency") String currencyCode) {
        // 해당 통화 현재 환율 가져오기
        ExchangeRate exchangeRate = exchangeService.getExchangeRateByCurrency(currencyCode);

        Map<String, Object> result = new HashMap<>();
        result.put("baseRate", exchangeRate.getBaseRate());

        return ResponseEntity.ok(result);
    }

    @GetMapping("/walletTransactionDetail")
    public String walletTransactionDetail(@ModelAttribute("currentMember") Member member, Model model) {
        List<Wallet> walletList = walletService.findWalletByMemberId(member.getUserSeq());
        Wallet wallet = walletService.findWalletByUserSeqAndCurrencyCode(member.getUserSeq(), "KRW");
        model.addAttribute("walletList", walletList);
        model.addAttribute("wallet", wallet);
        System.out.println(wallet.toString());
        return "/wallet/walletTransactionDetail";
    }

    @PostMapping("/getWholeWalletHistory")
    public ResponseEntity<List<WalletHistoryDTO>> getWholeWalletHistory(@RequestBody Map<String, String> request) {
        String walletNo = request.get("walletNo");
        System.out.println(walletNo);
        int walletSeq = Integer.parseInt(walletNo);
        List<WalletHistoryDTO> walletHistoryDTOList = walletService.getWholeWalletHistory(walletSeq);
        for (WalletHistoryDTO w : walletHistoryDTOList) {
            System.out.println(w.toString());
        }
        return ResponseEntity.ok(walletHistoryDTOList);
    }
    
    // 자동환전내역
    @PostMapping("/getExchangeHist")
    public ResponseEntity<List<AutoExchangeDTO>> getExchangeHist(@RequestBody Map<String, String> request, @ModelAttribute("currentMember") Member member) {
        String walletNo = request.get("walletNo");
        System.out.println(walletNo);
        int walletSeq = Integer.parseInt(walletNo);
        List<AutoExchangeDTO> autoExchangeDTOList = walletService.getAutoExchangeListByWalletSeq(walletSeq);
//        for (AutoExchangeDTO w : autoExchangeDTOList) {
//            System.out.println(w.toString());
//        }
        return ResponseEntity.ok(autoExchangeDTOList);
    }

    // 자동환전 삭제
    @PostMapping("/removeAutoExchange")
    public ResponseEntity<Map<String, Object>> removeAutoExchange(
            @ModelAttribute("currentMember") Member member, @RequestParam("aeSeq") int aeSeq) {
        Map<String, Object> response = new HashMap<>();
        try {
            walletService.removeAutoExchange(aeSeq);
            response.put("success", true);
            response.put("message", "Successfully removed the auto exchange.");
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Failed to remove the auto exchange.");
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/changeWalletPassword")
    public ResponseEntity<Map<String, String>> changeWalletPassword(
            @ModelAttribute("currentMember") Member member, @RequestParam("walletPw") String walletPw){
        Map<String, String> response = new HashMap<>();
        int userSeq = member.getUserSeq();
        try {
            walletService.changeWalletPassword(walletPw, userSeq);
            response.put("status", "success");
            response.put("message", "비밀번호 변경 성공");
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "비밀번호 변경 중 오류 발생: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }

}
