package com.kopo.hanaglobal.hana_global.web.dto.request;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ExchangeRateHistRequestDTO {
    private String inqDt;
    private String currency;
}
