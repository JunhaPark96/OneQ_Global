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
    private Integer remitAmount; // 원화
    private Integer receivableAmount; // 외화
    private String currencyCode;
    private String address;
    private String tradeDate;
    private String status;
    private String dailyLimit;
    // 계좌보낼때
    private String recipientAc;
    private String bankCode;
    // 웨스턴유니온할때
    private String countryName;
    private String paymentPlace;
}
