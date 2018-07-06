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
	public List<NoticeVO> getNoticePage(Criteria cri) throws Exception {
		return noticeMapper.getNoticePage(cri);
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
	
	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 NoticeVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	@Override
	public NoticeVO getNotice(NoticeVO vo, int no) throws Exception {
		
		NoticeVO resultVO = noticeMapper.getNoticeByNo(no);
		
		return resultVO;
	}
	
	
	
	
	
	
	
	
}
