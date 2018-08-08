package kr.green.camping.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.LikeVO;

public interface SearchMapper {

	// camp
	public CampVO getCampByNo(CampVO vo) throws Exception;
	
	
	// 좋아요
    public int getBoardLike(LikeVO vo) throws Exception;
    public void insertBoardLike(LikeVO vo) throws Exception;
    public void deleteBoardLike(LikeVO vo) throws Exception;
    public void updateBoardLike(int camp_no) throws Exception;
	
	
	
	// region
	public List<CampVO> getSeoul(CampVO vo) throws Exception;
	
	
	// type
	public CampVO getTypeByNo(CampVO vo) throws Exception;
	
	// 검색
	public Integer getCountType(@Param("type") Integer type) throws Exception;
	public List<CampVO> getType(@Param("cri")Criteria cri, @Param("type") Integer type) throws Exception;
	
	
}
