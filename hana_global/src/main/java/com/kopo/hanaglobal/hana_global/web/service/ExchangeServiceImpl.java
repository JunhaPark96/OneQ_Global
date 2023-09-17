package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.CurrencyRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Account;
import com.kopo.hanaglobal.hana_global.web.entity.ExchangeRate;
import com.kopo.hanaglobal.hana_global.web.entity.Wallet;
import com.kopo.hanaglobal.hana_global.web.repository.AccountRepository;
import com.kopo.hanaglobal.hana_global.web.repository.ExchangeRepository;
import com.kopo.hanaglobal.hana_global.web.repository.WalletRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;

@Service
public class ExchangeServiceImpl implements ExchangeService {
    private ExchangeRepository exchangeRepository;
    private AccountRepository accountRepository;
    private WalletRepository walletRepository;


    @Autowired
    public ExchangeServiceImpl(ExchangeRepository exchangeRepository, AccountRepository accountRepository, WalletRepository walletRepository) {
        this.exchangeRepository = exchangeRepository;
        this.accountRepository = accountRepository;
        this.walletRepository = walletRepository;
    }

    @Override
    public List<ExchangeRateHistDTO> getExchangeRateHist(ExchangeRateHistRequestDTO requestDTO) {
        String inqDt = requestDTO.getInqDt().replace("-", "/");
        requestDTO.setInqDt(inqDt);
        List<ExchangeRateHistDTO> exchangeRateHistList = exchangeRepository.getExchangeRateHist(requestDTO);
        for (ExchangeRateHistDTO e : exchangeRateHistList) {
            System.out.println(e.toString());
        }
        return exchangeRateHistList;
    }

//    // 3개월간 최저 환율 조회
//    @Override
//    public ExchangeRateHistDTO getExchangeRateForLastThreeMonths(CurrencyRequestDTO requestDTO) {
//        String endDate = LocalDate.now().toString();
//        String startDate = LocalDate.now().minusMonths(3).toString();
//        requestDTO.setEndDate(endDate);
//        requestDTO.setStartDate(startDate);
//        requestDTO.getEndDate().replace("-", "/");
//        requestDTO.getStartDate().replace("-", "/");
//
//        ExchangeRateHistDTO lowestBaseRate = exchangeRepository.getLowestBaseRateForDates(requestDTO);
//
//        return lowestBaseRate;
//    }
//    // 1개월간 최저 환율 조회
//    @Override
//    public ExchangeRateHistDTO getExchangeRateForLastMonth(CurrencyRequestDTO requestDTO) {
//        String endDate = LocalDate.now().toString();
//        String startDate = LocalDate.now().minusMonths(1).toString();
//        requestDTO.setEndDate(endDate);
//        requestDTO.setStartDate(startDate);
//        requestDTO.getEndDate().replace("-", "/");
//        requestDTO.getStartDate().replace("-", "/");
//
//        ExchangeRateHistDTO lowestBaseRate = exchangeRepository.getLowestBaseRateForDates(requestDTO);
//
//        return lowestBaseRate;
//    }
//    // 1주일간 최저 환율 조회
//    @Override
//    public ExchangeRateHistDTO getExchangeRateForLastWeek(CurrencyRequestDTO requestDTO) {
//        String endDate = LocalDate.now().toString();
//        String startDate = LocalDate.now().minusWeeks(1).toString();
//        requestDTO.setEndDate(endDate);
//        requestDTO.setStartDate(startDate);
//        requestDTO.getEndDate().replace("-", "/");
//        requestDTO.getStartDate().replace("-", "/");
//
//        ExchangeRateHistDTO lowestBaseRate = exchangeRepository.getLowestBaseRateForDates(requestDTO);
//
//        return lowestBaseRate;
//    }
    // 공통 로직을 별도의 메서드로 추출
    // 특정 기간 환율 정보
    public ExchangeRateHistDTO getExchangeRateForPeriod(CurrencyRequestDTO requestDTO, Period period) {
        String endDate = LocalDate.now().toString();
        String startDate = LocalDate.now().minus(period).toString();
        requestDTO.setEndDate(endDate.replace("-", "/"));
        requestDTO.setStartDate(startDate.replace("-", "/"));

        return exchangeRepository.getLowestBaseRateForDates(requestDTO);
    }

    // 최근 6개월 환율 정보
    @Override
    public List<ExchangeRateHistDTO> getExchangeRateForLastSixMonths(CurrencyRequestDTO requestDTO) {
        String endDate = LocalDate.now().toString();
        String startDate = LocalDate.now().minusMonths(6).toString();
        requestDTO.setEndDate(endDate);
        requestDTO.setStartDate(startDate);
        requestDTO.getEndDate().replace("-", "/");
        requestDTO.getStartDate().replace("-", "/");
        List<ExchangeRateHistDTO> currencyRequestDTOList = exchangeRepository.getExchangeRateForLastSixMonths(requestDTO);
        return currencyRequestDTOList;
    }

    // 최신 환율 불러오기
    @Override
    public ExchangeRate getExchangeRateByCurrency(String currency){
        ExchangeRate exchangeRate = exchangeRepository.getExchangeRateByCurrency(currency);
        System.out.println("환율은" + exchangeRate.toString());
        return exchangeRate;
    }

    @Override
    public List<ExchangeRate> getExchangeRate(){
        List<ExchangeRate> exchangeRateList = exchangeRepository.getExchangeRate();
//        for (ExchangeRate e : exchangeRateList){
//            System.out.println("오늘의 환율은: " + e.toString());
//        }
        return exchangeRateList;
    }

    // 환전기능 - 계좌금액 차감, 월렛 통화 충전
    @Transactional
    public void doExchange(int walletSeq, String currencyCode, String password, Integer amount){
        // 계좌 금액 차감
//        Account account = accountRepository.getAccountByAcNo(senderAccountNo);
//        System.out.println(senderAccountNo.toString());
//        Integer senderBalance = account.getBalance() - krwAmount;

        // 만약 월렛에 돈이 없으면, 계좌에서 차감 후 월렛에 돈을 충전.
        // 월렛에 돈이 있으면, 월렛에서 돈을 차감
        // 원화 차감
        Wallet fromWallet = walletRepository.findWalletByWalletNo(walletSeq);
        walletRepository.deductWalletBalance(fromWallet.getUserSeq(), amount, "KRW");
        // 외화 충전
        Wallet targetWallet = walletRepository.findWalletByUserSeqAndCurrencyCode(fromWallet.getUserSeq(), currencyCode);
        if (targetWallet.getCurrencyCode() != null){ // 월렛에 해당 외화가 있으면
            walletRepository.addWalletBalance(targetWallet.getUserSeq(), amount, targetWallet.getCurrencyCode());
        } else{ // 월렛에 해당 외화가 없으면

        }


        // 통화가 이미 존재한다면 있는 것에 update
        // 통화가 없으면 insert
    }

}
