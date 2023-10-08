package com.kopo.hanaglobal.hana_global.web.mapping;

import java.util.HashMap;
import java.util.Map;

public class CountryCurrencyMapping {
    private static final Map<String, String> currencyMapping = new HashMap<>();

    static {
        currencyMapping.put("KOR", "KRW");  // 대한민국
        currencyMapping.put("GBR", "GBP");  // 영국
        currencyMapping.put("USA", "USD");  // 미국
        currencyMapping.put("JPN", "JPY");  // 일본
        currencyMapping.put("DEU", "EUR");  // 독일
        currencyMapping.put("FRA", "EUR");  // 프랑스
        currencyMapping.put("CHN", "CNY");  // 중국
        currencyMapping.put("IND", "INR");  // 인도
        currencyMapping.put("BRA", "BRL");  // 브라질
        currencyMapping.put("CAN", "CAD");  // 캐나다
        currencyMapping.put("AUS", "AUD");  // 호주
        currencyMapping.put("RUS", "RUB");  // 러시아
        currencyMapping.put("TUR", "TRY");  // 터키
        currencyMapping.put("SAU", "SAR");  // 사우디 아라비아
        currencyMapping.put("ZAF", "ZAR");  // 남아프리카
        currencyMapping.put("MEX", "MXN");  // 멕시코
        currencyMapping.put("ARG", "ARS");  // 아르헨티나
        currencyMapping.put("EGY", "EGP");  // 이집트
        currencyMapping.put("NGA", "NGN");  // 나이지리아
        currencyMapping.put("IDN", "IDR");  // 인도네시아
        currencyMapping.put("ESP", "EUR");  // 스페인
        currencyMapping.put("ITA", "EUR");  // 이탈리아
        currencyMapping.put("GRC", "EUR");  // 그리스
        currencyMapping.put("ESP", "EUR");  // 스페인
        currencyMapping.put("ITA", "EUR");  // 이탈리아
        currencyMapping.put("GRC", "EUR");  // 그리스
        currencyMapping.put("NLD", "EUR");  // 네덜란드
        currencyMapping.put("BEL", "EUR");  // 벨기에
        currencyMapping.put("AUT", "EUR");  // 오스트리아
        currencyMapping.put("SWE", "SEK");  // 스웨덴
        currencyMapping.put("NOR", "NOK");  // 노르웨이
        currencyMapping.put("DNK", "DKK");  // 덴마크
        currencyMapping.put("FIN", "EUR");  // 핀란드
        currencyMapping.put("CHE", "CHF");  // 스위스
        currencyMapping.put("SGP", "SGD");  // 싱가포르
        currencyMapping.put("MYS", "MYR");  // 말레이시아
        currencyMapping.put("THA", "THB");  // 태국
        currencyMapping.put("VNM", "VND");  // 베트남
        currencyMapping.put("PHL", "PHP");  // 필리핀
        currencyMapping.put("KWT", "KWD");  // 쿠웨이트
        currencyMapping.put("SAU", "SAR");  // 사우디 아라비아
        currencyMapping.put("ARE", "AED");  // 아랍에미리트
        currencyMapping.put("EGY", "EGP");  // 이집트
    }

    public static String getCurrencyCodeByCountryCode(String countryCode) {
        return currencyMapping.getOrDefault(countryCode, "KRW");  // 기본값은 KRW로 설정
    }
}

