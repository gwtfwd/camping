package kr.green.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller

@RequestMapping(value="/board/*")

public class BoardController {

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String boardListGet() {
		
		
		
		return "user/board/notice/list";
	}
	
	
	
	
	
	
	
}
