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
	
	
	@Override
	public List<NoticeVO> getNoticePage(Criteria cri) throws Exception {
		return noticeMapper.getNoticePage(cri);
	}
	
	
	@Override
	public NoticeVO getNotice(NoticeVO vo) throws Exception {

		NoticeVO resultVO = noticeMapper.getNoticeByNo(vo);
		
		return resultVO;
	}
	
	@Override
	public void modifyNotice(NoticeVO vo) throws Exception {
		noticeMapper.modifyNotice(vo);
	}

	
	@Override
	public int view(NoticeVO vo) throws Exception {
		return noticeMapper.view(vo);
	}
	
	
	// 검색
	@Override
	public List<NoticeVO> searchNotice(Criteria cri, String search, Integer type) throws Exception {
		return noticeMapper.searchNotice(cri, search,type);
	}
	
	@Override
	public int getCountNotice(String search,Integer type) throws Exception {
		return noticeMapper.getCountNotice(search, type);
	}
	
	
	
	/*// 제목검색
	@Override
	public List<NoticeVO> getListPageBySubject(Criteria cri, String search) throws Exception {
		return noticeMapper.getListPageBySubject(cri, search);
	}
	
	@Override
	public int getCountFreeBySubject(String search) throws Exception {
		return noticeMapper.getCountFreeBySubject(search);
	}
	
	// 내용검색
	@Override
	public List<NoticeVO> getListPageByContents(Criteria cri, String search) throws Exception {
		return noticeMapper.getListPageByContents(cri, search);
	}
	
	@Override
	public int getCountFreeByContents(String search) throws Exception {
		return noticeMapper.getCountFreeByContents(search);
	}
	
	// 글쓴이 검색
	@Override
	public List<NoticeVO> getListPageByName(Criteria cri, String search) throws Exception {
		return noticeMapper.getListPageByName(cri, search);
	}
	
	@Override
	public int getCountFreeByName(String search) throws Exception {
		return noticeMapper.getCountFreeByName(search);
	}
	
	// id검색
	@Override
	public List<NoticeVO> getListPageById(Criteria cri, String search) throws Exception {
		return noticeMapper.getListPageById(cri, search);
	}
	
	@Override
	public int getCountFreeById(String search) throws Exception {
		return noticeMapper.getCountFreeById(search);
	}*/
	
	
}
