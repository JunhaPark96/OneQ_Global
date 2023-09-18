package com.kopo.hanaglobal.hana_global.web.dto.request;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class AutoExchangeDTO {
    private int walletSeq;
    private String targetCurCode;
    private BigDecimal exchangeAmount;
    private String exchangeDate;
    private BigDecimal lowerBound;
}
