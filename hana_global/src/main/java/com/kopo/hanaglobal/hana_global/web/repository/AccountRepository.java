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

    public List<AccountHistoryResponseDTO> getTransactionHistoryByAcNo(@Param("ac_no") String acNo);

    public Account getAccountByAcNo(String acNo);

    public void updateAccountBalance(@Param("acNo") String acNo, @Param("amount") Integer amount);

    public void deductAccountBalance(@Param("acNo") String acNo, @Param("amount") Integer amount);

    public void insertAccHistTransaction(
            @Param("ac_no") String acNo,
            @Param("balance") Integer balance,
            @Param("transaction_amount") Integer transactionAmount,
            @Param("transaction_type") int transactionType,
            @Param("participant") String participant,
            @Param("participant_account") String participantAccount);
    public void insertAccHistByWallet(AccountHistoryResponseDTO accountHistoryResponseDTO);
}
