package kr.green.camping.dao.admin;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.vo.admin.AdminJoinVO;

public interface AdminMemberMapper {

	
	public void adminJoin(@Param("adminJoin") AdminJoinVO adminJoin);
	public AdminJoinVO adminById(@Param("adminId") String adminId);
	
}
