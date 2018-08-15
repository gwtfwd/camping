package kr.green.camping.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.green.camping.vo.user.BookingVO;
import kr.green.camping.vo.user.JoinVO;

@Controller

@RequestMapping(value="/reservation/*")
public class BookingController {

	
	// 실시간예약하기
	/*@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String reservationWriteGet(HttpServletRequest request, Model model, BookingVO vo) throws Exception {
		
		로그인 유지
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		
		//vo.setRegistered_id(user.getId());
		//vo.setName(user.getName());
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "user/board/booking/reservation";
	}*/
	
	
	/*@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String boardWritePost(HttpServletRequest request, Model model, FreeVO vo, MultipartFile file) throws Exception {
		
		로그인 유지
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		
		vo.setRegistered_id(user.getId());
		vo.setName(user.getName());
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		freeService.writeFree(vo);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "redirect:/free/list";
	}*/
	
	
	
	
	
	
	
}
