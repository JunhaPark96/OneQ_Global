//package com.kopo.hanaglobal.hana_global.web.repository;
//
//import com.kopo.hanaglobal.hana_global.web.dto.request.LoginDTO;
//import com.kopo.hanaglobal.hana_global.web.entity.Member;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import java.util.List;
//
//@Repository
//public class MemberRepositoryImpl implements MemberRepository{
//    @Autowired
//    SqlSessionTemplate sqlSessionTemplate;
//
//    @Override
//    public List<Member> getMemberAll() {
//        List<Member> memberList = sqlSessionTemplate.selectList("com.kopo.hanaglobal.hana_global.web.repository.MemberRepository.selectMemberAll");
//        return memberList;
//    }
//
//    @Override
//    public Member signIn(LoginDTO loginDTO) {
//        Member member = sqlSessionTemplate.selectOne("com.kopo.hanaglobal.hana_global.web.repository.MemberRepository.signIn", loginDTO);
//        return member;
//    }
//
//    @Override
//    public void signUp(Member member) {
//
//    }
//
//    @Override
//    public Member findMemberById(int memberId) {
//        Member member = sqlSessionTemplate.selectOne("com.kopo.hanaglobal.hana_global.web.repository.MemberRepository.findMemberById", memberId);
//        return member;
//    }
//
//}
