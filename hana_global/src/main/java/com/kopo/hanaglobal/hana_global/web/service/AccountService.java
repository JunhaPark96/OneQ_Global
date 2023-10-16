package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.response.AccountHistoryResponseDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.MemberAccDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.Wallet;

import java.util.List;

public interface AccountService {
    public void createNewAccount(String acPasswd, int userSeq);
    List<Account> findAccountByMemberId(int memberId);
    Account findAccountByUserSeq(int memberId);

    List<MemberAccDTO> findMemberAccounts(int memberId);

    List<AccountHistoryResponseDTO> getTransactionHistoryByAcNo(String acNo);
    
    
    void updateAccountBalance(String acNo, Integer amount);

    void insertAccHistTransaction(String acNo, Integer balance, Integer transactionAmount, int transactionType, String participant, String participantAccount);

    void accountTransfer(String fromAcNo, String toAcNo, Integer amount);

    Account getAccountByAcNo(String acNo);

    String createTemporaryAccount(int userSeq);

    public Account findFirstAccountByMemberId(int userSeq);

    public AccountHistoryResponseDTO lastTransactionDate(String acNo);

    public List<Account> getAccountAll();

    public void updateAccountStatus(String acNo);
    public void updateAccountStatus2(String acNo);

    public void deleteAccountByAcNo(String acNo);

    public List<String> findApprovedRefundsOlderThanTwoWeeks();
}
