package kr.green.camping.controller.user;

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
import kr.green.camping.service.user.BookingService;
import kr.green.camping.service.user.SearchService;
import kr.green.camping.vo.user.BookingVO;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;

@Controller

@RequestMapping(value="/booking/*")
public class BookingController {

	/** searchService */
	@Resource(name = "searchService")
	private SearchService searchService;
	
	/** bookingService */
	@Resource(name = "bookingService")
	private BookingService bookingService;
	
	
	// 실시간예약하기
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String reservationWriteGet(HttpServletRequest request, Model model, BookingVO vo, String campName, Integer campNo) throws Exception {
		
		//로그인 유지
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		
		vo.setUser_id(user.getId());
		vo.setUser_name(user.getName());
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("campName", campName);
		model.addAttribute("campNo", campNo);
		
		return "user/board/booking/write";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String boardWritePost(HttpServletRequest request, Model model, BookingVO vo, String campName, Integer campNo) throws Exception {
		
		//로그인 유지
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		
		vo.setUser_id(user.getId());
		vo.setUser_name(user.getName());
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		bookingService.bookingInsert(vo);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("campName", campName);
		model.addAttribute("campNo", campNo);
		
		return "redirect:/booking/list";
	}
	
	// 예약목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String reservationListGet(HttpServletRequest request, Model model, BookingVO vo, Criteria cri) throws Exception {
		
		//로그인 유지
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		
		if(cri == null) 
			cri = new Criteria();
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		ArrayList<BookingVO> list = null;
		int totalCount = 0;
		
		list = (ArrayList)bookingService.getBookingByNo(user,cri);
		totalCount = bookingService.getBookingCount(user);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri",cri);
		
		return "user/board/booking/list";
	}
	
	// 야영장찾기폼
	@RequestMapping(value = "/findCamp", method = RequestMethod.GET)
	public String findIdGet() {
		
		return "/user/board/booking/findCamp";
	}
	
	// 야영장명으로 검색
	@RequestMapping(value = "/findCampName", method = RequestMethod.GET)
	public String searchCamp(Model model,HttpServletRequest request,String search) throws Exception {
		
		
		ArrayList<CampVO> list = null;
		int totalCount = 0;
		
		list = (ArrayList)searchService.searchCamp("%"+search+"%");
		totalCount = searchService.getCountCamp("%"+search+"%");
		
		boolean camplist = false;
		if( totalCount != 0) {
			camplist = true;
		}
		
		model.addAttribute("camplist", camplist);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("search",search);
		
		return "user/board/booking/resultCamp";
	}
	
	// 예약확인
	@RequestMapping(value = "/detail")
	public String freeDetailPost(Model model, HttpServletRequest request,BookingVO vo) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		BookingVO booking = bookingService.getBooking(vo);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("booking", booking);
		
		return "user/board/booking/detail";
	}
	
	
	
	
	
}
