package com.kopo.hanaglobal.hana_global.web.dto.response;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AccountHistoryResponseDTO {
    private String acNo;
    private String tradeDate;
    private String transactionAmount;
    private String transactionType;
    private String balance;
    private String target;
    private String targetAccount;
}
