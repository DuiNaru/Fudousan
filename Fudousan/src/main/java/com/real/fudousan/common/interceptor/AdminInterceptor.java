package com.real.fudousan.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("preHandler Start");
		boolean result = super.preHandle(request, response, handler);
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("loginId");
		
		logger.debug("preHandler session(loginId) : " + id);
		if (id.equals("admin")) {
			result &= true;
		}
		
		logger.debug("preHandler result : " + result);
		if (!result) {
			response.sendRedirect(request.getContextPath()+"/");
		}
		logger.info("preHandler End");
		return result;
	}

	
}
