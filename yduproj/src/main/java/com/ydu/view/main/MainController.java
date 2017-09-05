package com.ydu.view.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ydu.biz.board.BoardSearchVO;
import com.ydu.biz.board.BoardService;
import com.ydu.biz.board.BoardVO;

@Controller
public class MainController {
	
	// interview calendar
	@RequestMapping("/interview/calendar")
	public String calendar(){
		return "/interview/calendar";
	}
	
}
