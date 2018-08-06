package kr.green.camping.service.user;

import org.springframework.stereotype.Service;

import kr.green.camping.vo.user.JoinVO;

@Service
public interface MemberService {

	public JoinVO login(String id, String pw) throws Exception;
	
	public void join(JoinVO join) throws Exception;
	
	public JoinVO loginById(String id) throws Exception;


	
	
}



