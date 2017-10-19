package com.neusoft.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.servicedao.ShopcartServiceDAO;
import com.neusoft.servicedaoimpl.ShopcartServiceDAOImpl;
import com.neusoft.servicedaoimpl.UserServiceDAOImpl;

import net.sf.json.JSONObject;
@WebServlet("*.cart")
public class ShopcartServlet extends HttpServlet {
	
	private ShopcartServiceDAO cartdao = new ShopcartServiceDAOImpl();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1,uri.indexOf("."));
		if("list".equals(path)){
			list(request,response);
		}else if("addcart".equals(path)){
			addcart(request,response);
		}else if("list1".equals(path)){
			list1(request,response);
		}else if("delete".equals(path)){
			delete(request,response);
		}else if("pay".equals(path)){
			pay(request,response);
		}else if("findone".equals(path)){
			findone(request,response);
		}else if("num".equals(path)){
			num(request,response);
		}
		
	}
	public void list1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<List<Object>> listo = cartdao.getCartinfo();
		
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			sb.append("<tr>");
			sb.append("<td>");
			sb.append("<img src='../../upload/"+lists.get(2)+"'>");
			sb.append("</td>");
			for(int i=3;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
				/*System.out.println(lists.get(i));*/
			}
			sb.append("<td>");
			
			sb.append("<a href='delete.cart?proid="+lists.get(1) +"' >É¾³ý</a> &nbsp&nbsp<a href='pay.jsp?proid="+lists.get(1)+"' >ÏÂµ¥</a> ");
			sb.append("<input type='hidden' name='proid' value='"+lists.get(1)+"' >");
			
			sb.append("</td>");
			sb.append("</tr>");
			
		}
		
		String strsb=new String(sb);
		
		response.getWriter().println(strsb);		
	}
	public void findone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int proid = Integer.parseInt(request.getParameter("proid"));
		
		List<List<Object>> listo = cartdao.getOneCartinfo(proid);
		
		
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
		
			sb.append("<tr>");
			sb.append("<td>");
			sb.append("<img src='../../upload/"+lists.get(2)+"'>");
			sb.append("</td>");
			sb.append("<input type='hidden' id='num' value='"+lists.get(5)+"' >");
			sb.append("<input type='hidden' id='proname' value='"+lists.get(3)+"' >");
			sb.append("<input type='hidden' id='price' value='"+lists.get(6)+"' >");
			sb.append("<input type='hidden' id='totalprice' value='"+lists.get(7)+"' >");
			for(int i=3;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
				/*System.out.println(lists.get(i));*/
			}
			
			sb.append("</tr>");
			
		}
		
		
		String strsb=new String(sb);
		double totalprice = (double) listo.get(0).get(7);
		String jsonStr = "{\"strsb\":\""+strsb+"\",\"totalprice\":\""+totalprice+"\"}";
		JSONObject json = JSONObject.fromObject(jsonStr);
		response.getWriter().println(json);		
	}
	public void pay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("proid");
		int proid=-1;
		if(id!=null){
			proid=Integer.parseInt(id);
		}
		
		int i=cartdao.delete(proid);
		/*PrintWriter out = response.getWriter();
		boolean flag=true;
		if(i==-1){
			flag = false;
		}
		String jsonStr = "{\"flag\":"+flag+"}";
		out.println(jsonStr);*/
		response.sendRedirect("shopcart.jsp");
		
	}
	
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("proid");
		int proid=-1;
		if(id!=null){
			proid=Integer.parseInt(id);
		}
		
		int i=cartdao.delete(proid);
		/*PrintWriter out = response.getWriter();
		boolean flag=true;
		if(i==-1){
			flag = false;
		}
		String jsonStr = "{\"flag\":"+flag+"}";
		out.println(jsonStr);*/
		response.sendRedirect("shopcart.jsp");
		
	}
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<List<Object>> listo = cartdao.getAllcar();
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			sb.append("<tr>");
			for(int i=0;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
			}
			sb.append("<td>");
			
			sb.append("<a href=  >ÐÞ¸Ä</a>");
			sb.append("</tr>");
			
		}
		
		String strsb=new String(sb);
		response.getWriter().println(strsb);
	}
	public void addcart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		int proid = Integer.parseInt(request.getParameter("proid"));
		int pronum = Integer.parseInt(request.getParameter("pronum"));
		System.out.println(pronum);
		int i = cartdao.cartInsert(userid, proid, pronum);
		boolean flag = true;
		if(i!=-1){
			
			String jsonStr = "{\"flag\":"+flag+"}";
			response.getWriter().write(jsonStr);
		}else{
			flag=false;
			String jsonStr = "{\"flag\":"+flag+"}";
			response.getWriter().write(jsonStr);
		}
		
		
	}
	
	public void num(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i = cartdao.num();
	
		if(i!=-1){
			String jsonStr = "{\"num\":"+i+"}";
			response.getWriter().write(jsonStr);
			
		}
		
	}
	
	
	
	
	

}
