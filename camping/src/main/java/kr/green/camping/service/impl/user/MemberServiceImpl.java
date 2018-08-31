package kr.green.camping.service.impl.user;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.camping.dao.user.MemberMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.user.MemberService;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;


@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name = "memberMapper")
	private MemberMapper memberMapper;
	
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@Override
	public boolean keepLogin(JoinVO user) throws Exception {
		
		boolean member = false;
		if( user != null) {
			member = true;
		}

		return member;
	}
	@Override
	public JoinVO getLoginUser(HttpServletRequest request) throws Exception {
		
		/*로그인 유지*/
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		return user;
	}
	
	
	@Override
	public JoinVO login(String id, String pw) throws Exception {
		
		JoinVO user = memberMapper.loginById(id);
		
		if( !(user != null && passwordEncoder.matches(pw, user.getPw()))) {
			
			user = null;
		}

		return user;
	}
	
	
	@Override
	public void join(JoinVO join) throws Exception {
		
		memberMapper.join(join);
		
	}
	
	@Override
	public JoinVO loginById(String id) throws Exception {
		
		JoinVO user = memberMapper.loginById(id);

		return user;
	}
	
	@Override
	public void modifyJoin(JoinVO vo) throws Exception {
		memberMapper.modifyJoin(vo);
	}
	
	@Override
	public void deleteUser(JoinVO vo) throws Exception {
		memberMapper.deleteUser(vo);
	}


	/*아이디찾기*/
	@Override
	public JoinVO getid(String name, String phone) {
		
		JoinVO user = memberMapper.getid(name, phone);

		return user;
	}	
		
	@Override
	public boolean findid(String name, String phone) {
		
		JoinVO user = getid(name, phone);
		
		if( user != null ) {
			String id = user.getId();
			return true;
		}
		
		return false;
	}
	
	
	/*비밀번호찾기*/
	@Override
	public JoinVO getpw(String id, String phone, String email) {
		
		JoinVO user = memberMapper.getpw(id, phone, email);

		return user;
	}	
		
	@Override
	public boolean findpw(String id, String phone, String email) {
		
		JoinVO user = getpw(id, phone, email);
		
		if( user != null ) {
			String pw = user.getPw();
			return true;
		}
		
		return false;
	}
	
	// user 리스트
	@Override
	public List<JoinVO> searchUser(Criteria cri) throws Exception {
		return memberMapper.searchUser(cri);
	}
	@Override
	public Integer getCountUser() throws Exception {
		return memberMapper.getCountUser();
	}
	@Override
	public JoinVO getUser(JoinVO vo) throws Exception {

		JoinVO resultVO = memberMapper.getUserById(vo);
		
		return resultVO;
	}
		
		
		
}
	
	
	
	


	
	




















