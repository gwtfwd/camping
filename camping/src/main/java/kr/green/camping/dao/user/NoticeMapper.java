package kr.green.camping.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getNoticePage(Criteria cri) throws Exception;
	
	public NoticeVO getNoticeByNo(NoticeVO vo) throws Exception;

	public void modifyNotice(NoticeVO vo) throws Exception;

	public int view(NoticeVO vo) throws Exception;
	
	// 검색
	public Integer getCountNotice(@Param("search") String search,@Param("type") Integer type) throws Exception;
	public List<NoticeVO> searchNotice(@Param("cri")Criteria cri,@Param("search") String search,@Param("type") Integer type) throws Exception;
	
	
	
	
	
	
	/*// 제목검색
	public Integer getCountFreeBySubject(String search) throws Exception;
	public List<NoticeVO> getListPageBySubject(Criteria cri, String search) throws Exception;
	
	// 내용검색
	public Integer getCountFreeByContents(String search) throws Exception;
	public List<NoticeVO> getListPageByContents(Criteria cri, String search) throws Exception;

	// 글쓴이검색
	public Integer getCountFreeByName(String search) throws Exception;
	public List<NoticeVO> getListPageByName(Criteria cri, String search) throws Exception;
	
	// id검색
	public Integer getCountFreeById(String search) throws Exception;
	public List<NoticeVO> getListPageById(Criteria cri, String search) throws Exception;*/
	
	
	
	
	
}
