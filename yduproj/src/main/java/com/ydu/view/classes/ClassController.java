package com.ydu.view.classes;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		//강의 계획서 조회
		@RequestMapping(value="/classProgram.do")
		public String classProgram(Model model, ClassListVO vo) {
			System.out.println("강의계획서조회할거야");
			if(classService == null){
				System.out.println("수강 자료가 없네");
			} 
			else {
				System.out.println("조회성공");
				List<Map<String, Object>> list = classService.getClassesList();
				model.addAttribute("classList",list);
			}
			return "/class/classProgram";
		}
		
		// 수강신청(조회하기)
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
		
		// 코드 리스트 조회
		@RequestMapping(value="getsmallList.do")
		@ResponseBody
		public List<Map<String, Object>> getsmallList(@RequestParam (value = "code") String code){
			return classService.getsmallList(code);
		}
		
		//강의 계획서 조회
		@RequestMapping("/getClassDetail.do")
		public String ClassDetail(Model model, ClassListVO vo) {
			// Map<String,Object> map= classService.getClasses(vo);
			model.addAttribute("detail", classService.getClasses(vo));
			//model.addAttribute("classList", classService.getClasses(vo));
			return "/class/classDetail";
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
			return "/class/classStatus";
		}
		
}
