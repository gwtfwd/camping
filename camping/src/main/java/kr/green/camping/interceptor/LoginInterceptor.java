package kr.green.camping.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.green.camping.vo.user.JoinVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	/*Controller���� Model�� ���� ������ �������� �ʾ����� modelMap.get("user")�� ���� �� null���� ���� ������ ������ ������ �����´�.
	������ ������ null�� �ƴϸ� �ش� ���� ������ ���ǿ� ����*/
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		ModelMap modelMap = modelAndView.getModelMap();
		JoinVO user = (JoinVO)modelMap.get("user");
		
		if( user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		}
		
		
		
	}
		
	
	
}






