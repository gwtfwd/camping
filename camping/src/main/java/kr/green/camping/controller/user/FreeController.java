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
import kr.green.camping.service.user.FreeService;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.LoginVO;
import kr.green.camping.vo.user.NoticeVO;

@Controller

@RequestMapping(value="/free/*")
public class FreeController {

	/** FreeService */
	@Resource(name = "freeService")
	private FreeService freeService;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getFree(Model model, Criteria cri, HttpServletRequest request) throws Exception {
		
		/*로그인유지*/
		HttpSession session = request.getSession();
		LoginVO user = (LoginVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		int totCnt = freeService.getCountFree(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totCnt);

		ArrayList<NoticeVO> list = (ArrayList) freeService.getFreePage(pageMaker.getCriteria());
		
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
		
		return "user/board/free/list";
	}
	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String freeDetailGet(FreeVO vo, Model model, HttpServletRequest request) throws Exception {
		
		/*로그인유지*/
		HttpSession session = request.getSession();
		LoginVO user = (LoginVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		
		FreeVO free = freeService.getFree(vo);
		
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("free", free);
			
	    
		return "user/board/free/detail";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String freeWriteGet(HttpServletRequest request, Model model) {
		
		/*로그인유지*/
		HttpSession session = request.getSession();
		LoginVO user = (LoginVO)session.getAttribute("user");

		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "user/board/free/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String boardWritePost(HttpServletRequest request, Model model, FreeVO vo, MultipartFile file) throws Exception {
		
		/*로그인유지*/
		HttpSession session = request.getSession();
		LoginVO user = (LoginVO)session.getAttribute("user");
		vo.setRegistered_id(user.getId());
		//vo.setName();
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		freeService.writeFree(vo);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "redirect:/free/list";
	}
	
	
	
	
}
