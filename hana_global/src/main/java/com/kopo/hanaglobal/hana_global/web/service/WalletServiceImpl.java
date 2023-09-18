package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.NewWalletCurrencyDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.AccountHistoryResponseDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.WalletHistoryDTO;
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
public class WalletServiceImpl implements WalletService {
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
    public Wallet findWalletByWalletNo(int walletSeq){
        Wallet wallet = walletRepository.findWalletByWalletNo(walletSeq);
        System.out.println("서비스에서 가져온 월렛은 " + wallet.toString());
        return wallet;
    }

    @Override
    public List<Wallet> findWalletByMemberId(int memberId) {
        List<Wallet> walletList = walletRepository.findWalletByMemberId(memberId);
        for (Wallet w : walletList) {
            System.out.println("월렛은: " + w.toString());
        }
        return walletList;
    }

    @Override
    public List<Wallet> findWalletByAccountNo(String acNo) {
        List<Wallet> walletList = walletRepository.findWalletByAccountNo(acNo);
        for (Wallet w : walletList) {
            System.out.println("월렛은: " + w.toString());
        }
        return walletList;
    }

    @Transactional
    @Override
    public void loadWallet(int userSeq, Integer amount, String password) {
        Wallet wallet = validateWalletAndRetrieve(userSeq, password);
        Account account = validateAccountAndRetrieve(wallet, amount);
        // 계좌 잔액 차감
        deductFromAccount(account, amount);
        // 계좌 내역 추가
        addAccountHistory(account, amount);
        // 월렛에 충전
        addToWallet(wallet, amount);
        // 월렛 내역 추가
        addWalletHistory(wallet, amount);
    }
    // 환전기능 - 계좌금액 차감, 월렛 통화 충전
    @Transactional
    public void doExchange(int walletSeq, String currencyCode, String password, Integer krwAmount, Integer foreignAmount){
        Wallet fromWallet = walletRepository.findWalletByWalletNo(walletSeq);
        Account account = accountRepository.getAccountByAcNo(fromWallet.getAcNo());
        // 계좌 내역 추가
        // 만약 월렛에 돈이 없으면, 계좌에서 차감 후 월렛에 돈을 충전.

        // 원화 차감
        if (fromWallet.getBalance().compareTo(BigDecimal.valueOf(krwAmount)) < 0) {
            // BigDecimal 값에서 Integer 값을 뺄셈하기
            BigDecimal shortageBigDecimal = BigDecimal.valueOf(krwAmount).subtract(fromWallet.getBalance());
            // 계좌에서 차감 후 월렛에 돈을 충전
            int shortage = shortageBigDecimal.intValue();
            deductFromAccount(account, shortage);
            addAccountHistory(account, krwAmount);
            // 월렛에 충전
            walletRepository.addWalletBalance(fromWallet.getUserSeq(), shortage, "KRW");
        }
        // 월렛에 돈이 있으면, 월렛에서 돈을 차감
        walletRepository.deductWalletBalance(fromWallet.getUserSeq(), krwAmount, "KRW");
        // 외화 충전
        Wallet targetWallet = walletRepository.findWalletByUserSeqAndCurrencyCode(fromWallet.getUserSeq(), currencyCode);
        if (targetWallet.getCurrencyCode() != null){ // 월렛에 해당 외화가 있으면 update
            walletRepository.addWalletBalance(targetWallet.getUserSeq(), foreignAmount, targetWallet.getCurrencyCode());
        } else{ // 월렛에 해당 외화가 없으면 insert
            addWalletNewCur(targetWallet);
        }
    }

    private void addWalletNewCur(Wallet wallet) {
        // 월렛 외화 추가
        NewWalletCurrencyDTO newWalletCurrencyDTO = new NewWalletCurrencyDTO();
        newWalletCurrencyDTO.setUserSeq(wallet.getUserSeq());
        newWalletCurrencyDTO.setAcNo(wallet.getAcNo());
        newWalletCurrencyDTO.setWalletPw(wallet.getWalletPw());
        newWalletCurrencyDTO.setBalance(wallet.getBalance());
        newWalletCurrencyDTO.setCurrencyCode(wallet.getCurrencyCode());
        newWalletCurrencyDTO.setCurrency(wallet.getCurrency());
        insertWalletNewCurrency(newWalletCurrencyDTO);

        System.out.println("월렛 외화 추가: " + newWalletCurrencyDTO.toString());
    }

    @Override
    public Wallet findWalletByUserSeqAndCurrencyCode(int userSeq, String currencyCode) {
        Wallet wallet = walletRepository.findWalletByUserSeqAndCurrencyCode(userSeq, currencyCode);
        System.out.println("선택된 월렛은: " + wallet.toString());
        return wallet;
    }

    // 월렛 유효성 체크
    @Override
    public Wallet validateWalletAndRetrieve(int userSeq, String password) {
        Wallet wallet = walletRepository.findWalletByUserSeqAndCurrencyCode(userSeq, "KRW");
        if (wallet == null) throw new RuntimeException("지갑을 찾을 수 없습니다.");
        if (!wallet.getWalletPw().equals(password)) throw new RuntimeException("간편비밀번호가 틀렸습니다.");
        return wallet;
    }
    // 계좌 유효성 체크
    @Override
    public Account validateAccountAndRetrieve(Wallet wallet, Integer amount) {
        Account account = accountRepository.getAccountByAcNo(wallet.getAcNo());
        if (account.getBalance() < amount) throw new RuntimeException("계좌 잔액이 부족합니다.");
        return account;
    }
    private void deductFromAccount(Account account, Integer amount) {
        // 계좌에서 출금
        System.out.println("계좌 출금 전: " + account.toString());
        accountRepository.deductAccountBalance(account.getAcNo(), amount);
        System.out.println("계좌 출금 후: " + account.toString());
    }
    @Override
    public void deductWalletBalance(Wallet wallet, Integer amount){
        System.out.println("월렛 출금 전: " + wallet.toString());
        walletRepository.deductWalletBalance(wallet.getUserSeq(), amount, wallet.getCurrencyCode());
        System.out.println("월렛 출금 후: " + wallet.toString());
    }

    @Override
    public void addToWallet(Wallet wallet, Integer amount) {
        System.out.println("월렛 충전 전: " + wallet.toString());
        // 월렛 잔액에 충전
        walletRepository.addWalletBalance(wallet.getUserSeq(), amount, wallet.getCurrencyCode());
        System.out.println("월렛 충전 후: " + wallet.toString());
    }


    private void addAccountHistory(Account account, Integer amount) {
        // 계좌 거래 내역 추가
        AccountHistoryResponseDTO accountHistoryDTO = new AccountHistoryResponseDTO();
        accountHistoryDTO.setAcNo(account.getAcNo());
        accountHistoryDTO.setTransactionAmount(amount);
        accountHistoryDTO.setTransactionType("1"); // 1은 출금을 의미
        accountHistoryDTO.setBalance(account.getBalance() - amount); // 잔액 업데이트
        accountHistoryDTO.setParticipant("Hana Wallet");
        accountHistoryDTO.setParticipantAccount(account.getAcNo());
        insertAccHistByWallet(accountHistoryDTO);
        System.out.println("계좌 거래내역 추가: " + accountHistoryDTO.toString());
    }
    public void insertAccHistByWallet(AccountHistoryResponseDTO accountHistoryResponseDTO){
        accountRepository.insertAccHistByWallet(accountHistoryResponseDTO);
    }

    private void addWalletHistory(Wallet wallet, Integer amount) {
        // 월렛 거래 내역 추가
        WalletHistoryDTO walletHistoryDTO = new WalletHistoryDTO();
        walletHistoryDTO.setWalletSeq(wallet.getWalletSeq());
        walletHistoryDTO.setBalance(wallet.getBalance().add(new BigDecimal(amount)));
        walletHistoryDTO.setTransactionAmount(new BigDecimal(amount));
        walletHistoryDTO.setCurrencyCode("KRW");
        walletHistoryDTO.setCurrency("Won");
        walletHistoryDTO.setTransactionType("A"); // A는 충전을 의미
        walletHistoryDTO.setDepositCur("KRW");
        walletHistoryDTO.setDepositName("Won");

        insertDepositWalletHist(walletHistoryDTO);
        System.out.println("월렛 거래내역 추가: " + walletHistoryDTO.toString());
    }

    // 월렛 충전 거래내역 삽입
    public void insertDepositWalletHist(WalletHistoryDTO walletHistoryDTO) {
        walletRepository.insertDepositWalletHist(walletHistoryDTO);
    }

    // 새로운 통화 삽입
    @Override
    public void insertWalletNewCurrency(NewWalletCurrencyDTO newWalletCurrencyDTO) {
        walletRepository.insertWalletNewCurrency(newWalletCurrencyDTO);
    }


}
