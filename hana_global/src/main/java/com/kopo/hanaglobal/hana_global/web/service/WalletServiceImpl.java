package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.Wallet;
import com.kopo.hanaglobal.hana_global.web.repository.AccountRepository;
import com.kopo.hanaglobal.hana_global.web.repository.WalletRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

@Service
public class WalletServiceImpl implements WalletService{
    private WalletRepository walletRepository;
    private AccountRepository accountRepository;

    @Autowired
    public WalletServiceImpl(WalletRepository walletRepository, AccountRepository accountRepository) {
        this.walletRepository = walletRepository;
        this.accountRepository = accountRepository;
    }

    @Override
    public void createNewWallet(int userSeq, String acNo, String walletPw) {
        Wallet newWallet = new Wallet();
        newWallet.setUserSeq(userSeq);
        newWallet.setAcNo(acNo);
        newWallet.setWalletPw(walletPw);

        walletRepository.createNewWallet(newWallet);
    }

    @Override
    public List<Wallet> findWalletByMemberId(int memberId) {
        List<Wallet> walletList = walletRepository.findWalletByMemberId(memberId);
        for (Wallet w : walletList){
            System.out.println("월렛은: " + w.toString());
        }
        return walletList;
    }

    @Override
    public List<Wallet> findWalletByAccountNo(String acNo) {
        List<Wallet> walletList = walletRepository.findWalletByAccountNo(acNo);
        for (Wallet w : walletList){
            System.out.println("월렛은: " + w.toString());
        }
        return walletList;
    }

    @Transactional
    public void loadWallet(int userSeq, Integer amount, String password) throws Exception{
        // 해당 유저의 원화가 들어있는 월렛만 검색
        Wallet wallet = walletRepository.findWalletByUserSeqAndCurrencyCode(userSeq, "KRW");
        System.out.println("원화 월렛은: " + wallet.toString());

        // 비밀번호 체크
        if (!wallet.getWalletPw().equals(password)) {
            throw new Exception("간편비밀번호가 틀렸습니다.");
        }
        // 계좌 잔액 확인
        Account account = accountRepository.getAccountByAcNo(wallet.getAcNo());
        if (account.getBalance() < amount) {
            throw new Exception("계좌 잔액이 부족합니다.");
        }
        // 계좌 잔액 차감
        accountRepository.deductAccountBalance(account.getAcNo(), amount);
        // 계좌 내역 처리

        // 월렛 잔액 충전
        walletRepository.addWalletBalance(userSeq, amount, wallet.getCurrencyCode());
        // 월렛 거래내역 추가
//        walletRepository.insertDepositWalletHist();
    }

}
