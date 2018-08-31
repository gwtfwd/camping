package kr.green.camping.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.green.camping.service.user.SearchService;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.JoinVO;

@Controller
public class HomeController {
	
	@Resource
	private SearchService searchService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("admin", admin);
		
		return "/index";
	}
	
	
	@RequestMapping(value = "/selectJoin", method = RequestMethod.GET)
	public String selectJoin() {
		
		
		return "/selectJoin";
	}
	
	
}
