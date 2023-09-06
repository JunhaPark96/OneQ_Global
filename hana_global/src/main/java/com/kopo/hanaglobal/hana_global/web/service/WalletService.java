package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.entity.Wallet;

import java.util.List;

public interface WalletService {
    public void createNewWallet(int userSeq, String acNo, String walletPw);

    public List<Wallet> findWalletByMemberId(int memberId);

    public List<Wallet> findWalletByAccountNo(String acNo);

}
