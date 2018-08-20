package kr.green.camping.service.impl.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.camping.dao.user.ReviewMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.user.ReviewService;
import kr.green.camping.utils.UploadFileUtils;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Resource(name = "reviewMapper")
	private ReviewMapper reviewMapper;
	
	@Override
	public List<ReviewVO> getReviewPage(Criteria cri) throws Exception {
		return reviewMapper.getReviewPage(cri);
	}
	
	@Override
	public Integer getCountReview() throws Exception {
		return reviewMapper.getCountReview();
	}
	
	@Override
	public void writeReview(ReviewVO vo, MultipartFile file, String uploadPath) throws Exception {
		
		if(file != null) {
			String filePath = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),file.getBytes());
			vo.setFilepath(filePath);
		}
		
		reviewMapper.writeReview(vo);
	}
	
	
	
	
	
	
}
