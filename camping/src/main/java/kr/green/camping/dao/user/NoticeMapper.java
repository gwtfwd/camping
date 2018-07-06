package kr.green.camping.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getNoticePage(Criteria cri) throws Exception;
	
	public int getCountNotice();
	
	public NoticeVO getNoticeByNo(int no);
	
}
