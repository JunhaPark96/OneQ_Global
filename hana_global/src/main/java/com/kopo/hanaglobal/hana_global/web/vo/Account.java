package com.kopo.hanaglobal.hana_global.web.vo;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Account {
    private String accountName;
    private String accountNumber;
    private String creationDate;
    private String balance;
}
