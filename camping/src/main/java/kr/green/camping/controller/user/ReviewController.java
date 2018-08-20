package kr.green.camping.controller.user;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.pagination.PageMaker;
import kr.green.camping.service.user.ReviewService;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.ReviewVO;

@Controller

@RequestMapping(value="/review/*")
public class ReviewController {

	/** ReviewService */
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	@Resource
	private String uploadPath;
	
	
	// 후기 리스트
	@RequestMapping(value = "/list")
	public String getReview(Model model, Criteria cri, HttpServletRequest request, Integer type, String search) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		if(cri == null) 
			cri = new Criteria();
		
		cri.setPerPageNum(9);
		
		ArrayList<ReviewVO> list = null;
		int totalCount = 0;
		
		if(type == null)
			type = 0;
		
		list = (ArrayList)reviewService.getReviewPage(cri);
		totalCount = reviewService.getCountReview();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("cri",cri);
		
		return "user/board/review/list";
	}
	
	
	// 자유게시판 등록
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String reviewWriteGet(HttpServletRequest request, Model model, ReviewVO vo) throws Exception {
		
		/*로그인 유지*/
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
		
		return "user/board/review/write";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String reviewWritePost(HttpServletRequest request, Model model, ReviewVO vo, MultipartFile file) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		
		vo.setUser_id(user.getId());
		vo.setUser_name(user.getName());
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		reviewService.writeReview(vo,file,uploadPath);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "redirect:/review/list";
	}
	
	
	
	
	
	
}
