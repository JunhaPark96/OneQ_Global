package com.kopo.hanaglobal.hana_global.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class MainController {

    @GetMapping("/")
    public String index() {
        System.out.println("index페이지");
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

    //    @GetMapping("/myAccount")
//    public String myAccount() {
//        System.out.println("myAccount 페이지");
//        return "myAccount";
//    }
    @GetMapping("/account_details")
    public String accountDetails() {
        System.out.println("account_details 페이지");
        return "account_details";
    }
//    @GetMapping("/accountTransfer")
//    public String accountTransfer() {
//        System.out.println("account_transfer 페이지");
//        return "account_transfer";
//    }

    @GetMapping("/transfer")
    public String transfer() {
        System.out.println("transfer 페이지");
        return "transfer";
    }

//    @GetMapping("/signUp")
//    public String signUp() {
//        System.out.println("signUp 페이지");
//        return "member/signUp";
//    }

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

    @PostMapping("/signUp_STEP3")
    public String processSignUp3(
            @RequestParam("hiddenName") String name,
            @RequestParam("hiddenID") String foreignRegNo,
            HttpSession session
    ) {
        System.out.println("Processing signUp step3 post");
        session.setAttribute("name", name);
        session.setAttribute("foreignRegNo", foreignRegNo);
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


        session.setAttribute("name", name);
        session.setAttribute("foreignRegNo", foreignRegNo);
        session.setAttribute("gender", determinedGender);
        session.setAttribute("mobileDigit", mobileDigit);
        session.setAttribute("emailId", emailId);
        session.setAttribute("nationality", nationality);
        session.setAttribute("countryCode", countryCode);
        session.setAttribute("roadAddress", roadAddress);
        session.setAttribute("jibunAddress", jibunAddress);
        session.setAttribute("detailAddress", detailAddress);
        // 여기서 form으로부터 받은 데이터를 처리할 수 있습니다.

        System.out.println("성별: " + session.getAttribute("gender"));
        return "member/signUp_STEP4";
    }

    @GetMapping("/signUp_STEP5")
    public String signUp5() {
        System.out.println("signUp step5 get 페이지");
        return "member/signUp_STEP5";
    }

}