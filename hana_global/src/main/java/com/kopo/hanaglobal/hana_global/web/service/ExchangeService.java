package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.CurrencyRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;
import com.kopo.hanaglobal.hana_global.web.entity.ExchangeRate;

import java.time.Period;
import java.util.List;

public interface ExchangeService {
    public List<ExchangeRateHistDTO> getExchangeRateHist(ExchangeRateHistRequestDTO requestDTO);
    // 6개월 환율 조회
    public List<ExchangeRateHistDTO> getExchangeRateForLastSixMonths(CurrencyRequestDTO requestDTO);
    // 3개월간 최저환율 조회
//    public ExchangeRateHistDTO getExchangeRateForLastThreeMonths(CurrencyRequestDTO requestDTO);
//    // 1개월간 최저환율 조회
//    public ExchangeRateHistDTO getExchangeRateForLastMonth(CurrencyRequestDTO requestDTO);
//    // 1주일간 최저환율 조회
//    public ExchangeRateHistDTO getExchangeRateForLastWeek(CurrencyRequestDTO requestDTO);
    public ExchangeRate getExchangeRateByCurrency(String currency);

    public ExchangeRateHistDTO getExchangeRateForPeriod(CurrencyRequestDTO requestDTO, Period period);
}
