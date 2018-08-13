package kr.green.camping.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.green.camping.vo.user.JoinVO;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		/* 세션에 저장된 유저 정보를 얻기위해nrequest를 이용하여 세션 정보를 가져오고 세션에서 유저 정보가 있는지 확인한다.*/
		
		HttpSession session = request.getSession();
		JoinVO user = (JoinVO) session.getAttribute("user");
		
		
		/* 유저 정보가 없으면 main 화면으로 보냄 */
		if(user == null) {
			response.sendRedirect("/camping");
			return false;
		}
		return true;
	}
}
