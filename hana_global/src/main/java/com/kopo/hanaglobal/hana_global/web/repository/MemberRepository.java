package com.kopo.hanaglobal.hana_global.web.repository;

import com.kopo.hanaglobal.hana_global.web.dto.request.LoginDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Member;

import java.util.List;

public interface MemberRepository {
    public List<Member> getMemberAll();

    public Member signIn(LoginDTO loginDTO);

    public void signUp(Member member);

    public Member findMemberById(int memberId);

}
