package com.kopo.hanaglobal.hana_global.web.dto.mapper;

import com.kopo.hanaglobal.hana_global.web.entity.Member;
import com.kopo.hanaglobal.hana_global.web.repository.MemberRepository;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;


@SpringBootTest
class MemberMapperTest {
    @Autowired
    private MemberRepository memberRepository;

    @Test
    void testGetAllMembers() {
        // DB에서 모든 멤버 정보 가져오기
        List<Member> members = memberRepository.getMemberAll();

        // 결과가 비어있지 않은지 확인
        Assertions.assertThat(members).isNotEmpty();

        // 가져온 첫 번째 멤버의 email이 비어있지 않은지 확인 (추가적인 검증을 더 할 수 있음)
        Assertions.assertThat(members.get(0).getEmail()).isNotEmpty();
    }


}