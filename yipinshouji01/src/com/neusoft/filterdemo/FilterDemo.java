package com.neusoft.filterdemo;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class FilterDemo implements Filter{

	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response=(HttpServletResponse) arg1;
		//如果提交的method 是post 需要修改request的字符编码
		request.setCharacterEncoding("utf-8");
		//设置文档类型 同时设置编码类型
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//放行
		
		arg2.doFilter(request, response);
			}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}

	

}
