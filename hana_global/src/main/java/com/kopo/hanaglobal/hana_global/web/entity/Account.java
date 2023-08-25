package com.kopo.hanaglobal.hana_global.web.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Account {
    private String acNo;
    private int userSeq;
    private String acName;
    private String acPasswd;
    private String balance;
    private String openDate;
    private int status;

}
