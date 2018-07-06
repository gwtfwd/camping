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
	 * �� �� ������ ��ȸ�Ѵ�.
	 * @param searchVO - ��ȸ�� ������ ��� VO
	 * @return �� �� ����
	 * @exception
	 */
	@Override
	public int getCountNotice(Criteria cri) {
		return noticeMapper.getCountNotice();
	}
	
	/**
	 * ���� ��ȸ�Ѵ�.
	 * @param vo - ��ȸ�� ������ ��� NoticeVO
	 * @return ��ȸ�� ��
	 * @exception Exception
	 */
	@Override
	public NoticeVO getNotice(NoticeVO vo, int no) throws Exception {
		
		NoticeVO resultVO = noticeMapper.getNoticeByNo(no);
		
		return resultVO;
	}
	
	
	
	
	
	
	
	
}
