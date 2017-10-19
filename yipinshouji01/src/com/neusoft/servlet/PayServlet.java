package com.neusoft.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.servicedao.PayServiceDAO;
import com.neusoft.servicedaoimpl.PayServiceDAOImpl;



@WebServlet("*.pay")
public class PayServlet extends HttpServlet{
	private PayServiceDAO paydao = new PayServiceDAOImpl();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1,uri.indexOf("."));
		if("list".equals(path)){
			list(request,response);
		}else if("delete".equals(path)){
			delete(request,response);
		}else if("selectblur".equals(path)) {
			selectblur(request,response);
		}
	}
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<List<Object>> listo = paydao.getAllType();
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			sb.append("<tr>");
			for(int i=0;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
			}
			sb.append("<td>");
			sb.append("<a href='delete.pay?payid="+lists.get(0)+"'>É¾³ý</a>&nbsp;&nbsp");
			
			sb.append("</tr>");
			
			
		}
		
		String strsb=new String(sb);
		response.getWriter().println(strsb);
		
	}
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("payid");
		int payid=-1;
		if(id!=null){
			payid=Integer.parseInt(id);
		}
		
		int i=paydao.delete(payid);
		/*PrintWriter out = response.getWriter();
		boolean flag=true;
		if(i==-1){
			flag = false;
		}
		String jsonStr = "{\"flag\":"+flag+"}";
		out.println(jsonStr);*/
		response.sendRedirect("pay.jsp");
		
	}
public void selectblur(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String selObject = request.getParameter("selObject");
		String search = request.getParameter("search");
		System.out.println(selObject+search);
		
		List<List<Object>> listo = paydao.getAllUser(selObject,search);
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			sb.append("<tr>");
			for(int i=0;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
			}
			sb.append("<td>");
			sb.append("<a href='delete.pay?payid="+lists.get(0)+"'>É¾³ý</a>&nbsp;&nbsp");
			
			sb.append("</tr>");
			
		}
		
		String strsb=new String(sb);
		response.getWriter().println(strsb);
	}
}
