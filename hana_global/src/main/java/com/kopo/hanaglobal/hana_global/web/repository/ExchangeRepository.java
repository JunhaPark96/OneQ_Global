package com.kopo.hanaglobal.hana_global.web.repository;

import com.kopo.hanaglobal.hana_global.web.dto.request.CurrencyRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Mapper
public interface ExchangeRepository {
    public List<ExchangeRateHistDTO> getExchangeRateHist(ExchangeRateHistRequestDTO requestDTO);

    public List<ExchangeRateHistDTO> getExchangeRateForLastSixMonths(CurrencyRequestDTO requestDTO);
}
