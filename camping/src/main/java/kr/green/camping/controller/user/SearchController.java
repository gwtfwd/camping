package kr.green.camping.controller.user;


import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.pagination.PageMaker;
import kr.green.camping.service.user.SearchService;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.LikeVO;
import kr.green.camping.vo.user.RegionVO;


@Controller

@RequestMapping(value="/search/*")

public class SearchController {

	/** searchService */
	@Resource(name = "searchService")
	private SearchService searchService;
	
	@RequestMapping(value = "/region/list", method = RequestMethod.GET)
	public String getSearchRegion(String area, Model model, HttpServletRequest request,String type) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		boolean areaSelect = false;
		if( area != null) {
			areaSelect = true;
		}
		
		boolean typeSelect = false;
		if( type != null) {
			typeSelect = true;
		}
		
		ArrayList<CampVO> list = null;
		int totalCount = 0;
		
		if(type == null)
			type = "";

		String region_code = searchService.getRegionCode(area);
		
		list = (ArrayList)searchService.regionList(region_code,type);
		totalCount = searchService.regionCnt(region_code,type);
		
		System.out.println(type);
		
		model.addAttribute("areaSelect", areaSelect);
		model.addAttribute("typeSelect", typeSelect);
		model.addAttribute("area", area);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("type",type);
		
		return "user/board/search/region/list";
	}
	
	@RequestMapping(value = "/region/list", method = RequestMethod.POST)
	public String postSearchRegion(String area, Model model, HttpServletRequest request,String type) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		boolean areaSelect = false;
		if( area != null) {
			areaSelect = true;
		}
		
		boolean typeSelect = false;
		if( type != null) {
			typeSelect = true;
		}
		
		ArrayList<CampVO> list = null;
		int totalCount = 0;
		
		if(type == null)
			type = "";
		
		String region_code = searchService.getRegionCode(area);
		
		//list = (ArrayList)searchService.regionList(region_code);
		//totalCount = searchService.regionCnt(region_code);
		list = (ArrayList)searchService.regionList(region_code,type);
		totalCount = searchService.regionCnt(region_code,type);
		
		System.out.println(type);
		
		model.addAttribute("typeSelect", typeSelect);
		model.addAttribute("areaSelect", areaSelect);
		model.addAttribute("area", area);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("type",type);
		
		return "user/board/search/region/list";
	}
	
	@RequestMapping(value = "/region/detail", method = RequestMethod.GET)
	public String regionDetailGet(CampVO vo, Model model, HttpServletRequest request) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		CampVO camp = searchService.getCamp(vo);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("camp", camp);
	    
		return "user/board/search/region/detail";
	}
	
	
	@RequestMapping(value = "/type/list", method = RequestMethod.GET)
	public String getSearchType(Model model, HttpServletRequest request, Criteria cri, Integer type) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		if(cri == null) 
			cri = new Criteria();
		
		ArrayList<CampVO> list = null;
		int totalCount = 0;
		
		if(type == null)
			type = 0;
		
		list = (ArrayList)searchService.getType(cri, type);
		totalCount = searchService.getCountType(type);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("type",type);

	    return "user/board/search/type/list";
	}
	
	@RequestMapping(value = "/type/list", method = RequestMethod.POST)
	public String postSearchType(Integer camp_no, Model model, HttpServletRequest request, Criteria cri, Integer type) throws Exception {
		
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		if(cri == null) 
			cri = new Criteria();
		
		ArrayList<CampVO> list = null;
		int totalCount = 0;
		
		if(type == null)
			type = 0;
		
		list = (ArrayList)searchService.getType(cri, type);
		totalCount = searchService.getCountType(type);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("type",type);
	    
	    return "user/board/search/type/list";
	}

	@RequestMapping(value = "/type/detail", method = RequestMethod.GET)
	public String typeDetailGet(CampVO vo, Model model, HttpServletRequest request) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		CampVO camp = searchService.getCamp(vo);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("camp", camp);
	    
		return "user/board/search/type/detail";
	}
	
	
	// 야영장명으로 검색
	@RequestMapping(value = "/name", method = RequestMethod.GET)
	public String searchCamp(Model model,HttpServletRequest request,String search) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		ArrayList<CampVO> list = null;
		int totalCount = 0;
		
		list = (ArrayList)searchService.searchCamp("%"+search+"%");
		totalCount = searchService.getCountCamp("%"+search+"%");
		
		boolean camplist = false;
		if( totalCount != 0) {
			camplist = true;
		}
		
		model.addAttribute("camplist", camplist);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("search",search);
		
		return "user/board/search/name/list";
	}
	
	// 야영장명으로 검색 상세보기
	@RequestMapping(value = "/name/detail", method = RequestMethod.GET)
	public String nameDetailGet(CampVO vo, Model model, HttpServletRequest request) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		CampVO camp = searchService.getCamp(vo);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("camp", camp);
	    
		return "user/board/search/name/detail";
	}
	
	
	
	
}
