package com.kopo.hanaglobal.hana_global.web.mapping;

import java.util.HashMap;
import java.util.Map;

public class CountryCurrencyMapping {
    private static final Map<String, String> currencyMapping = new HashMap<>();

    static {
        currencyMapping.put("KOR", "KRW");  // 대한민국
        currencyMapping.put("GBR", "GBP");  // 영국
        currencyMapping.put("USA", "USD");  // 미국
        //... 추가적인 국가와 통화 코드 매핑 ...
    }

    public static String getCurrencyCodeByCountryCode(String countryCode) {
        return currencyMapping.getOrDefault(countryCode, "KRW");  // 기본값은 KRW로 설정
    }
}

