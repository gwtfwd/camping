package kr.green.camping.service.impl.admin;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.camping.dao.admin.AdminMemberMapper;
import kr.green.camping.service.admin.AdminMemberService;
import kr.green.camping.vo.admin.AdminJoinVO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{

	@Resource(name = "adminMemberMapper")
	private AdminMemberMapper adminMemberMapper;
	
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@Override
	public void adminJoin(AdminJoinVO adminJoin) throws Exception {
		
		adminMemberMapper.adminJoin(adminJoin);
		
	}
	
	@Override
	public AdminJoinVO adminByIdPw(String adminId, String adminPw) throws Exception {
		
		AdminJoinVO user = adminMemberMapper.adminById(adminId);
		
		if( !(user != null && passwordEncoder.matches(adminPw, user.getPw()))) {
			
			user = null;
		}

		return user;
	}
	
	@Override
	public AdminJoinVO adminById(String adminId) throws Exception {
		
		AdminJoinVO user = adminMemberMapper.adminById(adminId);

		return user;
	}
}
