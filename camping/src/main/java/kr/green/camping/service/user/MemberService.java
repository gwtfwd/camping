package kr.green.camping.service.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.green.camping.pagination.Criteria;
import kr.green.camping.vo.user.FreeVO;
import kr.green.camping.vo.user.JoinVO;

@Service
public interface MemberService {

	
	
	public boolean keepLogin(JoinVO user) throws Exception;
	public JoinVO getLoginUser(HttpServletRequest request) throws Exception;
	public JoinVO login(String id, String pw) throws Exception;
	public void join(JoinVO join) throws Exception;
	public JoinVO loginById(String id) throws Exception;
	public void modifyJoin(JoinVO vo) throws Exception;
	public void deleteUser(JoinVO vo) throws Exception;
	
	
	//아이디 찾기
	public JoinVO getid(String name, String phone) throws Exception;
	public boolean findid(String name, String phone) throws Exception;
	
	// 비밀번호찾기
	public JoinVO getpw(String id, String phone, String email) throws Exception;
	public boolean findpw(String id, String phone, String email) throws Exception;
	
	// user 리스트
	public List<JoinVO> searchUser(Criteria cri) throws Exception;
	public Integer getCountUser() throws Exception;
	public JoinVO getUser(JoinVO vo) throws Exception;
	
	
	
}



