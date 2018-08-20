package kr.green.camping.service.user;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.ReviewVO;

@Service
public interface ReviewService {

	public List<ReviewVO> getReviewPage(Criteria cri) throws Exception;
	public Integer getCountReview() throws Exception;
	public void writeReview(ReviewVO vo, MultipartFile file, String uploadPath) throws Exception;
	
	
	
}
