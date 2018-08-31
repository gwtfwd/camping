package kr.green.camping.controller.admin;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.pagination.PageMaker;
import kr.green.camping.service.admin.AdminMemberService;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.FreeVO;
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
		
		AdminJoinVO admin = adminMemberService.adminByIdPw(adminId, adminPw);
		
		if( admin != null ) {
			model.addAttribute("admin", admin);
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
			
			String encPw = passwordEncoder.encode(adminJoin.getAdminPw());
			adminJoin.setAdminPw(encPw);
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
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		
		return "redirect:/";
	}
	
	// 마이페이지 비밀번호 입력
	@RequestMapping(value = "/confirmPw", method = RequestMethod.GET)
	public String confirmGet(HttpServletRequest request, Model model) throws Exception{
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		
		return "/admin/member/confirmPw";
	}
	
	@RequestMapping(value = "/confirmPw", method = RequestMethod.POST)
	public String confirmPost(HttpServletRequest request, Model model) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		String adminPw = request.getParameter("adminPw");
		
		if( passwordEncoder.matches(adminPw, admin.getAdminPw())) {
			
			return "redirect:/admin/member/mypageDetail";
		}
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);

		
		return "redirect:/admin/member/confirmPw";
	}
	
	// 마이페이지 상세
	@RequestMapping(value = "/mypageDetail", method = RequestMethod.GET)
	public String mypageDetailGet(HttpServletRequest request, Model model) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		AdminJoinVO adminJoin = adminMemberService.adminById(admin.getAdminId());
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		model.addAttribute("adminJoin", adminJoin);
		
		return "/admin/member/adminMyDetail";
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/mypageModify", method = RequestMethod.GET)
	public String freeModifyGet(HttpServletRequest request, Model model) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		AdminJoinVO adminJoin = adminMemberService.adminById(admin.getAdminId());
		
		model.addAttribute("adminJoin", adminJoin);
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		
		return "/admin/member/adminMyModify";
	}
		
		
	@RequestMapping(value="/mypageModify", method= RequestMethod.POST)
	public String mypageModifyPost(AdminJoinVO vo, HttpServletRequest request, Model model, String adminPw) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		AdminJoinVO adminJoin = adminMemberService.adminById(admin.getAdminId());
		
		if(adminPw == null || adminPw == "") {
			vo.setAdminPw(admin.getAdminPw());
		}
		else {
			String encPw = passwordEncoder.encode(vo.getAdminPw());
			vo.setAdminPw(encPw);
		}
		
		vo.setAdminId(adminJoin.getAdminId());
		
		adminMemberService.modifyJoin(vo);
		
			
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		model.addAttribute("adminJoin", adminJoin);
		
		return "redirect:/admin/member/mypageDetail";
	}
	
	// user 리스트
	@RequestMapping(value = "/adminList")
	public String getFree(Model model, Criteria cri, HttpServletRequest request) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		if(cri == null) 
			cri = new Criteria();
		
		ArrayList<AdminJoinVO> list = null;
		int totalCount = 0;

		list = (ArrayList)adminMemberService.searchAdmin(cri);
		totalCount = adminMemberService.getCountAdmin();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		

		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("cri",cri);
	    
		return "superadmin/member/adminList";
	}
	
	@RequestMapping(value = "/adminList/detail")
	public String adminDetailPost(AdminJoinVO vo, Model model, HttpServletRequest request) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		AdminJoinVO adminJoin = adminMemberService.getAdmin(vo);
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		model.addAttribute("adminJoin", adminJoin);
		
		return "superadmin/member/adminDetail";
	}
	
}
