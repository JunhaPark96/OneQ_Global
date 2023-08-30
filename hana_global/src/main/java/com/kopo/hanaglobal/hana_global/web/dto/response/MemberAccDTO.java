package com.kopo.hanaglobal.hana_global.web.dto.response;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberAccDTO {
    private String name;
    private String signupDate;
    private String acNo;
    private Integer balance;
    private String acName;
}
// 회원 계좌 조회