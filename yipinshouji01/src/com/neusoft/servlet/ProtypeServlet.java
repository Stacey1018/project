package com.neusoft.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.pojo.Protype;
import com.neusoft.servicedao.ProtypeServiceDAO;
import com.neusoft.servicedao.UserServiceDAO;
import com.neusoft.servicedaoimpl.ProtypeServiceDAOImpl;
import com.neusoft.servicedaoimpl.UserServiceDAOImpl;
@WebServlet("*.type")
public class ProtypeServlet extends HttpServlet {
	private ProtypeServiceDAO typedao = new ProtypeServiceDAOImpl();
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1,uri.indexOf("."));
		if("list".equals(path)){
			list(request,response);
		}else if("add".equals(path)){
			add(request,response);
		}else if("delete".equals(path)){
			delete(request,response);
		}else if("find".equals(path)){
			find(request,response);
		}else if("update".equals(path)){
			update(request,response);
		}
		
	}
	
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<List<Object>> listo = typedao.getAllType();
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			sb.append("<tr>");
			for(int i=0;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
			}
			sb.append("<td>");
			sb.append("<a href='delete.type?typeid="+lists.get(0)+"'>删除</a>&nbsp;&nbsp");
			sb.append("<a data-toggle='modal' data-target='#myModal3' href='###' onclick=\"updatefun("+lists.get(0)+")\">修改</a>");
			sb.append("</tr>");
			
			
		}
		
		String strsb=new String(sb);
		response.getWriter().println(strsb);
		
	}
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String protype = request.getParameter("protype");
		String leafnode = request.getParameter("leafnode");
		String fathernode = request.getParameter("fathernode");
		
		Protype type = new Protype();
		type.setType(protype);
		type.setLeafnode(Integer.parseInt(leafnode));
		type.setFathernode(Integer.parseInt(fathernode));
		System.out.println(type);
		int i = typedao.add(type);
		
		boolean flag=true;
		if(i==-1){
			flag = false;
			response.sendRedirect("protype.jsp");
		}else{
			response.sendRedirect("protype.jsp");
		}
	
		
	}
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("typeid");
		int typeid=-1;
		if(id!=null){
			typeid=Integer.parseInt(id);
		}
		
		int i=typedao.delete(typeid);
		/*PrintWriter out = response.getWriter();
		boolean flag=true;
		if(i==-1){
			flag = false;
		}
		String jsonStr = "{\"flag\":"+flag+"}";
		out.println(jsonStr);*/
		response.sendRedirect("protype.jsp");
		
	}
	public void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		int typeid=-1;
		if(id!=null){
			typeid=Integer.parseInt(id);
		}
		
		Protype type = typedao.getOneProtype(typeid);
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("<input type='text' name='protype1' value="+type.getType()+"><br>");
		sb.append("<lable>是否有叶子节点</lable>");
		sb.append("<input type='radio' name='leafnode1' value='1'>是");
		sb.append("<input type='radio' name='leafnode1' value='0'>否<br>");
		sb.append("<lable>是否有父亲节点</lable>");
		sb.append("<input type='radio' name='fathernode1' value='1'>是");
		sb.append("<input type='radio' name='fathernode1' value='0'>否<br>");
		sb.append("<input type='hidden' name='typeid1' value="+type.getId()+">");
		String strsb=new String(sb);
		response.getWriter().println(strsb);
		
	}
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String protype = request.getParameter("protype1");
		String leafnode = request.getParameter("leafnode1");
		String fathernode = request.getParameter("fathernode1");
		String id = request.getParameter("typeid1");
		int typeid=-1;
		if(id!=null){
			typeid=Integer.parseInt(id);
		}
		Protype type = new Protype();
		type.setType(protype);
		type.setLeafnode(Integer.parseInt(leafnode));
		type.setFathernode(Integer.parseInt(fathernode));
		type.setId(typeid);
		int i = typedao.modify(type);
		PrintWriter out = response.getWriter();
		boolean flag=true;
		if(i==-1){
			flag = false;
		}
		String jsonStr = "{\"flag\":"+flag+"}";
		out.println(jsonStr);
		
	}
	
}
