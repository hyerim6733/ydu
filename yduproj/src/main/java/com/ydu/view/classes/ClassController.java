package com.ydu.view.classes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;

import com.ydu.biz.classes.ClassListVO;
import com.ydu.biz.classes.ClassSearchVO;
import com.ydu.biz.classes.ClassService;
import com.ydu.biz.classes.ClassStatusVO;
import com.ydu.biz.classes.ClassTimeTransVO;
import com.ydu.biz.classes.ClassTimeVO;
import com.ydu.biz.interview.InterStatusVO;
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
		
		//수강신청 insert
		@RequestMapping(value="/insertClass.do")
		@ResponseBody
		public String insertClass(Model model, @RequestBody List<Map<String, Object>> vo, HttpSession session) {
			String errMsg = null;
			
			StudentVO stuInfo = (StudentVO)session.getAttribute("stuInfo");
			System.out.println("=============stdInfo========================"+stuInfo);
			StudentVO stuVO = new StudentVO();
			stuVO.setStudentCode(stuInfo.getStudentCode());
			
			// 수강신청한 목록 가지고 오기
			List<ClassStatusVO> myList = classService.getSelStuClassesList(stuVO);
			List<ClassTimeTransVO> timeList = new ArrayList<ClassTimeTransVO>();
			List<ClassTimeTransVO> timeList2 = new ArrayList<ClassTimeTransVO>();
						
			for(ClassStatusVO currList : myList) {
				//list.get(cnt++).getClassTime();
				
				
			//	String temp1 = "월:3~4/수:1~3";
				String temp1 = currList.getClassTime();
				String subName = currList.getClassTitle();
				String subProperty = currList.getProperty();
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
					strList.add(subProperty);
				}
			
				//////////////////////////////////////////////////////
				// vo save
				for(int i=0;i<strList.size();i+=5) {
					ClassTimeTransVO ex = new ClassTimeTransVO();
					ex.setWeek(strList.get(i));
					ex.setStart(strList.get(i+1));
					ex.setEnd(strList.get(i+2));
					ex.setTitle(strList.get(i+3));
					ex.setProperty(strList.get(i+4));
					//ex.setTitle(strList.get(cnt++));
					timeList.add(ex);
				}	
			}

			/////////////////////위쪽이 원래 수강신청 목록/////////////////////////////////////////////
			
			/////////////////////아래쪽이 수강신청하는 목록/////////////////////////////////////////////
		
		
			// List<Map<String, Object>> 값을 받아옴   ---> vo
			// vo의 값하나 당 for문 한 사이클 다 돌기
			for(Map<String, Object> voIdx:vo) {
				String temp1 = (String) voIdx.get("classTime");
				String subName = (String) voIdx.get("classTitle");
				String subProperty = (String) voIdx.get("property"); 
				String[] temp2 = temp1.split("/");
				String[] str_main = null;
				String[] str_main2 = null;
				ArrayList<String> strList2 = new ArrayList<String>();
				
				temp1 = (String) voIdx.get("classTime");
				// 1. 파싱
				// classTime parsing
				for(String idx:temp2)
				{
					str_main = idx.split(":");
					System.out.println("str_main2");
					
					for(String idx2:str_main) {
						str_main2 = idx2.split("~");
						
						for(String idx3:str_main2) {
							strList2.add(idx3);
							System.out.println(idx3);
						}
					}
					strList2.add(subName);
					strList2.add(subProperty);
				}
				// 2. vo에 값 넣고. for문으로 들어가면 체크할수 있음
				//////////////////////////////////////////////////////
				// vo save
				for(int i=0;i<strList2.size();i+=5) {
					ClassTimeTransVO ex = new ClassTimeTransVO();
					ex.setWeek(strList2.get(i));
					ex.setStart(strList2.get(i+1));
					ex.setEnd(strList2.get(i+2));
					ex.setTitle(strList2.get(i+3));
					ex.setProperty(strList2.get(i+4));
					//ex.setTitle(strList.get(cnt++));
					timeList2.add(ex);
				}
			}
		
			// 비교할 변수 선언
			Integer currStart, currEnd, wasStart, wasEnd;
			String currWeek, wasWeek;
			
			for(ClassTimeTransVO timeIdx1 : timeList2) {	// 수강신청한 목록
				currStart = Integer.valueOf(timeIdx1.getStart());
				currEnd = Integer.valueOf(timeIdx1.getEnd());
				currWeek = timeIdx1.getWeek();
				
				// timList = vo(TransVO)
				for(ClassTimeTransVO timeIdx2 : timeList) {	// 수강신청 되어있는 목록
					int s = currStart, e = currEnd;
					String weekk= currWeek;
		
					wasStart = Integer.valueOf(timeIdx2.getStart());
					wasEnd = Integer.valueOf(timeIdx2.getEnd());
					wasWeek = timeIdx2.getWeek();
					
					System.out.println("======================IF 들어가기전 MSG 삽입 전==============");
					System.out.println("Currweek : " + currWeek);
					System.out.println("s : "+s);
					System.out.println("e : "+e);
					System.out.println("----------------");
					System.out.println(wasWeek);
					System.out.println("wasStart : "+wasStart);
					System.out.println("wasEnd : "+wasEnd);
					if(wasWeek.equals(weekk)) {
						if((s>=wasStart && s<=wasEnd) || (e>=wasStart && e<=wasEnd)) {
							errMsg = "duplication";
						}
					}
				}
			}
		
			///////////////////////////insert는 정상적으로 되지만 위에서 예외처리중 9.25 ///////////////////////////
			if(errMsg != null){
				return errMsg;
			}
			else{
				// 수강신청 항목 넣기
				for(Map<String, Object> idx:vo) {
					classService.insertClass(idx);
				}
				return "success";
			}	
		}
		
		
		//강의 계획서 조회
		@RequestMapping(value="/classProgram.do")
		public String classProgram(Model model, ClassSearchVO vo) {
			System.out.println("강의계획서조회할거야");
			if(classService == null){
				System.out.println("수강 자료가 없네");
			} 
			else {
				System.out.println("조회성공");
				List<Map<String, Object>> list = classService.getProgramList(vo);
				model.addAttribute("classList",list);
			}
			return "/class/classProgram";
		}
		
		// 수강 포기 (단건)
		@RequestMapping(value="/deleteClass.do", method=RequestMethod.POST)
		@ResponseBody
		public String deleteClass(Model model, ClassStatusVO vo) {
			System.out.println(vo.getStatusId());
			classService.deleteClass(vo);
			return "success";
		}
		
		// 수강신청 메인화면에서  개인조회  세션 어떻게 가져옴??
		@RequestMapping(value="/currClass.do")
		@ResponseBody
		public List<Map<String, Object>>currClass(Model model, HttpSession session) {
			
			StudentVO stuInfo = (StudentVO)session.getAttribute("stuInfo");
			System.out.println("=============stdInfo========================"+stuInfo);
			ClassStatusVO cs = new ClassStatusVO();
			cs.setStCode(stuInfo.getStudentCode());
//			cs.setStCode("5049452");
			List<Map<String, Object>> list =  classService.getSelCurrClassesList(cs);
			for(Map<String, Object> idx:list) {
				System.out.println("idx : "+idx);
			}
			return list;
		}//테스트해보기
		
	
		// 수강신청(조회하기)
		@RequestMapping(value="/getClassesList.do")
		public String enrollmentTime(Model model, ClassSearchVO vo) {
			System.out.println("수강신청조회");
			if(classService == null){
				System.out.println("수강 자료 없음");
			} 
			else {
				System.out.println("조회성공");
				List<Map<String, Object>> list = classService.getProgramList(vo);
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
		
		// class set
		@RequestMapping(value="/setClass.do", method= RequestMethod.POST)
		@ResponseBody
		public List<Map<String, Object>> setClass(Model model){
			List<Map<String, Object>> list = classService.getClassList();
			System.out.println("================SET CLASS DO===================================");
			System.out.println(list);
			return list;
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
			
			
			for(ClassStatusVO currList : list) {
				//list.get(cnt++).getClassTime();
				
				
			//	String temp1 = "월:3~4/수:1~3";
				String temp1 = currList.getClassTime();
				String subName = currList.getClassTitle();
				String subProperty = currList.getProperty();
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
					strList.add(subProperty);
				}
			
				
				//////////////////////////////////////////////////////
				// vo save
				for(int i=0;i<strList.size();i+=5) {
					ClassTimeTransVO ex = new ClassTimeTransVO();
					ex.setWeek(strList.get(i));
					ex.setStart(strList.get(i+1));
					ex.setEnd(strList.get(i+2));
					ex.setTitle(strList.get(i+3));
					ex.setProperty(strList.get(i+4));
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
