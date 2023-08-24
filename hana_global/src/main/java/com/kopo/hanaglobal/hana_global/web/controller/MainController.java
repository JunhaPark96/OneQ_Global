package com.kopo.hanaglobal.hana_global.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
    @GetMapping("/myAccount")
    public String myAccount() {
        System.out.println("myAccount 페이지");
        return "myAccount";
    }
    @GetMapping("/account_details")
    public String accountDetails() {
        System.out.println("account_details 페이지");
        return "account_details";
    }
    @GetMapping("/account_transfer")
    public String accountTransfer() {
        System.out.println("account_transfer 페이지");
        return "account_transfer";
    }

    @GetMapping("/transfer")
    public String transfer() {
        System.out.println("transfer 페이지");
        return "transfer";
    }

    @GetMapping("/signUp")
    public String signUp() {
        System.out.println("signUp 페이지");
        return "signUp";
    }

    @GetMapping("/signUp_STEP1")
    public String signUp1() {
        System.out.println("signUp step1 get 페이지");
        return "signUp_STEP1";
    }

    @GetMapping("/signUp_STEP2")
    public String signUp2() {
        System.out.println("signUp step2 get 페이지");
        return "signUp_STEP2";
    }

    @PostMapping("/signUp_STEP2")
    public String signUp2(@RequestParam(name = "agreeYN", required = false) String agreeYN) {
        System.out.println("signUp step2 post 페이지");

        if ("Y".equals(agreeYN)) {
            return "signUp_STEP2";
        } else {
            return "signUp"; // 약관에 동의하지 않은 경우 다시 초기 페이지로 리다이렉트
        }
    }

    @GetMapping("/signUp_STEP3")
    public String signUp3() {
        System.out.println("signUp step3 get 페이지");
        return "signUp_STEP3";
    }

    @PostMapping("/signUp_STEP3")
    public String processSignUp3(
            @RequestParam Map<String, String> params,
            @RequestParam("idCardImage") MultipartFile idCardImage,
            @RequestParam("visaImage") MultipartFile visaImage,
            @RequestParam("passportImage") MultipartFile passportImage) {
        System.out.println("Processing signUp step3 post");
        return "signUp_STEP3";
    }

    @GetMapping("/signUp_STEP4")
    public String signUp4() {
        System.out.println("signUp step4 페이지");
        return "signUp_STEP4";
    }

    @PostMapping("/signUp_STEP4")
    public String processSignUp4(
            @RequestParam("userName") String name,
            @RequestParam("registerNo") String foreignRegNo,
            @RequestParam("birthdate") String birthdate,
            @RequestParam("countryCode") String countryCode,
            @RequestParam("nationality") String nationality,
            @RequestParam("gender") String gender,
            @RequestParam("mobilePrefix") String mobilePrefix,
            @RequestParam("mobileSuffix") String mobileSuffix,
            @RequestParam("postcode") String postcode,
            @RequestParam("roadAddress") String roadAddress,
            @RequestParam("jibunAddress") String jibunAddress,
            @RequestParam("detailAddress") String detailAddress,
            @RequestParam("extraAddress") String extraAddress
    ) {
        System.out.println("Processing signUp step4");

        // 여기서 form으로부터 받은 데이터를 처리할 수 있습니다.

        return "signUp_STEP4";
    }

    @GetMapping("/signUp_STEP5")
    public String signUp5() {
        System.out.println("signUp step5 get 페이지");
        return "signUp_STEP5";
    }

}