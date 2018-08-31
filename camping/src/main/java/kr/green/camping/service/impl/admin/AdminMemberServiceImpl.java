package kr.green.camping.service.impl.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.camping.dao.admin.AdminMemberMapper;
import kr.green.camping.pagination.Criteria;
import kr.green.camping.service.admin.AdminMemberService;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.JoinVO;

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
		
		if( !(user != null && passwordEncoder.matches(adminPw, user.getAdminPw()))) {
			
			user = null;
		}

		return user;
	}
	
	@Override
	public AdminJoinVO adminById(String adminId) throws Exception {
		
		AdminJoinVO user = adminMemberMapper.adminById(adminId);

		return user;
	}
	
	@Override
	public void modifyJoin(AdminJoinVO adminJoin) throws Exception {
		adminMemberMapper.modifyJoin(adminJoin);
	}
	
	// user 리스트
	@Override
	public List<AdminJoinVO> searchAdmin(Criteria cri) throws Exception {
		return adminMemberMapper.searchAdmin(cri);
	}
	@Override
	public Integer getCountAdmin() throws Exception {
		return adminMemberMapper.getCountAdmin();
	}
	@Override
	public AdminJoinVO getAdmin(AdminJoinVO vo) throws Exception {

		AdminJoinVO resultVO = adminMemberMapper.getAdminById(vo);
		
		return resultVO;
	}
	
	
	
	
}
