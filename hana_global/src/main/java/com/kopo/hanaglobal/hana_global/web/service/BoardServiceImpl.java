package com.kopo.hanaglobal.hana_global.web.service;

import com.kopo.hanaglobal.hana_global.web.repository.BoardRepository;
import com.kopo.hanaglobal.hana_global.web.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BoardServiceImpl implements BoardService{
    @Autowired
    private BoardRepository boardRepository;

    @Override
    public List<BoardVO> getAllBoard() {
        List<BoardVO> boardList = boardRepository.getAllPost();
        return boardList;
    }
}
