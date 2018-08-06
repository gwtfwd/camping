package kr.green.camping.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) 
			throws Exception {
		
		try {
			// list���� ��Ϲ�ư�� ���� �� �α��� ���°� �ƴϸ� �α���ȭ������ �̵���Ų��.
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
