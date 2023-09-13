package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.CurrencyRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;
import com.kopo.hanaglobal.hana_global.web.entity.ExchangeRate;
import com.kopo.hanaglobal.hana_global.web.repository.ExchangeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;

@Service
public class ExchangeServiceImpl implements ExchangeService {
    private ExchangeRepository exchangeRepository;

    @Autowired
    public ExchangeServiceImpl(ExchangeRepository exchangeRepository) {
        this.exchangeRepository = exchangeRepository;
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
    public ExchangeRateHistDTO getExchangeRateForPeriod(CurrencyRequestDTO requestDTO, Period period) {
        String endDate = LocalDate.now().toString();
        String startDate = LocalDate.now().minus(period).toString();
        requestDTO.setEndDate(endDate.replace("-", "/"));
        requestDTO.setStartDate(startDate.replace("-", "/"));

        return exchangeRepository.getLowestBaseRateForDates(requestDTO);
    }


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


}
