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
import kr.green.camping.vo.user.NoticeVO;

@Controller

@RequestMapping(value="/free/*")
public class FreeController {

	/** FreeService */
	@Resource(name = "freeService")
	private FreeService freeService;
	
	
	@RequestMapping(value = "/list")
	public String getFree(Model model, Criteria cri, HttpServletRequest request, Integer type, String search) throws Exception {
		
		/*로그인유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		if(cri == null) 
			cri = new Criteria();
		
		ArrayList<FreeVO> list = null;
		int totalCount = 0;
		
		if(type == null)
			type = 0;
		
		list = (ArrayList)freeService.searchFree(cri, "%"+search+"%",type);
		totalCount = freeService.getCountFree("%"+search+"%",type);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);

		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("search",search);
	    model.addAttribute("type",type);
		
		return "user/board/free/list";
	}
	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String freeDetailGet(FreeVO vo, Model model, HttpServletRequest request) throws Exception {
		
		freeService.view(vo);
		
		/*로그인유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
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
		JoinVO user = (JoinVO)session.getAttribute("user");

		
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
	}
	
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String freeModifyGet(HttpServletRequest request,FreeVO vo, Model model, int no) throws Exception {
		
		/*로그인유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		FreeVO free = freeService.getFree(vo);
		free.setNo(no);
		
		model.addAttribute("free", free);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "user/board/free/modify";
	}
	
	@RequestMapping(value="/modify", method= RequestMethod.POST)
	public String freeModifyPost(FreeVO vo, int no, HttpServletRequest request, Model model) throws Exception {
		
		/*로그인유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		freeService.modifyFree(vo);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "redirect:/free/list";
	}
	
	@RequestMapping(value = "/delete")
	public String freeDeletePost(FreeVO vo) throws Exception {
		
		
		freeService.deleteFree(vo);
		
		return "redirect:/free/list";
	}
	
	
	
	
}
