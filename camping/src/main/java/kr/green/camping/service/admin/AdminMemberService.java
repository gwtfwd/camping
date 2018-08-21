package kr.green.camping.service.admin;

import org.springframework.stereotype.Service;

import kr.green.camping.vo.admin.AdminJoinVO;

@Service
public interface AdminMemberService {

	public void adminJoin(AdminJoinVO adminJoin) throws Exception;
	public AdminJoinVO adminByIdPw(String adminId, String adminPw) throws Exception;
	public AdminJoinVO adminById(String adminId) throws Exception;
	
	
	
	
	
	
}
