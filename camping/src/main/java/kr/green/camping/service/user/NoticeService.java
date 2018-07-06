package kr.green.camping.service.user;

import java.util.List;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.NoticeVO;

public interface NoticeService {

	List<NoticeVO> getNoticePage(Criteria cri) throws Exception;
	
	int getCountNotice(Criteria cri);
	
}



