package com.kopo.hanaglobal.hana_global.web.Util;

import java.util.Random;

public class RandomNumberGenerator {
    public static int generateRandomNumber(int length) {
        Random random = new Random();
        StringBuilder randomNumber = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int digit = random.nextInt(10);
            randomNumber.append(digit);
        }

        return Integer.parseInt(randomNumber.toString());
    }
}