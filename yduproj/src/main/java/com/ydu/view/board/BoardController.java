package com.ydu.view.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ydu.biz.board.BoardSearchVO;
import com.ydu.biz.board.BoardService;
import com.ydu.biz.board.BoardVO;

@Controller
public class BoardController {
	
	@Autowired    
	BoardService boardService;
	
	@RequestMapping(value="/prevNotice.do")
	public ModelAndView getBoardList(ModelAndView mv,BoardSearchVO vo){
		vo.setBoardCode("10");//검색값 10 넘어감
		List<BoardVO> list = boardService.prevNotice(vo);
		mv.addObject("boardList",list);
		mv.setViewName("/board/prevNotice");
		return mv;
	}
	
	
}
