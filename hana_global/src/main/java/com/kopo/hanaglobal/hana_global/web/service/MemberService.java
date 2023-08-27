package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.LoginDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Member;

import java.util.List;

public interface MemberService {
    public List<Member> getMemberAll();

    public Member signIn(LoginDTO loginDTO);

    public void signUp(Member member);
}
