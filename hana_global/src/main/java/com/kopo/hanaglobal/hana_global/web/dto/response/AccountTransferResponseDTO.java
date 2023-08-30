package com.kopo.hanaglobal.hana_global.web.dto.response;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AccountTransferResponseDTO {
    private Integer accHistNo;
    private String acNo;
    private String tradeDate;
    private Integer balance;
    private Integer transactionAmount;
    private Integer transactionType;
    private String participant;
    private String participantAccount;

}
