package com.kopo.hanaglobal.hana_global.web.dto.mapper;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class MemberMapperTest {
    @Autowired
    private MemberMapper memberMapper;


    @Test
    public void getCnt(){
        int cnt = memberMapper.getCnt();
        Assertions.assertThat(cnt).isEqualTo(10);
    }
    @Test
    public void getCnt2(){
        int cnt = memberMapper.getCnt2();
        Assertions.assertThat(cnt).isEqualTo(10);
    }

}