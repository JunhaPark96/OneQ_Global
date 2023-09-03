package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.response.AccountHistoryResponseDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.MemberAccDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.repository.AccountRepository;
import com.kopo.hanaglobal.hana_global.web.repository.MemberRepository;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public void createNewAccount(String acPasswd, int userSeq) {
        Account newAccount = new Account();
        newAccount.setAcNo("CA" + RandomStringUtils.randomNumeric(8)); // CA + random 8 digit number
        newAccount.setUserSeq(userSeq); // Set the user sequence number
        newAccount.setAcName("주계좌");
        newAccount.setAcPasswd(acPasswd);
        newAccount.setStatus(1);

        accountRepository.createNewAccount(newAccount);
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
    @Override
    public void updateAccountBalance(@Param("acNo") String acNo, @Param("amount") Integer amount){
        accountRepository.updateAccountBalance(acNo, amount);
    }
    @Override
    public void insertAccHistTransaction(String acNo, Integer balance, Integer transactionAmount, int transactionType, String participant, String participantAccount){
        accountRepository.insertAccHistTransaction(acNo, balance, transactionAmount, transactionType, participant, participantAccount);
    }
    @Transactional
    @Override
    public void accountTransfer(String fromAcNo, String toAcNo, Integer amount){
        // 1. 보내는 계좌의 잔액 감소
        Account fromAccount = accountRepository.getAccountByAcNo(fromAcNo);
        System.out.println(fromAccount.toString());
        Integer fromBalance = fromAccount.getBalance() - amount;
        updateAccountBalance(fromAcNo, fromBalance);
        System.out.println(fromAccount.toString());

        // 2. 받는 계좌의 잔액 증가
        Account toAccount = accountRepository.getAccountByAcNo(toAcNo);
        System.out.println(toAccount.toString());
        Integer toBalance = toAccount.getBalance() + amount;
        updateAccountBalance(toAcNo, toBalance);
        System.out.println(toAccount.toString());

        // 3. 보내는 사람의 이름 가져오기
        Member fromMember = memberRepository.findMemberById(fromAccount.getUserSeq());
        String fromName = fromMember.getName();
        System.out.println(fromMember.toString());

        // 4. 받는 사람의 이름 가져오기
        Member toMember = memberRepository.findMemberById(toAccount.getUserSeq());
        String toName = toMember.getName();
        System.out.println(toMember.toString());

        // 5. 보내는 사람의 계좌 내역에 출금 내역 추가
        insertAccHistTransaction(fromAcNo, fromBalance, amount, 1, toName, toAcNo);

        // 6. 받는 사람의 계좌 내역에 입금 내역 추가
        insertAccHistTransaction(toAcNo, toBalance, amount, 0, fromName, fromAcNo);
    }

}
