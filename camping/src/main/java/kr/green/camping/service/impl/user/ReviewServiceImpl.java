package kr.green.camping.service.impl.user;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.camping.dao.user.ReviewMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.user.ReviewService;
import kr.green.camping.utils.UploadFileUtils;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.ReplyVO;
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
	
	@Override
	public ReviewVO getReview(ReviewVO vo) throws Exception {

		ReviewVO resultVO = reviewMapper.getReviewByNo(vo);
		
		return resultVO;
	}
	
	@Override
	public Integer view(ReviewVO vo) throws Exception {
		return reviewMapper.view(vo);
	}
	@Override
	public void modifyReview(ReviewVO vo, MultipartFile file, String uploadPath, Integer del) throws Exception {
		
		//수정된 날짜로 created_date를 업데이트
		Date created_date = new Date();
		vo.setUpdated_at(created_date);
		
		//기존 첨부파일 경로를 가져오기 위함
		ReviewVO tmp = reviewMapper.getReviewByNo(vo);
	
		//수정될 첨부파일이 있는 경우
		if(file != null && file.getOriginalFilename().length()!= 0) {
			String filePath = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),file.getBytes());
			vo.setFilepath(filePath);
		}
		//수정될 첨부파일이 없지만 기존 첨부파일이 지워져야 하는 경우
		else if(del != null && tmp.getFilepath() != null) {
			//실제 파일을 삭제
			new File(uploadPath + tmp.getFilepath().replace('/', File.separatorChar)).delete();
			vo.setFilepath(null);
		}
		//수정될 파일이 없고 기존 파일을 유지하는 경우
		else {
			vo.setFilepath(tmp.getFilepath());
		}
		
		reviewMapper.modifyReview(vo);
	}
	@Override
	public void deleteReview(ReviewVO vo) throws Exception {
		reviewMapper.deleteReview(vo);
	}
	
	
	
	
	
	
}
