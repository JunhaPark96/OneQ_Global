package com.kopo.hanaglobal.hana_global.web.repository;

import com.kopo.hanaglobal.hana_global.web.dto.request.CurrencyRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;
import com.kopo.hanaglobal.hana_global.web.entity.ExchangeRate;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Mapper
public interface ExchangeRepository {
    public List<ExchangeRateHistDTO> getExchangeRateHist(ExchangeRateHistRequestDTO requestDTO);

    // 최근 6개월 환율 불러오기
    public List<ExchangeRateHistDTO> getExchangeRateForLastSixMonths(CurrencyRequestDTO requestDTO);

    // 해당 통화 불러오기
    public ExchangeRate getExchangeRateByCurrency(String currency);

    // 환율 최저가 찾기
    public ExchangeRateHistDTO getLowestBaseRateForDates(CurrencyRequestDTO requestDTO);

    // 가장 최신 환율 불러오기
    public List<ExchangeRate> getExchangeRate();
}
