package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.NewWalletCurrencyDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;
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

    // 월렛 패스워드 체크
    public Wallet validateWalletAndRetrieve(int userSeq, String password);
    // 월렛에 연동된 계좌 잔액 확인
    public Account validateAccountAndRetrieve(Wallet wallet, Integer amount);

    public Wallet findWalletByWalletNo(int walletSeq);
    // 월렛 출금
    public void deductWalletBalance(Wallet wallet, Integer amount);

    public void addToWallet(Wallet wallet, Integer amount);

    public void insertWalletNewCurrency(NewWalletCurrencyDTO newWalletCurrencyDTO);

    public void doExchange(String walletSeq, String currencyCode, String password, Integer krwAmount, Integer foreignAmount, String sourceCurrencyName);
}
