package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.Util.RandomNumberGenerator;
import com.kopo.hanaglobal.hana_global.web.dto.request.AutoExchangeDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.NewWalletCurrencyDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.RemittanceDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.AccountHistoryResponseDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.WalletHistoryDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.entity.Wallet;
import com.kopo.hanaglobal.hana_global.web.repository.AccountRepository;
import com.kopo.hanaglobal.hana_global.web.repository.WalletRepository;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.NoSuchElementException;

import static com.kopo.hanaglobal.hana_global.web.Util.NewHanaWallet.generateWalletNumber;
import static com.kopo.hanaglobal.hana_global.web.Util.RandomNumberGenerator.generateRandomNumber;

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
        int generatedWalletSeq = generateWalletNumber();
        newWallet.setWalletSeq(generatedWalletSeq);
        newWallet.setUserSeq(userSeq);
        newWallet.setAcNo(acNo);
        newWallet.setWalletPw(walletPw);
        try {
            walletRepository.createNewWallet(newWallet);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

    @Override
    public Wallet findWalletByWalletNo(int walletSeq) {
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
    @Override
    public void doExchange(String walletSeqStr, String currencyCode, String password, Integer krwAmount, Integer foreignAmount, String sourceCurrencyName) {
        int walletSeq;
        try {
            walletSeq = Integer.parseInt(walletSeqStr);
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Invalid wallet sequence number.", e);
        }

        Wallet fromWallet = getWalletBySeq(walletSeq);
        Account account = getAccountByAcNo(fromWallet);
        Wallet targetWallet = getWalletByUserAndCurrency(fromWallet, currencyCode);

        processKrwDeduction(fromWallet, account, krwAmount, "E");

        processForeignAddition(fromWallet, targetWallet, currencyCode, foreignAmount, sourceCurrencyName);
    }

    public Wallet getWalletBySeq(int walletSeq) {
        return walletRepository.findWalletByWalletNo(walletSeq);
    }

    public Account getAccountByAcNo(Wallet fromWallet) {
        return accountRepository.getAccountByAcNo(fromWallet.getAcNo());
    }

    public Wallet getWalletByUserAndCurrency(Wallet fromWallet, String currencyCode) {
        return walletRepository.findWalletByUserSeqAndCurrencyCode(fromWallet.getUserSeq(), currencyCode);
//        Wallet wallet = walletRepository.findWalletByUserSeqAndCurrencyCode(fromWallet.getUserSeq(), currencyCode);
//        if (wallet == null) {
//            throw new NoSuchElementException("No wallet found with the given currency code.");
//        }
//        return wallet;
    }

    public void processForeignAddition(Wallet fromWallet, Wallet targetWallet, String currencyCode, Integer foreignAmount, String sourceCurrencyName) {
        // 외화 충전
        if (targetWallet == null) { // 월렛에 해당 외화가 없으면 insert
            addWalletNewCur(fromWallet, currencyCode, sourceCurrencyName, foreignAmount);
        } else if (targetWallet.getCurrencyCode() != null) { // 월렛에 해당 외화가 있으면 update
            walletRepository.addWalletBalance(targetWallet.getUserSeq(), foreignAmount, targetWallet.getCurrencyCode());
        }
        Wallet newTargetWallet = walletRepository.findWalletByUserSeqAndCurrencyCode(fromWallet.getUserSeq(), currencyCode);
        // 외화 입금에 대한 내역
        WalletHistoryDTO walletDepositDTO = createDepositDTO(newTargetWallet, currencyCode, foreignAmount, sourceCurrencyName);
        walletRepository.insertDepositWalletHist(walletDepositDTO);
        System.out.println("환전 입금 내역 추가: " + walletDepositDTO.toString());
    }

    public WalletHistoryDTO createDepositDTO(Wallet targetWallet, String currencyCode, Integer foreignAmount, String sourceCurrencyName) {
        WalletHistoryDTO walletDepositDTO = new WalletHistoryDTO();
        walletDepositDTO.setWalletSeq(targetWallet.getWalletSeq());
        walletDepositDTO.setBalance(targetWallet.getBalance().add(new BigDecimal(foreignAmount)));
        walletDepositDTO.setTransactionAmount(new BigDecimal(foreignAmount));
        walletDepositDTO.setTransactionType("E"); // E는 환전을 의미
        walletDepositDTO.setDepositCur(currencyCode);
        walletDepositDTO.setDepositName(sourceCurrencyName);
        return walletDepositDTO;
    }

    public void processKrwDeduction(Wallet fromWallet, Account account, Integer krwAmount, String transactionType) {
        // 만약 월렛에 돈이 없으면, 계좌에서 차감 후 월렛에 돈을 충전.
        if (fromWallet.getBalance().compareTo(BigDecimal.valueOf(krwAmount)) < 0) {
            // 계좌에서 차감 후 월렛에 돈을 충전
            BigDecimal shortageBigDecimal = BigDecimal.valueOf(krwAmount).subtract(fromWallet.getBalance());
            int shortage = shortageBigDecimal.intValue();
            deductFromAccount(account, shortage);
            // 월렛에 충전
            walletRepository.addWalletBalance(fromWallet.getUserSeq(), shortage, "KRW");
            // 거래내역추가
            addAccountHistory(account, krwAmount);
        }
        walletRepository.deductWalletBalance(fromWallet.getUserSeq(), krwAmount, "KRW");

        WalletHistoryDTO walletWithdrawDTO = createWithdrawDTO(fromWallet, krwAmount, transactionType);
        walletRepository.insertWithdrawWalletHist(walletWithdrawDTO);
        System.out.println("환전 출금 내역 추가: " + walletWithdrawDTO.toString());
    }

    public WalletHistoryDTO createWithdrawDTO(Wallet fromWallet, Integer krwAmount, String transactionType) {
        WalletHistoryDTO walletWithdrawDTO = new WalletHistoryDTO();
        walletWithdrawDTO.setWalletSeq(fromWallet.getWalletSeq());
        walletWithdrawDTO.setBalance(fromWallet.getBalance().subtract(new BigDecimal(krwAmount)));
        walletWithdrawDTO.setTransactionAmount(new BigDecimal(krwAmount));
        walletWithdrawDTO.setTransactionType(transactionType); // E는 환전을 의미
        walletWithdrawDTO.setWithdrawCur("KRW");
        walletWithdrawDTO.setWithdrawName("won");
        return walletWithdrawDTO;
    }

    private void addWalletNewCur(Wallet wallet, String currencyCode, String sourceCurrencyName, Integer foreignAmount) {
        // 월렛 외화 추가
        NewWalletCurrencyDTO newWalletCurrencyDTO = new NewWalletCurrencyDTO();
        int generatedWalletSeq = generateWalletNumber();
        newWalletCurrencyDTO.setWalletSeq(generatedWalletSeq);
        newWalletCurrencyDTO.setUserSeq(wallet.getUserSeq());
        newWalletCurrencyDTO.setAcNo(wallet.getAcNo());
        newWalletCurrencyDTO.setWalletPw(wallet.getWalletPw());
        BigDecimal formattedAmount = BigDecimal.valueOf(foreignAmount);
        newWalletCurrencyDTO.setBalance(formattedAmount);
        newWalletCurrencyDTO.setCurrencyCode(currencyCode);
        newWalletCurrencyDTO.setCurrency(sourceCurrencyName);

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
        Integer accountBalance = account.getBalance(); // 계좌의 현재 잔액을 얻습니다.
        if (accountBalance < amount) {
            throw new InsufficientBalanceException("계좌 잔액이 부족합니다.");
        }
        accountRepository.deductAccountBalance(account.getAcNo(), amount);
        System.out.println("계좌 출금 후: " + account.toString());
    }

    public class InsufficientBalanceException extends RuntimeException {
        public InsufficientBalanceException(String message) {
            super(message);
        }
    }

    @Override
    public void deductWalletBalance(Wallet wallet, Integer amount) {
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

    public void insertAccHistByWallet(AccountHistoryResponseDTO accountHistoryResponseDTO) {
        accountRepository.insertAccHistByWallet(accountHistoryResponseDTO);
    }

    private void addWalletHistory(Wallet wallet, Integer amount) {
        // 월렛 거래 내역 추가
        WalletHistoryDTO walletHistoryDTO = new WalletHistoryDTO();
        walletHistoryDTO.setWalletSeq(wallet.getWalletSeq());
        walletHistoryDTO.setBalance(wallet.getBalance().add(new BigDecimal(amount)));
        walletHistoryDTO.setTransactionAmount(new BigDecimal(amount));
        walletHistoryDTO.setTransactionType("A"); // A는 계좌를 의미
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

    // 자동환전 테이블 삽입
    @Override
    public void insertAutoExchange(AutoExchangeDTO autoExchangeDTO) {
        walletRepository.insertAutoExchange(autoExchangeDTO);
        System.out.println("자동환전 삽입은 " + autoExchangeDTO.toString());
    }

    @Override
    public List<AutoExchangeDTO> getAutoExchangeListByUserSeq(int userSeq) {
        List<AutoExchangeDTO> autoExchangeDTOS = walletRepository.getAutoExchangeListByUserSeq(userSeq);
        for (AutoExchangeDTO a : autoExchangeDTOS) {
            System.out.println("자동환전 리스트는 " + a);
        }
        return autoExchangeDTOS;
    }

    @Override
    public List<AutoExchangeDTO> getAutoExchangeListByWalletSeq(int walletSeq) {
        List<AutoExchangeDTO> autoExchangeDTOS = walletRepository.getAutoExchangeListByWalletSeq(walletSeq);
        for (AutoExchangeDTO a : autoExchangeDTOS) {
            System.out.println("자동환전 리스트는 " + a);
        }
        return autoExchangeDTOS;
    }

    // 송금기능
    @Transactional
    public void doRemittance(RemittanceDTO remittanceDTO) {
        Wallet wallet = walletRepository.findWalletByWalletNo(remittanceDTO.getWalletSeq());
        Account account = accountRepository.getAccountByAcNo(remittanceDTO.getSenderAc());
        Integer amount = remittanceDTO.getRemitAmount();
        // 월렛 돈 차감
        processKrwDeduction(wallet, account, amount, "T");

        //해외송금내역 추가
        remittanceDTO.setRemitSeq(generateRandomNumber(9));
        walletRepository.insertRemittance(remittanceDTO);
        // 일일한도 감소
    }

    @Override
    public List<RemittanceDTO> getRemittanceListByWalletSeq(int walletSeq) {
        List<RemittanceDTO> remittanceDTOList = walletRepository.getRemittanceListByWalletSeq(walletSeq);
        return remittanceDTOList;
    }

    @Override
    public List<WalletHistoryDTO> getWholeWalletHistory(int walletSeq) {
        List<WalletHistoryDTO> walletHistoryDTOList = walletRepository.getWholeWalletHistory(walletSeq);
        return walletHistoryDTOList;
    }

    @Override
    public void changeWalletPassword(String walletPw, int userSeq){
        walletRepository.changeWalletPassword(walletPw, userSeq);
        Wallet wallet = walletRepository.findWalletByWalletNo(userSeq);
        System.out.println("바뀐 월렛 비밀번호는 " + wallet.toString());
    }

    @Override
    public void removeAutoExchange(int aeSeq){
        walletRepository.removeAutoExchange(aeSeq);
        System.out.println("자동환전 삭제 완료");
    }
}

