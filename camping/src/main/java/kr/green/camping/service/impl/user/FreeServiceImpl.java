package kr.green.camping.service.impl.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.green.camping.dao.user.FreeMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.user.FreeService;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.NoticeVO;

@Service("freeService")
public class FreeServiceImpl implements FreeService {

	@Resource(name = "freeMapper")
	private FreeMapper freeMapper;
	
	
	@Override
	public List<FreeVO> getFreePage(Criteria cri) throws Exception {
		return freeMapper.getFreePage(cri);
	}
	
	@Override
	public int getCountFree(Criteria cri) throws Exception {
		return freeMapper.getCountFree();
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
	
	
}
