package kr.green.camping.service.user;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.NoticeVO;

@Service
public interface NoticeService {

	public List<NoticeVO> getNoticePage(Criteria cri) throws Exception;
	
	public NoticeVO getNotice(NoticeVO vo) throws Exception;
	
	public void modifyNotice(NoticeVO vo) throws Exception;

	public int view(NoticeVO vo) throws Exception;

	
	// 검색
	public List<NoticeVO> searchNotice(Criteria cri, String search, Integer type) throws Exception;
	public int getCountNotice(String search, Integer type) throws Exception;
	
	
	// 검색
	/*public List<NoticeVO> getListPageBySubject(Criteria cri, String search) throws Exception;
	public int getCountFreeBySubject(String search) throws Exception;
	
	public List<NoticeVO> getListPageByContents(Criteria cri, String search) throws Exception;
	public int getCountFreeByContents(String search) throws Exception;
	
	public List<NoticeVO> getListPageByName(Criteria cri, String search) throws Exception;
	public int getCountFreeByName(String search) throws Exception;
	
	public List<NoticeVO> getListPageById(Criteria cri, String search) throws Exception;
	public int getCountFreeById(String search) throws Exception;*/
	
	
	
	
	
	
	
	
	
	
	
}



