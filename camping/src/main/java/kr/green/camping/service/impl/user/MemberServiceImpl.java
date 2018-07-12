package kr.green.camping.service.impl.user;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.green.camping.dao.user.MemberMapper;
import kr.green.camping.service.user.MemberService;
import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.LoginVO;


@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name = "memberMapper")
	private MemberMapper memberMapper;
	
	@Override
	public LoginVO login(String id, String pw) throws Exception {
		
		LoginVO resultVO = memberMapper.login(id, pw);

		return resultVO;
	}
	
	
	@Override
	public void join(JoinVO join) throws Exception {
		
		memberMapper.join(join);
		
	}
	
	
	
}
