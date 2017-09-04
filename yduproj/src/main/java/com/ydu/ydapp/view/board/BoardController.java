package com.ydu.ydapp.view.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ydu.ydapp.biz.board.BoardSearchVO;
import com.ydu.ydapp.biz.board.BoardService;
import com.ydu.ydapp.biz.board.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	//등록 formPage
	@RequestMapping("/boradInsertForm.do")
	public String boardInsertForm(){
		return "/boradInsertForm";
	}
	
	//insert
	@RequestMapping("/boardInsert.do")
	public String boardInsert(BoardVO vo){
		boardService.insertBoard(vo);
		return "redirect:/board/boardInsert";
	}
	
	//boardList
	@RequestMapping(value="getBoardList.do")
	public String getBoardList(Model model, BoardSearchVO vo ){
		List<BoardVO> list = boardService.getBoardList(vo);
		model.addAttribute("boardList",list);
		return "/board/getBoardList";
	}
	
	//detail
	@RequestMapping("/getBoard.do")
	public String getBoard(Model model, BoardVO vo){
		model.addAttribute("board", boardService.getBoard(vo));
		return "/board/getBoard";
	}
	
	
}
