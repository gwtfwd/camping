package kr.green.camping.service.user;

import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.LoginVO;

public interface MemberService {

	public LoginVO login(String id, String pw) throws Exception;
	
	public void join(JoinVO join) throws Exception;
	
	public LoginVO loginById(String id) throws Exception;
	
	
}



