package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.LoginDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {
    private MemberRepository memberRepository;

    // 생성자 주입
    @Autowired
    public MemberServiceImpl(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
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

//    @Override
//    public void signUp(Member member) {
//        memberRepository.signUp(member);
//    }

    @Override
    public Member findMemberById(int memberId) {
        return memberRepository.findMemberById(memberId);
    }

    @Override
    public Integer findUserSeqByID(String id) {
        Member member = memberRepository.findUserSeqByID(id);
        return member.getUserSeq();
    }
}
