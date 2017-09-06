package com.ydu.ydapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//홈화면
	@RequestMapping(value = "/main/index", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		System.out.println("홈화면 접속 하셨습니다.");
		return "/tiles/layout";
	}
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//메인화면 클릭시
	@RequestMapping(value = "/main/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		System.out.println("메인화면 클릭 하셨습니다.");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "/main/home";
	}
	
}
