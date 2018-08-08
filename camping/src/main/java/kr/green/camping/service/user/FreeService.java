package kr.green.camping.service.user;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.ReplyVO;

@Service
public interface FreeService {

	
	public List<FreeVO> getFreePage(Criteria cri) throws Exception;
	public FreeVO getFree(FreeVO vo) throws Exception;
	
	public void writeFree(FreeVO vo) throws Exception;
	public void modifyFree(FreeVO vo) throws Exception;
	public void deleteFree(FreeVO vo) throws Exception;
	public int view(FreeVO vo) throws Exception;
	
	// 검색
	public List<FreeVO> searchFree(Criteria cri, String search, Integer type) throws Exception;
	public int getCountFree(String search, Integer type) throws Exception;
	
	
	
	// 댓글
	public List<ReplyVO> replyList(Integer bno) throws Exception;
	public List<ReplyVO> getReplyPage(Criteria cri) throws Exception;
	public int replyCount() throws Exception;
	public int replyInsert(ReplyVO replyVO) throws Exception;
	public int replyUpdate(ReplyVO replyVO) throws Exception;
	public int replyDelete(int reno) throws Exception;

	
	
	
	
	
	
	
	
	
	
	
	
}





