package kr.green.camping.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) 
			throws Exception {
		
		try {
			// list에서 등록버튼을 누를 때 로그인 상태가 아니면 로그인화면으로 이동시킨다.
			if (request.getSession().getAttribute("user") == null) {
				
				response.sendRedirect(request.getContextPath() + "/member/needLogin");
				return false;
			}
			else {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}		
				
		return super.preHandle(request, response, handler);
	}
	
	
	
	
	
	
	
	
	
}
