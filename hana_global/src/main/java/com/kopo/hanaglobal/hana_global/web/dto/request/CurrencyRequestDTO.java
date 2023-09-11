package com.kopo.hanaglobal.hana_global.web.dto.request;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CurrencyRequestDTO {
    private String currency;
    private String startDate;
    private String endDate;
}
