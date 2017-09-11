package com.ydu.view.main;

import org.springframework.web.bind.annotation.RequestMapping;

public class LoginController {
	// login
	@RequestMapping("/login.do")
	public String login(){
		return "/main/login";
	}
}
