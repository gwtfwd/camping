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
	public int view(ReviewVO vo) throws Exception {
		return reviewMapper.view(vo);
	}
	
	
	
	
	
	
	
	// 댓글
		@Override
		public Integer replyCount(int bno) throws Exception {
			return reviewMapper.replyCount(bno);
		}
		@Override
		 public List<ReplyVO> replyList(Integer bno) throws Exception{
		        
	        return reviewMapper.replyList(bno);
	    }
		@Override
		public List<ReplyVO> getReplyPage(Criteria cri) throws Exception {
			return reviewMapper.getReplyPage(cri); 
		}
		@Override    
	    public Integer replyInsert(ReplyVO replyVO) throws Exception{
	        
	        return reviewMapper.replyInsert(replyVO);
	    }
		@Override 
	    public Integer replyUpdate(ReplyVO replyVO) throws Exception{
	        
	        return reviewMapper.replyUpdate(replyVO);
	    }
		@Override
	    public Integer replyDelete(int reno) throws Exception{
	        
	        return reviewMapper.replyDelete(reno);
	    }
	
}
