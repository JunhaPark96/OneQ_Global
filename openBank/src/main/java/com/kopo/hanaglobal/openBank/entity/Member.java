package com.kopo.hanaglobal.openBank.entity;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Member {
    private int userSeq;
    private String email;
    private String id;
    private String passwd;
    private String name;
    private String registNo;
    private String signupDate;
    private String countrySP;
    private String nationality;
    private String birthDate;
    private String gender;
    private String contact;
    private String roadAddress;
    private String jibunAddress;
    private String status;
}
