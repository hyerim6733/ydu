package com.ydu.view.cbt;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ydu.biz.board.BoardVO;
import com.ydu.biz.cbt.CBTComentVO;
import com.ydu.biz.cbt.CBTExampackVO;
import com.ydu.biz.cbt.CBTListVO;
import com.ydu.biz.cbt.CBTResultVO;
import com.ydu.biz.cbt.CBTService;
import com.ydu.biz.classes.ClassSearchVO;
import com.ydu.biz.classes.ClassService;
import com.ydu.biz.main.ProfessorVO;
import com.ydu.biz.main.StudentVO;

@Controller
public class CBTController {

	@Autowired CBTService cbtService;
	@Autowired ClassService classService;
	
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

	// cbt Coment 
		@RequestMapping(value="/getCbtComent.do", method=RequestMethod.POST)
		@ResponseBody
		public List<Map<String, Object>> getCbtComent(Model model){
			//List<Map<String, Object>> list = interviewService.getInterveiwList();
			List<Map<String, Object>> list = cbtService.getCbtComent();
			List<Map<String, Object>> reList = cbtService.getCbtComentRe();
			System.out.println(reList);
			model.addAttribute("reply", reList);
		//	model.addAttribute("list", "dd");
			return list;
		}
		// cbt Coment insert
		@RequestMapping(value="/insertCbtComent.do", method=RequestMethod.POST)
		public void insertCbtComent(Model model,CBTComentVO vo){
			cbtService.insertComent(vo);
		}
		
			
	//[교수 cbt 조회 ] 교수는 모든 cbt 목록을 조회할 수 있습니다.
	@RequestMapping(value= "/getAllCBT.do")
	public String getAllCBT(Model model, CBTListVO vo) {

		System.out.println("[교수 목록 조회 페이지] by cbt_controller=====");

		List<Map<String, Object>> list = cbtService.getAllCBT();
		model.addAttribute("cbtList", list);

		return "/cbt/cbtList";
	}
	////[교수 cbt] 교수는 문제 출제완료후 모든 cbt 목록을 조회할 수 있습니다.
	@RequestMapping(value= "/proSelectCBT.do")
	public String proSelectCBT(Model model, CBTListVO vo) {
		System.out.println("[문제 출제후 리스트 페이지로 ] =========cbt_controller=====");
		List<Map<String, Object>> list = cbtService.getAllCBT();
		model.addAttribute("cbtList", list);
		return "/cbt/cbtList";
	}
	
	
	//[학생 cbt 조회]학생은 수강신청한 cbt의 목록만 조회가능합니다. 학생목록조회테스트
	@RequestMapping(value= "/getMyCBT.do")
	public String getMyCBT(Model model, HttpSession session) {
		System.out.println("[학생 목록 조회 페이지] by cbt_controller=====");

		String code =((StudentVO)session.getAttribute("stuInfo")).getStudentCode(); //(로그인세션받아오기) cbt-mapping.xml 에 #{code}에 전달되는 값

		List<CBTListVO> list = cbtService.getMyCBT(code);
		model.addAttribute("cbtList", list);
		return "/cbt/cbtList";
	}

	//[시험을 클릭했을 때, 시험시작 전 준비화면]
	@RequestMapping(value= "/goTestInfo.do")
	public String getTestInfo(Model model, CBTListVO vo , HttpSession session ) {
		System.out.println("[Test Main] by cbt_controller=====");

		int cbt_code = vo.getCbtCode(); //cbt-mapping.xml 에 #{code}에 전달되는 값
		model.addAttribute("test", cbtService.getCBTInfo(cbt_code));

		return "/cbt/cbtTestMain";
	}
	
	
	//[시험ㄱㄱ하는 페이지]

	@RequestMapping(value= "/goTestPage.do", method=RequestMethod.POST)
	public String takeAnExam(Model model, CBTExampackVO vo , HttpServletRequest request, HttpSession session) {
		System.out.println("[시험] by cbt_controller=====");//삭제
		
		int cbt_code = vo.getCbtCode(); //cbt-mapping.xml 에 #{code}에 전달되는 값
		//(String)session.getAttribute("cbtCode"); 쌤이 이거 쓰시라구했는데, 어케쓰는지 모르겠음,ㅎ,ㅎ
		
		List<Map<String, Object>> list = cbtService.getTest(cbt_code);
		int size = list.size(); 		//cbt 문제의 갯수,  cbtCode=3 은 6개입니다..
		int cnt = Integer.parseInt((String)request.getParameter("cnt"));	
		
		System.out.println("first : " + (BigDecimal) (list.get(0).get("examId")) 
							+ " || size : " + list.size()
							+ " || cnt : " + request.getParameter("cnt")); //삭제
		//세션에 mark저장
		int[] total = new int[size] ;//점수 int 배열로 넘김
		if(cnt>0){
			total = (int[])request.getSession().getAttribute("total");
		} //세션에 mark값 더해짐
		if( cnt < size) {	
			 //제일 처음 시작 시작을 누르면 cnt = 0 , (cbtTestMain.jsp에서 제일 먼저 받음.)
			 //cbtTestPage.jsp 에서 한 문제씩 출력 및 다음을 누르면 채점
			 //cnt 는 만약 size가 6이면 0~5까지임. 리스트에서 하나씩 문제 읽어옴.
			//int mark = cbtService.getMarkTest(vo);
			if(cnt != 0 ) {
				System.out.println("===code : " + vo.getCbtCode()
								+ " ===id : " + vo.getExamId() 
								+ " ===rightAnswer : " + vo.getRightAnswer());
				CBTExampackVO cBTExampackVO = cbtService.getMarkTest(vo); 
				if(cBTExampackVO!=null) {
					System.out.println("===점수는 : "+cBTExampackVO.getMark());
					//cnt-1 이전 cnt 채점값
					total[cnt-1] =cBTExampackVO.getMark();
				}
			}
			request.getSession().setAttribute("total",total); //세션에 mark값 더해짐
			model.addAttribute("list", list.get(cnt));
			model.addAttribute("cnt", ++cnt);
			model.addAttribute("size", size);
			return "/cbt/cbtTestPage";
		}
		else {
			CBTExampackVO cBTExampackVO = cbtService.getMarkTest(vo); 
			if(cBTExampackVO!=null) {
				System.out.println("점수는 "+cBTExampackVO.getMark());
				total[cnt-1] =cBTExampackVO.getMark();
			}
			// 시험이 끝나면 결과화면으로,, 팝업창이나, 
			//  종료되기전에 팝업이 뜨면 좋을 것같아요..ㅠㅠㅠ 
			//  예를 들면 "시험을 제출하면 더이상 시험을 볼 수 없습니다. 제출하시겠습니까?" 등..
			//  점수도 떠야하구ㅜ
			int score=0;
			for(int i =0; i<size; i++){
				score+=total[i];
			}
			
			CBTResultVO cbtResultvo = new CBTResultVO(); 
			cbtResultvo.setCbtCode(vo.getCbtCode());
			cbtResultvo.setScore(score);
			cbtResultvo.setStCode(((StudentVO)session.getAttribute("stuInfo")).getStudentCode());
			cbtService.insertMark(cbtResultvo);
			
			session.setAttribute("cbtResultvo", cbtResultvo);
			return "redirect:/cbtMain.do#goResult.do";
		}
	}
	

	

	// 시험 next & exit & end 처리하는 것 넣기

	// [학생:시험친 후 시험결과]시험종료후 보여지는 페이지==============================jung
	@RequestMapping(value = "/goResult.do")
	public String getExamResult(HttpSession session, Model model) {
		System.out.println("[응시한 시험 결과] by cbt_controller=====");
		CBTResultVO cbtResultvo = (CBTResultVO) session.getAttribute("cbtResultvo");
		model.addAttribute("Result", cbtService.getMyGrade(cbtResultvo));
		return "/cbt/cbtResult";
	}

	// [학생:응시한 시험 전체 결과]결과보기 클릭시 응시한 전체 시험 결과 보여줌
	// ====================================jung
	@RequestMapping(value = "/goAllResult.do")
	public String getAllExamResult(HttpSession session, Model model, CBTResultVO cbtResultvo) {
		System.out.println("[전체시험 결과] by cbt_controller=====");
		cbtResultvo.setStCode(((StudentVO) session.getAttribute("stuInfo")).getStudentCode());
		model.addAttribute("Result", cbtService.getAllMyGrade(cbtResultvo));
		return "/cbt/cbtResult";
	}

	// [학생:시험친 후 시험결과] 응시불가능 클릭시 보여지는 =====================jung
	@RequestMapping(value = "/resultExam.do")
	public String ExamResult(HttpSession session, Model model, CBTResultVO cbtResultvo) {
		System.out.println("[응시한 시험 결과] by cbt_controller=====");
		cbtResultvo.setStCode(((StudentVO) session.getAttribute("stuInfo")).getStudentCode());
		model.addAttribute("Result", cbtService.getMyGrade(cbtResultvo));
		return "/cbt/cbtResult";
	}
	
	//[교수:시험지 등록폼(시험목록 등록)]Jung:ok
	@RequestMapping(value="/submitExamListForm.do",method=RequestMethod.GET)
	public String examListForm(Model model,ClassSearchVO vo, HttpSession session) {	
		vo.setProfCode(((ProfessorVO)session.getAttribute("proInfo")).getProfessorCode());//교수코드로 정보 넘겨줌
		System.out.println(vo.getProfCode()+ "======CBT등록폼페이지========");
		List<Map<String, Object>> list = classService.getProgramList(vo);
		model.addAttribute("classList",list);
		return "/cbt/insertListExam";
	}
	//[교수:시험지 등록처리(시험목록 등록)]Jung:ok
	@RequestMapping(value="/submitListExam.do" ,method=RequestMethod.POST)
	public String insertListExam(Model model ,CBTListVO vo) {
		cbtService.insertTestList(vo);
		System.out.println(vo.getCbtCode() + "===========시험지 등록===========");
		return "redirect:/cbtMain.do#getAllCBT.do";
	}
	//[교수:문제 출제 폼]jung:ok
	@RequestMapping(value="/submitExamForm.do",method=RequestMethod.GET)
	public String inserTestForm(Model model,CBTExampackVO cbtvo,HttpSession session) {		
		List<Map<String, Object>> list = cbtService.getTest(cbtvo.getCbtCode());
		model.addAttribute("examList",list);
		model.addAttribute("cBTExampackVO",cbtvo);
		return "/cbt/insertExam";
	}	
	//[교수:문제 출제 처리]jung
	@RequestMapping(value="/submitExam.do",method=RequestMethod.POST)
	public String insertTest(Model model,CBTExampackVO cbtvo) {
		cbtService.insertTest(cbtvo);
		System.out.println( "===========문제 등록===========");
		return "redirect:/cbtMain.do#submitExamForm.do?cbtCode="+cbtvo.getCbtCode();
	}
	

	//시험 질문게시판
	@RequestMapping("/boardQnA.do")
	public String boardQnA(Model model) {		
		return "/cbt/boardQnA";
	}
}
