package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Locale;

@Controller
public class MainController {
    private MemberService memberService;
    private AccountService accountService;
    private WalletService walletService;
    @Autowired
    public MainController(MemberService memberService, AccountService accountService, WalletService walletService) {
        this.memberService = memberService;
        this.accountService = accountService;
        this.walletService = walletService;
    }

    @GetMapping("/")
    public String index(Locale locale) {
        System.out.println("index페이지");
        System.out.println("index 페이지, 로케일: " + locale);
        return "index";
    }

    @GetMapping("/exchange")
    public String exchange() {
        System.out.println("exchange 페이지");
        return "exchange";
    }

    @GetMapping("/account")
    public String account() {
        System.out.println("account 페이지");
        return "account";
    }

    @GetMapping("/account_details")
    public String accountDetails() {
        System.out.println("account_details 페이지");
        return "account_details";
    }

    @GetMapping("/signUp_STEP1")
    public String signUp1() {
        System.out.println("signUp step1 get 페이지");
        return "member/signUp_STEP1";
    }

    @GetMapping("/signUp_STEP2")
    public String signUp2() {
        System.out.println("signUp step2 get 페이지");
        return "member/signUp_STEP2";
    }

    @PostMapping("/signUp_STEP2")
    public String signUp2(@RequestParam(name = "agreeYN", required = false) String agreeYN) {
        System.out.println("signUp step2 post 페이지");

        if ("Y".equals(agreeYN)) {
            return "member/signUp_STEP2";
        } else {
            return "member/signUp"; // 약관에 동의하지 않은 경우 다시 초기 페이지로 리다이렉트
        }
    }

    @GetMapping("/signUp_STEP3")
    public String signUp3() {
        System.out.println("signUp step3 get 페이지");
        return "member/signUp_STEP3";
    }
    @GetMapping("/error_page")
    public String error_page() {
        System.out.println("error_page get 페이지");
        return "error_page";
    }
    //      CoolSMS 이용 SMS 인증번호 요청
    @GetMapping("/sms")
    public ResponseEntity sendSMS(@RequestParam("phone") String phone, HttpSession session) {
        try {
            // SMS 전송
            memberService.getSmsCertificationNumber(phone, session);
            // 정상 전송됨
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to send SMS");
        }
    }

    //       사용자 입력 인증코드 검증
    @PostMapping("/sms")
    public ResponseEntity verifySmsCode(@RequestParam("phoneCodeInput") String phoneCodeInput, HttpSession session) {
        // SMS 전송
        if (memberService.isVerifySms(phoneCodeInput, session)) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid SMS code");
        }
    }


    @PostMapping("/signUp_STEP3")
    public String processSignUp3(
            @RequestParam("hiddenName") String name,
            @RequestParam("hiddenID") String foreignRegNo,
            @RequestParam("hiddenIssueDate") String issueDate,
            @RequestParam("hiddenStatus") String status,
            @RequestParam("hiddenLocKor") String locKor,
            @RequestParam("hiddenLocEng") String locEng,
            @RequestParam("hiddenCountry") String country,
            HttpSession session
    ) {
        System.out.println("Processing signUp step3 post");
        session.setAttribute("name", name);
        session.setAttribute("foreignRegNo", foreignRegNo);
        session.setAttribute("issueDate", issueDate);
        session.setAttribute("status", status);
        session.setAttribute("locKor", locKor);
        session.setAttribute("locEng", locEng);
        session.setAttribute("country", country);

        System.out.println("Name: " + session.getAttribute("name"));
        System.out.println("Foreign Registration Number: " + session.getAttribute("foreignRegNo"));
        System.out.println("Issue Date: " + session.getAttribute("issueDate"));
        System.out.println("Status: " + session.getAttribute("status"));
        System.out.println("Location (Korean): " + session.getAttribute("locKor"));
        System.out.println("Location (English): " + session.getAttribute("locEng"));
        System.out.println("Country: " + session.getAttribute("country"));

        return "member/signUp_STEP3";
    }

    @GetMapping("/signUp_STEP4")
    public String signUp4() {
        System.out.println("signUp step4 페이지");
        return "member/signUp_STEP4";
    }

    @PostMapping("/signUp_STEP4")
    public String processSignUp4(
            @RequestParam("userName") String name,
            @RequestParam("foreignRegNo") String foreignRegNo,
            @RequestParam("birthDate") String birthDate,
            @RequestParam("gender") String gender,
            @RequestParam("mobileDigit") String mobileDigit,
            @RequestParam("emailId") String emailId,
            @RequestParam("nationality") String nationality,
            @RequestParam("countryCode") String countryCode,
            @RequestParam("roadAddress") String roadAddress,
            @RequestParam("jibunAddress") String jibunAddress,
            @RequestParam("detailAddress") String detailAddress,
            HttpSession session
    ) {
        System.out.println("Processing signUp step4");
        System.out.println("name = " + name + ", foreignRegNo = " + foreignRegNo + ", gender = " + gender + ", mobileDigit = " + mobileDigit + ", emailId = " + emailId + ", nationality = " + nationality + ", countryCode = " + countryCode + ", roadAddress = " + roadAddress + ", jibunAddress = " + jibunAddress + ", detailAddress = " + detailAddress + ", session = " + session);
        String determinedGender = Integer.parseInt(gender) % 2 == 0 ? "F" : "M";
        String fullYear = birthDate.substring(0, 1).equals("0") ? "20" + birthDate : "19" + birthDate;
        String formattedDate = fullYear.substring(0, 4) + "-" + fullYear.substring(4, 6) + "-" + fullYear.substring(6);

        session.setAttribute("name", name);
        session.setAttribute("foreignRegNo", foreignRegNo);
        session.setAttribute("birthDate", formattedDate);
        session.setAttribute("gender", determinedGender);
        session.setAttribute("mobileDigit", mobileDigit);
        session.setAttribute("emailId", emailId);
        session.setAttribute("nationality", nationality);
        session.setAttribute("countryCode", countryCode);
        session.setAttribute("roadAddress", roadAddress);
        session.setAttribute("jibunAddress", jibunAddress);
        session.setAttribute("detailAddress", detailAddress);
        // 여기서 form으로부터 받은 데이터를 처리

        System.out.println("성별: " + session.getAttribute("gender"));
        System.out.println("생년월일: " + session.getAttribute("birthDate"));
        return "member/signUp_STEP4";
    }

    @GetMapping("/signUp_STEP5")
    public String signUp5() {
        System.out.println("signUp step5 get 페이지");
        return "member/signUp_STEP5";
    }

    @Transactional
    @PostMapping("/signUp_STEP5")
    public String processSignUp5(
            @RequestParam("userId") String userId,
            @RequestParam("userPasswd") String userPasswd,
            @RequestParam("acPasswd") String acPasswd,
            HttpSession session
    ) {
        System.out.println("Processing signUp step5");

        String emailId = (String) session.getAttribute("emailId");
        String name = (String) session.getAttribute("name");
        String foreignRegNo = (String) session.getAttribute("foreignRegNo");
        foreignRegNo = foreignRegNo.replace("-", "");
        String birthDate = (String) session.getAttribute("birthDate");
        String gender = (String) session.getAttribute("gender");
        String mobileDigit = (String) session.getAttribute("mobileDigit");
        String nationality = (String) session.getAttribute("nationality");
        String countryCode = (String) session.getAttribute("countryCode");
        String roadAddress = (String) session.getAttribute("roadAddress");
        String jibunAddress = (String) session.getAttribute("jibunAddress");
        String detailAddress = (String) session.getAttribute("detailAddress");

        // 회원 생성
        memberService.signUp(emailId, userId, userPasswd, name, foreignRegNo, birthDate, gender, mobileDigit, roadAddress, jibunAddress, detailAddress, nationality, countryCode);
        System.out.println("회원정보: " + memberService.toString());
        // 계좌 생성
        int userSeq = memberService.findUserSeqByID(userId);
        System.out.println("userSeq: " + userSeq);
        accountService.createNewAccount(acPasswd, userSeq);
        System.out.println("계좌정보: " + accountService.toString());
        // 월렛 생성
        Account account = accountService.findAccountByUserSeq(userSeq);
        walletService.createNewWallet(userSeq, account.getAcNo(), "000000");
        System.out.println("월렛정보: " + walletService.toString());
        return "member/signUp_STEP5";
    }

    // 로그아웃
    @GetMapping("/signout")
    public String signOut(HttpSession session){
        session.invalidate();
        System.out.println("로그아웃 완료");
        return "redirect:/";
    }
}