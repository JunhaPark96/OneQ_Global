package com.kopo.hanaglobal.hana_global.web.repository;

import com.kopo.hanaglobal.hana_global.web.vo.BoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepositoryImpl implements BoardRepository{
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<BoardVO> getAllPost() {
        List<BoardVO> boardList = sqlSessionTemplate.selectList("com.kopo.hanaglobal.hana_global.web.repository.BoardRepository.selectAll");
        return boardList;
    }
}
