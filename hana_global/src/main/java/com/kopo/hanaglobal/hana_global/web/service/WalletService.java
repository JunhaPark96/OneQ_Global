package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.entity.Wallet;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WalletService {
    public void createNewWallet(int userSeq, String acNo, String walletPw);

    public List<Wallet> findWalletByMemberId(int memberId);

    public List<Wallet> findWalletByAccountNo(String acNo);

    public void loadWallet(int userSeq, Integer amount, String password);

//    public Wallet findWalletByCurrencyCode(String currencyCode);
    public Wallet findWalletByUserSeqAndCurrencyCode(int userSeq, String currencyCode);
}
