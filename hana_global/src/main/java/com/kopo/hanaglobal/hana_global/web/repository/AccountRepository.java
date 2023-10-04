package com.kopo.hanaglobal.hana_global.web.repository;

import com.kopo.hanaglobal.hana_global.web.dto.response.AccountHistoryResponseDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.MemberAccDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AccountRepository {
    public void createNewAccount(Account account);

    public List<Account> findAccountByMemberId(int memberId);

    public Account findAccountByUserSeq(int userSeq);
    public List<AccountHistoryResponseDTO> getTransactionHistoryByAcNo(@Param("acNo") String acNo);

    public Account getAccountByAcNo(String acNo);

    public void updateAccountBalance(@Param("acNo") String acNo, @Param("amount") Integer amount);

    public void deductAccountBalance(@Param("acNo") String acNo, @Param("amount") Integer amount);

    public void insertAccHistTransaction(
            @Param("acNo") String acNo,
            @Param("balance") Integer balance,
            @Param("transactionAmount") Integer transactionAmount,
            @Param("transactionType") int transactionType,
            @Param("participant") String participant,
            @Param("participantAccount") String participantAccount);
    public void insertAccHistByWallet(AccountHistoryResponseDTO accountHistoryResponseDTO);

    public void createTemporaryAccount(Account account);
}
