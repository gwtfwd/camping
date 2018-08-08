package kr.green.camping.service.user;

import org.springframework.stereotype.Service;

import kr.green.camping.vo.user.TestVO;

@Service
public interface TestService {

	public void insertBoardReply(TestVO param) throws Exception;
	
	
}
