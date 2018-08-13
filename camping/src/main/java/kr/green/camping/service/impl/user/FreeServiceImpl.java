package kr.green.camping.service.impl.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.green.camping.dao.user.FreeMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.user.FreeService;
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
	public void writeFree(FreeVO vo) throws Exception {
		
		freeMapper.writeFree(vo);
	}
	@Override
	public void modifyFree(FreeVO vo) throws Exception {
		freeMapper.modifyFree(vo);
	}
	@Override
	public void deleteFree(FreeVO vo) throws Exception {
		freeMapper.deleteFree(vo);
	}
	@Override
	public int view(FreeVO vo) throws Exception {
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
	
	
	
	// 댓글
	@Override
	public Integer replyCount(int bno) throws Exception {
		return freeMapper.replyCount(bno);
	}
	@Override
	 public List<ReplyVO> replyList(Integer bno) throws Exception{
	        
        return freeMapper.replyList(bno);
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










