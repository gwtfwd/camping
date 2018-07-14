package kr.green.camping.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.LoginVO;

@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		LoginVO user = (LoginVO) session.getAttribute("user");
		
		
		boolean member = false;
		if( user != null) {
			member = true;
		}

		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "/index";
	}
	
	
	@RequestMapping(value = "/selectJoin", method = RequestMethod.GET)
	public String selectJoin() {
		
		
		return "/selectJoin";
	}
	
	
	
	
	
	
	
	
}
