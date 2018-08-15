package kr.green.camping.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.LikeVO;
import kr.green.camping.vo.user.RegionVO;

public interface SearchMapper {

	// camp
	public CampVO getCampByNo(CampVO vo) throws Exception;
	
	
	// 좋아요
    public int getBoardLike(LikeVO vo) throws Exception;
    public void insertBoardLike(LikeVO vo) throws Exception;
    public void deleteBoardLike(LikeVO vo) throws Exception;
    public void updateBoardLike(int camp_no) throws Exception;
	
	
	
	// region
    //public List<CampVO> regionList(String region_code) throws Exception;
    //public Integer regionCnt(String region_code) throws Exception;
    public List<CampVO> regionList(@Param("region_code") String region_code, @Param("type") String type) throws Exception;
    public Integer regionCnt(@Param("region_code") String region_code, @Param("type") String type) throws Exception;
    public String getRegionCode(String area) throws Exception;
    
	
	// type
	public CampVO getTypeByNo(CampVO vo) throws Exception;
	
	// 검색
	public Integer getCountType(@Param("type") Integer type) throws Exception;
	public List<CampVO> getType(@Param("cri")Criteria cri, @Param("type") Integer type) throws Exception;
	
	// 야영장 이름으로 검색
	public List<CampVO> searchCamp(@Param("search") String search) throws Exception;
	public Integer getCountCamp(@Param("search") String search) throws Exception;
	
}




