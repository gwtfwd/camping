package kr.green.camping.service.impl.user;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.green.camping.dao.user.SearchMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.user.SearchService;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.LikeVO;
import kr.green.camping.vo.user.NoticeVO;

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
	@Override
	  public CampVO readCampByNo(HashMap hashMap) throws Exception {
	    return searchMapper.readCampByNo(hashMap);
	  }
	@Override
	public int like_cnt_up(CampVO vo) throws Exception {
		return searchMapper.like_cnt_up(vo);
	}
	@Override
	public int like_cnt_down(CampVO vo) throws Exception {
		return searchMapper.like_cnt_down(vo);
	}
	
	
	
	//like
	@Override
	public void create(HashMap hashMap) throws Exception {
		
		searchMapper.create(hashMap);
	}
	@Override
	public void deletebyCampNo(HashMap hashMap) throws Exception {
		
		searchMapper.deletebyCampNo(hashMap);
	}
	@Override
	public void deletebyUserId(HashMap hashMap) throws Exception {
		
		searchMapper.deletebyUserId(hashMap);
	}
	@Override
	  public int countbyLike(HashMap hashMap) throws Exception{
	    int count = searchMapper.countbyLike(hashMap);
	    return count;
	  }
	@Override
	  public int like_check(HashMap hashMap) throws Exception {
	    int count = searchMapper.like_check(hashMap);
	    return count;
	  }

	 @Override
	 public int like_check_cancel(HashMap hashMap) throws Exception {
	    int count = searchMapper.like_check_cancel(hashMap);
	    return count;
	  }
	 @Override
	  public LikeVO readLike(HashMap hashMap) throws Exception {
	    LikeVO likeVO = searchMapper.readLike(hashMap);
	    return likeVO;
	  }
	
	 
	 
	 
	
	// region
	@Override
	public List<CampVO> getSeoul(CampVO vo) throws Exception {
		return searchMapper.getSeoul(vo);
	}


	
	
	
	// TYPE
	@Override
	public CampVO getTypeByNo(CampVO vo) throws Exception {

		CampVO resultVO = searchMapper.getTypeByNo(vo);
		return resultVO;
	}
	
	
	
	// °Ë»ö
	@Override
	public List<CampVO> getType(Criteria cri, Integer type) throws Exception {
		return searchMapper.getType(cri, type);
	}
	
	@Override
	public int getCountType(Integer type) throws Exception {
		return searchMapper.getCountType(type);
	}
	
	
}
