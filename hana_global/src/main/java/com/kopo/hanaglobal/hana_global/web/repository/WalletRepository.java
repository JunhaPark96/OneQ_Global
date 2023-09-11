package com.kopo.hanaglobal.hana_global.web.repository;

import com.kopo.hanaglobal.hana_global.web.dto.response.WalletHistoryDTO;
import com.kopo.hanaglobal.hana_global.web.entity.Wallet;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

@Mapper
public interface WalletRepository {
    // 월렛최초생성
    public void createNewWallet(Wallet wallet);

    public List<Wallet> findWalletByMemberId(int memberId);

    public List<Wallet> findWalletByAccountNo(String acNo);

    public Wallet findWalletByUserSeqAndCurrencyCode(@Param("userSeq") int userSeq, @Param("currencyCode") String currencyCode);

    public void addWalletBalance(@Param("userSeq") int userSeq,
                                 @Param("deposit") Integer deposit,
                                 @Param("currencyCode") String currencyCode);
    // 월렛 seq로 잔액 가져오기
    public BigDecimal getBalanceByWalletSeq(int walletSeq);
    
    // 월렛 충전시 거래내역 추가
    public void insertDepositWalletHist(WalletHistoryDTO walletHistoryDTO);
}
