package kr.green.camping.service.impl.user;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.green.camping.dao.user.TestMapper;
import kr.green.camping.vo.user.TestVO;

@Service("testService")
public class TestServiceImpl {

	@Resource(name = "testMapper")
	private TestMapper testMapper;
	
	
	
    public void insertBoardReply(TestVO param) {
        if (param.getReno()==null || "".equals(param.getReno())) {
        	testMapper.insert("insertBoard5Reply", param);
        } else {
        	testMapper.insert("updateBoard5Reply", param);
        }
    }

	
	
	
}
