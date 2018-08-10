package kr.green.camping.service.impl.user;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.green.camping.dao.user.MemberMapper;
import kr.green.camping.service.user.MemberService;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;


@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name = "memberMapper")
	private MemberMapper memberMapper;
	
	@Override
	public JoinVO login(String id, String pw) throws Exception {
		
		JoinVO user = memberMapper.login(id, pw);

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
	
	
		
		
		
}
	
	
	
	


	
	




















