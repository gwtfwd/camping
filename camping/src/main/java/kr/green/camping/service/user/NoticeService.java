package kr.green.camping.service.user;

import java.util.List;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.NoticeVO;

public interface NoticeService {

	// �� ��� ��ȸ
	public List<NoticeVO> getNoticePage(Criteria cri) throws Exception;
	
	// �� �� ���� ��ȸ
	public int getCountNotice(Criteria cri) throws Exception;
	
	// �� ��ȸ
	//public NoticeVO getNotice(NoticeVO vo, int no) throws Exception;
	
	public NoticeVO getNotice(NoticeVO vo) throws Exception;
	
	// 글 수정
	public void modifyNotice(NoticeVO vo) throws Exception;

	

	
}



