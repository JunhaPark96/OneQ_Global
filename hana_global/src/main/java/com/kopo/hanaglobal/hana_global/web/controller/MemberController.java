package com.kopo.hanaglobal.hana_global.web.controller;

import com.kopo.hanaglobal.hana_global.web.service.BoardService;
import com.kopo.hanaglobal.hana_global.web.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/board")
    public ModelAndView getAllMember(){
        ModelAndView mav = new ModelAndView("/boardlist");
        List<BoardVO> boardList = boardService.getAllBoard();
        mav.addObject("boardList", boardList);
        return mav;
    }
}
