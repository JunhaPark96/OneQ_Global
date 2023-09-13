package com.kopo.hanaglobal.hana_global.web.entity;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ExchangeRate {
    private String currencyCode;
    private String rateDate;
    private BigDecimal buyRate;
    private BigDecimal sellRate;
    private BigDecimal remittance;
    private BigDecimal receiving;
    private BigDecimal baseRate;
    private BigDecimal prevRate;
    private BigDecimal usdConversionRate;
}
