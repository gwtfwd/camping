package kr.green.camping.dao.user;

import java.util.List;


import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.FreeVO;

public interface FreeMapper {

	public List<FreeVO> getFreePage(Criteria cri) throws Exception;
	
	public int getCountFree() throws Exception;
	
	public FreeVO getFreeByNo(FreeVO vo) throws Exception;
	
	public void writeFree(FreeVO vo) throws Exception;
	
	
}
