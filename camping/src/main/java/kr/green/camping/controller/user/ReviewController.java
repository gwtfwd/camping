package kr.green.camping.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.pagination.PageMaker;
import kr.green.camping.service.user.ReviewService;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.ReplyVO;
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
	
	
	@RequestMapping(value = "/detail")
	public String freeDetailPost(ReviewVO vo, Model model, HttpServletRequest request) throws Exception {
		
		reviewService.view(vo);
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
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
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("review", review);
		
		return "user/board/review/detail";
	}
	
	
	
	// 자유게시판 댓글
	/*@RequestMapping("/reply/list")
    @ResponseBody
    private List<ReplyVO> replyList(Model model, Integer bno, Criteria cri) throws Exception{
	  
	    return reviewService.replyList(bno);
    }*/
	   
	//댓글 등록 
    /*@RequestMapping("/reply/insert") 
    @ResponseBody
    private Integer replyInsert(@RequestParam int bno, @RequestParam String recontent, HttpServletRequest request, MultipartFile file, Integer del) throws Exception{
        
    	HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
    	
    	ReplyVO replyVO = new ReplyVO();
    	replyVO.setBno(bno);
    	replyVO.setRecontent(recontent);
    	replyVO.setReid(user.getId());  
    	
    	// 댓글등록 서비스 호출
    	reviewService.replyInsert(replyVO);
    	
    	  자유게시판 목록에 댓글 수를 표시하기 위한 작업 : 댓글을 등록한 후 댓글수의 정보를 불러오고, 해당게시글의 댓글수를 저장
    	  * 일단 자유게시판의 일련번호를 가져와서 댓글목록의 개수를 호출하여 자유게시판 목록에 댓글수를 표시할 reply_cnt에 담는다 
    	int reply_cnt = reviewService.replyCount(bno);
    	
    	  자유게시판VO freeVO객체를 새로 생성하여 자유게시판 일련번호를 가져와서 free에 저장하고 
        FreeVO free = new FreeVO();
        free.setNo(bno);

         자유게시판 일련번호를 가져오는 서비스를 호출하여 free에 담아서 게시판에 표시할 댓글 수 reply_cnt를 저장한다 
        free = reviewService.getFree(free);
        free.setReply_cnt(reply_cnt);

         마지막으로 free에 담았던 정보를 가지고 자유게시판의 정보를 수정 
        reviewService.modifyFree(free, file, uploadPath, del);
        
    	
        return 1;
    }*/
	    
    //댓글 수정 
    /*@RequestMapping("/reply/update")  
    @ResponseBody
    private Integer replyUpdate(@RequestParam int reno, @RequestParam String recontent) throws Exception{
        
    	ReplyVO replyVO = new ReplyVO();
    	replyVO.setReno(reno);
    	replyVO.setRecontent(recontent);
    	
        
        return reviewService.replyUpdate(replyVO);
    }*/
    
    
    //댓글 삭제
   /* @RequestMapping("/reply/delete/{reno}")   
    @ResponseBody
    private Integer replyDelete(Integer reno, @RequestParam Integer bno, MultipartFile file, Integer del) throws Exception{
    	
    	reviewService.replyDelete(reno);
    	
    	  자유게시판 목록에 댓글 수를 표시하기 위한 작업 : 댓글을 등록한 후 댓글수의 정보를 불러오고, 해당게시글의 댓글수를 저장
	   	  * 일단 자유게시판의 일련번호를 가져와서 댓글목록의 개수를 호출하여 자유게시판 목록에 댓글수를 표시할 reply_cnt에 담는다 
	   	int reply_cnt = reviewService.replyCount(bno);
   	
   	  자유게시판VO freeVO객체를 새로 생성하여 자유게시판 일련번호를 가져와서 free에 저장하고 
       FreeVO free = new FreeVO();
       free.setNo(bno);

        자유게시판 일련번호를 가져오는 서비스를 호출하여 free에 담아서 게시판에 표시할 댓글 수 reply_cnt를 저장한다 
       free = reviewService.getFree(free);
       free.setReply_cnt(reply_cnt);

        마지막으로 free에 담았던 정보를 가지고 자유게시판의 정보를 수정 
       reviewService.modifyFree(free, file, uploadPath, del);
        
        return 1;
    }*/

}
