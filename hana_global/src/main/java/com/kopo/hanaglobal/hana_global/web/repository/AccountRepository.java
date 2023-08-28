package com.kopo.hanaglobal.hana_global.web.repository;

import com.kopo.hanaglobal.hana_global.web.dto.response.MemberAccDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;

import java.util.List;

public interface AccountRepository {
    List<Account> findAccountByMemberId(int memberId);

}
