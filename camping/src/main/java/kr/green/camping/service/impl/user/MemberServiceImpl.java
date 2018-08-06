package kr.green.camping.service.impl.user;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.green.camping.dao.user.MemberMapper;
import kr.green.camping.service.user.MemberService;
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




	/*@Override
	public int chkDupId(JoinVO user, String id) {

		int count = 0;
		
		count = memberMapper.chkDupId(id);
		
		return count;
	}*/




	
	
}
