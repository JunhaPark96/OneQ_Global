package com.kopo.hanaglobal.hana_global.web.dto.request;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class RemittanceDTO {
    private int remitSeq;
    private int walletSeq;
    private String sender;
    private String recipient;
    private String senderAc;
    private String recipientAc;
    private BigDecimal remitAmount;
    private String tradeDate;
    private String status;
    private String currencyCode;
    private String bank;
    private String mtcn;
    private BigDecimal dailyLimit;
}
