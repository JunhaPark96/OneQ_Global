package com.kopo.hanaglobal.hana_global.web.entity;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Wallet {
    private int walletTransNo;
    private int walletSeq;
    private int userSeq;
    private String acNo;
    private String walletPw;
    private BigDecimal balance;
    private String currencyCode;
    private String currency;
    private BigDecimal primeRate;
}
