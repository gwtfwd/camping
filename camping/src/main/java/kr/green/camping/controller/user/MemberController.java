package kr.green.camping.controller.user;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.green.camping.service.user.MemberService;
import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.LoginVO;



@Controller

@RequestMapping(value="/member/*")

public class MemberController {

	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet() {
		
		return "/user/member/login";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(HttpServletRequest request, Model model) throws Exception {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		LoginVO user = memberService.loginById(id);
		
		
		if( user != null && passwordEncoder.matches(pw, user.getPw())) {
			
			model.addAttribute("user", user);
			
			return "redirect:/";
		}
	
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinGet() {
		
		return "/user/member/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String JoinPost(HttpServletRequest request, Model model, JoinVO join, String id, String pw) throws Exception {
		
		
		LoginVO searchuser = memberService.login(id, pw);
		
		if( searchuser != null ) {
			
			return "redirect:/member/login";
		}
		else {
			
			String encPw = passwordEncoder.encode(join.getPw());
			join.setPw(encPw);
			join.setAdmin("user");
			memberService.join(join);
			
			
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		return "redirect:/";
	}
	
	
	
		// 아이디중복확인
		@RequestMapping("/dup")
		@ResponseBody
		public Map<Object, Object> idcheck(@RequestBody String id) throws Exception{
			
			
			
		    int count = 0;
		    
		    Map<Object, Object> map = new HashMap<Object, Object>();
		    
		    LoginVO user = memberService.loginById(id);
		    
		    
		    if( user != null) {
		    	count = 1;
		    }
		    
		    map.put("cnt", count);
		    System.out.println(id);
		    
		    return map;
		    
		}
	
	
	
	
	
	
}
