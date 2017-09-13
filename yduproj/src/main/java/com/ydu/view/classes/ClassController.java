package com.ydu.view.classes;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ydu.biz.classes.ClassListVO;
import com.ydu.biz.classes.ClassService;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.main.StudentVO;

@Controller
public class ClassController {

		@Autowired ClassService classService;
	
		@RequestMapping("/classBody.do")
		public String classBody()
		{
			System.out.println("�닔媛뺤떊泥� body load");
			return "/class/classBody";
		}
		
		//硫붿씤
		@RequestMapping(value="/classMain.do")
		public String classMain() {
			System.out.println("�닔媛뺤떊泥� main");
			return "/class/classMain";
		}
		@RequestMapping(value="/classProgram.do")
		public String classProgram() {
			System.out.println("媛뺤쓽 怨꾪쉷�꽌");
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
			List<Map<String, Object>> list = classService.getClassesList();
			model.addAttribute("classList",list);
		}
			return "/class/enrollmentTime";
		}
		
		@RequestMapping(value="/myPage.do")
		public String myPage() {
			System.out.println("마이페이지");
			return "/class/myPage";
		}
	
		@RequestMapping(value="/getSelClassList.do")
		public String getSelClassList(Model model, StudentVO vo) {
			List<ClassStatusVO> list = classService.getSelStuClassesList(vo);
			model.addAttribute("SelClassList", list);
			System.out.println("selected student classStatusList method excute!!");
			System.out.println(list);
			return "/newPage"; // new page setting
		}		
		
		//classStatus
		@RequestMapping(value="/classStatus.do")
		public String classStatusView() {
			System.out.println("留덉씠�럹�씠吏�");
			String temp1 = "월:3~4/수:1~3";
			String[] temp2 = temp1.split("/");
			String[] str_main = null;
			
			for(String idx:temp2)
			{
				str_main = idx.split(":");
				/*
				for(String idx2:str_main) {
					System.out.println(idx2);
				}*/
			}

			System.out.println("str_main");
			for(String idx2 : str_main) {
				
				System.out.println(idx2);
			}
			
			return "/class/classStatus";
		}
		
}
