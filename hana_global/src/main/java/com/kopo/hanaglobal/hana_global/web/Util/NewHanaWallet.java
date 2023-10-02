package com.kopo.hanaglobal.hana_global.web.Util;

import java.util.Random;

public class NewHanaWallet {
    public static int generateWalletNumber() {
        Random random = new Random();

        // 412 다음에 6자리 랜덤 숫자 생성
        int randomNumber = 412000000 + random.nextInt(1000000);

        return randomNumber;
    }
}


