package com.kopo.hanaglobal.hana_global.web.service;

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

    // 월렛 충전
//    @Transactional
//    public void loadWallet(int userSeq, Integer amount, String password) {
//        try {
//            // 해당 유저의 원화가 들어있는 월렛만 검색
//            System.out.println("월렛충전 시작 --------------------------");
//            Wallet wallet = walletRepository.findWalletByUserSeqAndCurrencyCode(userSeq, "KRW");
//            System.out.println("원화 월렛은: " + wallet.toString());
//            if (wallet == null) {
//                throw new RuntimeException("지갑을 찾을 수 없습니다.");
//            }
//            // 비밀번호 체크
//            if (!wallet.getWalletPw().equals(password)) {
//                throw new RuntimeException("간편비밀번호가 틀렸습니다.");
//            }
//            // 계좌 잔액 확인
//            Account account = accountRepository.getAccountByAcNo(wallet.getAcNo());
//            System.out.println("계좌 잔액은: " + account.getBalance());
//            if (account.getBalance() < amount) {
//                throw new RuntimeException("계좌 잔액이 부족합니다.");
//            }
//            // 계좌 잔액 차감
//            accountRepository.deductAccountBalance(account.getAcNo(), amount);
//            // 계좌 내역 처리
//            AccountHistoryResponseDTO accountHistoryDTO = new AccountHistoryResponseDTO();
//            accountHistoryDTO.setAcNo(account.getAcNo());
//            accountHistoryDTO.setTransactionAmount(amount);
//            accountHistoryDTO.setTransactionType("1"); // 1은 출금
//            accountHistoryDTO.setBalance(account.getBalance() - amount);
//            accountHistoryDTO.setParticipant("Hana Wallet");
//            accountHistoryDTO.setParticipantAccount(account.getAcNo());
//            insertAccHistByWallet(accountHistoryDTO);
//
//            // 월렛 잔액 충전
//            walletRepository.addWalletBalance(userSeq, amount, wallet.getCurrencyCode());
//
//            // 월렛 거래내역 추가
//            // 충전 후의 월렛 잔액을 가져오기
//            BigDecimal newBalance = walletRepository.getBalanceByWalletSeq(wallet.getWalletSeq());
//            // 월렛 거래 내역 생성
//            WalletHistoryDTO walletHistoryDTO = new WalletHistoryDTO();
//            walletHistoryDTO.setWalletSeq(wallet.getWalletSeq());
//            walletHistoryDTO.setBalance(newBalance);
//            walletHistoryDTO.setTransactionAmount(new BigDecimal(amount));
//            walletHistoryDTO.setCurrencyCode("KRW");
//            walletHistoryDTO.setCurrency("Won");
//            walletHistoryDTO.setTransactionType("A");
//            walletHistoryDTO.setDepositCur("KRW");
//            walletHistoryDTO.setDepositName("Won");
//            insertDepositWalletHist(walletHistoryDTO);
//
//            System.out.println("월렛충전 끝 --------------------------");
//        } catch (RuntimeException e) {
//            // 로그에 예외 정보를 남긴다거나 추가적인 작업이 필요한 경우 여기서 처리
//            throw e;
//        }
//    }
    @Transactional
    public void loadWallet(int userSeq, Integer amount, String password) {
        Wallet wallet = validateWalletAndRetrieve(userSeq, password);
        Account account = validateAccountAndRetrieve(wallet, amount);
        // 계좌 잔액 차감
        deductFromAccount(account, amount);
        // 월렛에 충전
        addToWallet(wallet, amount);
        // 계좌 내역 추가
        addAccountHistory(account, amount);
        // 월렛 내역 추가
        addWalletHistory(wallet, amount);
    }
    // 월렛 유효성 체크
    private Wallet validateWalletAndRetrieve(int userSeq, String password) {
        Wallet wallet = walletRepository.findWalletByUserSeqAndCurrencyCode(userSeq, "KRW");
        if (wallet == null) throw new RuntimeException("지갑을 찾을 수 없습니다.");
        if (!wallet.getWalletPw().equals(password)) throw new RuntimeException("간편비밀번호가 틀렸습니다.");
        return wallet;
    }
    // 계좌 유효성 체크
    private Account validateAccountAndRetrieve(Wallet wallet, Integer amount) {
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
    private void addToWallet(Wallet wallet, Integer amount) {
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
        BigDecimal newBalance = walletRepository.getBalanceByWalletSeq(wallet.getWalletSeq()); // 충전 후의 월렛 잔액

        WalletHistoryDTO walletHistoryDTO = new WalletHistoryDTO();
        walletHistoryDTO.setWalletSeq(wallet.getWalletSeq());
        walletHistoryDTO.setBalance(newBalance);
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


    // 월렛 입금 내역 추가
//    public void insertDepositWalletHist(int walletTransNo, int walletSeq, BigDecimal balance,
//                                        BigDecimal transactionAmount, String currencyCode,
//                                        String currency, String transactionType,
//                                        String depositCur, String depositName){
//        walletRepository.insertDepositWalletHist(walletTransNo, walletSeq, balance,
//                transactionAmount, currencyCode, currency, transactionType,
//                depositCur, depositName);
//    }
}
