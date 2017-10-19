package com.neusoft.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.neusoft.servicedao.UserServiceDAO;
import com.neusoft.servicedaoimpl.UserServiceDAOImpl;

import net.sf.json.JSONObject;
@WebServlet("*.user")
public class UserServlet extends HttpServlet {
	private UserServiceDAO usdao = new UserServiceDAOImpl();
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1,uri.indexOf("."));
		if("list".equals(path)){
			list(request,response);
		}else if("deleteUser".equals(path)){
			deleteUser(request,response);
		}else if("selectblur".equals(path)){
			selectblur(request,response);
		}else if("login".equals(path)){
			login(request,response);
		}else if("reguser".equals(path)){
			reguser(request,response);
		}else if("adduser".equals(path)){
			adduser(request,response);
		}else if("ajaxpuser".equals(path)){
			ajaxpuser(request,response);
		}else if("updateUser".equals(path)){
			updateUser(request,response);
		}else if("userin".equals(path)){
			userin(request,response);
		}else if("updateUserpwd".equals(path)){
			updateUserpwd(request,response);
		}else if("aupdateUser".equals(path)){
			aupdateUser(request,response);
		}
		
	}
	
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<List<Object>> listo = usdao.getAllUser();
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			sb.append("<tr>");
			for(int i=0;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
			}
			sb.append("<td>");
			
			sb.append("<a data-toggle='modal' data-target='#myModal1' href='aupdateUser?id="+lists.get(0) +"'>修改</a>");
			sb.append("</tr>");
			
			
		}
		
		String strsb=new String(sb);
		response.getWriter().println(strsb);
	}
	
	public void selectblur(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selObject = request.getParameter("selObject");
		String search = request.getParameter("search");
		
		
		List<List<Object>> listo = usdao.getAllUser(selObject,search);
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			sb.append("<tr>");
			for(int i=0;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
			}
			sb.append("<td>");
			sb.append("<input type='hidden' name='id' value='"+lists.get(0)+"' >");
			sb.append("<a data-toggle='modal' data-target='#myModal' href=''>修改</a>");
			
			sb.append("</tr>");
			
		}
		
		String strsb=new String(sb);
		response.getWriter().println(strsb);
	}
	
	public void aupdateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*String userid = request.getParameter("id");
		
		int id = Integer.parseInt(userid);
		String baned = request.getParameter("baned");
		System.out.println(baned);
		boolean flag=true;
		if(baned.equals("true")){
			flag=true;
		}else{
			flag = false;
		}
		int i = usdao.aupdateUser( flag,id);
		if(i!=-1){
			response.sendRedirect("user.jsp");
			//重定向
			
			
		}else{
			PrintWriter out = response.getWriter();
		}
		*/
	}
	public void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		
		int id = Integer.parseInt(userid);
		int i = usdao.deleteUser(id);
		//在页面上输入
				PrintWriter out = response.getWriter();
		if(i!=-1){
			out.println("<h1>删除成功</h1>");
			//重定向
			
			
		}else{
			out.println("<h1>删除失败</h1>");
		}
		
	}
	public void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		
		int id = Integer.parseInt(userid);
		String sex = request.getParameter("sex");
		
		String phone = request.getParameter("phone");
		
		String address = request.getParameter("address");
		
		int i = usdao.updateUser(sex, phone, address, id);
		//在页面上输入
		
		
		if(i!=-1){
			response.sendRedirect("information.jsp");
			//重定向
			
			
		}else{
			PrintWriter out = response.getWriter();
		}
		
	}
	//登录匹配
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String userpwd = request.getParameter("userpwd");
		
		
		List<List<Object>> listo = usdao.finOUser(username, userpwd);
		HttpSession session = request.getSession();
		
		if(listo.size()<=0){
			response.sendRedirect("login.jsp");
		}else{
			session.setAttribute("userid",listo.get(0).get(0));
			session.setAttribute("username", listo.get(0).get(1));
			session.setAttribute("password", listo.get(0).get(2));
			session.setAttribute("sex", listo.get(0).get(3));
			session.setAttribute("phone", listo.get(0).get(4));
			session.setAttribute("address", listo.get(0).get(8));
			StringBuffer sb = new StringBuffer();
			
			sb.append("<input type='hidden' name='idlogin' value="+listo.get(0).get(0)+">");
			String strsb=new String(sb);
			response.getWriter().println(strsb);
			response.sendRedirect("home1.jsp");
		}
		
	
	}
	public void reguser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String,String[]> maps =  request.getParameterMap();
		for(Map.Entry<String, String[]> me:maps.entrySet()){
			/*System.out.println(me.getKey());*/
			String[] values = me.getValue();
			for(int i=0;values!=null && i<values.length;i++){
				/*System.out.println("  "+values[i]);*/
			}
		}
		
		
	}
	public void adduser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String userpwd = request.getParameter("userpwd");
		
		int i = usdao.userInsert(username, userpwd);
		PrintWriter out = response.getWriter();
		boolean flag = true;
		if(i!=-1){
			String jsonStr = "{\"flag\":"+flag+"}";
			out.println(jsonStr);
			response.sendRedirect("home1.jsp");
			
			//重定向
		}else{
			flag=false;
			String jsonStr = "{\"flag\":"+flag+"}";
			out.println(jsonStr);
		}

	}
	public void ajaxpuser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		
		List<List<Object>> listo = usdao.getAllUser();
		boolean flag = true;
		for (List<Object> list : listo) {
			if(list.get(1).equals(username)){
				flag=false;
				break;
			}
		}
		
		//{name:value,name:value}
		String jsonString = "{\"flag\":"+flag+"}";
		response.getWriter().write(jsonString);
	}
	public void userin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("id1");
		
		int id1 = Integer.parseInt(userid);
		
		List<List<Object>> listo = usdao.selectOUser(id1);
		int id=(int) listo.get(0).get(0);
		String name =(String) listo.get(0).get(1);
		String password = (String) listo.get(0).get(2);
		String sex = (String)listo.get(0).get(3);
		String phone = (String)listo.get(0).get(4);
		String address = (String)listo.get(0).get(5);
		
		
		String str = "{\"id2\":\""+id+"\",\"name2\":\""+name+"\",\"password2\":\""+password+"\",\"sex2\":\""+sex+"\",\"phone2\":\""+phone+"\",\"address2\":\""+address+"\"}";  
		
		/*String jsonStr="{\'id\':"+id+"}";*/
		
		
		JSONObject json = JSONObject.fromObject(str);
		
		response.getWriter().print(json);
		/*+"\"sex\":"+sex+ ","
		+"\"phone\":"+phone+ ","
		+"\"address\":"+address+*/
	}
	public void updateUserpwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("id1");
		int id1 = Integer.parseInt(userid);
		String password = request.getParameter("password1");
		int i = usdao.updateUserpwd(password, id1);
		
		boolean flag = true;
		if(i!=-1){
			String jsonStr = "{\"flag\":"+flag+"}";
			
			response.sendRedirect("password.jsp");
			HttpSession session = request.getSession();
			session.setAttribute("flag1", flag);
			
			//重定向
		}else{
			flag=false;
			
			
		}
	}
	public void findouser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("id");
		int id1 = Integer.parseInt(userid);
		StringBuffer sb = new StringBuffer();
		List<List<Object>> lists = null;
		lists= usdao.findOuser(id1);
		
		sb.append("<input type='hidden' value='"+lists.get(0).get(0)+"'>");
		String strsb=new String(sb);
		response.getWriter().println(strsb);
			
		
	}
	
	
}
