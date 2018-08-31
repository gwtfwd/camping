package kr.green.camping.service.user;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.ReplyVO;

@Service
public interface FreeService {

	// 자유게시판
	public List<FreeVO> getFreePage(Criteria cri) throws Exception;
	public FreeVO getFree(FreeVO vo) throws Exception;
	public void writeFree(FreeVO vo, MultipartFile file, String uploadPath) throws Exception;
	public void modifyFree(FreeVO vo, MultipartFile file, String uploadPath, Integer del) throws Exception;
	public void deleteFree(Integer bno) throws Exception;
	public Integer view(FreeVO vo) throws Exception;
	
	
	// 검색
	public List<FreeVO> searchFree(Criteria cri, String search, Integer type) throws Exception;
	public int getCountFree(String search, Integer type) throws Exception;
	
	// 공지
	public List<FreeVO> searchFreeByNotice() throws Exception;
	public int getCountFreeByNotice() throws Exception;
	
	
	// 댓글
	public Integer replyCount(Integer bno, Criteria cri) throws Exception;
	public ReplyVO replyListByReno(ReplyVO reply) throws Exception;
	public List<ReplyVO> replyList(Integer bno, Criteria cri) throws Exception;
	public List<ReplyVO> getReplyPage(Criteria cri) throws Exception;
	public Integer replyInsert(ReplyVO replyVO) throws Exception;
	public Integer replyUpdate(ReplyVO replyVO) throws Exception;
	public Integer replyDelete(int reno) throws Exception;

	
	
	
	
	
	
	
	
	
	
	
	
}





