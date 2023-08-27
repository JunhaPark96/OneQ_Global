package com.kopo.hanaglobal.hana_global.web.dto.request;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class LoginDTO {
    private String id;
    private String passwd;
}
