package com.kopo.hanaglobal.hana_global.web.repository;

import com.kopo.hanaglobal.hana_global.web.vo.BoardVO;

import java.util.List;

public interface BoardRepository {
    public List<BoardVO> getAllPost();
}
