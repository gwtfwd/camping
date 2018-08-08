package kr.green.camping.service.user;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.LikeVO;

@Service
public interface SearchService {

	//camp
	public CampVO getCamp(CampVO vo) throws Exception;
	
	
	// 좋아요
	public int getBoardLike(LikeVO vo) throws Exception;
    public void insertBoardLike(LikeVO vo) throws Exception;
    public void deleteBoardLike(LikeVO vo) throws Exception;
	
	
	
	// region
	public List<CampVO> getSeoul(CampVO vo) throws Exception;
	
	
	// type
	public CampVO getTypeByNo(CampVO vo) throws Exception;
	
	
	// 검색
	public List<CampVO> getType(Criteria cri, Integer type) throws Exception;
	public int getCountType(Integer type) throws Exception;

	
}
