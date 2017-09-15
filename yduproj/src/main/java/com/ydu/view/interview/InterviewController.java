package com.ydu.view.interview;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	
	
}
