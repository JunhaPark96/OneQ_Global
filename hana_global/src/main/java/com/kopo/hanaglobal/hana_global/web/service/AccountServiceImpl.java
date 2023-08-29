package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.response.AccountHistoryResponseDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.MemberAccDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.repository.AccountRepository;
import com.kopo.hanaglobal.hana_global.web.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AccountServiceImpl implements AccountService{
    private AccountRepository accountRepository;
    private MemberRepository memberRepository;

    @Autowired
    public AccountServiceImpl(AccountRepository accountRepository, MemberRepository memberRepository){
        this.accountRepository = accountRepository;
        this.memberRepository = memberRepository;
    }


    @Override
    public List<Account> findAccountByMemberId(int memberId) {
        List<Account> accountList = accountRepository.findAccountByMemberId(memberId);
        for (Account acc : accountList){
            System.out.println("계좌는 " + acc.toString());
        }
        return accountList;
    }

    @Override
    public List<MemberAccDTO> findMemberAccounts(int memberId) {
        Member member = memberRepository.findMemberById(memberId);
//        System.out.println(member.getUserSeq());
        int userSeq = member.getUserSeq();
//        System.out.println("유저번호 " + userSeq);
        List<Account> accountList = accountRepository.findAccountByMemberId(userSeq);
        for (Account acc : accountList){
            System.out.println("계좌는 " + acc.toString());
        }
//        System.out.println("멤버는: " + member.toString());
        List<MemberAccDTO> memberAccDTOList = new ArrayList<>();
        for (Account account : accountList) {
            MemberAccDTO memberAccDTO = new MemberAccDTO();
            memberAccDTO.setName(member.getName());
            memberAccDTO.setSignupDate(member.getSignupDate());
            memberAccDTO.setAcNo(account.getAcNo());
            memberAccDTO.setBalance(account.getBalance());
            memberAccDTO.setAcName(account.getAcName());
            memberAccDTOList.add(memberAccDTO);
        }
        return memberAccDTOList;
    }

    @Override
    public List<AccountHistoryResponseDTO> getTransactionHistoryByAcNo(String acNo) {
        List<AccountHistoryResponseDTO> accHistoryList = accountRepository.getTransactionHistoryByAcNo(acNo);
        for (AccountHistoryResponseDTO a : accHistoryList){
            System.out.println(a.toString());
        }
        return accHistoryList;
    }
}
