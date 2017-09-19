package com.ydu.ydapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ydu.biz.board.BoardSearchVO;
import com.ydu.biz.board.BoardService;
import com.ydu.biz.board.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//홈화면
	@RequestMapping(value = "/main/index", method = RequestMethod.GET)
	public String main(Locale locale, Model model, BoardVO vo/*, @RequestBody String getStr*/) {
		
		String selectKey = "b1"; //공지사항 호출
		
		vo.setBoardCode(selectKey);
		List<BoardVO> boardList = boardService.mainBoard(vo);
		
		System.out.println("홈화면 접속 하셨습니다.");
		return "/tiles/layout";
	}
	@RequestMapping(value = "/getget.do")
	@ResponseBody
	public List<BoardVO> getget(Locale locale, Model model, BoardVO vo) {
		
		String selectKey = "b1"; //공지사항 호출
		
		vo.setBoardCode(selectKey);
		List<BoardVO> boardList = boardService.mainBoard(vo);
		
		System.out.println("getget 접속 하셨습니다.");
		return boardList;
	}
	
	@RequestMapping("/tabClick.do")
	@ResponseBody
	public List<BoardVO> tabClick(Locale locale, Model model, BoardVO vo, HttpServletRequest req) {
		String getStr = req.getParameter("selectMenu");
		System.out.println(getStr+"====================");
		String selectKey = "b1";
		if(getStr.equals("공지사항"))
		{
			selectKey = "b1";	
		}else if(getStr.equals("자유게시판"))
		{
			selectKey = "b5";
		}else if(getStr.equals("벼룩시장"))
		{
			selectKey = "b4";
		}else if(getStr.equals("학교안내"))
		{
			
		}
		
		vo.setBoardCode(selectKey);
		List<BoardVO> boardList = boardService.mainBoard(vo);
		
		return boardList;
	}
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//메인화면 클릭시
	@RequestMapping(value = "/main/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		
		logger.info("Welcome home! The client locale is {}.", locale);
		
		System.out.println("메인화면 클릭 하셨습니다.");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/main/home";
	}
	
}
