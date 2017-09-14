package com.ydu.view.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ydu.biz.board.BoardSearchVO;
import com.ydu.biz.board.BoardService;
import com.ydu.biz.board.BoardVO;

@Controller
public class BoardController {
	
	@Autowired    
	BoardService boardService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap =  new HashMap<String, String>();
		conditionMap.put("noticeGen", "일반");
		conditionMap.put("noticeLit", "학사");
		conditionMap.put("noticeEmp", "취업");
		conditionMap.put("noticeSch", "장학");
		conditionMap.put("noticeVol", "봉사");
		conditionMap.put("noticeEve", "학술/행사");
		return conditionMap;
	}
	
	
	
//공지사항b1
	@RequestMapping(value="/notice.do")
	public String notice(Model md,BoardSearchVO vo){
		vo.setBoardCode("b1");//검색값 b1 넘어감
		List<BoardVO> list = boardService.notice(vo);
		System.out.println("공지사항 클릭 접속==notice==="+list);//확인용
		md.addAttribute("notice1",list);
		return "/board/b1/notice";
	}
	@RequestMapping(value="/noticeGen.do")
	public String noticeGen(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b1");
		vo.setCategory("b10");
		List<BoardVO> list2 = boardService.noticeGen(vo);
		System.out.println("일반공지==noticeGen==="+list2);//확인용
		model.addAttribute("notice1", list2);
		return "/board/b1/notice";
	}
	@RequestMapping(value="/noticeLit.do")
	public String noticeLit(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b1");
		vo.setCategory("b11");
		List<BoardVO> list2 = boardService.noticeLit(vo);
		System.out.println(list2);
		System.out.println("학사공지==noticeLit===");//확인용
		model.addAttribute("notice1",list2);
		return "/board/b1/notice";
	}
	@RequestMapping(value="/noticeEmp.do")
	public String noticeEmp(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b1");
		vo.setCategory("b12");
		List<BoardVO> list2 = boardService.noticeEmp(vo);
		System.out.println(list2);
		System.out.println("취업공지==noticeEmp===");//확인용
		model.addAttribute("notice1",list2);
		return "/board/b1/notice";
	}
	@RequestMapping(value="/noticeSch.do")
	public String noticeSch(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b1");
		vo.setCategory("b13");
		List<BoardVO> list2 = boardService.noticeSch(vo);
		System.out.println(list2);
		System.out.println("장학공지==noticeSch===");//확인용
		model.addAttribute("notice1",list2);
		return "/board/b1/notice";
	}
	@RequestMapping(value="/noticeVol.do")
	public String noticeVol(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b1");
		vo.setCategory("b14");
		List<BoardVO> list2 = boardService.noticeVol(vo);
		System.out.println(list2);
		System.out.println("봉사공지==noticeVol===");//확인용
		model.addAttribute("notice1",list2);
		return "/board/b1/notice";
	}
	@RequestMapping(value="/noticeEve.do")
	public String noticeEve(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b1");
		vo.setCategory("b15");
		List<BoardVO> list2 = boardService.noticeEve(vo);
		System.out.println(list2);
		System.out.println("학술/행사==noticeVol===");//확인용
		model.addAttribute("notice1",list2);
		return "/board/b1/notice";
	}
	

//학교일정:캘린더 b2
	@RequestMapping("/academicCalendar.do")
	public String academicCalendar() {
		System.out.println("학교일정 클릭 접속==academicCalendar===");//확인용
		return "/board/b2/academicCalendar";
	}		
//학교안내 b3
	@RequestMapping("/academics1.do")
	public String academics1() {
		System.out.println("대학 클릭 접속==academics1===");//확인용
		return "/board/b3/academics1";
	}
	@RequestMapping("/academics2.do")
	public String academics2() {
		System.out.println("대학교 클릭 접속==academics2=====");//확인용
		return "/board/b3/academics2";
	}
	@RequestMapping("/academics3.do")
	public String academics3() {
		System.out.println("부속교육기관 클릭 접속==academics3=====");//확인용
		return "/board/b3/academics3";
	}
	
	
	
	
//벼룩시장 b4
	@RequestMapping(value="/fleaMarket.do")
	public String fleaMarket(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b4");//검색값 b4 넘어감
		List<BoardVO> list2 = boardService.fleaMarket(vo);
		model.addAttribute("fleaMarket1",list2);
		System.out.println("벼룩시장 클릭 접속==fleaMarket==="+list2);//확인용
		return "/board/b4/fleaMarket";
	}
	@RequestMapping(value="/fleaMarketSell.do")
	public String fleaMarketSell(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b4");//검색값 b4 넘어감
		vo.setCategory("b40");
		List<BoardVO> list2 = boardService.fleaMarketSell(vo);
		System.out.println("벼룩시장 [팝니다]클릭 접속==fleaMarket==="+list2);//확인용
		model.addAttribute("fleaMarket1",list2);
		return "/board/b4/fleaMarket";
	}
	@RequestMapping(value="/fleaMarketBuy.do")
	public String fleaMarketBuy(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b4");//검색값 b4 넘어감
		vo.setCategory("b41");
		List<BoardVO> list2 = boardService.fleaMarketBuy(vo);
		System.out.println("벼룩시장 [삽니다]클릭 접속==fleaMarket==="+list2);//확인용
		model.addAttribute("fleaMarket1",list2);
		return "/board/b4/fleaMarket";
	}
//벼룩시장 상세보기
	
//벼룩시장 등록폼 
	

	
//자유게시판 b5
	@RequestMapping("/freeBoard.do")
	public String freeBoard(Model model, BoardSearchVO vo) {
		vo.setBoardCode("b5");//검색값 b5 넘어감
		List<BoardVO> list = boardService.freeBoard(vo);
		System.out.println("자유게시판 클릭 접속==freeBoard====="+list);//확인용
		model.addAttribute("freeBoard1",list);
		return "/board/b5/freeBoard";
	}	

	
//FAQ b6
	@RequestMapping("/faq.do")
	public String faq() {
		System.out.println("FAQ 클릭 접속==faq===");//확인용
		return "/board/b6/faq";
	}	

	
	
	
	
}
