package com.kopo.hanaglobal.hana_global.web.dto.request;

import lombok.*;

//@Getter
//@Setter
//@AllArgsConstructor
//@NoArgsConstructor
//@ToString
@Data
public class CurrencyRequestDTO {
    private String currency;
    private String startDate;
    private String endDate;

    public CurrencyRequestDTO(String currency) {
        this.currency = currency;
    }
}
