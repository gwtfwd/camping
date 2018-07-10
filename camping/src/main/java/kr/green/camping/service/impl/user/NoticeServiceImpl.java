package kr.green.camping.service.impl.user;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import kr.green.camping.dao.user.NoticeMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.user.NoticeService;
import kr.green.camping.vo.user.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Resource(name = "noticeMapper")
	private NoticeMapper noticeMapper;
	
	
	/**
	 * �� ����� ��ȸ�Ѵ�.
	 * @param searchVO - ��ȸ�� ������ ��� VO
	 * @return �� ���
	 * @exception Exception
	 */
	@Override
	public List<NoticeVO> getNoticePage(Criteria cri) throws Exception {
		return noticeMapper.getNoticePage(cri);
	}
	
	/**
	 * @throws Exception 
	 * �� �� ������ ��ȸ�Ѵ�.
	 * @param searchVO - ��ȸ�� ������ ��� VO
	 * @return �� �� ����
	 * @exception
	 */
	@Override
	public int getCountNotice(Criteria cri) throws Exception {
		return noticeMapper.getCountNotice();
	}
	
	/**
	 * ���� ��ȸ�Ѵ�.
	 * @param vo - ��ȸ�� ������ ��� NoticeVO
	 * @return ��ȸ�� ��
	 * @exception Exception
	 */
	@Override
	public NoticeVO getNotice(NoticeVO vo) throws Exception {

		NoticeVO resultVO = noticeMapper.getNoticeByNo(vo);
		
		return resultVO;
	}
	
	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 ParkVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void modifyNotice(NoticeVO vo) throws Exception {
		noticeMapper.modifyNotice(vo);
	}

	
	
	
	
	
	
	
}
