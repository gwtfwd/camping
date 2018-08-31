package kr.green.camping.controller.admin;

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
import kr.green.camping.service.admin.MyCampService;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;

@Controller

@RequestMapping(value="/mycamp/*")
public class MyCampController {
	
	/** searchService */
	@Resource(name = "myCampService")
	private MyCampService myCampService;
	
	
	// 나의 야영장목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String reservationListGet(HttpServletRequest request, Model model, Criteria cri) throws Exception {
		
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO)session.getAttribute("admin");
		
		if(cri == null) 
			cri = new Criteria();
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		ArrayList<CampVO> list = null;
		int totalCount = 0;
		
		list = (ArrayList)myCampService.getMyCampByNo(admin, cri);
		totalCount = myCampService.getMyCampCount(admin);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri",cri);
		
		return "admin/board/myCamp/list";
	}
	
	@RequestMapping(value = "/detail")
	public String freeDetailPost(Model model, HttpServletRequest request, CampVO vo) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		CampVO camp = myCampService.getMyCamp(vo);
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		model.addAttribute("camp", camp);
		
		return "admin/board/myCamp/detail";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String freeModifyGet(HttpServletRequest request, CampVO vo, Model model) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO)session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		CampVO camp = myCampService.getMyCamp(vo);
		
		model.addAttribute("camp", camp);
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		
		return "/admin/board/myCamp/modify";
	}
	
	@RequestMapping(value="/modify", method= RequestMethod.POST)
	public String freeModifyPost(CampVO vo, HttpServletRequest request, Model model) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO)session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		vo.setUpdated_id(admin.getAdminId());
		
		myCampService.modifyMyCamp(vo);
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		
		return "redirect:/mycamp/list";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String boardWriteGet(HttpServletRequest request, Model model, CampVO vo) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
			vo.setRegistered_id(admin.getAdminId());
		}
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		
		return "admin/board/myCamp/write";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String boardWritePost(HttpServletRequest request, Model model, CampVO vo, AdminJoinVO adminJoin) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
			vo.setRegistered_id(admin.getAdminId());
		}
		
		myCampService.writeMyCamp(vo, adminJoin);
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		
		return "redirect:/mycamp/list";
	}
	
	

}
