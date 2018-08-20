package kr.green.camping.dao.user;

import java.util.List;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.ReviewVO;

public interface ReviewMapper {

	public List<ReviewVO> getReviewPage(Criteria cri) throws Exception;
	public Integer getCountReview() throws Exception;
	public void writeReview(ReviewVO vo) throws Exception;
	
}
