package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.LoginDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.OpenAccountDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.repository.AccountRepository;
import com.kopo.hanaglobal.hana_global.web.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {
    private MemberRepository memberRepository;
    private AccountRepository accountRepository;


    // 생성자 주입
    @Autowired
    public MemberServiceImpl(MemberRepository memberRepository, AccountRepository accountRepository) {
        this.memberRepository = memberRepository;
        this.accountRepository = accountRepository;
    }

    @Override
    public List<Member> getMemberAll() {
        List<Member> memberList = memberRepository.getMemberAll();
        return memberList;
    }

    @Override
    public Member signIn(LoginDTO loginDTO) {
        return memberRepository.signIn(loginDTO);
    }

    @Transactional
    @Override
    public void signUp(String email, String userId, String userPasswd,
                       String name, String foreignRegNo, String birthDate,
                       String gender, String mobileDigit, String roadAddress,
                       String jibunAddress, String detailAddress,
                       String nationality, String countryCode) {
        Member member = new Member();

        member.setEmail(email);
        member.setId(userId);
        member.setPasswd(userPasswd);
        member.setName(name);
        member.setRegistNo(foreignRegNo);
        member.setCountrySP(countryCode);
        member.setNationality(nationality);
        member.setBirthDate(birthDate);
        member.setGender(gender);
        member.setContact(mobileDigit);
        member.setRoadAddress(roadAddress + " " + detailAddress);
        member.setJibunAddress(jibunAddress + " " + detailAddress);
        member.setStatus("Y");

        memberRepository.signUp(member);
    }


    @Override
    public Member findMemberById(int memberId) {
        return memberRepository.findMemberById(memberId);
    }

    @Override
    public Integer findUserSeqByID(String id) {
        Member member = memberRepository.findUserSeqByID(id);
        return member.getUserSeq();
    }

//      SMS 인증번호 요청 (CoolSMS 이용)
    @Override
    public void getSmsCertificationNumber(String phoneNumber, HttpSession session){
        try {
            Random random = new Random();
            String smsApiKey = "NCSOMB62T3GUKWR3";
            String smsApiSecret = "BPIN24PCFSFWVZUOFL0QJ6HXZDTZI9EL";
            Message coolsms = new Message(smsApiKey, smsApiSecret);
            String myPhone = "01099692958";
            // 인증번호 생성
            String numStr = "";
            for (int i = 0; i < 6; i++) {
                numStr += Integer.toString(random.nextInt(10));
            }
            System.out.println("생성된 숫자는" + numStr);
            HashMap<String, String> params = new HashMap<String, String>();
            params.put("to", phoneNumber); // 수신 전화번호
            params.put("from", myPhone); // 발신 전화번호
            params.put("type", "sms");
            params.put("text", "Confirm your phone number on HanaGlobal with the code " + numStr + ". Don't share with anyone");
            coolsms.send(params);

            // 세션에 인증번호 저장 (유효기간 3분)
            session.setAttribute("smsCertificationNumber", numStr);
            session.setMaxInactiveInterval(180);

            System.out.println(numStr);
            System.out.println(session.getAttribute("smsCertificationNumber"));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//       인증번호 확인 검사
    @Override
    public boolean isVerifySms(String userInput, HttpSession session) {
        // 세션에서 인증번호 가져옴
        System.out.println(session.getAttribute("smsCertificationNumber"));
        String smsData = (String) session.getAttribute("smsCertificationNumber");
        if (smsData != null) {
            if (userInput.equals(smsData)) {
                // 사용자가 올바른 인증번호를 입력한 경우
                return true;
            }
        }
        return false;
    }
    
    
    // 임시 회원가입 및 계좌 생성
    @Override
    public void insertTemporaryMember(OpenAccountDTO openAccountDTO){
        System.out.println(openAccountDTO);
        // 임시 회원 생성
        memberRepository.insertTemporaryMember(openAccountDTO);

    }

    @Override
    public void approveMember(int userSeq){
        Member member = memberRepository.findMemberById(userSeq);
        memberRepository.approveMember(member.getUserSeq());
        System.out.println("바뀐 멤버 권한은 " + member.getStatus());
    }
}
