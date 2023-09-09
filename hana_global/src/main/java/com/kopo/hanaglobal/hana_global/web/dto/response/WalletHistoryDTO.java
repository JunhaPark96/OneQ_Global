package com.kopo.hanaglobal.hana_global.web.dto.response;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class WalletHistoryDTO {
    private int walletTransNo;
    private int walletSeq;
    private BigDecimal balance;
    private BigDecimal transactionAmount;
    private String currencyCode;
    private String currency;
    private String transactionType;
    private String withdrawCur;
    private String withdrawName;
    private String depositCur;
    private String depositName;
}
