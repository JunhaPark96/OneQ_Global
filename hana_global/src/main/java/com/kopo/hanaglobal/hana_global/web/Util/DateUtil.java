package com.kopo.hanaglobal.hana_global.web.Util;

// Utility 클래스 생성
public class DateUtil {
    public static String getBirthDateFromId(String id) {
        String year = id.substring(0, 2);
        String month = id.substring(2, 4);
        String day = id.substring(4, 6);
        // 주민등록번호 첫 번째 숫자가 3이거나 4인 경우, 2000년 이후 출생으로 간주
        if (id.charAt(6) == '3' || id.charAt(6) == '4') {
            year = "20" + year;
        } else {
            year = "19" + year;
        }
        return year + "-" + month + "-" + day;
    }
}

