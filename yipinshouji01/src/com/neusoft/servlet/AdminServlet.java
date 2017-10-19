package com.neusoft.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.pojo.Admin;
import com.neusoft.servicedao.AdminServiceDAO;
import com.neusoft.servicedaoimpl.AdminServiceDAOImpl;




@WebServlet("*.admin")
public class AdminServlet   extends HttpServlet{
	private AdminServiceDAO ductdao = new AdminServiceDAOImpl();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1,uri.indexOf("."));
		if("list".equals(path)){
			list(request,response);
		}else if("delete".equals(path)){
			delete(request,response);
		}else if("add".equals(path)){
			add(request,response);
		}
		else if("find".equals(path)){
			find(request,response);
		}
		else if("updata".equals(path)){
			updata(request,response);
			}else if("selectblur".equals(path)) {
				selectblur(request,response);
			}else if("selectUser".equals(path)){
				selectUser(request,response);}
			}
	   
	private void updata(HttpServletRequest request, HttpServletResponse response) {
		String adname = request.getParameter("adname");
		String adpwd = request.getParameter("adpwd");
		String adid=request.getParameter("adid");
		
		Admin pro = new Admin();
		pro.setId(Integer.valueOf(adid));
		pro.setName(adname);
	    
		pro.setPwd(adpwd);
		
		
		System.out.println("updata"+pro);
		int i = ductdao.modify(pro);
		System.out.println(pro);
		try {
			PrintWriter out = response.getWriter();
			boolean flag=true;
			if(i==-1){
				flag = false;
			}
			String jsonStr = "{\"flag\":"+flag+"}";
			out.println(jsonStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	
		
		
	}
public void selectblur(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String selObject = request.getParameter("selObject");
		String search = request.getParameter("search");
		System.out.println(selObject+search);
		
		List<List<Object>> listo = ductdao.getAllUser(selObject,search);
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			sb.append("<tr>");
			for(int i=0;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
			}
			sb.append("<td>");
			sb.append("<a href='delete.admin?adid="+lists.get(0)+"'>删除</a>&nbsp;&nbsp");
			sb.append("<a data-toggle='modal' data-target='#myModal3' href='###' onclick=\"updatefun("+lists.get(0)+")\">修改</a>");
			
			sb.append("</tr>");
			
		}
		
		String strsb=new String(sb);
		response.getWriter().println(strsb);
	}
	private void find(HttpServletRequest request, HttpServletResponse response) {
      String id = request.getParameter("id");
		
		int adid=-1;
		if(id!=null){
			adid=Integer.parseInt(id);
		}
		
		Admin prod = ductdao.getOne(adid);
		
		StringBuffer sb = new StringBuffer();
		 
		 sb.append("<label>管理员帐号:</label>  <input name='adname1' type='text' value="+prod.getName()+"><br>") ;
		 sb.append(" <label>密码:</label>  <input name='adpwd1' type='text' value="+prod.getPwd()+"><br>") ;
		 sb.append("<label></label>  <input name='adid' type='hidden' value="+prod.getId()+"><br>") ;
     	 
		
		String strsb=new String(sb);
		System.out.println(strsb);
		try {
			response.getWriter().println(strsb);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<List<Object>> listo = ductdao.getAllUser();
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			sb.append("<tr>");
			for(int i=0;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
			}
			sb.append("<td>");
			sb.append("<a href='delete.admin?adid="+lists.get(0)+"'>删除</a>&nbsp;&nbsp");
			sb.append("<a data-toggle='modal' data-target='#myModal3' href='###' onclick=\"updatefun("+lists.get(0)+")\">修改</a>");
			sb.append("</tr>");
			
			
		}
		
		String strsb=new String(sb);
		response.getWriter().println(strsb);
		
	}
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adname = request.getParameter("adname");
		String adpwd = request.getParameter("adpwd");
		String permission = request.getParameter("permission");
	
		
		Admin pro = new Admin();
		pro.setName(adname);
		pro.setPwd(adpwd);
		pro.setPermission(Boolean.valueOf(permission));
		int i = ductdao.add(pro);
		System.out.println(pro);
		PrintWriter out = response.getWriter();
		boolean flag=true;
		if(i==-1){
			flag = false;
		}
		String jsonStr = "{\"flag\":"+flag+"}";
		out.println(jsonStr);
	
		
	}
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("adid");
		int adid=-1;
		if(id!=null){
			adid=Integer.parseInt(id);
		}
		
		int i=ductdao.deleteUser(adid);
		/*PrintWriter out = response.getWriter();
		boolean flag=true;
		if(i==-1){
			flag = false;
		}
		String jsonStr = "{\"flag\":"+flag+"}";
		out.println(jsonStr);*/
		response.sendRedirect("admin.jsp");
		
	}
	public void selectUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("selectUser()");
		//接收用户名和密码
		String adname=request.getParameter("adname");
		String adpwd=request.getParameter("adpwd");
		AdminServiceDAOImpl adminServiceDao=new AdminServiceDAOImpl();
		List<List<Object>> admin=adminServiceDao.getAllUser();
		for(int i=0;i<admin.size();i++) {
			System.out.println(admin.get(i));
			if(adname.equals(admin.get(i).get(1))&adpwd.equals(admin.get(i).get(2))) {
				//需要跳转的页面
				if((boolean) admin.get(i).get(3)){
					response.sendRedirect("admin.jsp");
				}else{				
					response.sendRedirect("user.jsp");
}
				
//				StringBuffer sb = new StringBuffer();
//				sb.append("<li role='presentation'><a href='user.jsp' >登录</li>");
			}
				
		}
	}
}
