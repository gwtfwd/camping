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
import kr.green.camping.service.user.NoticeService;
import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.NoticeVO;


@Controller

@RequestMapping(value="/notice/*")

public class NoticeController {

	
	/** NoticeService */
	@Resource(name = "noticeService")
	private NoticeService noticeService;
	
	
	@RequestMapping(value = "/list")
	public String getNotice(Model model, Criteria cri, HttpServletRequest request, Integer type, String search) throws Exception {
		
		/*로그인유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		if(cri == null) 
			cri = new Criteria();
		
		ArrayList<NoticeVO> list = null;
		int totalCount = 0;
		
		if(type == null)
			type = 0;
		
		list = (ArrayList)noticeService.searchNotice(cri, "%"+search+"%",type);
		totalCount = noticeService.getCountNotice("%"+search+"%",type);
		
		
		
		//int totCnt = noticeService.getCountNotice(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);

		//ArrayList<NoticeVO> list = (ArrayList) noticeService.getNoticePage(pageMaker.getCriteria());
		
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("search",search);
	    model.addAttribute("type",type);
		
		return "user/board/notice/list";
	}
	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String noticeDetailGet(NoticeVO vo, Model model, HttpServletRequest request) throws Exception {
		
		noticeService.view(vo);
		
		/*로그인유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		NoticeVO notice = noticeService.getNotice(vo);
		
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("notice", notice);
			
	    
		return "user/board/notice/detail";
	}
	
/*	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String noticeModifyGet(NoticeVO vo, Model model, int no) throws Exception {
		
		NoticeVO notice = noticeService.getNotice(vo);
		notice.setNo(no);
		
		model.addAttribute("notice", notice);
		
		return "user/board/notice/modify";
	}
	
	@RequestMapping(value="/modify", method= RequestMethod.POST)
	public String noticeModifyPost(NoticeVO vo, int no, HttpServletRequest request) throws Exception {
	
		HttpSession session = request.getParameter();
		
		noticeService.modifyNotice(vo);
		System.out.println("////////////no : " + no);
		
		return "redirect:/notice/list";
	}*/
	
	
}
