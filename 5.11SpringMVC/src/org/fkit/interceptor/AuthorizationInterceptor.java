package org.fkit.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.fkit.model.User;
import org.springframework.web.servlet.HandlerInterceptor;

public class AuthorizationInterceptor implements HandlerInterceptor{

	private static final String[] IGNORE_URI = {"/loginForm","/login"};
	
	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse response,Object handler,Exception exception) {
		System.out.println("AuthorizationInterceptor afterCompletion -->");
	}
	
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception {
		System.out.println("AuthorizationInterceptor preHandle -->");
		
		boolean flag = false;
		
		String servletPath = request.getServletPath();
		
		for (String s :IGNORE_URI) {
			if (servletPath.contains(s)) {
				flag = true;
				break;
			}
		}
		if (!flag) {
			User user =(User) request.getSession().getAttribute("user");
			if( user == null) {
				System.out.println("AuthorizationInterceptor��������");
				request.setAttribute("message", "���ȵ�¼�ٷ�����վ");
				request.getRequestDispatcher("login").forward(request, response);
				
			}else {
				System.out.println("AuthorizationInterceptor��������");
				flag = true;
			}
			
		}
		return flag;
	}
}
