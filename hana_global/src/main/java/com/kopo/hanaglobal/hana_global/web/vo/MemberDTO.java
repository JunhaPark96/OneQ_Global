package com.kopo.hanaglobal.hana_global.web.vo;

import lombok.*;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class MemberDTO {
    private int user_seq;
    private String email;
    private String passwd;
    private String name;
    private String registNo;
    private Date signupDate;
    private String visaNo;
    private String countrySP;
    private String nationality;
    private String birthDate;
    private String gender;
    private String contact;
    private String address;

}