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
import kr.green.camping.vo.user.NoticeVO;


@Controller

@RequestMapping(value="/notice/*")

public class NoticeController {

	
	/** NoticeService */
	@Resource(name = "noticeService")
	private NoticeService noticeService;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getNotice(Model model, Criteria cri) throws Exception {
		
		int totCnt = noticeService.getCountNotice(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totCnt);

		ArrayList<NoticeVO> list = (ArrayList) noticeService.getNoticePage(pageMaker.getCriteria());

		System.out.println("ls : " + list.size()+ ", totCnt : " + totCnt + " ********");

		model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
		
		return "user/board/notice/list";
	}
	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String noticeDetailGet(NoticeVO vo, Model model) throws Exception {
		
		
		NoticeVO notice = noticeService.getNotice(vo);
		
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
