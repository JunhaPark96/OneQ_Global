package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.response.AccountHistoryResponseDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.MemberAccDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;

import java.util.List;

public interface AccountService {
    public List<Account> findAccountByMemberId(int memberId);

    public List<MemberAccDTO> findMemberAccounts(int memberId);

    List<AccountHistoryResponseDTO> getTransactionHistoryByAcNo(String acNo);
}
