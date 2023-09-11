package com.kopo.hanaglobal.hana_global.web.dto.response;

import lombok.*;

import java.math.BigDecimal;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ExchangeRateHistDTO {
    private int curHistSeq;
    private String currencyCode;
    private Date rateDate;
    private BigDecimal buyRate;
    private BigDecimal sellRate;
    private BigDecimal remittance;
    private BigDecimal receiving;
    private BigDecimal baseRate;
    private BigDecimal prevRate;
    private BigDecimal usdConversionRate;
}
