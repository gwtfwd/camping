package kr.green.camping.service.user;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.LikeVO;
import kr.green.camping.vo.user.RegionVO;

@Service
public interface SearchService {

	//camp
	public CampVO getCamp(CampVO vo) throws Exception;
	
	// region
	public List<CampVO> regionList(String region_code, String type) throws Exception;
	public Integer regionCnt(String region_code, String type) throws Exception;
	public String getRegionCode(String area) throws Exception;
	
	// type
	public CampVO getTypeByNo(CampVO vo) throws Exception;
	
	
	// 검색
	public List<CampVO> getType(Criteria cri, Integer type) throws Exception;
	public int getCountType(Integer type) throws Exception;

	
	// 야영장이름으로 검색
	public List<CampVO> searchCamp(String search) throws Exception;
	public int getCountCamp(String search) throws Exception;
}
