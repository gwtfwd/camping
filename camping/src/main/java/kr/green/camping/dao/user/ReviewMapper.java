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
	public Integer view(ReviewVO vo) throws Exception;
	public void modifyReview(ReviewVO vo) throws Exception;
	public void deleteReview(ReviewVO vo) throws Exception;
	
	
}
