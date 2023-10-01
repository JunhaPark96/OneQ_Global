package com.kopo.hanaglobal.hana_global.web.dto.request;

import lombok.Data;

@Data
public class EmailDTO {
    private String to;
    private String subject;
    private String content;
}
