package com.ydu.view.classes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ydu.biz.classes.ClassListVO;
import com.ydu.biz.classes.ClassService;

@Controller
public class ClassController {

		@Autowired ClassService classService;
	
		@RequestMapping("/classBody.do")
		public String classBody()
		{
			System.out.println("수강신청 body load");
			return "/class/classBody";
		}
		
		//메인
		@RequestMapping(value="/classMain.do")
		public String classMain() {
			System.out.println("수강신청 main");
			return "/class/classMain";
		}
		@RequestMapping(value="/classProgram.do")
		public String classProgram() {
			System.out.println("강의 계획서");
			return "/class/classProgram";
		}
		
		@RequestMapping(value="/getClassesList.do")
		public String enrollmentTime(Model model, ClassListVO vo) {
			System.out.println("수강신청조회");
		if(classService == null){
			System.out.println("수강 자료 없음");
		}
		else {
			System.out.println("조회성공");
			List<ClassListVO> list = classService.getClassesList();
			model.addAttribute("classList",list);
		}
			return "/class/classList";
		}
		
		@RequestMapping(value="/myPage.do")
		public String myPage() {
			System.out.println("마이페이지");
			return "/class/myPage";
		}
	
}
