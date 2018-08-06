package kr.green.camping.dao.user;

import org.apache.ibatis.annotations.Param;

import kr.green.camping.vo.user.JoinVO;


public interface MemberMapper {

	public JoinVO login(@Param("id") String id,@Param("pw") String pw);
	
	public void join(@Param("join") JoinVO join);
	
	public JoinVO loginById(@Param("id") String id);
	
	/*public int chkDupId(@Param("id") String id);*/
	
}



