package kr.green.camping.controller.admin;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.green.camping.service.admin.AdminMemberService;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.JoinVO;


@Controller

@RequestMapping(value="/admin/member/*")

public class AdminMemberController {

	@Resource(name="adminMemberService")
	private AdminMemberService adminMemberService;
	
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String adminloginPost(HttpServletRequest request, Model model) throws Exception {
		
		String adminId = request.getParameter("adminId");
		String adminPw = request.getParameter("adminPw");
		
		AdminJoinVO user = adminMemberService.adminByIdPw(adminId, adminPw);
		
		
		if( user != null ) {
			
			model.addAttribute("user", user);
			
			return "redirect:/";
		}
	
		return "redirect:/member/login";
	}
	
	
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String adminJoinGet() {
		
		return "/admin/member/adminJoin";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String adminJoinPost(HttpServletRequest request, Model model, AdminJoinVO adminJoin, String adminId, String adminPw) throws Exception {
		
		
		AdminJoinVO searchuser = adminMemberService.adminByIdPw(adminId, adminPw);
		
		if( searchuser != null ) {
			
			return "redirect:/admin/member/login";
		}
		else {
			
			String encPw = passwordEncoder.encode(adminJoin.getPw());
			adminJoin.setPw(encPw);
			adminJoin.setAdmin("admin");
			
			adminMemberService.adminJoin(adminJoin);
			
			return "redirect:/";
		}
	}
	
	// 아이디 중복검사
	@RequestMapping("/dup")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String adminId) throws Exception{
		
	    int count = 0;
	    
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    
	    AdminJoinVO user = adminMemberService.adminById(adminId);
	    
	    if( user != null) {
	    	count = 1;
	    }
	    
	    map.put("cnt", count);
	    
	    return map;
	    
	}
	
	
	
	
	
	
}
