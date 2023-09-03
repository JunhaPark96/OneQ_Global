package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.LoginDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.AccountHistoryResponseDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Member;

import java.util.List;

public interface MemberService {
    public List<Member> getMemberAll();

    public Member signIn(LoginDTO loginDTO);

//    public void signUp(Member member);
    public void signUp(String email, String userId, String userPasswd, String name, String foreignRegNo, String birthDate, String gender, String mobileDigit, String roadAddress, String detailAddress, String jibunAddress, String nationality, String countryCode);
    public Member findMemberById(int memberId);
}
