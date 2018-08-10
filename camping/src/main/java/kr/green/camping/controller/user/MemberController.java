package kr.green.camping.controller.user;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.camping.service.user.MemberService;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;



@Controller

@RequestMapping(value="/member/*")

public class MemberController {

	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	@Resource
	private JavaMailSender mailSender;
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet() {
		
		return "/user/member/login";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(HttpServletRequest request, Model model) throws Exception {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		JoinVO user = memberService.loginById(id);
		
		
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
		
		
		JoinVO searchuser = memberService.login(id, pw);
		
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
	
	
	
	// 아이디 중복검사
	@RequestMapping("/dup")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id) throws Exception{
		
	    int count = 0;
	    
	    Map<Object, Object> map = new HashMap<Object, Object>();
	    
	    JoinVO user = memberService.loginById(id);
	    
	    
	    if( user != null) {
	    	count = 1;
	    }
	    
	    map.put("cnt", count);
	    
	    return map;
	    
	}
	
	// 로그인 후 글쓰기
	@RequestMapping(value = "/needLogin")
	public ModelAndView needLogin() throws Exception {
		
		ModelAndView mav = new ModelAndView("/user/board/free/loginWarning");
		mav.addObject("msg","로그인 후 이용해주세요.");
		
		return mav;
	}
	
	
	// id 찾기
	@RequestMapping(value = "/login/findId", method = RequestMethod.GET)
	public String findIdGet() {
		
		return "/user/member/findId";
	}
	
	// 윈도우창에서 출력할 서블릿객체(HttpServletResponse) 선언
	@RequestMapping(value = "/login/findId", method = RequestMethod.POST)
	public String findIdPost(String name, String phone, Model model) throws Exception{
		
		String id = "";
		
		if(memberService.findid(name, phone) == true) {
			
			JoinVO join = memberService.getid(name, phone);
			
			id = join.getId();
			int resultNum = 0;
			model.addAttribute("resultNum",resultNum);
			
		}
		else {
			// 유저 정보가 null이면 resultNum = 1로 보내줌
			int resultNum = 1;
			model.addAttribute("resultNum",resultNum);
		}
		
		
		model.addAttribute("name", name);
		model.addAttribute("id", id);
		
		return "redirect:/member/login/findId/result";
	}
	
	@RequestMapping(value = "/login/findId/result", method = RequestMethod.GET)
	public String findresultIdPost(String id, String name, Model model, int resultNum) throws Exception{
	
		model.addAttribute("name", name);
		model.addAttribute("id",id);
		model.addAttribute("resultNum", resultNum);
		
		return "/user/member/findResultId";
	}
	
	
	// pw 찾기 -> 이메일로 전송
	@RequestMapping(value = "/login/findPw", method = RequestMethod.GET)
	public String findPwGet() {
		
		return "/user/member/findPw";
	}
	
	// 임시비밀번호 생성
	public static String getNewPw() throws Exception {
		
		char[] charSet = { '0','1','2','3','4','5','6','7','8','9','A','B',
						   'C','D','E','F','G','H','I','J','K','L','M','N',
						   'O','P','Q','R','S','T','U','W','X','Y','Z'};
		
		StringBuffer newKey = new StringBuffer();
		
		for(int i=0; i<10; i++) {
			int idx = (int) (charSet.length * Math.random());
			newKey.append(charSet[idx]);
		}
		return newKey.toString();
	}
	
	
	@RequestMapping(value = "/login/findPw", method = RequestMethod.POST)
	public String findPwPost(String email, String id, String phone, HttpSession session,Model model) throws Exception{
		
		JoinVO join = memberService.loginById(id);
		
		if(join != null && join.getEmail().compareTo(email) == 0 && join.getPhone().compareTo(phone) == 0) {
			
			String newPw = getNewPw();
			join.setPw(passwordEncoder.encode(newPw));
			
			memberService.modifyJoin(join);
			
			model.addAttribute("newPw",newPw);
			model.addAttribute("email",email);
			return "redirect:/member/mail/mailSending";
		}
		
		// 유저 정보가 null이면 resultNum = 1로 보내줌
		int resultNum = 1;
		model.addAttribute("resultNum",resultNum);
		
		return "redirect:/member/login/findPw/result";
	}
	
	@RequestMapping(value = "/login/findPw/result", method = RequestMethod.GET)
	public String findresultPwPost(String id, String email, Model model,int resultNum ) throws Exception{
	
		model.addAttribute("email", email);
		model.addAttribute("id", id);
		model.addAttribute("resultNum", resultNum);
		
		return "/user/member/findResultPw";
	}
	
	
	// mailSending 코드
	@RequestMapping(value = "/mail/mailSending")
	public String mailSending(String email, String newPw, HttpServletRequest request, Model model) throws Exception{

	    String tomail  = email;    // 받는 사람 이메일
	    String title   = "변경된 비밀번호 입니다.";      // 제목
	    String content = newPw;    // 내용

	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper 
	            = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setTo(tomail);     // 받는사람 이메일
	        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	        messageHelper.setText(content);  // 메일 내용

	        mailSender.send(message);
	    } catch(Exception e){
	        System.out.println(e);
	    }
	    
	    // 유저 정보가 있으니 resultNum = 0로 보내줌
 		int resultNum = 0;
 		model.addAttribute("resultNum",resultNum);
 		model.addAttribute("email", email);

	    return "redirect:/member/login/findPw/result";
	}
	
	
	
	// 마이페이지 비밀번호 입력
	@RequestMapping(value = "/confirmPw", method = RequestMethod.GET)
	public String confirmGet(HttpServletRequest request, Model model) throws Exception{
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "/user/member/confirmPw";
	}
	
	
	@RequestMapping(value = "/confirmPw", method = RequestMethod.POST)
	public String confirmPost(HttpServletRequest request, Model model) throws Exception {
		
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		String pw = request.getParameter("pw");
		
		if( passwordEncoder.matches(pw, user.getPw())) {
			
			return "redirect:/member/mypageDetail";
		}
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);

		
		return "redirect:/member/confirmPw";
	}
	
	
	// 마이페이지 상세
	@RequestMapping(value = "/mypageDetail", method = RequestMethod.GET)
	public String mypageDetailGet(HttpServletRequest request, Model model) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		JoinVO join = memberService.loginById(user.getId());
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("join", join);
		
		return "/user/member/myDetail";
	}
	
	
	@RequestMapping(value = "/mypageDetail", method = RequestMethod.POST)
	public String mypageDetailPost(HttpServletRequest request, Model model, JoinVO join) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("join", join);
		
		return "/user/member/myDetail";
	}
	
	
	// 회원정보 수정
	@RequestMapping(value = "/mypageModify", method = RequestMethod.GET)
	public String freeModifyGet(HttpServletRequest request, Model model) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		JoinVO join = memberService.loginById(user.getId());
		
		model.addAttribute("join", join);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "/user/member/myModify";
	}
		
		
	@RequestMapping(value="/mypageModify", method= RequestMethod.POST)
	public String mypageModifyPost(JoinVO vo, HttpServletRequest request, Model model, String pw) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		JoinVO join = memberService.loginById(user.getId());
		
		if(pw == null || pw == "") {
			vo.setPw(user.getPw());
		}
		else {
			String encPw = passwordEncoder.encode(vo.getPw());
			vo.setPw(encPw);
		}
		
		vo.setId(join.getId());
		vo.setAdmin("user");
		
		memberService.modifyJoin(vo);
		
			
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("join", join);
		
		return "redirect:/member/mypageDetail";
	}
	
	
	// 회원정보 삭제
	@RequestMapping(value = "/mypageDelete")
	public String mypageDeletePost(JoinVO vo) throws Exception {
		
		memberService.deleteUser(vo);
		
		System.out.println(" id : "+vo.getId());
		
		return "redirect:/member/logout";
	}
	
}













