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
import com.ydu.biz.main.ProfessorVO;
import com.ydu.biz.main.StudentVO;
import com.ydu.biz.main.impl.LoginMapper;

@Controller
public class MainController {
	@Autowired
	LoginService userService;
	
	
	// 濡쒓렇�씤 �뤌
	@RequestMapping("/loginForm.do")
	public String loginForm(){
		
		return "./main/login";
	}
	
	// 濡쒓렇�씤
	@RequestMapping("/login.do")
	@ResponseBody 
	public String login(LoginVO vo, HttpSession session) {
		LoginVO userId = userService.getUser(vo);
		StudentVO stuResult = new StudentVO();
		ProfessorVO proResult = new ProfessorVO();
		
		/*StudentVO stu_result = userService.getStudentInfo(vo);*/
		System.out.println("----result媛� : "+userId);
		
		if( vo.getUserpw().equals(userId.getUserpw()) ) {
			session.setAttribute("userId", userId);
	//		System.out.println("===================== userId : "+userId.getUserid());
	//		System.out.println("===================== userSaper : "+userId.getSeparation());
			
			if(userId.getSeparation().equals("stu"))
			{
				stuResult.setId(userId.getUserid());
				stuResult = userService.getStudentInfo(stuResult);
				session.setAttribute("stuInfo", stuResult);
			}
			else if(userId.getSeparation().equals("pro")) {
				proResult.setId(userId.getUserid());
				proResult = userService.getProfessorInfo(proResult);
				session.setAttribute("proInfo", proResult);
			}
			
			return "success";
		}else {
			return null;
		}
	}

	//濡쒓렇�븘�썐
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); //�꽭�뀡 臾댄슚�솕
		System.out.println("logout call!");
		return "redirect:/main/index"; //硫붿씤�솃
	}
	/*
	//�긽�떞�떊泥��궡�뿭蹂닿린
	@RequestMapping("/selectSchedule.do")
	public String selectSchedule1(InterStausVO vo, Model model) {
		InterStausVO result = interviewService.selectSchedule();
		System.out.println(result);
		model.addAttribute("result", result);
		return "/interview/calendar"; //硫붿씤�솃
	}
	*/
	
	/*
	// �뀒�뒪�듃
	@RequestMapping("/test.do")
	@ResponseBody 
	public String getParam(LoginVO vo) {
		LoginVO result = userService.getUser(vo);
		System.out.println("----result媛� : "+result);
		if(result==null){
			System.out.println("-----------濡쒓렇�씤 �떎�뙣");
			return "/main/login";
		}
		
		return "redirect:/main/index";
		
		//濡쒓렇�씤�씠 �븞�맂 寃쎌슦
		if(result == null) {
			return "/main/login";
		} else {
			//�꽭�뀡�뿉 ���옣
			session.setAttribute("login", result.getUserid());
			return "redirect:/main/index";	//home
		}
		
	}*/
	
}
