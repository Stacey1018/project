package com.neusoft.servicedaoimpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import com.neusoft.pojo.Protype;
import com.neusoft.pojo.Productinfo;
import com.neusoft.servicedao.ProductServiceDAO;
import com.newsoft.dao.BaseDAO;
import com.newsoft.daoimpl.BaseDAOImpl;
import com.newsoft.squtil.SQLUtil;

public class ProductServiceDAOImpl implements ProductServiceDAO{
	
	private BaseDAO pdao = new BaseDAOImpl();
	@Override
	public List<List<Object>> getAllType() {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from productinfo";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = pdao.select(con, sql, null);
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		 
		return lists;
	}
	@Override
	public int delete(int proid) {
		Connection con = SQLUtil.getCon();
		String sql ="delete from productinfo where proid=?";
		int i=-1;
		try {
			i=pdao.insert(con, sql,proid );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public int add(Productinfo product) {
		Connection con = SQLUtil.getCon();
		String sql = "insert into productinfo(proname,price,ramin,typeid,color,ram,imgpath) values(?,?,?,?,?,?,?)";
		int i=-1;
		try {
			i=pdao.insert(con, sql, product.getProname(),product.getPrice(),product.getRamin(),product.getTypeid(),product.getColor(),product.getRam(),product.getImgpath());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public Productinfo getOneproduct(int proid) {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from productinfo where proid=?";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = pdao.select(con, sql, proid);
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		List<Object> listo = lists.get(0);
		Productinfo pro = new Productinfo();
		pro.setProname((String) listo.get(1));
	    pro.setPrice((Double) listo.get(2));
		pro.setRamin((int) listo.get(3));
		pro.setTypeid((int) listo.get(4));
		pro.setColor((String) listo.get(5));
		pro.setRam((String) listo.get(6));
		pro.setId((int) listo.get(0));
		
		return pro;
	}
	@Override
	public int modify(Productinfo product) {
		Connection con = SQLUtil.getCon();
		String sql = "update productinfo set proname=?,price=?,ramin=?,type=?,color=?,ram=? where proid=?";
		int i=-1;
		try {
			i=pdao.update(con, sql, product.getProname(),product.getPrice(),product.getRamin(),product.getTypeid(),product.getColor(),product.getRam(),product.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public List<List<Object>> getAllUser(String name, String value) {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from productinfo";
		String val = null;
		if(name!=null&&value!=null){
			//∂‘sql”Ôæ‰µƒÕÍ…∆
			if("proname".equals(name.trim())){
				sql+=" where proname like ?";
			}else if("type".equals(name.trim())){
				sql+=" where type like ?";
			}
			val="%"+value+"%";
		}
		
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			if(val==null){
				lists = pdao.select(con, sql, null);
			}else{
				lists = pdao.select(con, sql, val);
			}
			
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		 
		return lists;
	}
	@Override
	public List<List<Object>> selectOpro(int id) {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from productinfo where proid=?";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = pdao.select(con, sql, id);
			con.commit();
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		 
		return lists;
	}
}

	
		  


