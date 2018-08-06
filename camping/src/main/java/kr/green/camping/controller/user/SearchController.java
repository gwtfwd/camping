package kr.green.camping.controller.user;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.pagination.PageMaker;
import kr.green.camping.service.user.FreeService;
import kr.green.camping.service.user.SearchService;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.LikeVO;
import kr.green.camping.vo.user.NoticeVO;
import net.sf.json.JSONObject;


@Controller

@RequestMapping(value="/search/*")

public class SearchController {

	/** searchService */
	@Resource(name = "searchService")
	private SearchService searchService;
	
	
	@RequestMapping(value = "/region/list", method = RequestMethod.GET)
	public String getSearchRegion(String area, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		

		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		System.out.println(area);
		
		return "user/board/search/region/list";
	}
	
	@ResponseBody // ajax를 부르기 위한 어노테이션
	@RequestMapping(value="/kr.green.camping.dao.user.SearchMapper/getSeoul.do", method = RequestMethod.GET)
    public List<CampVO> getSeoul(CampVO vo) throws Throwable {
		return searchService.getSeoul(vo);
 	}
	
	
	@RequestMapping(value = "/type/list", method = RequestMethod.GET)
	public String getSearchType(Model model, HttpServletRequest request, Criteria cri, Integer type) throws Exception {
		
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
	public String postSearchType(Model model, HttpServletRequest request, Criteria cri, Integer type) throws Exception {
		
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		HashMap <String, Object> hashMap = new HashMap<String, Object>();
		
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
		//LikeVO like = searchService.readLike(hashMap);
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("type",type);
	   // model.addAttribute("like",like);
		

	    return "user/board/search/type/list";
	}

	
	@ResponseBody
	  @RequestMapping(value="/type/liketo/like.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	  public String liketo(HttpSession session, String userId, Integer campNo) throws Exception{
		
	    //System.out.println("--> like() created");
		JoinVO user = (JoinVO)session.getAttribute("user");
		CampVO vo = new CampVO();
		vo.setNo(campNo);
		CampVO camp = searchService.getCamp(vo);
		
		JSONObject obj = new JSONObject();
	    
	    
	    ArrayList<String> msgs = new ArrayList<String>();
	    HashMap <String, Object> hashMap = new HashMap<String, Object>();
	    hashMap.put("campNo", campNo);
	    hashMap.put("userId", userId);
	    LikeVO likeVO = searchService.readLike(hashMap);
	    
	    
	    CampVO campVO = searchService.readCampByNo(hashMap);
	    int like_cnt =  campVO.getLike();     //게시판의 좋아요 카운트
	    int like_check = 0;
	    like_check = likeVO.getLike_check();    //좋아요 체크 값
	    
	    if(searchService.countbyLike(hashMap)==0){
	    	searchService.create(hashMap);
	    }
	      
	    if(like_check == 0) {
	      msgs.add("좋아요!");
	      searchService.like_check(hashMap);
	      like_check++;
	      like_cnt++;
	      searchService.like_cnt_up(vo);   //좋아요 갯수 증가
	    } else {
	      msgs.add("좋아요 취소");
	      searchService.like_check_cancel(hashMap);
	      like_check--;
	      like_cnt--;
	      searchService.like_cnt_down(vo);   //좋아요 갯수 감소
	    }
	    obj.put("campNo", campNo);
	    obj.put("userId", userId);
	    obj.put("like_check", like_check);
	    obj.put("like_cnt", like_cnt);
	    obj.put("msg", msgs);
	    
	    return obj.toString();
	  }
	
	
	@RequestMapping(value = "/type/detail", method = RequestMethod.GET)
	public String typeDetailGet(CampVO vo, Model model, HttpServletRequest request) throws Exception {
		
		/*로그인유지*/
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
	
	
}
