package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.dto.request.ExchangeRateHistRequestDTO;
import com.kopo.hanaglobal.hana_global.web.dto.response.ExchangeRateHistDTO;
import com.kopo.hanaglobal.hana_global.web.repository.ExchangeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ExchangeServiceImpl implements ExchangeService{
    private ExchangeRepository exchangeRepository;

    @Autowired
    public ExchangeServiceImpl(ExchangeRepository exchangeRepository){
        this.exchangeRepository = exchangeRepository;
    }

    @Override
    public List<ExchangeRateHistDTO> getExchangeRateHist(ExchangeRateHistRequestDTO requestDTO) {
        List<ExchangeRateHistDTO> exchangeRateHistList = exchangeRepository.getExchangeRateHist(requestDTO);
        for (ExchangeRateHistDTO e : exchangeRateHistList){
            System.out.println(e.toString());
        }
        return exchangeRateHistList;
    }
}
