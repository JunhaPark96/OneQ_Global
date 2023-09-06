package com.kopo.hanaglobal.openBank.repository;

import com.kopo.hanaglobal.openBank.dto.AccountInfoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AccountRepository {
    // 멤버 아이디로 본인 전체 계좌 가져오기
    public List<AccountInfoDTO> findAccountsByMemberId(String memberId);
    // 멤버 아이디로 오픈뱅킹에 연동된 내 계좌 찾기
    public List<AccountInfoDTO> findMyAccountsByMemberId(String memberId);
    // 계좌번호로 멤버 이름 찾기
    public String getMemberName(String accountNumber);
    // 오픈뱅킹 등록
    void updateRegisterYn(String accountNumber)

}
