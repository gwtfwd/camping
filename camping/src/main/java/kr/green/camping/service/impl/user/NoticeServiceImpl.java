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
	public List<NoticeVO> getNotice(Criteria cri) throws Exception {
		return noticeMapper.getNotice();
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
	
	
}