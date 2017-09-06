package com.ydu.view.classes;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ydu.biz.classes.ClassService;

public class ClassController {

	@Autowired ClassService classService;
	
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
		
		@RequestMapping(value="/enrollmentTime.do")
		public String enrollmentTime() {
			System.out.println("수강신청");
			return "/class/enrollmentTime";
		}
		
		@RequestMapping(value="/myPage.do")
		public String myPage() {
			System.out.println("마이페이지");
			return "/class/myPage";
		}
	
}
