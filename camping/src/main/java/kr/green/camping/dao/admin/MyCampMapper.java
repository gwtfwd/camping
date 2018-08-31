package kr.green.camping.dao.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.CampVO;
import kr.green.camping.vo.user.FreeVO;

public interface MyCampMapper {

	public List<CampVO> getMyCampByNo(@Param("admin") AdminJoinVO admin, @Param("cri")Criteria cri) throws Exception;
	public Integer getMyCampCount(@Param("admin") AdminJoinVO admin) throws Exception;
	public CampVO getMyCamp(CampVO vo) throws Exception;
	public void modifyMyCamp(CampVO vo) throws Exception;
	public void writeMyCamp(CampVO vo) throws Exception;
	
	
	
}
