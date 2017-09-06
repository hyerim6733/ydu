package com.ydu.view.main.check;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("samp")
public class scheduleCheck {
	@RequestMapping("/submitCal.do")
	public void submitCalendar(HttpServletRequest req) {
		//받아온 값 넣어주고.. (켈린더 일정...)
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		for(Map<String, String> idx : list) {
			
		}
		
	//	String sample = req.getParameter("param");

	}
}
