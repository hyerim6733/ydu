package com.ydu.view.classes;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ydu.biz.classes.ClassListVO;
import com.ydu.biz.classes.ClassService;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.classes.ClassTimeTransVO;
import com.ydu.biz.classes.ClassTimeVO;
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
		public String classStatusView(StudentVO vo, Model model ) {
			
			return "/class/classStatus";
		}

			/*
			for(String idx2 : str_main) {
				
				System.out.println(idx2);
			}
			*/
		@RequestMapping("/getClassTimeList.do")
		@ResponseBody
		public List<ClassTimeTransVO> getClassTimeList(StudentVO vo, Model model ) {
			List<ClassStatusVO> list = classService.getSelStuClassesList(vo);
			List<ClassTimeTransVO> timeList = new ArrayList<ClassTimeTransVO>();
			int cnt = 0;
			System.out.println(list);
			
			////////////////////////////////09.14수정중///////////////////////////////////
			for(ClassStatusVO currList : list) {
				//list.get(cnt++).getClassTime();
				
				
			//	String temp1 = "월:3~4/수:1~3";
				String temp1 = currList.getClassTime();
				String subName = currList.getClassTitle();
				String[] temp2 = temp1.split("/");
				String[] str_main = null;
				String[] str_main2 = null;
				ArrayList<String> strList = new ArrayList<String>();
				
				
				// classTime parsing
				for(String idx:temp2)
				{
					str_main = idx.split(":");
					System.out.println("str_main1");
					
					for(String idx2:str_main) {
						str_main2 = idx2.split("~");
						
						for(String idx3:str_main2) {
							strList.add(idx3);
							System.out.println(idx3);
						}
					}
					strList.add(subName);
				}
			
				
				//////////////////////////////////////////////////////
				// vo save
				for(int i=0;i<strList.size();i+=4) {
					ClassTimeTransVO ex = new ClassTimeTransVO();
					ex.setWeek(strList.get(i));
					ex.setStart(strList.get(i+1));
					ex.setEnd(strList.get(i+2));
					ex.setTitle(strList.get(i+3));
					//ex.setTitle(strList.get(cnt++));
					timeList.add(ex);
				}
				
				
			}
			//model.addAttribute("timeList", timeList);
			
			
			//////////////////////////////////////////////////////////////
			////       "월:3~4/수:1~3"  "화:1~3/목:3~4"        /////
			//////////////////////////////////////////////////////////////
			
			
			return timeList;
		}
		
		
}
