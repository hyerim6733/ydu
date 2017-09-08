package com.ydu.view.cbt;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ydu.biz.cbt.CBTListVO;
import com.ydu.biz.cbt.CBTResultVO;
import com.ydu.biz.cbt.CBTService;

@Controller
public class CBTController {
	
	@Autowired CBTService cbtService;
	
	//cbt 메인페이지 
	@RequestMapping(value="/cbtMain.do")
	public String cbtMain() {
		System.out.println("cbt main page");
		return "/cbt/cbtMain";
	}
	
	//[교수 cbt 조회 ] 교수는 모든 cbt 목록을 조회할 수 있습니다.
	@RequestMapping(value= "/getAllCBT.do")
	public String getAllCBT(Model model, CBTListVO vo) {
		
		System.out.println("[교수 목록 조회 페이지] by cbt_controller=====");
		
		
		List<CBTListVO> list = cbtService.getAllCBT();
		model.addAttribute("cbtList", list);
		return "/cbt/cbtList";
	}
	
	//[학생 cbt 조회]학생은 수강신청한 cbt의 목록만 조회가능합니다.
	@RequestMapping(value= "/getMyCBT.do")
	public String getMyCBT(Model model, HttpSession session) {
		System.out.println("[학생 목록 조회 페이지] by cbt_controller=====");
		
		String stu_code = "1";//(String)session.getAttribute("abc");
		
		List<CBTListVO> list = cbtService.getMyCBT(stu_code);
		model.addAttribute("cbtList", list);
		return "/cbt/cbtList";
	}
	
	//[시험]
	@RequestMapping(value= "/goTestPage.do")
	public String takeAnExam(Model model, HttpSession session) {
		System.out.println("[시험치는 페이지로넘어갑니다.] by cbt_controller=====");
		List<CBTResultVO> list = cbtService.getTest();
		model.addAttribute("examList", list);
		return "/cbt/cbtTestPage";
	}
	
	//[결과]
	@RequestMapping(value= "/goResult.do")
	public String getExamResult(Model model, HttpSession session) {
		System.out.println("[결과 페이지로넘어갑니다.] by cbt_controller=====");
		
		return "/cbt/cbtResult";
	}
	
	
	
	
	/*test page*/
	@RequestMapping(value="/test.do")
	public void Test() {
		System.out.println("test");
	}
	
	@RequestMapping("/cbtBody.do")
	public String cbtBody() {
		return "/cbt/cbtBody";
	}
	@RequestMapping("/test11.do")
	public String test1() {
		return "/cbt/test1";
	}
}
