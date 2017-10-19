package com.neusoft.servicedaoimpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.neusoft.pojo.Protype;
import com.neusoft.servicedao.ProtypeServiceDAO;
import com.newsoft.dao.BaseDAO;
import com.newsoft.daoimpl.BaseDAOImpl;
import com.newsoft.squtil.SQLUtil;

public class ProtypeServiceDAOImpl implements ProtypeServiceDAO {
	private BaseDAO bdao = new BaseDAOImpl();
	@Override
	public List<List<Object>> getAllType() {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from protype";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = bdao.select(con, sql, null);
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
	public int add(Protype proty) {
		Connection con = SQLUtil.getCon();
		String sql = "insert into protype(type,leafnode,fathernode) values(?,?,?)";
		int i=-1;
		try {
			i=bdao.insert(con, sql, proty.getType(),proty.getLeafnode(),proty.getFathernode());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public int delete(int typeid) {
		Connection con = SQLUtil.getCon();
		String sql ="delete from protype where typeid=?";
		int i=-1;
		try {
			i=bdao.insert(con, sql, typeid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public Protype getOneProtype(int typeid) {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from protype where typeid=?";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = bdao.select(con, sql, typeid);
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
		 Protype type = new Protype();
		List<Object> listo = lists.get(0);
		type.setId((int)listo.get(0));
		type.setType((String)listo.get(1));
		type.setLeafnode((int)listo.get(2));
		type.setFathernode((int)listo.get(3));
		
		return type;
	}

	@Override
	public int modify(Protype proty) {
		Connection con = SQLUtil.getCon();
		String sql = "update protype protype set type=?,leafnode=?,fathernode=? where typeid=?";
		int i=-1;
		try {
			i=bdao.update(con, sql, proty.getType(),proty.getLeafnode(),proty.getFathernode(),proty.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
		
	}

//	@Override
//	public Protype getOneProtype(int typeid) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
