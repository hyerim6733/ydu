package com.ydu.view.cbt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ydu.biz.cbt.CBTListVO;
import com.ydu.biz.cbt.CBTService;

@Controller
public class CBTController {
	
	@Autowired CBTService cbtService;
	
	@RequestMapping(value="/cbtMain.do")
	public String cbtMain() {
		System.out.println("cbt main page");
		return "/cbt/cbtMain";
	}
	
	@RequestMapping(value ="/getAllCBT.do")
	public String getAllCBT(Model model, CBTListVO vo) {
		
		System.out.println("======getAllCBT by con=====");
		if(cbtService ==null){
			System.out.println(" data null");
		}
		else {
			System.out.println("success");
			
			List<CBTListVO> list = cbtService.getAllCBT();
			model.addAttribute("cbtList", list);
		}
		return "/cbt/cbtList";
	}
	
	@RequestMapping(value="/test.do")
	public void Test() {
		System.out.println("test");
	}

}
