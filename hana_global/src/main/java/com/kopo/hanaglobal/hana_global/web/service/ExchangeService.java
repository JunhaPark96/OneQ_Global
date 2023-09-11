package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.CurrencyRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;

import java.util.List;

public interface ExchangeService {
    public List<ExchangeRateHistDTO> getExchangeRateHist(ExchangeRateHistRequestDTO requestDTO);
    // 6개월 환율 조회
    public List<ExchangeRateHistDTO> getExchangeRateForLastSixMonths(CurrencyRequestDTO requestDTO);
}
