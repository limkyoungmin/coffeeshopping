package com.novocozy.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		 // 로그인 여부를 체크하고 로그인이 필요한 페이지에 접근하는 경우
		 if (request.getSession().getAttribute("user") == null) {
			 // 로그인 페이지로 이동
	            response.sendRedirect(request.getContextPath() + "/member/login");
	            return false;
	        }
		 return true;
	   }

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}
}
