package com.kopo.hanaglobal.hana_global.web.dto.request;

import lombok.Data;

@Data
public class OpenAccountDTO {
    private String name;
    private String id;
    private String passwd;
    private String email;
    private String countrySP;
    private String nationality;
    private String contact;
    private String jibunAddress;
    private String birthDate;
}
