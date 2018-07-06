package kr.green.camping.service.user;

import java.util.List;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.NoticeVO;

public interface NoticeService {

	// �� ��� ��ȸ
	List<NoticeVO> getNoticePage(Criteria cri) throws Exception;
	
	// �� �� ���� ��ȸ
	int getCountNotice(Criteria cri);
	
	// �� ��ȸ
	NoticeVO getNotice(NoticeVO vo, int no) throws Exception;
	
}



