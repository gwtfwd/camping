package kr.green.camping.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.ReplyVO;

public interface FreeMapper {

	public List<FreeVO> getFreePage(Criteria cri) throws Exception;
	
	public FreeVO getFreeByNo(FreeVO vo) throws Exception;
	
	public void writeFree(FreeVO vo) throws Exception;
	
	public void modifyFree(FreeVO vo) throws Exception;
	
	public void deleteFree(FreeVO vo);
	
	public int view(FreeVO vo) throws Exception;
	
	// 검색
	public Integer getCountFree(@Param("search") String search,@Param("type") Integer type) throws Exception;
	public List<FreeVO> searchFree(@Param("cri")Criteria cri,@Param("search") String search,@Param("type") Integer type) throws Exception;
	
	// 댓글
	//public void insertReply(ReplyVO vo) throws Exception;
	//public void updateReply(ReplyVO vo) throws Exception;
	
	
	
	
	
	 // 댓글 개수
    public int replyCount() throws Exception;
 
    // 댓글 목록
    public List<ReplyVO> replyList(Integer bno) throws Exception;
 
    // 댓글 작성
    public int replyInsert(ReplyVO replyVO) throws Exception;
    
    // 댓글 수정
   // public int replyUpdate(ReplyVO replyVO) throws Exception;
 
    // 댓글 삭제
   // public int replyDelete(int reno) throws Exception;


	
}
