package kr.green.camping.controller.user;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.pagination.PageMaker;
import kr.green.camping.service.user.FreeService;
import kr.green.camping.service.user.MemberService;
import kr.green.camping.utils.MediaUtils;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.ReplyVO;

@Controller

@RequestMapping(value="/free/*")
public class FreeController {

	/** FreeService */
	@Resource(name = "freeService")
	private FreeService freeService;
	
	/** MemeberService */
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Resource
	private String uploadPath;
	
	
	// 자유게시판 리스트
	@RequestMapping(value = "/list")
	public String getFree(Model model, Criteria cri, HttpServletRequest request, Integer type, String search, FreeVO vo) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		/*로그인유지 service -> 매개변수 : boolean member*/
		/*JoinVO user = memberService.getLoginUser(request);
		member = memberService.keepLogin(user);*/
		
		if(cri == null) 
			cri = new Criteria();
		
		ArrayList<FreeVO> list = null;
		ArrayList<FreeVO> notice = null;
		int totalCount = 0;
		
		if(type == null)
			type = 0;
		
		cri.setPerPageNum(5);
		
		list = (ArrayList)freeService.searchFree(cri, "%"+search+"%",type);
		notice = (ArrayList)freeService.searchFreeByNotice();
		totalCount = freeService.getCountFree("%"+search+"%",type) + freeService.getCountFreeByNotice();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("list", list);
		model.addAttribute("notice", notice);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("search",search);
	    model.addAttribute("type",type);
	    model.addAttribute("cri",cri);
	    
		return "user/board/free/list";
	}
	
	
	// 자유게시판 상세페이지
	@RequestMapping(value = "/detail")
	public String freeDetailPost(FreeVO vo, Model model, HttpServletRequest request, ReplyVO reply) throws Exception {
		
		freeService.view(vo);
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		FreeVO free = freeService.getFree(vo);
		ReplyVO replyList = freeService.replyListByReno(reply);
		
		//파일명 수정하는 과정
		String filepath = free.getFilepath();
		String fileName = null;
		if(filepath != null) {
			// filepath : /년/월/일/uuid_파일명
			fileName = filepath.substring(filepath.lastIndexOf("_")+1);
		}
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		model.addAttribute("fileName", fileName);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("reply", replyList);
		model.addAttribute("free", free);
		
		return "user/board/free/detail";
	}
	
	@ResponseBody
	@RequestMapping("/download")
	public ResponseEntity<byte[]> downloadFile(String fileName)throws Exception{
		
	    InputStream in = null;
	    ResponseEntity<byte[]> entity = null;
	    
	    try{
	    	String FormatName = fileName.substring(fileName.lastIndexOf(".")+1);
	    	
	        /*	확장자를 통해 미디어 타입 정보를 가져옴*/
	        MediaType mType = MediaUtils.getMediaType(FormatName);
	        
	        HttpHeaders headers = new HttpHeaders();
	        in = new FileInputStream(uploadPath+fileName);
	        
        	fileName = fileName.substring(fileName.indexOf("_")+1);
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        headers.add("Content-Disposition",  "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
	    }catch(Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally {
	        in.close();
	    }
	    return entity;
	}
	
	
	// 자유게시판 등록
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String boardWriteGet(HttpServletRequest request, Model model, FreeVO vo) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean member = false;
		if( user != null) {
			member = true;
			vo.setAdmin("user");
			vo.setRegistered_id(user.getId());
			vo.setName(user.getName());
			vo.setNotice("false");
		}
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
			vo.setAdmin("admin");
			vo.setRegistered_id(admin.getAdminId());
			vo.setName(admin.getAdminName());
		}
		
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		
		return "user/board/free/write";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String boardWritePost(HttpServletRequest request, Model model, FreeVO vo, MultipartFile file) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean member = false;
		if( user != null) {
			member = true;
			vo.setAdmin("user");
			vo.setRegistered_id(user.getId());
			vo.setName(user.getName());
			vo.setNotice("false");
		}
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
			vo.setAdmin("admin");
			vo.setRegistered_id(admin.getAdminId());
			vo.setName(admin.getAdminName());
		}
		
		freeService.writeFree(vo, file, uploadPath);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		
		return "redirect:/free/list";
	}
	
	
	// 자유게시판 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String freeModifyGet(HttpServletRequest request, FreeVO vo, Model model, Integer no,Integer del) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		FreeVO free = freeService.getFree(vo);
		free.setNo(no);
		if(del != null && del == 1) {
			//db불러온 게시판의 정보에서 업로드 파일 경로를 지움
			//db에서는 지우지 않음
			free.setFilepath(null);
		}
		//파일명 수정하는 과정
		String filepath = free.getFilepath();
		if(filepath != null) {
		//filepath : /년/월/일/uuid_파일명
			String fileName = filepath.substring(filepath.indexOf("_")+1);
			model.addAttribute("fileName", fileName);
		}
		
		model.addAttribute("free", free);
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		
		return "/user/board/free/modify";
	}
	
	
	@RequestMapping(value="/modify", method= RequestMethod.POST)
	public String freeModifyPost(FreeVO vo, HttpServletRequest request, Model model, MultipartFile file, Integer del) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
		boolean member = false;
		if( user != null) {
			member = true;
		}
		
		boolean adminMember = false;
		if( admin != null) {
			adminMember = true;
		}
		
		vo.setUpdated_id(user.getId());

		FreeVO tmp = freeService.getFree(vo);
		vo.setReply_cnt(tmp.getReply_cnt());
		
		
		freeService.modifyFree(vo, file, uploadPath, del);
		
		model.addAttribute("member", member);
		model.addAttribute("user", user);
		model.addAttribute("adminMember", adminMember);
		model.addAttribute("admin", admin);
		
		return "redirect:/free/list";
	}
	
	
	// 자유게시판 삭제
	@RequestMapping(value = "/delete")
	public String freeDeletePost(Integer bno) throws Exception {
		
		freeService.deleteFree(bno);
		
		return "redirect:/free/list";
	}
	
	// 관리자 체크박스 삭제
	@RequestMapping(value = "/admin/delete")
	public String freeDeletePost(Integer checkbox[]) throws Exception {
		
		for( int i=0; i< checkbox.length ; i++) {
			freeService.deleteFree(checkbox[i]);
		}
		
		return "redirect:/free/list";
	}
	

	// 자유게시판 댓글
	@RequestMapping("/reply/list")
    @ResponseBody
    private List<ReplyVO> replyList(Model model, Integer bno, Criteria cri) throws Exception{
	  
		cri.setPerPageNum(5);
	    return freeService.replyList(bno,cri);
    }
	   
	//댓글 등록 
    @RequestMapping("/reply/insert") 
    @ResponseBody
    private Integer replyInsert(@RequestParam int bno, @RequestParam String recontent, HttpServletRequest request, MultipartFile file, Integer del,Criteria cri) throws Exception{
        
    	HttpSession session = request.getSession();
		JoinVO user = (JoinVO)session.getAttribute("user");
		AdminJoinVO admin = (AdminJoinVO) session.getAttribute("admin");
		
    	ReplyVO replyVO = new ReplyVO();
    	replyVO.setBno(bno);
    	replyVO.setRecontent(recontent);
    	
    	if(user != null) {
    	replyVO.setReid(user.getId());  
    	}
    	if(admin != null) {
    	replyVO.setReid(admin.getAdminId());  
    	}
    	
    	// 댓글등록 서비스 호출
    	freeService.replyInsert(replyVO);
    	
    	 /* 자유게시판 목록에 댓글 수를 표시하기 위한 작업 : 댓글을 등록한 후 댓글수의 정보를 불러오고, 해당게시글의 댓글수를 저장
    	  * 일단 자유게시판의 일련번호를 가져와서 댓글목록의 개수를 호출하여 자유게시판 목록에 댓글수를 표시할 reply_cnt에 담는다 */
    	int reply_cnt = freeService.replyCount(bno,cri);
    	
    	 /* 자유게시판VO freeVO객체를 새로 생성하여 자유게시판 일련번호를 가져와서 free에 저장하고 */
        FreeVO free = new FreeVO();
        free.setNo(bno);

        /* 자유게시판 일련번호를 가져오는 서비스를 호출하여 free에 담아서 게시판에 표시할 댓글 수 reply_cnt를 저장한다 */
        free = freeService.getFree(free);
        free.setReply_cnt(reply_cnt);

        /* 마지막으로 free에 담았던 정보를 가지고 자유게시판의 정보를 수정 */
        freeService.modifyFree(free, file, uploadPath, del);
        
        return 1;
    }
	    
    //댓글 수정 
    @RequestMapping("/reply/update")  
    @ResponseBody
    private Integer replyUpdate(@RequestParam int reno, @RequestParam String recontent) throws Exception{
        
    	ReplyVO replyVO = new ReplyVO();
    	replyVO.setReno(reno);
    	replyVO.setRecontent(recontent);
        
        return freeService.replyUpdate(replyVO);
    }
    
    
    //댓글 삭제
    @RequestMapping("/reply/delete/{reno}")   
    @ResponseBody
    private Integer replyDelete(Integer reno, @RequestParam Integer bno, MultipartFile file, Integer del,Criteria cri) throws Exception{
    	
    	freeService.replyDelete(reno);
    	
    	/* 자유게시판 목록에 댓글 수를 표시하기 위한 작업 : 댓글을 등록한 후 댓글수의 정보를 불러오고, 해당게시글의 댓글수를 저장
	   * 일단 자유게시판의 일련번호를 가져와서 댓글목록의 개수를 호출하여 자유게시판 목록에 댓글수를 표시할 reply_cnt에 담는다 */
	   int reply_cnt = freeService.replyCount(bno, cri);
   	
	   /* 자유게시판VO freeVO객체를 새로 생성하여 자유게시판 일련번호를 가져와서 free에 저장하고 */
       FreeVO free = new FreeVO();
       free.setNo(bno);

       /* 자유게시판 일련번호를 가져오는 서비스를 호출하여 free에 담아서 게시판에 표시할 댓글 수 reply_cnt를 저장한다 */
       free = freeService.getFree(free);
       free.setReply_cnt(reply_cnt);

       /* 마지막으로 free에 담았던 정보를 가지고 자유게시판의 정보를 수정 */
       freeService.modifyFree(free, file, uploadPath, del);
    
        return 1;
    }
    
    
    @RequestMapping("/reply/page")
    @ResponseBody
    public HashMap<String, Object> commentPageList(Model model, Criteria cri, ReplyVO reply, HttpServletRequest request, int bno) throws Exception {
       
       /* 위에 파라미터로 게시판번호도 받아와야함 */
       
    	
    	if(cri == null) 
			cri = new Criteria();
    	
    	
       /* 페이징 전체카운트 0으로 초기값 잡아주고 */
       int totalCount = 0;
       PageMaker pageMaker = new PageMaker();
       pageMaker.setCriteria(cri);
       
       cri.setPerPageNum(5);
       /* 전체카운트에 해당게시글에 대한 댓글총카운트를 저장한 후
          pageMaker의 전체카운트에 저장 */
       totalCount = freeService.replyCount(bno, cri);
       
       pageMaker.setTotalCount(totalCount);
       
       /* 페이징만 하는 목록이기 때문에 댓글목록을 따로 안불러와도 됨
          hashMap으로 키와 값을 저장할 객체를 생성해주고 map에 키와 값을 저장 후 map을 리턴.
          리턴타입도 hashMap으로 해주면 OK */
       HashMap<String, Object> map = new HashMap<String, Object>();
       map.put("pageMaker", pageMaker);
       
       return map;
    }
    
    @RequestMapping(value = "/list/replyList")
	public String replyListGet(Criteria cri, Model model, Integer bno) throws Exception {
		
    	/*Required Integer parameter 'bno' is not present 오류발생 
    	-> required 속성의 default값은 true이며 false값으로 사용하면 해당 Parameter를 반드시 받지 않아도 됨
    	RequestParam(value="bno", required=false) Integer bno
    	*/
    	
    	if(cri == null) 
			cri = new Criteria();
		
		ArrayList<ReplyVO> list = null;
		int totalCount = 0;
		
		cri.setPerPageNum(5);
		
		list = (ArrayList)freeService.replyList(bno,cri);
		totalCount = freeService.replyCount(bno,cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(cri);
		pageMaker.setTotalCount(totalCount);
		
		model.addAttribute("list", list);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("cri",cri);
	    model.addAttribute("bno",bno);
    	
		return "/user/board/free/replyList";
	}

}
