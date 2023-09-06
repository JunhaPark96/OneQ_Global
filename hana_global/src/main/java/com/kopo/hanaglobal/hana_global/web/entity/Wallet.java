package com.kopo.hanaglobal.hana_global.web.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Wallet {
    private int walletSeq;
    private int userSeq;
    private String acNo;
    private String walletPw;
    private Long balance;
    private Long deposit;
    private String currencyCode;
    private String currency;
    private Long primeRate;
}
