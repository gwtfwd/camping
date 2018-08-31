package kr.green.camping.controller.admin;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.pagination.PageMaker;
import kr.green.camping.service.admin.AdminBookingService;
import kr.green.camping.service.user.BookingService;
import kr.green.camping.service.user.MemberService;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.BookingVO;
import kr.green.camping.vo.user.JoinVO;

@Controller

@RequestMapping(value="/admin/booking/*")
public class AdminBookingController {

	/** adminBookingService */
	@Resource(name = "adminBookingService")
	private AdminBookingService adminBookingService;
	
	/** bookingService */
	@Resource(name = "bookingService")
	private BookingService bookingService;
	
	/** memberService */
	@Resource(name = "memberService")
	private MemberService memberService;
	
	// 예약목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String reservationListGet(HttpServletRequest request, Model model, BookingVO vo, Criteria cri) throws Exception {
		
		//로그인 유지
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO)session.getAttribute("admin");
		
		if(cri == null) 
			cri = new Criteria();
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		ArrayList<BookingVO> list = null;
		int totalCount = 0;
		
		list = (ArrayList)adminBookingService.getBookingById(admin,cri);
		totalCount = adminBookingService.getBookingCount(admin);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri",cri);
		
		return "admin/board/booking/list";
	}

	// 예약확인
	@RequestMapping(value = "/detail")
	public String freeDetailPost(Model model, HttpServletRequest request,BookingVO vo) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO)session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		BookingVO booking = bookingService.getBooking(vo);
		
		JoinVO user = memberService.loginById(booking.getUser_id());
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		model.addAttribute("booking", booking);
		model.addAttribute("user", user);
		
		return "admin/board/booking/detail";
	}
	
	@RequestMapping(value="/set")
	public String bookingSet(Model model, Integer page, Integer no, String book_status) throws Exception{
		
		adminBookingService.setBooking(no, book_status);
		
		model.addAttribute("page", page);
		
		return "redirect:/admin/booking/list";
	}
	
	@RequestMapping(value="/cancel/set")
	public String cancelSet(Model model, Integer page, Integer no, String can_status) throws Exception{
		
		adminBookingService.setCancel(no, can_status);
		
		model.addAttribute("page", page);
		
		return "redirect:/admin/booking/list";
	}
	
	
	
	
	
}
