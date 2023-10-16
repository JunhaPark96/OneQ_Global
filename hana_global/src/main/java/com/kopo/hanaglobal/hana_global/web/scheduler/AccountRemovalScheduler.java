package com.kopo.hanaglobal.hana_global.web.scheduler;

import com.kopo.hanaglobal.hana_global.web.service.AccountService;
import com.kopo.hanaglobal.hana_global.web.service.MemberService;
import com.kopo.hanaglobal.hana_global.web.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AccountRemovalScheduler {
    private AccountService accountService;
    private MemberService memberService;

    @Autowired
    public AccountRemovalScheduler(MemberService memberService, AccountService accountService) {
        this.memberService = memberService;
        this.accountService = accountService;
    }

    @Scheduled(fixedDelay = 1209600000)
    public void removeAccountAndMember() {
        List<String> accountsToBeDeleted = accountService.findApprovedRefundsOlderThanTwoWeeks();
        for (String acNo : accountsToBeDeleted) {
            accountService.deleteAccountByAcNo(acNo);
        }
    }
}

