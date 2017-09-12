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
import org.springframework.web.servlet.ModelAndView;

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
	//cbt Body load
	@RequestMapping("/cbtBody.do")
	public String cbtBody() {
		return "/cbt/cbtBody";
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
		
		String code = "201711400"; //(로그인세션받아오기) cbt-mapping.xml 에 #{code}에 전달되는 값
		
		List<CBTListVO> list = cbtService.getMyCBT(code);
		model.addAttribute("cbtList", list);
		return "/cbt/cbtList";
	}
	
	//[시험을 클릭했을 때, 시험시작 전 준비화면]
	@RequestMapping(value= "/goTestInfo.do")
	public String getTestInfo(Model model, CBTListVO vo  /*, HttpSession session */) {
		System.out.println("[Test Main] by cbt_controller=====");
		
		int cbt_code = vo.getCbtCode(); //cbt-mapping.xml 에 #{code}에 전달되는 값
		model.addAttribute("test", cbtService.getCBTInfo(cbt_code));

		return "/cbt/cbtTestMain";
	}
	//[시험ㄱㄱ하는 페이지]
	@RequestMapping(value= "/goTestPage.do")
	public String takeAnExam(Model model, CBTExampackVO vo /*, HttpSession session*/) {
		System.out.println("[시험] by cbt_controller=====");

		int cbt_code = vo.getCbtCode(); //cbt-mapping.xml 에 #{code}에 전달되는 값
										//(String)session.getAttribute("cbtCode"); 쌤이 이거 쓰시라구했는데, 어케쓰는지 모르겠음,ㅎ,ㅎ
		List<CBTExampackVO> list = cbtService.getTest(cbt_code);
		
		int first = 5; // list.get(0).getExamId();
		int current = vo.getExamId();
		
		if( current - first < first ) {
			System.out.println("if == ");
			model.addAttribute("list", list.get(current));
			return "/cbt/cbtTestPage";
		}
		else {
			System.out.println("else ==");
			return "redirect:/goResult.do";
		}
	}
	
	//시험 next & exit & end 처리하는 것 넣기
	
	//[학생:시험친 후 시험결과]
	@RequestMapping(value= "/goResult.do", method=RequestMethod.POST)
	public ModelAndView getExamResult(ModelAndView mv, HttpSession session) {
		System.out.println("[결과 페이지로넘어갑니다.] by cbt_controller=====");
		
		//mv.addObject("",list);
		mv.setViewName("/cbt/cbtResult");
		return mv;
	}
	
	//[교수:시험 출제 폼]
	@RequestMapping("/submitExamForm.do")
	public String examForm(Model model) {		
		return "/cbt/insertExam";
	}	
	//[교수:시험 출제]
	@RequestMapping("/submitExam.do")
	public String insertExampack(Model model) {
		
		return "redirect:/getAllCBT.do";
	}
	
	//시험 질문게시판
	@RequestMapping("/boardQnA.do")
	public String boardQnA(Model model) {		
		return "/cbt/boardQnA";
	}
}
