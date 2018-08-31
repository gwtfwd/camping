package kr.green.camping.service.admin;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.CampVO;

@Service
public interface MyCampService {

	public List<CampVO> getMyCampByNo(AdminJoinVO admin,Criteria cri) throws Exception;
	public Integer getMyCampCount(AdminJoinVO admin) throws Exception;
	public CampVO getMyCamp(CampVO vo) throws Exception;
	public void modifyMyCamp(CampVO vo) throws Exception;
	public void writeMyCamp(CampVO vo, AdminJoinVO adminJoin) throws Exception;
}
