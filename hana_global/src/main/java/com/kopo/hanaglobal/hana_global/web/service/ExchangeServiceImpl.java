package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.CurrencyRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;
import com.kopo.hanaglobal.hana_global.web.repository.ExchangeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

    //    @Override
//    public List<ExchangeRateHistDTO> getExchangeRateForLastSixMonths(String currency){
//        CurrencyRequestDTO currencyRequestDTO = new CurrencyRequestDTO();
//
//        // 오늘부터 6개월 전까지의 데이터를 DB에서 조회하여 반환
//        LocalDate today = LocalDate.now();
//        java.sql.Date todayD = java.sql.Date.valueOf(today);
////        currencyRequestDTO.setStartDate(todayD);
////        System.out.println(currencyRequestDTO.getStartDate());
//        LocalDate sixMonthsAgo = today.minusMonths(6);
//        java.sql.Date sixMonthsAgoD = java.sql.Date.valueOf(sixMonthsAgo);
////        currencyRequestDTO.setEndDate(sixMonthsAgoD);
//
//        System.out.println(todayD + " " + sixMonthsAgoD);
//        return exchangeRepository.getExchangeRateForLastSixMonths(currency, sixMonthsAgoD, todayD);
//    }
    @Override
    public List<ExchangeRateHistDTO> getExchangeRateForLastSixMonths(CurrencyRequestDTO requestDTO) {
        String endDate = LocalDate.now().toString();
        String startDate = LocalDate.now().minusMonths(6).toString();
        requestDTO.setEndDate(endDate);
        requestDTO.setStartDate(startDate);
        requestDTO.getEndDate().replace("-", "/");
        requestDTO.getStartDate().replace("-", "/");


        List<ExchangeRateHistDTO> currencyRequestDTOList = exchangeRepository.getExchangeRateForLastSixMonths(requestDTO);
        // 오늘부터 6개월 전까지의 데이터를 DB에서 조회하여 반환
//        LocalDate today = LocalDate.now();
//        LocalDate sixMonthsAgo = today.minusMonths(6);
        // 변환된 날짜를 출력 (참조용)
//        System.out.println(today.format(DateTimeFormatter.ofPattern("yyyy/MM/dd")) + " " + sixMonthsAgo.format(DateTimeFormatter.ofPattern("yyyy/MM/dd")));

        return currencyRequestDTOList;
    }


}
