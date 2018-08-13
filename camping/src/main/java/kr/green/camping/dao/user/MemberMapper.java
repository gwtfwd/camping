package kr.green.camping.dao.user;


import org.apache.ibatis.annotations.Param;

import kr.green.camping.vo.user.JoinVO;


public interface MemberMapper {

	
	public JoinVO login(@Param("id") String id,@Param("pw") String pw);
	
	public void join(@Param("join") JoinVO join);
	
	public JoinVO loginById(@Param("id") String id);
	public void modifyJoin(@Param("join") JoinVO join) throws Exception;
	public void deleteUser(@Param("join") JoinVO join) throws Exception;
	
	
	
	// 아이디찾기
	public JoinVO getid(@Param("name") String name, @Param("phone") String phone);
	public boolean findid(@Param("name") String name, @Param("phone") String phone);
	
	
	// 비밀번호찾기
	public JoinVO getpw(@Param("id") String id, @Param("phone") String phone, @Param("email") String email);
	public boolean findpw(@Param("id") String id, @Param("phone") String phone, @Param("email") String email);
	
	
}



