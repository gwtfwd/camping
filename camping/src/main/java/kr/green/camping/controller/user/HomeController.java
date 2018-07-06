package kr.green.camping.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "/index";
	}
	
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		
		return "/user/member/login";
	}
	
}
