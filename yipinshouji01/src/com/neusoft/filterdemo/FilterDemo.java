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
		//����ύ��method ��post ��Ҫ�޸�request���ַ�����
		request.setCharacterEncoding("utf-8");
		//�����ĵ����� ͬʱ���ñ�������
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//����
		
		arg2.doFilter(request, response);
			}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
		
	}

	

}
