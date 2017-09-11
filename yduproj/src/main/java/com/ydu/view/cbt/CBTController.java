package com.ydu.view.cbt;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.ydu.biz.cbt.CBTExampackVO;
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

		List<Map<String, Object>> list = cbtService.getAllCBT();
		model.addAttribute("cbtList", list);
		
		return "/cbt/cbtList";
	}

	//[학생 cbt 조회]학생은 수강신청한 cbt의 목록만 조회가능합니다.
	@RequestMapping(value= "/getMyCBT.do")
	public String getMyCBT(Model model, HttpSession session) {
		System.out.println("[학생 목록 조회 페이지] by cbt_controller=====");
		
		String stu_code = "201711400";//(String)session.getAttribute("stCode");
		
		List<CBTListVO> list = cbtService.getMyCBT(stu_code);
		model.addAttribute("cbtList", list);
		return "/cbt/cbtList";
	}
	
	//[시험을 클릭했을 때, 시험시작 전 준비화면]
	@RequestMapping(value= "/goTestInfo.do")
	public String getTestInfo(Model model, CBTListVO vo) {
		System.out.println("[Test Main] by cbt_controller=====");
		
		model.addAttribute("test", cbtService.getCBTInfo(vo));

		return "/cbt/cbtTestMain";
	}
	
	
	//[시험ㄱㄱ하는 페이지]
	@RequestMapping(value= "/goTestPage.do")
	public String takeAnExam(Model model, HttpSession session) {
		System.out.println("[시험치는 페이지로넘어갑니다.] by cbt_controller=====");
		
		//String exam_code = "3"; //(String)session.getAttribute("cbtCode");
		List<CBTExampackVO> list = cbtService.getTest();
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
