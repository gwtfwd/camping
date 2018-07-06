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
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<NoticeVO> getNotice(Criteria cri) throws Exception {
		return noticeMapper.getNotice();
	}
	
	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int getCountNotice(Criteria cri) {
		return noticeMapper.getCountNotice();
	}
	
	
}
