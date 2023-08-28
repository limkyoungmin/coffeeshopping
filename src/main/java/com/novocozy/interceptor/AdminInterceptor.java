package com.novocozy.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.novocozy.domain.AdminVO;

public class AdminInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handle) throws Exception {
		
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");	
		
		HttpSession session = request.getSession();
		AdminVO adminVo = (AdminVO)session.getAttribute("admin");

		String requestURI = request.getRequestURL().toString();
		System.out.println("requestURI : " + requestURI);
		
		if (requestURI.endsWith("login") || requestURI.endsWith("loginCheck")) {
			return true;
		}
		
		if (adminVo == null) {
			
			PrintWriter printwriter = response.getWriter();
			printwriter.print("<script>alert('관리자 로그인이 확인이 안 됐습니다.\\n관리자 로그인을 반드시 해주세요.');</script>");
			
			response.sendRedirect("login");
			return false;
		}
		
		return true;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}
}
