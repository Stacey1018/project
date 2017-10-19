package com.neusoft.servicedaoimpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import com.neusoft.pojo.Orders;

import com.neusoft.servicedao.OrdersServiceDAO;

import com.newsoft.dao.BaseDAO;
import com.newsoft.daoimpl.BaseDAOImpl;
import com.newsoft.squtil.SQLUtil;

public class OrdersServiceDAOImpl implements OrdersServiceDAO{
	private BaseDAO odao = new BaseDAOImpl();
	@Override
	public List<List<Object>> getAllType() {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from orders";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = odao.select(con, sql, null);
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
	public int delete(int orderid) {
		Connection con = SQLUtil.getCon();
		String sql ="delete from orders where orderid=?";
		int i=-1;
		try {
			i=odao.insert(con, sql,orderid );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	
	@Override
	public Orders getOneorder(int id) {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from orders where orderid=?";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = odao.select(con, sql, id);
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
		Orders pro = new Orders();
	
		pro.setId((int) listo.get(0));
		pro.setSend((String) listo.get(7));
		
		return pro;
	}
	
	@Override
	public int modify(int orderid,int state) {
		Connection con = SQLUtil.getCon();
		String sql = "update orders set state=? where orderid=?";
		int i=-1;
		try {
			i=odao.update(con, sql, state,orderid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public int add(Timestamp ordertime,String proname,int num, double price, double totalprice, String transport, String buyname, int buyphone,
			String address, int state, int userid, int proid) {
		Connection con = SQLUtil.getCon();
		String sql = "insert into orders(ordertime,proname,num,price,totalprice,transport,buyname,buyphone,address,state,userid,proid)"+
				"value(?,?,?,?,?,?,?,?,?,?,?,?) ";
		int i=-1;
		try {
			 i= odao.insert(con, sql,ordertime,proname,num,price,totalprice,transport,buyname,buyphone,address,state,userid,proid);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return i;
	}
	
    
}

	  


