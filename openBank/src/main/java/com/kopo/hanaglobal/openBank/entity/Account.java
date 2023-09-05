package com.kopo.hanaglobal.openBank.entity;

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
    private Integer balance;
    private String openDate;
    private int status;
}
