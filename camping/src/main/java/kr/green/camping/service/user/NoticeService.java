package kr.green.camping.service.user;

import java.util.List;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.NoticeVO;

public interface NoticeService {

	// 글 목록 조회
	List<NoticeVO> getNoticePage(Criteria cri) throws Exception;
	
	// 글 총 개수 조회
	int getCountNotice(Criteria cri);
	
	// 글 조회
	NoticeVO getNotice(NoticeVO vo, int no) throws Exception;
	
}



