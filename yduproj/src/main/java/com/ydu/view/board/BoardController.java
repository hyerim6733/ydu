package com.ydu.view.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ydu.biz.board.Paging;
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
	
	
	@RequestMapping(value="/noticeMain.do")
	public String noticeMain(Model md,BoardSearchVO vo){
		//vo.setBoardCode("b1");//검색값 b1 넘어감
		//List<BoardVO> list = boardService.noticeMain(vo);
		//md.addAttribute("notice1",list);
		return "/board/b1/noticeMain";
	}
	
	
	@RequestMapping(value = "/notice.do")
	public ModelAndView notice(ModelAndView mv, 
								BoardSearchVO vo, 
								Paging paging) {
		
		vo.setBoardCode("b1");
		
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}

		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		// 전체 건수
		int total = boardService.total(vo);//
		paging.setTotalRecord(total);

		List<BoardVO> list = boardService.notice(vo);
		mv.addObject("paging", paging);
		mv.addObject("notice1", list);
		mv.setViewName("/board/b1/notice");
		return mv;
	}
	
	
	@RequestMapping(value="/noticeGen.do")
	public String noticeGen(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b1");
		vo.setCategory("b10");
		List<BoardVO> list2 = boardService.noticeGen(vo);
		model.addAttribute("notice1", list2);
		return "/board/b1/notice";
	}
	@RequestMapping(value="/noticeLit.do")
	public String noticeLit(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b1");
		vo.setCategory("b11");
		List<BoardVO> list2 = boardService.noticeLit(vo);
		model.addAttribute("notice1",list2);
		return "/board/b1/notice";
	}
	@RequestMapping(value="/noticeEmp.do")
	public String noticeEmp(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b1");
		vo.setCategory("b12");
		List<BoardVO> list2 = boardService.noticeEmp(vo);
		model.addAttribute("notice1",list2);
		return "/board/b1/notice";
	}
	@RequestMapping(value="/noticeSch.do")
	public String noticeSch(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b1");
		vo.setCategory("b13");
		List<BoardVO> list2 = boardService.noticeSch(vo);
		model.addAttribute("notice1",list2);
		return "/board/b1/notice";
	}
	@RequestMapping(value="/noticeVol.do")
	public String noticeVol(Model model,BoardSearchVO vo) {
		vo.setBoardCode("b1");
		vo.setCategory("b14");
		List<BoardVO> list2 = boardService.noticeVol(vo);
		model.addAttribute("notice1",list2);
		return "/board/b1/notice";
	}
	
	
	@RequestMapping(value="/noticeEve.do")
	public ModelAndView noticeEve(ModelAndView mv, BoardSearchVO vo, Paging paging) {
		vo.setBoardCode("b1");
		vo.setCategory("b15");
	
		// 페이지번호 파라미터
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		// 전체 건수
		int totalEve = boardService.totalEve(vo);//
		paging.setTotalRecord(totalEve);

		List<BoardVO> list = boardService.noticeEve(vo);
		mv.addObject("paging", paging);
		mv.addObject("notice1", list);
		mv.setViewName("/board/b1/notice");
		return mv;
	}
	
	
	
	

	
	
	
	
	
	
	//공지사항 등록폼
	@RequestMapping(value="/insertNoticeForm.do",method=RequestMethod.GET) //value={}배열 여러개 입력가능
	public String insertNoticeForm(){
		return "/board/b1/noticeInsert";
	}
	//공지사항 등록
	@RequestMapping(value="/insertNotice.do",method=RequestMethod.POST)
	public String insertNotice(Model model, BoardVO vo) {
		if (vo.getMandatory()==null){
			vo.setMandatory("n");
		}//mandetory 널값일 경우 값넣어주기
		boardService.insertNotice(vo);	
		return "redirect:/detailNotice.do?boardNo="+vo.getBoardNo();
	}
		
	//공지사항 수정
	@RequestMapping(value="/updateNoticeForm.do",method=RequestMethod.GET)// 핸들러 같을때 GET방식 (생략가능) : jsp파일의 action= 같아야함
	public String updateNotice(Model model, BoardVO vo){
		model.addAttribute("board",boardService.detailNotice(vo));
		return "/board/b1/noticeInsert"; //파일위치파일명 주의!!
	}
	//수정처리
	@RequestMapping(value="/updateNotice.do",method=RequestMethod.POST)
	public String updateNotice(@ModelAttribute("board") BoardVO vo){
		System.out.println("=======공지사항=====수정: "+ vo);//수정
		//수정처리
		if (vo.getMandatory()==null){
			vo.setMandatory("n");
		}//mandetory 널값일 경우 값넣어주기
		boardService.updateNotice(vo);
		return "redirect:/detailNotice.do?boardNo="+vo.getBoardNo();//파일위치파일명 주의!!
	}
	
	//상세보기
	@RequestMapping("/detailNotice.do")
	public String detailNotice(Model model, BoardVO vo){
		System.out.println("공지사항 상세보기 controller");
		model.addAttribute("board",boardService.detailNotice(vo));
		//상세보기의 조회 한 정보를 세션으로 넣어두면 수정 할때 다시 조회 안해도 됨
		return "/board/b1/noticeDetail";
	}
	
	

	
	/*
	 * //등록처리 등록시는 모델어트리뷰트 사용 하면 안됨(이전 정보 가져오기때문)
		@RequestMapping(value="/insertNotice.do",method=RequestMethod.POST)
		public String insertNotice( BoardVO vo,
				SessionStatus status)throws IOException { //p377~
			
			System.out.println("등록==============="+ vo );
			boardService.insertNotice(vo);
			status.setComplete();
			return "redirect:/notice.do?boardNo="+vo.getBoardNo();
		}
		*/
		
		
	
	
	
	

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
/*	@RequestMapping(value="/insertFleaMarketForm.do",method=RequestMethod.GET) //value={}배열 여러개 입력가능
	public String insertFleaMarketForm(Model model){
		return "/board/b4/fleaMarketInsert";
	}
	//벼룩시장 등록
	@RequestMapping(value="/insertFleaMarket.do",method=RequestMethod.POST)
	public String insertFleaMarket(Model model, BoardVO vo){
		boardService.insertFleaMarket(vo);
		return "/board/b4/fleaMarket";
	}	
	
*/
	
//자유게시판 b5
	@RequestMapping("/freeBoard.do")
	public String freeBoard(Model model, BoardSearchVO vo) {
		vo.setBoardCode("b5");//검색값 b5 넘어감
		List<BoardVO> list = boardService.freeBoard(vo);
		model.addAttribute("freeBoard1",list);
		return "/board/b5/freeBoard";
	}	
	//등록폼
		@RequestMapping(value="/insertFreeBoardForm.do",method=RequestMethod.GET) //value={}배열 여러개 입력가능
		public String insertFreeBoardForm(){
			return "/board/b5/freeBoardInsert";
		}
	//등록
		@RequestMapping(value="/insertFreeBoard.do",method=RequestMethod.POST)
		public String insertFreeBoard(Model model, BoardVO vo) {
			boardService.insertFreeBoard(vo);
			return "redirect:/main/index#../detailFreeBoard.do?boardNo="+vo.getBoardNo();
		}	
	//수정
		@RequestMapping(value="/updateFreeBoardForm.do",method=RequestMethod.GET)// 핸들러 같을때 GET방식 (생략가능) : jsp파일의 action= 같아야함
		public String updateFreeBoardForm(Model model, BoardVO vo){
			model.addAttribute("board",boardService.detailFreeBoard(vo));
			return "/board/b5/freeBoardInsert"; //파일위치파일명 주의!!
		}
	//수정처리
		@RequestMapping(value="/updateFreeBoard.do",method=RequestMethod.POST)
		public String updateFreeBoard(@ModelAttribute("board") BoardVO vo){
			boardService.updateFreeBoard(vo);
			return "redirect:/main/index#../detailFreeBoard.do?boardNo="+vo.getBoardNo();//파일위치파일명 주의!!
		}	
	//상세보기
		@RequestMapping("/detailFreeBoard.do")
		public String detailFreeBoard(Model model, BoardVO vo){
			model.addAttribute("board",boardService.detailFreeBoard(vo));
			//상세보기의 조회 한 정보를 세션으로 넣어두면 수정 할때 다시 조회 안해도 됨
			return "/board/b5/freeBoardDetail";
		}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//FAQ b6
	@RequestMapping("/faq.do")
	public String faq() {
		System.out.println("FAQ 클릭 접속==faq===");//확인용
		return "/board/b6/faq";
	}	

	
	
	
	
}
