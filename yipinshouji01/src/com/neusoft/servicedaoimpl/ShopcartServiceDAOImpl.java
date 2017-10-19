package com.neusoft.servicedaoimpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.neusoft.servicedao.ShopcartServiceDAO;
import com.newsoft.dao.BaseDAO;
import com.newsoft.daoimpl.BaseDAOImpl;
import com.newsoft.squtil.SQLUtil;

public class ShopcartServiceDAOImpl implements ShopcartServiceDAO {
	private BaseDAO basedao = new BaseDAOImpl();
	@Override
	public List<List<Object>> getAllcar() {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from cart";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = basedao.select(con, sql, null);
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
	public int cartInsert(int userid, int proid,int pronum ) {
		
		Connection con = SQLUtil.getCon();
		String sql = "insert into cart(userid,proid,pronum)"+
				"value(?,?,?) ";
		int i=-1;
		try {
			 i= basedao.insert(con, sql, userid,proid,pronum);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public List<List<Object>> getCartinfo() {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "SELECT cart.userid userid,cart.proid proid,productinfo.imgpath path,productinfo.proname proname,productinfo.color color,cart.pronum pronum,productinfo.price price,productinfo.price*cart.pronum prosum from cart,productinfo WHERE cart.proid = productinfo.proid;";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = basedao.select(con, sql, null);
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
	//根据id获取商品信息
	@Override
	public List<List<Object>> getOneCartinfo(int proid) {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "SELECT cart.userid userid,cart.proid proid,productinfo.imgpath path,productinfo.proname proname,productinfo.color color,cart.pronum pronum,productinfo.price price,productinfo.price*cart.pronum prosum from cart,productinfo WHERE cart.proid = productinfo.proid and productinfo.proid = ?;";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = basedao.select(con, sql, proid);
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
		String sql ="delete from cart  where proid=?";
		int i=-1;
		try {
			i=basedao.delete(con, sql,proid );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public int num() {
		Connection con = SQLUtil.getCon();
		String sql ="select COUNT(*) from cart";
		int i=-1;
		try {
//			i=basedao.delete(con, sql);
			i=basedao.query(con, sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
		
	}
	

}
