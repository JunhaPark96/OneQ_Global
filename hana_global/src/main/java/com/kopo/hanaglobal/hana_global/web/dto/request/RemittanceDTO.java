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
    private Integer remitAmount; // 원화
    private Integer receivableAmount; // 외화
    private String currencyCode;
    private String address;
    private String bankCode;
    private String tradeDate;
    private String status;
    private String dailyLimit;
}
