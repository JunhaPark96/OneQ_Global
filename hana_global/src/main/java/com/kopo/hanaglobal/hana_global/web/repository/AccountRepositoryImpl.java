//package com.kopo.hanaglobal.hana_global.web.repository;
//
//import com.kopo.hanaglobal.hana_global.web.dto.response.MemberAccDTO;
//import com.kopo.hanaglobal.hana_global.web.entity.Account;
//import com.kopo.hanaglobal.hana_global.web.entity.Member;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import java.util.ArrayList;
//import java.util.List;
//
//@Repository
//public class AccountRepositoryImpl implements AccountRepository{
//    @Autowired
//    SqlSessionTemplate sqlSessionTemplate;
//
//    @Override
//    public List<Account> findAccountByMemberId(int userSeq) {
//        List<Account> accountList = sqlSessionTemplate.selectList("com.kopo.hanaglobal.hana_global.web.repository.AccountRepository.findAccountByMemberId", userSeq);
//        for (Account account : accountList){
//            System.out.println(account.toString());
//        }
//        return accountList;
//    }
//}
