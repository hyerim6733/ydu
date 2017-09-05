package com.ydu.view.cbt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ydu.biz.cbt.CBTService;

@Controller
public class CBTController {
	
	@Autowired CBTService cbtService;
	
	@RequestMapping(value ="/getAllCBT.do", method=RequestMethod.POST)
	public String getAllCBT() {
		System.out.println("========제발 ㅎ====");
		return "/cbtList";
	}
	
	

}
