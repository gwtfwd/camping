package kr.green.camping.service.user;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.FreeVO;

@Service
public interface FreeService {

	
	public List<FreeVO> getFreePage(Criteria cri) throws Exception;
	
	public FreeVO getFree(FreeVO vo) throws Exception;
	
	public void writeFree(FreeVO vo) throws Exception;
	
	public void modifyFree(FreeVO vo) throws Exception;
	
	public void deleteFree(FreeVO vo) throws Exception;
	
	public int view(FreeVO vo) throws Exception;
	
	// °Ë»ö
	public List<FreeVO> searchFree(Criteria cri, String search, Integer type) throws Exception;
	public int getCountFree(String search, Integer type) throws Exception;
	
	
}
