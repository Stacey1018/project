package com.neusoft.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.pojo.Orders;

import com.neusoft.servicedao.OrdersServiceDAO;
import com.neusoft.servicedao.UserServiceDAO;
import com.neusoft.servicedaoimpl.OrdersServiceDAOImpl;
import com.neusoft.servicedaoimpl.UserServiceDAOImpl;



@WebServlet("*.order")
public class OrdersServlet   extends HttpServlet{
	private OrdersServiceDAO ordao = new OrdersServiceDAOImpl();
	private UserServiceDAO usdao = new UserServiceDAOImpl();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/")+1,uri.indexOf("."));
		if("list".equals(path)){
			list(request,response);
		}else if("delete".equals(path)){
			delete(request,response);
		}else if("find".equals(path)){
			find(request,response);
		}else if("add".equals(path)){
			add(request,response);
		}else if("setState".equals(path)){
			setState(request,response);
		}else if("list1".equals(path)){
			list1(request,response);
		}
	}
	
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<List<Object>> listo = ordao.getAllType();
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			String state = "已支付";
			int a = (int) (lists.get(10));
			if(a==0){
				state = "未支付";
			}
			
			sb.append("<div class='order-title'>");
				sb.append("<div class='dd-num'>订单编号：");
				sb.append("<a href='javascript:;'>"+lists.get(0)+"</a>");
				sb.append("</div>");
				sb.append("<span>成交时间："+lists.get(1)+"</span>");
				sb.append("<span class='add'>收货地址："+lists.get(9)+"</span>");
			sb.append("</div>");
			sb.append("<div class='order-con'>");
				sb.append("<div class='order-top'>");
					//商品名
					sb.append("<div class='th th-item'>");
						sb.append("<td class='td-proname'>"+lists.get(2)+"</td>");
					sb.append("</div>");
					//价格
					sb.append("<div class='th th-price'>");
						sb.append("<td class='td-inner'>"+lists.get(4)+"</td>");
					sb.append("</div>");
					//数量
					sb.append("<div class='th th-number'>");
						sb.append("<td class='td-inner'>"+lists.get(3)+"</td>");
					sb.append("</div>");
					//金额
					sb.append("<div class='th th-amount'>");
						sb.append("<td class='td-inner'>"+lists.get(5)+"</td>");
					sb.append("</div>");
					//收货人姓名
					sb.append("<div class='th th-status'>");
						sb.append("<td class='td-inner'>"+lists.get(7)+"</td>");
					sb.append("</div>");
					//联系方式
					sb.append("<div class='th th-status'>");
						sb.append("<td class='td-inner'>"+lists.get(8)+"</td>");
					sb.append("</div>");
					//物流方式
					sb.append("<div class='th th-status'>");
						sb.append("<td class='td-inner'>"+lists.get(6)+"</td>");
					sb.append("</div>");
					//交易状态
					sb.append("<div class='th th-status'>");
						sb.append("<td class='td-inner'>"+state+"</td>");
					sb.append("</div>");
					//操作
					sb.append("<div class='th th-change'>");
					sb.append("<a href='delete.order?orderid="+lists.get(0) +"'>删除</a>  <a href='../home/success.jsp?orderid="+lists.get(0) +"'>支付</a>");
					sb.append("</div>");
				sb.append("</div>");
			sb.append("</div>");
			
			
		}
		
		String strsb=new String(sb);
		response.getWriter().println(strsb);
		
	}
	
	public void list1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<List<Object>> listo = ordao.getAllType();
		StringBuffer sb = new StringBuffer();
	
			for(List<Object> lists:listo){
				String state = "已支付";
				int a = (int) (lists.get(10));
				if(a==0){
					state = "未支付";
				}
				sb.append("<tr>");
				for(int i=0;i<lists.size();i++){
					sb.append("<td>"+lists.get(i)+"</td>");
					/*System.out.println(lists.get(i));*/
				}
				sb.append("<td>");
				
				sb.append("<a href='delete.order?orderid="+lists.get(0) +"'>删除</a>");
				sb.append("<input type='hidden' name='proid' value='"+lists.get(1)+"' >");
				
				sb.append("</td>");
				sb.append("</tr>");
				
			}
			
			String strsb=new String(sb);
			
			response.getWriter().println(strsb);	
		
	}
	
	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int userid = Integer.parseInt(request.getParameter("userid"));
		Timestamp ordertime = new Timestamp(System.currentTimeMillis());
		int num = Integer.parseInt(request.getParameter("num"));
		double price = Double.valueOf(request.getParameter("price"));
		double totalprice = Double.valueOf(request.getParameter("totalprice"));
		int proid = Integer.parseInt(request.getParameter("proid"));
		String address = request.getParameter("address");
		String buyname = request.getParameter("buyname");
		int buyphone =Integer.parseInt(request.getParameter("buyphone"));
		String transport = request.getParameter("transport");
		String proname = request.getParameter("proname");
		int state = 0;
		int i = ordao.add(ordertime,proname,num,price,totalprice,transport,buyname,buyphone,address,state,userid,proid);
		boolean flag = true;
		PrintWriter out = response.getWriter();
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
		response.setHeader("Access-Control-Max-Age", "3600"); 
		if(i!=-1){
			System.out.println(i);
			String jsonStr = "{\"flag\":"+flag+"}";
			System.out.println(jsonStr);
			response.getWriter().println(jsonStr);
		}else{
			
		}
	
	}
	
	private void setState(HttpServletRequest request, HttpServletResponse response) {
	      int id = Integer.parseInt(request.getParameter("orderid"));
	      int state = Integer.parseInt(request.getParameter("state"));
	     
	      int i = ordao.modify(id, state);
	      boolean flag = true;
	  	  if(i!=-1){
		
			try {
				response.getWriter().println(flag);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	  	  }else{
			
		}
	}
	
	private void find(HttpServletRequest request, HttpServletResponse response) {
	      String id = request.getParameter("id");
			
			int orderid=-1;
			
			if(id!=null){
				orderid=Integer.parseInt(id);
			}
			
			 Orders   prod = ordao.getOneorder(orderid);
			
			 StringBuffer sb = new StringBuffer();
			 
			 sb.append("<label>地址：</label>  <input name='send' type='text' value="+prod.getSend()+"> <br>") ;
			
			 sb.append("  <input name='orderid' type='hidden' value="+prod.getId()+"> <br>") ;
		    
			
			String strsb=new String(sb);
			System.out.println(strsb);
			try {
				response.getWriter().println(strsb);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
		}
	/*private void updata(HttpServletRequest request, HttpServletResponse response) {
		String send = request.getParameter("send");
		
		String id=request.getParameter("orderid");
		
		
		
		Orders pro = new Orders();
		pro.setId(Integer.valueOf(id));
	    pro.setSend(send);
	   

		System.out.println("updata"+pro);
		int i = ordao.modify(pro);
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
	*/
	/*public void selectblur(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String selObject = request.getParameter("selObject");
		String search = request.getParameter("search");
		
		
		List<List<Object>> listo = ordao.getAllUser(selObject,search);
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			sb.append("<tr>");
			for(int i=0;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
			}
			sb.append("<td>");
			sb.append("<a href='delete.order?orderid="+lists.get(0)+"'>删除</a>&nbsp;&nbsp");
			sb.append("<a data-toggle='modal' data-target='#myModal3' href='###' onclick=\"updatefun("+lists.get(0)+")\">修改</a>");
			
			sb.append("</tr>");
			
		}
		
		String strsb=new String(sb);
		response.getWriter().println(strsb);
	}*/
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("orderid");
		int orderid=-1;
		if(id!=null){
			orderid=Integer.parseInt(id);
		}
		
		int i=ordao.delete(orderid);
		/*PrintWriter out = response.getWriter();
		boolean flag=true;
		if(i==-1){
			flag = false;
		}
		String jsonStr = "{\"flag\":"+flag+"}";
		out.println(jsonStr);*/
		response.sendRedirect("order.jsp");
		
	}
	
}
