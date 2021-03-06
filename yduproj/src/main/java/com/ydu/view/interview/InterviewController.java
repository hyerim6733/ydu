package com.ydu.view.interview;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ydu.biz.interview.InterStatusVO;
import com.ydu.biz.interview.InterStatusVO_trans;
import com.ydu.biz.interview.InterviewService;
import com.ydu.biz.main.LoginVO;

@Controller
public class InterviewController {
	@Autowired InterviewService interviewService;

	// interview calendar
	@RequestMapping("/interview/calendar.do")
	public String calendar(){
		return "/interview/calendar";
	}
	
	// view calendar
	@RequestMapping("/setCalendar.do")
	@ResponseBody
	public List<Map<String, Object>> setCalendar(Model model){
		List<Map<String, Object>> list = interviewService.getInterveiwList();
				
		return list;
	}
	
	// calendar update / insert Event
	@RequestMapping(value="/modifiedCalendar.do", method = RequestMethod.POST)
	@ResponseBody
	public void modifiedCalendar(Model model, @RequestBody List<InterStatusVO> list) {
		// @RequestBody <Map<String, InterStatusVO> vo 이형식으로 받을수 있는 방법은?
		
		
		for(InterStatusVO idx: list) {
			if(idx.getAction().equals("insert")) {
				// insert
				interviewService.insertInterview(idx);
				System.out.println("추가 완료");
			}
			
			// insert status number 설정.. (삭제 후 등록할때는 그 statusid 그대로 사용)
			else if(idx.getAction().equals("update")) {
				// 1. delete
				interviewService.deleteInterview(idx);
				System.out.println("삭제 완료");
				// 2. insert
				interviewService.insertInterview(idx);
				System.out.println("삭제 후 추가 완료");
			}
			System.out.println(idx);
		}
		
		//insert query문.. update랑.. 이어놓기
		
		
	}
	
	// calendar drop Event
		@RequestMapping("/dropCalendar.do")
		@ResponseBody
		public List<InterStatusVO> eventExcuteCalendar(Model model,HttpServletRequest request){
			List<InterStatusVO> list = new ArrayList<InterStatusVO>();
		//	model.addAttribute("common", request.getParameter("AddSchedule"));
		//	System.out.println(request.getParameter("AddSchedule"));
			
			//result
			List<Map<String, InterStatusVO>> result = new ArrayList<Map<String,InterStatusVO>>();
			
			InterStatusVO temp = new InterStatusVO();
			temp.setInterDate("2017-09-17");
			temp.setInterId("3");
			temp.setProperty("진로상담");
			temp.setSt_code("101");
			temp.setStatusId("2");
			temp.setTitle("진로상담");
			list.add(temp);
			System.out.println(temp);
			
			/*
			@RequestParam(value="AddSchedule") List<InterStatusVO> addSchedule;
			@RequestParam(value="schedule") List<InterStatusVO> schedule;
			*/
			
			
			// statusId / 명령어 동작
			Map<String, String> DBaction = new HashMap<String, String>();
			
			
			// 동작하기 / insert / update(delete , insert)		
			
			
			return list;
		}
		
	
}
