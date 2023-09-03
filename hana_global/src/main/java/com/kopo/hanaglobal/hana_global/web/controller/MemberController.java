package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.dto.request.LoginDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.ocr.ClovaOCRTemplate;
import com.kopo.hanaglobal.hana_global.web.repository.MemberRepository;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.MemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
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
public class MemberController {
    private MemberService memberService;

    @Autowired
    public MemberController(MemberService memberService){
        this.memberService = memberService;
    }
    @GetMapping("/boardlist")
    public ModelAndView getMemberAll(){
        ModelAndView mav = new ModelAndView("/boardlist");
        List<Member> memberList = memberService.getMemberAll();
        mav.addObject("memberList", memberList);
        return mav;
    }

    // 회원가입 페이지
    @GetMapping("/signup")
    public String signUp(Model model){
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
    public String signIn(Model model){
        model.addAttribute("loginDTO", new LoginDTO());
        System.out.println("로그인 페이지 이동");
        return "member/signIn";
    }

    // 로그인
    @PostMapping("/signin")
    public String loginProcess(@Valid @ModelAttribute("loginDTO") LoginDTO loginDTO, Errors errors, Model model, HttpSession session){
        if (errors.hasErrors()){ // 로그인 실패 시
            System.out.println("로그인 실패");
            return "member/signIn";
        } else {    // 로그인 성공 시
            Member member = memberService.signIn(loginDTO);
//            System.out.println(member);
            // 멤버가 없는 경우
            if (member == null){
                System.out.println("id와 비밀번호를 확인해 주세요");
                model.addAttribute("loginMsg", "id 또는 비밀번호를 확인해주세요");
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

    // 로그아웃
    @GetMapping("/signout")
    public String signOut(HttpSession session){
        session.invalidate();
        System.out.println("로그아웃 완료");
        return "redirect:/";
    }
}
