package kr.green.camping.dao.user;

import java.util.List;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.ReplyVO;
import kr.green.camping.vo.user.ReviewVO;

public interface ReviewMapper {

	public List<ReviewVO> getReviewPage(Criteria cri) throws Exception;
	public Integer getCountReview() throws Exception;
	public void writeReview(ReviewVO vo) throws Exception;
	public ReviewVO getReviewByNo(ReviewVO vo) throws Exception;
	public int view(ReviewVO vo) throws Exception;
	
	
	
	
	// 댓글
    public Integer replyCount(int bno) throws Exception;
    public List<ReplyVO> replyList(Integer bno) throws Exception;
    public List<ReplyVO> getReplyPage(Criteria cri) throws Exception;
    public Integer replyInsert(ReplyVO replyVO) throws Exception;
    public Integer replyUpdate(ReplyVO replyVO) throws Exception;
    public Integer replyDelete(int reno) throws Exception;
}
