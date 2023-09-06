package com.kopo.hanaglobal.hana_global.web.repository;

import com.kopo.hanaglobal.hana_global.web.entity.Wallet;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WalletRepository {
    // 월렛최초생성
    public void createNewWallet(Wallet wallet);

    public List<Wallet> findWalletByMemberId(int memberId);

    public List<Wallet> findWalletByAccountNo(String acNo);
}
