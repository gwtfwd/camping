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
	public void deleteFree(FreeVO vo) throws Exception;
	public int view(FreeVO vo) throws Exception;
	
	
	// 검색
	public Integer getCountFree(@Param("search") String search,@Param("type") Integer type) throws Exception;
	public List<FreeVO> searchFree(@Param("cri")Criteria cri,@Param("search") String search,@Param("type") Integer type) throws Exception;

	
	// 댓글
    public int replyCount() throws Exception;
    public List<ReplyVO> replyList(Integer bno) throws Exception;
    public List<ReplyVO> getReplyPage(Criteria cri) throws Exception;
    public int replyInsert(ReplyVO replyVO) throws Exception;
    public int replyUpdate(ReplyVO replyVO) throws Exception;
    public int replyDelete(int reno) throws Exception;

    
    
    
    
	
}







