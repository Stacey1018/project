package com.neusoft.servicedaoimpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.xml.ws.Response;

import com.neusoft.pojo.Admin;

import com.neusoft.servicedao.AdminServiceDAO;

import com.newsoft.dao.BaseDAO;
import com.newsoft.daoimpl.BaseDAOImpl;
import com.newsoft.squtil.SQLUtil;

public class AdminServiceDAOImpl implements AdminServiceDAO {
	private BaseDAO  pdao = new BaseDAOImpl();

	@Override
	public List<List<Object>> getAllUser() {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from admin";
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
	public List<List<Object>> getAllUser(String name, String value) {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from admin";
		String val = null;
		if(name!=null&&value!=null){
			//∂‘sql”Ôæ‰µƒÕÍ…∆
			if("adname".equals(name.trim())){
				sql+=" where adname like ?";
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
	public int deleteUser(int adid) {
		Connection con = SQLUtil.getCon();
		String sql ="delete from admin where adid=?";
		int i=-1;
		try {
			i=pdao.insert(con, sql,adid );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	

	@Override
	public int modify(Admin admin) {
		Connection con = SQLUtil.getCon();
		String sql = "update admin set adname=?,adpwd=? where adid=?";
		int i=-1;
		try {
			i=pdao.update(con, sql,admin.getName(),admin.getPwd(),admin.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	

	@Override
	public int add(Admin a) {
		Connection con = SQLUtil.getCon();
		String sql = "insert into admin(adname,adpwd,permission) values(?,?,?)";
		int i=-1;
		try {
			i=pdao.insert(con, sql, a.getName(),a.getPwd(),a.getPermission());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public Admin getOne(int adid) {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from admin where adid=?";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = pdao.select(con, sql, adid);
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
		Admin pro = new Admin();
		pro.setId((int) listo.get(0) );
        pro.setName((String) listo.get(1));
        pro.setPwd((String) listo.get(2));
        pro.setPermission((boolean) listo.get(3));
		
		
		return pro;
	}
	}
	
	

	


