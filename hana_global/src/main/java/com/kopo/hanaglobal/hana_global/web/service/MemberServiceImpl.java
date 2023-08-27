package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.LoginDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService{
    private MemberRepository memberRepository;
    
    // 생성자 주입
    @Autowired
    public MemberServiceImpl(MemberRepository memberRepository){
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

    @Override
    public void signUp(Member member) {

    }
}
