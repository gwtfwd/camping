package kr.green.camping.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.ReplyVO;

public interface FreeMapper {

	// 자유게시판
	public List<FreeVO> getFreePage(Criteria cri) throws Exception;
	public FreeVO getFreeByNo(FreeVO vo) throws Exception;
	public void writeFree(FreeVO vo) throws Exception;
	public void modifyFree(FreeVO vo) throws Exception;
	public void deleteFree(Integer no) throws Exception;
	public Integer view(FreeVO vo) throws Exception;
	public void replyDeleteByBno(Integer bno) throws Exception;
	
	
	// 검색
	public Integer getCountFree(@Param("search") String search,@Param("type") Integer type) throws Exception;
	public List<FreeVO> searchFree(@Param("cri")Criteria cri,@Param("search") String search,@Param("type") Integer type) throws Exception;
	
	// 공지
	public Integer getCountFreeByNotice() throws Exception;
	public List<FreeVO> searchFreeByNotice() throws Exception;

	
	// 댓글
    public Integer replyCount(@Param("bno")Integer bno) throws Exception;
    public ReplyVO replyListByReno(ReplyVO reply) throws Exception;
    public List<ReplyVO> replyList(@Param("bno")Integer bno,@Param("cri")Criteria cri) throws Exception;
    public List<ReplyVO> getReplyPage(Criteria cri) throws Exception;
    public Integer replyInsert(ReplyVO replyVO) throws Exception;
    public Integer replyUpdate(ReplyVO replyVO) throws Exception;
    public Integer replyDelete(int reno) throws Exception;

    
    
    
    
	
}







