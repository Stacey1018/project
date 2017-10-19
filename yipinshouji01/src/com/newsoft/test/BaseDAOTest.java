package com.newsoft.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.newsoft.daoimpl.BaseDAOImpl;
import com.newsoft.squtil.SQLUtil;

public class BaseDAOTest {
	public static void main(String[] args) throws SQLException {
		Connection con = SQLUtil.getCon();
		String sql = "delete from userinfo where userid=?";
		int id=1;
		int i=new BaseDAOImpl().delete(con, sql, id); 
		System.out.println(i);
	}
}
