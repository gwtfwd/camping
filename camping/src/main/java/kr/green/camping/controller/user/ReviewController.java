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
import kr.green.camping.vo.admin.AdminJoinVO;
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
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
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
		

		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("cri",cri);
	    model.addAttribute("admin", admin);
		
		return "user/board/review/list";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String reviewWriteGet(HttpServletRequest request, Model model, ReviewVO vo) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		vo.setUser_id(user.getId());
		vo.setUser_name(user.getName());
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		model.addAttribute("admin", admin);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "user/board/review/write";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String reviewWritePost(HttpServletRequest request, Model model, ReviewVO vo, MultipartFile file) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		vo.setUser_id(user.getId());
		vo.setUser_name(user.getName());
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		reviewService.writeReview(vo,file,uploadPath);
		
		model.addAttribute("admin", admin);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "redirect:/review/list";
	}
	
	
	@RequestMapping(value = "/detail")
	public String freeDetailPost(ReviewVO vo, Model model, HttpServletRequest request) throws Exception {
		
		reviewService.view(vo);
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		ReviewVO review = reviewService.getReview(vo);
		
		//파일명 수정하는 과정
		String filepath = review.getFilepath();
		if(filepath != null) {
			// filepath : /년/월/일/uuid_파일명
			String fileName = filepath.substring(filepath.lastIndexOf("_")+1);
			model.addAttribute("fileName", fileName);
		}
		
		model.addAttribute("admin", admin);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("review", review);
		
		return "user/board/review/detail";
	}
	
	// 자유게시판 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String freeModifyGet(HttpServletRequest request, ReviewVO vo, Model model, int no,Integer del) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		ReviewVO review = reviewService.getReview(vo);
		review.setNo(no);
		
		if(del != null && del == 1) {
			//db불러온 게시판의 정보에서 업로드 파일 경로를 지움
			//db에서는 지우지 않음
			review.setFilepath(null);
		}
		//파일명 수정하는 과정
		String filepath = review.getFilepath();
		if(filepath != null) {
		//filepath : /년/월/일/uuid_파일명
			String fileName = filepath.substring(filepath.indexOf("_")+1);
			model.addAttribute("fileName", fileName);
		}
		
		model.addAttribute("review", review);
		model.addAttribute("admin", admin);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "/user/board/review/modify";
	}
		
		
	@RequestMapping(value="/modify", method= RequestMethod.POST)
	public String freeModifyPost(ReviewVO vo, HttpServletRequest request, Model model, MultipartFile file, Integer del) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		reviewService.modifyReview(vo, file, uploadPath, del);
		
		model.addAttribute("admin", admin);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "redirect:/review/list";
	}
	// 자유게시판 삭제
	@RequestMapping(value = "/delete")
	public String reviewDeletePost(ReviewVO vo) throws Exception {
		
		reviewService.deleteReview(vo);
		
		return "redirect:/review/list";
	}
	
	
	
	
	

}
