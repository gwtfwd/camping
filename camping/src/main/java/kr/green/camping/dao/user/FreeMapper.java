package kr.green.camping.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.FreeVO;

public interface FreeMapper {

	public List<FreeVO> getFreePage(Criteria cri) throws Exception;
	
	public FreeVO getFreeByNo(FreeVO vo) throws Exception;
	
	public void writeFree(FreeVO vo) throws Exception;
	
	public void modifyFree(FreeVO vo) throws Exception;
	
	public void deleteFree(FreeVO vo);
	
	public int view(FreeVO vo) throws Exception;
	
	// °Ë»ö
	public Integer getCountFree(@Param("search") String search,@Param("type") Integer type) throws Exception;
	public List<FreeVO> searchFree(@Param("cri")Criteria cri,@Param("search") String search,@Param("type") Integer type) throws Exception;
	
	
	
	
}
