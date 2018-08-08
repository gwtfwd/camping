package kr.green.camping.dao.user;

import kr.green.camping.vo.user.TestVO;

public interface TestMapper {

	
	public void insertBoardReply(TestVO param) throws Exception;

	public void insert(String string, TestVO param);
	
	
	
}
