package kr.green.camping.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinGet() {
		
		return "/user/member/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String JoinPost(HttpServletRequest request, Model model, JoinVO join, String id, String pw) throws Exception {
		
		
		LoginVO searchuser = memberService.login(id, pw);
		
		if( searchuser != null ) {
			
			return "redirect:/camping/member/login";
		}
		else {
			
			String encPw = passwordEncoder.encode(join.getPw());
			join.setPw(encPw);
			join.setAdmin("user");
			memberService.join(join);
			
			
			return "redirect:/";
		}
	}
	
	
	
}
