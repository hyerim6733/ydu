package com.ydu.view.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ydu.biz.board.BoardSearchVO;
import com.ydu.biz.board.BoardService;
import com.ydu.biz.board.BoardVO;
import com.ydu.biz.main.LoginService;
import com.ydu.biz.main.LoginVO;
import com.ydu.biz.main.impl.LoginMapper;

@Controller
public class MainController {
	@Autowired LoginService
	userService;
	
	// interview calendar
	@RequestMapping("/interview/calendar")
	public String calendar(){
		return "/interview/calendar";
	}
	@RequestMapping("/login.do")
	public String login(){
		return "/main/login";
	}
	
	// 로그인
	@RequestMapping("/getParam.do")
	@ResponseBody 
	public String getParam(LoginVO vo, HttpSession session) {
		LoginVO result = userService.getUser(vo);
		System.out.println("----result값 : "+result);
		
		if( vo.getUserpw().equals(result.getUserpw()) ) {
			session.setAttribute("login", result.getUserid());
			return "success";
		}else {
			return null;
		}
	}

	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); //세션 무효화
		return "redirect:/main/index"; //메인홈
	}
	/*
	//상담신청내역보기
	@RequestMapping("/selectSchedule.do")
	public String selectSchedule1(InterStausVO vo, Model model) {
		InterStausVO result = interviewService.selectSchedule();
		System.out.println(result);
		model.addAttribute("result", result);
		return "/interview/calendar"; //메인홈
	}
	*/
	
	/*
	// 테스트
	@RequestMapping("/test.do")
	@ResponseBody 
	public String getParam(LoginVO vo) {
		LoginVO result = userService.getUser(vo);
		System.out.println("----result값 : "+result);
		if(result==null){
			System.out.println("-----------로그인 실패");
			return "/main/login";
		}
		
		return "redirect:/main/index";
		
		//로그인이 안된 경우
		if(result == null) {
			return "/main/login";
		} else {
			//세션에 저장
			session.setAttribute("login", result.getUserid());
			return "redirect:/main/index";	//home
		}
		
	}*/
	
}
