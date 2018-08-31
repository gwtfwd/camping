package kr.green.camping.service.admin;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.JoinVO;

@Service
public interface AdminMemberService {

	public void adminJoin(AdminJoinVO adminJoin) throws Exception;
	public AdminJoinVO adminByIdPw(String adminId, String adminPw) throws Exception;
	public AdminJoinVO adminById(String adminId) throws Exception;
	public void modifyJoin(AdminJoinVO adminJoin) throws Exception;
	
	// admin 리스트
	public Integer getCountAdmin() throws Exception;
	public List<AdminJoinVO> searchAdmin(Criteria cri) throws Exception;
	public AdminJoinVO getAdmin(AdminJoinVO vo) throws Exception;
	
	
}
