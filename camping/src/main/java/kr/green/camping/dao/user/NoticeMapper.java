package kr.green.camping.dao.user;

import java.util.List;

import kr.green.camping.vo.user.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getNotice();
	
	public int getCountNotice();
	
	
	
}
