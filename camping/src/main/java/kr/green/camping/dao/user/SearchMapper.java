package kr.green.camping.dao.user;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.LikeVO;

public interface SearchMapper {

	// camp
	public CampVO getCampByNo(CampVO vo) throws Exception;
	public CampVO readCampByNo(HashMap hashMap) throws Exception;
	public int like_cnt_up(CampVO vo) throws Exception;
	public int like_cnt_down(CampVO vo) throws Exception;
	
	
	// like
	public void create(HashMap hashMap) throws Exception;
	public void deletebyCampNo(HashMap hashMap) throws Exception;
	public void deletebyUserId(HashMap hashMap) throws Exception;
	public int countbyLike(HashMap hashMap) throws Exception;
	public int like_check(HashMap hashMap) throws Exception;
	public int like_check_cancel(HashMap hashMap) throws Exception;
	public LikeVO readLike(HashMap hashMap) throws Exception; 
	
	
	// region
	public List<CampVO> getSeoul(CampVO vo) throws Exception;
	
	
	// type
	public CampVO getTypeByNo(CampVO vo) throws Exception;
	
	// °Ë»ö
	public Integer getCountType(@Param("type") Integer type) throws Exception;
	public List<CampVO> getType(@Param("cri")Criteria cri, @Param("type") Integer type) throws Exception;
	
	
}
