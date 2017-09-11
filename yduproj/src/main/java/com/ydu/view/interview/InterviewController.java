package com.ydu.view.interview;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ydu.biz.interview.InterviewService;

@Controller
public class InterviewController {
	@Autowired InterviewService interviewService;
		
/*	@RequestMapping("/classBody.do")
	public String classBody()
	{
		System.out.println("body load");
		return "/class/classBody";
	}*/
}
