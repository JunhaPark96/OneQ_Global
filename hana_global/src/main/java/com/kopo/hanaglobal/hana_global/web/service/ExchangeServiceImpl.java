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

}
