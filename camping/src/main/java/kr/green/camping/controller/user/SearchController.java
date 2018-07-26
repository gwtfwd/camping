package kr.green.camping.controller.user;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.green.camping.vo.user.LoginVO;


@Controller

@RequestMapping(value="/search/*")

public class SearchController {

	@RequestMapping(value = "/region/list", method = RequestMethod.GET)
	public String getSearchRegion(String area, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		LoginVO user = (LoginVO) session.getAttribute("user");
		
		
		boolean member = false;
		if( user != null) {
			member = true;
		}

		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		System.out.println(area);
		
		return "user/board/search/region/list";
	}
	
	
	@RequestMapping(value = "/type/list", method = RequestMethod.GET)
	public String getSearchType(String area, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		LoginVO user = (LoginVO) session.getAttribute("user");
		
		
		boolean member = false;
		if( user != null) {
			member = true;
		}

		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		
		return "user/board/search/type/list";
	}
	
	
	
	
	
	
	
	
	
	
}
