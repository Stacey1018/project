package com.neusoft.servicedaoimpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import com.neusoft.servicedao.UserServiceDAO;
import com.newsoft.dao.BaseDAO;
import com.newsoft.daoimpl.BaseDAOImpl;
import com.newsoft.squtil.SQLUtil;

public class UserServiceDAOImpl implements UserServiceDAO {
	private BaseDAO basedao = new BaseDAOImpl();
	@Override
	public List<List<Object>> getAllUser() {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from userinfo";
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
	public int deleteUser(int userid) {
		Connection con = SQLUtil.getCon();
		String sql = "delete from userinfo where userid=?";
		int i=-1;
		try {
			 i= basedao.delete(con, sql, userid);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public int updateUser(String sex,String phone,String address,int userid) {
		
		Connection con = SQLUtil.getCon();
		String sql = "update userinfo userinfo set sex=?,phone=?,address=? where userid=?";
		int i=-1;
		try {
			 i= basedao.delete(con, sql, sex,phone,address,userid);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public List<List<Object>> getAllUser(String name, String value) {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from userinfo";
		String val = null;
		if(name!=null&&value!=null){
			//∂‘sql”Ôæ‰µƒÕÍ…∆
			if("username".equals(name.trim())){
				sql+=" where username like ?";
			}else if(" address".equals(name.trim())){
				sql+=" where address like ?";
			}else if("userid".equals(name.trim())){
				sql+=" where userid=?";
			}
			val="%"+value+"%";
		}
		
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			if(val==null){
				lists = basedao.select(con, sql, null);
			}else{
				lists = basedao.select(con, sql, val);
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
	public List<List<Object>> finOUser(String username, String userpwd) {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from userinfo where username=? and userpwd=?";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = basedao.select(con, sql, username,userpwd);
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
	public int userInsert(String username,String userpwd) {
		Connection con = SQLUtil.getCon();
		String sql = "insert into userinfo(username,userpwd)"+
				"value(?,?) ";
		int i=-1;
		try {
			 i= basedao.delete(con, sql, username,userpwd);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public List<List<Object>> selectOUser(int id) {
		Connection con = null;
		con = SQLUtil.getCon();
		String sql = "select * from userinfo where userid=?";
		List<List<Object>> lists = null;
		try {
			con.setAutoCommit(false);
			lists = basedao.select(con, sql, id);
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
	public int updateUserpwd(String password, int userid) {
		Connection con = SQLUtil.getCon();
		String sql = "update userinfo userinfo set userpwd=? where userid=?";
		int i=-1;
		try {
			 i= basedao.update(con, sql, password,userid);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public int aupdateUser(int baned, int userid) {
		Connection con = SQLUtil.getCon();
		String sql = "update userinfo userinfo set baned=? where userid=?";
		int i=-1;
		try {
			 i= basedao.update(con, sql, baned,userid);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public List<List<Object>>  findOuser(int id) {
		Connection con = SQLUtil.getCon();
		List<List<Object>> lists = null;
		String sql = "selsect * from userin userid=?";
		
		try {
			 lists= basedao.select(con, sql, id);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return lists;
	}

}
