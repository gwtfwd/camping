package kr.green.camping.dao.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.admin.AdminJoinVO;
import kr.green.camping.vo.user.JoinVO;

public interface AdminMemberMapper {

	
	public void adminJoin(@Param("adminJoin") AdminJoinVO adminJoin);
	public AdminJoinVO adminById(@Param("adminId") String adminId);
	public void modifyJoin(@Param("adminJoin") AdminJoinVO adminJoin) throws Exception;
	
	// admin 리스트
	public Integer getCountAdmin() throws Exception;
	public List<AdminJoinVO> searchAdmin(@Param("cri")Criteria cri) throws Exception;
	public AdminJoinVO getAdminById(AdminJoinVO vo) throws Exception;
	
	
}
