package com.ydu.view.cbt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.ydu.biz.cbt.CBTService;

@Controller
public class CBTController {
	
	@Autowired CBTService cbtService;

}
