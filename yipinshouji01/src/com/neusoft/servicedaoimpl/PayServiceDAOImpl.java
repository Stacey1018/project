package com.neusoft.servicedaoimpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.neusoft.servicedao.PayServiceDAO;
import com.newsoft.dao.BaseDAO;
import com.newsoft.daoimpl.BaseDAOImpl;
import com.newsoft.squtil.SQLUtil;

public class PayServiceDAOImpl implements PayServiceDAO{
	private BaseDAO padao = new BaseDAOImpl();
	@Override
	public List<List<Object>> getAllType() {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from pay";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = padao.select(con, sql, null);
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
	public int delete(int payid) {
		Connection con = SQLUtil.getCon();
		String sql ="delete from pay where payid=?";
		int i=-1;
		try {
			i=padao.insert(con, sql,payid );
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
		String sql = "select * from pay";
		String val = null;
		if(name!=null&&value!=null){
			//∂‘sql”Ôæ‰µƒÕÍ…∆
			if("payway".equals(name.trim())){
				sql+=" where payway like ?";
			}else if("orderid".equals(name.trim())){
				sql+=" where orderid like ?";
			}
			val="%"+value+"%";
		}
		
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			if(val==null){
				lists = padao.select(con, sql, null);
			}else{
				lists = padao.select(con, sql, val);
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
	}
	

		  


