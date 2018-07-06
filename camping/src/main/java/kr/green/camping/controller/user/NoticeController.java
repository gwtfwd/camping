package kr.green.camping.controller.user;

import java.util.ArrayList;

import javax.annotation.Resource;

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
	
	
	
	
	
	
	
}
