package com.kopo.hanaglobal.hana_global.web.dto.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberMapper {
    @Select("select count(*) from member")
    public int getCnt();
    public int getCnt2();
}
