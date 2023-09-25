package com.kopo.hanaglobal.hana_global.web.dto.request;

import lombok.Data;

@Data
public class OpenAccountDTO {
//    private int userSeq;
    private String email;
    private String id;
    private String passwd;
    private String name;
    private String countrySP;
    private String nationality;
    private String birthDate;
    private String contact;
    private String jibunAddress;
//    private String status;
}
