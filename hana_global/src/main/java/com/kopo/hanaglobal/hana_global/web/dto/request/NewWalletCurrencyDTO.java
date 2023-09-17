package com.kopo.hanaglobal.hana_global.web.dto.request;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class NewWalletCurrencyDTO {
    private int userSeq;
    private String acNo;
    private String walletPw;
    private BigDecimal balance;
    private String currencyCode;
    private String currency;
}
