package kr.green.camping.dao.user;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.vo.user.JoinVO;
import kr.green.camping.vo.user.LoginVO;


public interface MemberMapper {

	public LoginVO login(@Param("id") String id,@Param("pw") String pw);
	
	public void join(@Param("join") JoinVO join);
	
	
	
	
	
}



