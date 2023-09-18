package com.kopo.hanaglobal.hana_global.web.exception;

import com.kopo.hanaglobal.hana_global.web.service.WalletServiceImpl;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

    // 계좌에 충전금액이 부족할 경우
    @ExceptionHandler(WalletServiceImpl.InsufficientBalanceException.class)
    public String handleInsufficientBalanceException(WalletServiceImpl.InsufficientBalanceException ex, Model model) {
        model.addAttribute("errorMessage", ex.getMessage());
        return "wallet/doExchange"; // 오류 페이지 이름
    }

}

