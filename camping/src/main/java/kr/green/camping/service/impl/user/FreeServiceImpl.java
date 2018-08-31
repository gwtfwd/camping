package kr.green.camping.service.impl.user;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.camping.dao.user.FreeMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.user.FreeService;
import kr.green.camping.utils.UploadFileUtils;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.ReplyVO;

@Service("freeService")
public class FreeServiceImpl implements FreeService {

	@Resource(name = "freeMapper")
	private FreeMapper freeMapper;
	
	
	// 자유게시판
	@Override
	public List<FreeVO> getFreePage(Criteria cri) throws Exception {
		return freeMapper.getFreePage(cri);
	}
	@Override
	public FreeVO getFree(FreeVO vo) throws Exception {

		FreeVO resultVO = freeMapper.getFreeByNo(vo);
		
		return resultVO;
	}
	@Override
	public void writeFree(FreeVO vo, MultipartFile file, String uploadPath) throws Exception {
		
		if(file != null && file.getSize() != 0) {
			String filePath = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),file.getBytes());
			vo.setFilepath(filePath);
		}
		
		freeMapper.writeFree(vo);
	}
	@Override
	public void modifyFree(FreeVO vo, MultipartFile file, String uploadPath, Integer del) throws Exception {
		
		//수정된 날짜로 created_date를 업데이트
		Date created_date = new Date();
		vo.setUpdated_at(created_date);
		//기존 첨부파일 경로를 가져오기 위함
		FreeVO tmp = freeMapper.getFreeByNo(vo);
	
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
		
		freeMapper.modifyFree(vo);
	}
	@Override
	public void deleteFree(Integer bno) throws Exception {
		
		freeMapper.replyDeleteByBno(bno);
		freeMapper.deleteFree(bno);
	}
	
	@Override
	public Integer view(FreeVO vo) throws Exception {
		return freeMapper.view(vo);
	}
	
	
	// 검색
	@Override
	public List<FreeVO> searchFree(Criteria cri, String search, Integer type) throws Exception {
		return freeMapper.searchFree(cri, search,type);
	}
	@Override
	public int getCountFree(String search,Integer type) throws Exception {
		return freeMapper.getCountFree(search, type);
	}
	
	// 공지
	@Override
	public List<FreeVO> searchFreeByNotice() throws Exception {
		return freeMapper.searchFreeByNotice();
	}
	@Override
	public int getCountFreeByNotice() throws Exception {
		return freeMapper.getCountFreeByNotice();
	}
	
	
	
	// 댓글
	@Override
	public Integer replyCount(Integer bno, Criteria cri) throws Exception {
		return freeMapper.replyCount(bno);
	}
	@Override
	 public List<ReplyVO> replyList(Integer bno, Criteria cri) throws Exception{
	        
        return freeMapper.replyList(bno,cri);
    }
	@Override
	public ReplyVO replyListByReno(ReplyVO reply) throws Exception{
		
		ReplyVO replyVO = freeMapper.replyListByReno(reply);
		
		return replyVO;
	}
	@Override
	public List<ReplyVO> getReplyPage(Criteria cri) throws Exception {
		return freeMapper.getReplyPage(cri); 
	}
	@Override    
    public Integer replyInsert(ReplyVO replyVO) throws Exception{
        
        return freeMapper.replyInsert(replyVO);
    }
	@Override 
    public Integer replyUpdate(ReplyVO replyVO) throws Exception{
        
        return freeMapper.replyUpdate(replyVO);
    }
	@Override
    public Integer replyDelete(int reno) throws Exception{
        
        return freeMapper.replyDelete(reno);
    }


	
	
}










