package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.dto.request.AutoExchangeDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.LoginDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.OpenAccountDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.entity.Wallet;
import com.kopo.hanaglobal.hana_global.web.ocr.ClovaOCRTemplate;
import com.kopo.hanaglobal.hana_global.web.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes("currentMember")
public class MemberController {
    private MemberService memberService;
    private AccountService accountService;
    private WalletService walletService;
    private ExchangeService exchangeService;

    @Autowired
    public MemberController(MemberService memberService, AccountService accountService, WalletService walletService, ExchangeService exchangeService) {
        this.memberService = memberService;
        this.accountService = accountService;
        this.walletService = walletService;
        this.exchangeService = exchangeService;
    }

    @GetMapping("/boardlist")
    public ModelAndView getMemberAll() {
        ModelAndView mav = new ModelAndView("/boardlist");
        List<Member> memberList = memberService.getMemberAll();
        mav.addObject("memberList", memberList);
        return mav;
    }

    // 회원가입 페이지
    @GetMapping("/signup")
    public String signUp(Model model) {
        model.addAttribute("Member", new Member());
        System.out.println("회원가입 페이지 이동");
        return "member/signUp";
    }

    @PostMapping("/authenticateAction")
    public ResponseEntity<Map<String, String>> authenticate(@RequestParam("image") MultipartFile imageFile) {
        // 업로드된 파일을 임시 파일에 저장
        File tempFile = new File("temp.png");
        try (OutputStream os = new FileOutputStream(tempFile)) {
            os.write(imageFile.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }

        // Clova OCR API 호출하여 response get
        Map<String, String> extractedData = ClovaOCRTemplate.extractText(tempFile.getAbsolutePath());
        System.out.println("Extracted Data: " + extractedData);
        // Delete the temporary file
        tempFile.delete();

        return ResponseEntity.ok(extractedData);
    }


    // Extract the necessary information from the OCR API response
    private Map<String, String> processResponse(String response) {
        Map<String, String> extractedData = new HashMap<>();
        // TODO: Extract the necessary information from the response and populate the extractedData map
        // For example:
        // extractedData.put("name", ...);
        // extractedData.put("id", ...);
        // extractedData.put("status", ...);
        // extractedData.put("issueDate", ...);
        return extractedData;
    }

    // 로그인 페이지
    @GetMapping("/signin")
    public String signIn(Model model) {
        model.addAttribute("loginDTO", new LoginDTO());
        System.out.println("로그인 페이지 이동");
        return "member/signIn";
    }

    // 로그인
    @PostMapping("/signin")
    public String loginProcess(@Valid @ModelAttribute("loginDTO") LoginDTO loginDTO, Errors errors, Model model, HttpSession session) {
        if (errors.hasErrors()) { // 로그인 실패 시
            System.out.println("로그인 실패");
            return "member/signIn";
        } else {    // 로그인 성공 시
            Member member = memberService.signIn(loginDTO);
//            System.out.println(member);
            // 멤버가 없는 경우
            if (member == null) {
                System.out.println("id와 비밀번호를 확인해 주세요");
                model.addAttribute("loginMsg", "Please check your ID or password");
                return "member/signIn";
            } else { // 멤버가 있고, 로그인 입력을 제대로 한 경우
                System.out.println("로그인 성공");
//                System.out.println(member);
                session.setAttribute("currentMember", member);
                model.addAttribute("currentMember", member);
                return "redirect:/"; // 메인페이지로
            }
        }
    }

    @GetMapping("/profile")
    public String getProfile(@ModelAttribute("currentMember") Member member, Model model) {
        // 임시회원 체크
        if ("N".equals(member.getStatus())) {
            // 임시회원인 경우 처리 로직 (예: 에러 메시지를 모델에 추가)
            model.addAttribute("error", "Temporary members cannot access wallet information.");
            Account account = accountService.findAccountByUserSeq(member.getUserSeq());
            model.addAttribute("account", account);
            return "/member/profile";
        }

        // 원화 월렛
        Wallet wallet = walletService.findWalletByUserSeqAndCurrencyCode(member.getUserSeq(), "KRW");
        Account account = accountService.getAccountByAcNo(wallet.getAcNo());
        System.out.println("선택된 계좌는 " + account);
        //List<Wallet> walletList = walletService.findWalletByMemberId(member.getUserSeq());
        List<AutoExchangeDTO> autoExchangeDTOList = walletService.getAutoExchangeListByUserSeq(member.getUserSeq());

        model.addAttribute("autoExchangeList", autoExchangeDTOList);
        model.addAttribute("account", account);
        return "/member/profile";
    }

    @GetMapping("/branch")
    public String getBranch(){

        return "/member/branch";
    }

    @GetMapping("/dashboard")
    public String getDashBoard(@ModelAttribute("currentMember") Member member) {

        return "/admin/dashboard";
    }

    @GetMapping("/readyToApply")
    public String readyToApply() {
        return "/member/readyToApply";
    }

    @GetMapping("/openAccount")
    public String openAccount() {
        return "/member/openAccount";
    }

    @Transactional
    @PostMapping("/processOpenAccount")
    public ResponseEntity<String> processOpenAccount(@RequestBody OpenAccountDTO openAccountDTO, HttpSession session) {
        try {
            memberService.insertTemporaryMember(openAccountDTO);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("/member/openAccount");
        }

        int userSeq = memberService.findUserSeqByID(openAccountDTO.getId());
        Member member = memberService.findMemberById(userSeq);

        String acNo = accountService.createTemporaryAccount(userSeq);
        Account account = accountService.getAccountByAcNo(acNo);

        session.setAttribute("member", member);
        session.setAttribute("account", account);

        return ResponseEntity.ok("/completeAccount");
    }


    @GetMapping("/completeAccount")
    public String completeAccount(Model model, HttpSession session) {
        // 세션에서 데이터를 받아와서 모델에 추가
        model.addAttribute("member", session.getAttribute("member"));
        model.addAttribute("account", session.getAttribute("account"));
        // 필요시 세션에서 데이터 제거
        session.removeAttribute("member");
        session.removeAttribute("account");

        return "/member/completeAccount";
    }
}
