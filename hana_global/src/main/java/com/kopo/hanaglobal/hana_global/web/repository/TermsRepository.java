package com.kopo.hanaglobal.hana_global.web.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TermsRepository {
    String getTermsContent(@Param("title") String title);
}
