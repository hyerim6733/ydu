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
	
//공지사항&학사안내&미정
	@RequestMapping(value="/notice.do")
	public ModelAndView notice(ModelAndView mv,BoardSearchVO vo){
		vo.setBoardCode("10");//검색값 10 넘어감
		List<BoardVO> list = boardService.notice(vo);
		System.out.println("공지사항 클릭 접속==notice===");//확인용
		mv.addObject("notice",list);
		mv.setViewName("/board/notice");
		return mv;
	}
	@RequestMapping(value="/literature.do")
	public ModelAndView literature(ModelAndView mv2,BoardSearchVO vo){
		vo.setBoardCode("20");//검색값 20 넘어감
		List<BoardVO> list2 = boardService.literature(vo);
		System.out.println("학사안내 클릭 접속==literature===");//확인용
		mv2.addObject("literature",list2);
		mv2.setViewName("/board/literature");
		return mv2;
	}
	
//대학&대학원&부속교육기관
	@RequestMapping("/academics1.do")
	public String academics1() {
		System.out.println("대학 클릭 접속==academics1===");//확인용
		return "/board/academics1";
	}
	@RequestMapping("/academics2.do")
	public String academics2() {
		System.out.println("대학교 클릭 접속==academics2=====");//확인용
		return "/board/academics2";
	}
	@RequestMapping("/academics3.do")
	public String academics3() {
		System.out.println("부속교육기관 클릭 접속==academics3=====");//확인용
		return "/board/academics3";
	}
	
//벼룩시장&자유게시판
	@RequestMapping(value="/fleaMarket.do")
	public String fleaMarket(Model model,BoardSearchVO vo) {
		vo.setBoardCode("40");//검색값 40 넘어감
		List<BoardVO> list2 = boardService.fleaMarket(vo);
		System.out.println(list2);
		System.out.println("벼룩시장 클릭 접속==fleaMarket===");//확인용
		model.addAttribute("fleaMarket",list2);
		return "/board/fleaMarket";
	}
	@RequestMapping("/freeBoard.do")
	public String freeBoard() {
		System.out.println("자유게시판 클릭 접속==freeBoard=====");//확인용
		return "/board/freeBoard";
	}	

	
//FAQ
	@RequestMapping("/faq.do")
	public String faq() {
		System.out.println("FAQ 클릭 접속==faq===");//확인용
		return "/board/faq";
	}	

//학교일정:캘린더
	@RequestMapping("/academicCalendar.do")
	public String academicCalendar() {
		System.out.println("학교일정 클릭 접속==academicCalendar===");//확인용
		return "/board/academicCalendar";
	}		
	
	
	
}
