package com.neusoft.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.neusoft.pojo.Protype;
import com.neusoft.pojo.Productinfo;
import com.neusoft.servicedao.ProductServiceDAO;
import com.neusoft.servicedaoimpl.ProductServiceDAOImpl;

import net.sf.json.JSONObject;
@WebServlet("*.duct")

@MultipartConfig
public class ProductServlet   extends HttpServlet{
	private ProductServiceDAO ductdao = new ProductServiceDAOImpl();
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
		}else if("selectblur".equals(path)){
			selectblur(request,response);
		}else if("list1".equals(path)){
			list1(request,response);
		}else if("productin".equals(path)){
			productin(request,response);
		}
	}
	private void updata(HttpServletRequest request, HttpServletResponse response) {
		String proname = request.getParameter("proname");
		String price = request.getParameter("price");
		String ramin = request.getParameter("ramin");
		String typeid = request.getParameter("typeid");
		int typeid1 =Integer.parseInt(typeid);
		String color = request.getParameter("color");
		String ram = request.getParameter("ram");
		String proid=request.getParameter("proid");
		
		Productinfo pro = new Productinfo();
		pro.setId(Integer.valueOf(proid));
		pro.setProname(proname);
	    pro.setPrice(Double.valueOf(price));
		pro.setRamin(Integer.valueOf(ramin));
		pro.setTypeid(typeid1);
		pro.setColor(color);
		pro.setRam(ram);
		
		int i = ductdao.modify(pro);
		
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
		
		
		List<List<Object>> listo = ductdao.getAllUser(selObject,search);
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			sb.append("<tr>");
			for(int i=0;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
			}
			sb.append("<td>");
			sb.append("<a href='delete.duct?proid="+lists.get(0)+"'>删除</a>&nbsp;&nbsp");
			sb.append("<a data-toggle='modal' data-target='#myModal3' href='###' onclick=\"updatefun("+lists.get(0)+")\">修改</a>");
			
			sb.append("</tr>");
			
		}
		
		String strsb=new String(sb);
		response.getWriter().println(strsb);
	}
	private void find(HttpServletRequest request, HttpServletResponse response) {
      String id = request.getParameter("id");
		
		int proid=-1;
		if(id!=null){
			proid=Integer.parseInt(id);
		}
		
		Productinfo prod = ductdao.getOneproduct(proid);
		
		StringBuffer sb = new StringBuffer();
		 
		 sb.append("<label>型号:</label>  <input name='proname1' type='text' value="+prod.getProname()+"> <br>") ;
		 sb.append(" <label>价格:</label>  <input name='price1' type='text' value="+prod.getPrice()+"> <br>") ;
		 sb.append("<label>剩余量:</label>  <input name='ramin1' type='text' value="+prod.getRamin()+"> <br>") ;
		 sb.append("<label>种类:</label>  <input name='type1' type='text' value="+prod.getTypeid()+"> <br>") ;
		 sb.append("<label>颜色:</label>  <input name='color1' type='text' value="+prod.getColor()+"> <br>") ;
		 sb.append("<label>内存:</label>  <input name='ram1' type='text' value="+prod.getRam()+"><br>") ;
		 sb.append("<input name='imgname1' type='file' multiple='multiple'>");
		 sb.append("<input type='hidden' name='path' id='path'>");
		 sb.append("<input name='proid' type='hidden' value="+prod.getId()+"> <br>") ;

		
		String strsb=new String(sb);
		
		try {
			response.getWriter().println(strsb);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<List<Object>> listo = ductdao.getAllType();
		StringBuffer sb = new StringBuffer();
		for(List<Object> lists:listo){
			sb.append("<tr>");
			for(int i=0;i<lists.size();i++){
				sb.append("<td>"+lists.get(i)+"</td>");
			}
			sb.append("<td>");
			sb.append("<a href='delete.duct?proid="+lists.get(0)+"'>删除</a>&nbsp;&nbsp");
			/*sb.append("<a data-toggle='modal' data-target='#myModal3' href='###' onclick=\"updatefun("+lists.get(0)+")\">修改</a>&nbsp;&nbsp");*/
			
			sb.append("</tr>");
		}
		
		String strsb=new String(sb);
		response.getWriter().println(strsb);
		
	}
	public void list1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<List<Object>> listo = ductdao.getAllType();
		
		StringBuffer sb = new StringBuffer();
	
			for (List<Object> list : listo) {
				
				String imgstr=(String) list.get(7);
				
				String imgs[]=imgstr.split(";");
				
				sb.append("<div class='litem'>");
				sb.append("<div class='pic'>");
				for(int k=0;k<imgs.length;k++){
					if(!"".equals(imgs[k])){
				          sb.append("<img src='../../upload/"+imgs[k].substring(0,imgs[k].length())+"'>");
					}
				}
				sb.append("</div>"); 
				sb.append("<div class='desc'>");
			    sb.append("<a href='20.jsp?proid="+list.get(0)+"'>查看详情");
			    sb.append("</a>"); 
			    sb.append("</div>");    
			    sb.append("</div>");  
			}
			
		    
		    String strsb=new String(sb);
			response.getWriter().println(strsb);
		
	}
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Collection<Part> parts = request.getParts();
		File file=null;
		File file1 = null;
		StringBuffer sb=new StringBuffer();
		for (Part part : parts) {
			
			String filename = part.getSubmittedFileName();
			
			if(filename==null){
				continue;
			}
			String ckname = filename.substring(filename.indexOf("."));
			
			if(".jpg|.png|.gif".indexOf(ckname)<0){
				return;
			}
			//图片保存路径 tomcat
			String path = getServletContext().getRealPath("/upload/");
			String path2="E:\\Program Files\\wokespace\\yipinshouji01\\WebContent\\upload\\";
			
			long mill = System.currentTimeMillis();
			
			
			String newfile = mill+ckname;
			sb.append(newfile);
			sb.append(";");
			String pathfile = path+newfile;
			String path2file=path2+newfile;
			 file = new File(pathfile);
			 File file2=new File(path2file);
			OutputStream os = new FileOutputStream(file);
			OutputStream os2=new FileOutputStream(file2);
			InputStream isp = part.getInputStream();
			byte[] b = new byte[1024];
			int length = 0;
			while((length=isp.read(b))!=-1){
				os.write(b, 0, length);
				os2.write(b,0,length);
			}
			os.flush();
			os2.flush();
			os.close();
			os2.close();
		
		}
		
		
		String filepath = new String(sb);
		String proname = request.getParameter("proname");
		String price = request.getParameter("price");
		String ramin = request.getParameter("ramin");
		String typeid = request.getParameter("typeid");
		String color = request.getParameter("color");
		String ram = request.getParameter("ram");
		
		
		Productinfo pro = new Productinfo();
		pro.setProname(proname);
	    pro.setPrice(Double.parseDouble(price));
		pro.setRamin(Integer.parseInt(ramin));
		pro.setTypeid(Integer.parseInt(typeid));
		pro.setColor(color);
		pro.setRam(ram);
		pro.setImgpath(filepath);
		int i = ductdao.add(pro);
		System.out.println(pro);
		PrintWriter out = response.getWriter();
		boolean flag=true;
		if(i==-1){
			flag = false;
		}else{
			response.sendRedirect("product.jsp");
		}
		
	}
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("proid");
		int proid=-1;
		if(id!=null){
			proid=Integer.parseInt(id);
		}
		
		int i=ductdao.delete(proid);
		/*PrintWriter out = response.getWriter();
		boolean flag=true;
		if(i==-1){
			flag = false;
		}
		String jsonStr = "{\"flag\":"+flag+"}";
		out.println(jsonStr);*/
		response.sendRedirect("product.jsp");
		
	}
	public void productin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String proid = request.getParameter("proid");
		
		int id1 = Integer.parseInt(proid);
		
		List<List<Object>> listo = ductdao.selectOpro(id1);
		int id=(int) listo.get(0).get(0);
		String proname =(String) listo.get(0).get(1);
		Double price = (Double) listo.get(0).get(2);
		int ramin = (int)listo.get(0).get(3);
		String color = (String)listo.get(0).get(5);
		String ram = (String)listo.get(0).get(6);
		String imgpath = (String)listo.get(0).get(7);
		
		
		String str = "{\"proname\":\""+proname+"\",\"price\":\""+price+"\",\"ramin\":\""+ramin+"\",\"color\":\""+color+"\",\"ram\":\""+ram+"\",\"imgpath\":\""+imgpath+"\"}";  
		JSONObject json = JSONObject.fromObject(str);
		
		response.getWriter().print(json);
		
	}
	
}
