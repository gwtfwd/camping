package kr.green.camping.service.impl.user;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import kr.green.camping.dao.user.SearchMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.user.SearchService;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.LikeVO;
import kr.green.camping.vo.user.RegionVO;

@Service("searchService")
public class SearchServiceImpl implements SearchService{

	@Resource(name = "searchMapper")
	private SearchMapper searchMapper;
	
	
	//camp
	@Override
	public CampVO getCamp(CampVO vo) throws Exception {

		CampVO resultVO = searchMapper.getCampByNo(vo);
		return resultVO;
	}

	
	
	// 좋아요
	@Override
    public void insertBoardLike(LikeVO vo) throws Exception {
		searchMapper.insertBoardLike(vo);
		searchMapper.updateBoardLike(vo.getCamp_no());
    }

    @Override
    public void deleteBoardLike(LikeVO vo) throws Exception {
    	searchMapper.deleteBoardLike(vo);
    	searchMapper.updateBoardLike(vo.getCamp_no());
    }
    
    @Override
    public int getBoardLike(LikeVO vo) throws Exception {
            return searchMapper.getBoardLike(vo);
    }
	 
	 
	
	// region
	@Override
	/*public List<CampVO> regionList(String region_code) throws Exception {
		return searchMapper.regionList(region_code);
	}
	
	public Integer regionCnt(String region_code) throws Exception {
		return searchMapper.regionCnt(region_code);
	}*/
	public List<CampVO> regionList(String region_code, String type) throws Exception {
		return searchMapper.regionList(region_code, type);
	}
	
	public Integer regionCnt(String region_code, String type) throws Exception {
		return searchMapper.regionCnt(region_code, type);
	}

	public String getRegionCode(String area) throws Exception {
		
		String regionCode = searchMapper.getRegionCode(area);
		
		return regionCode;
	}
	
	
	
	// TYPE
	@Override
	public CampVO getTypeByNo(CampVO vo) throws Exception {

		CampVO resultVO = searchMapper.getTypeByNo(vo);
		return resultVO;
	}
	
	
	
	// 검색
	@Override
	public List<CampVO> getType(Criteria cri, Integer type) throws Exception {
		return searchMapper.getType(cri, type);
	}
	
	@Override
	public int getCountType(Integer type) throws Exception {
		return searchMapper.getCountType(type);
	}
	
	
	// 야영장이름으로 검색
	@Override
	public List<CampVO> searchCamp(String search) throws Exception {
		return searchMapper.searchCamp(search);
	}
	@Override
	public int getCountCamp(String search) throws Exception {
		return searchMapper.getCountCamp(search);
	}
	
}
