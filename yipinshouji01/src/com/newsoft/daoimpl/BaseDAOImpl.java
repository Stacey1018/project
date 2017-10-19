package com.newsoft.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.newsoft.dao.BaseDAO;

public class BaseDAOImpl implements BaseDAO{

	@Override
	public List<List<Object>> select(Connection con, String sql, Object... objects) throws SQLException {
		PreparedStatement pstm = null;
		
		ResultSet rs = null; 
		
		pstm = con.prepareStatement(sql);
		if(objects!=null&&objects.length>0){
			for(int i=0;i<objects.length;i++){
				pstm.setObject(i+1, objects[i]);
			}
		}
		rs=pstm.executeQuery();
		List<List<Object>> listo = new ArrayList<>();
		
		//求表中字段个数
		ResultSetMetaData rsmd =  rs.getMetaData();
		int columns = rsmd.getColumnCount();
		while(rs.next()){ 
			List<Object> ol = new ArrayList<>();
			for(int i=0;i<columns;i++){
				ol.add(rs.getObject(i+1));
			}
			listo.add(ol);
		}
		
		
		
		return listo;
	}

	@Override
	public int delete(Connection con, String sql, Object... objects) throws SQLException {
		PreparedStatement pstm = null;
		pstm = con.prepareStatement(sql);
		if(objects!=null&&objects.length>0){
			for(int i=0;i<objects.length;i++){
				pstm.setObject(i+1, objects[i]);
			}
		}
		int i = -1;
		i = pstm.executeUpdate();
//		i = pstm.executeQuery();
		return i;
	}
	
	public int query(Connection con, String sql, Object... objects) throws SQLException {
		PreparedStatement pstm = null;
		pstm = con.prepareStatement(sql);
		if(objects!=null&&objects.length>0){
			for(int i=0;i<objects.length;i++){
				pstm.setObject(i+1, objects[i]);
			}
		}
		int i = -1;
		ResultSet rs = pstm.executeQuery();
		rs.last();
		return rs.getInt(1);
	}
	
	/*public int delete1(Connection con, String sql, Object... objects) throws SQLException {
		PreparedStatement pstm = null;
		pstm = con.prepareStatement(sql);
		if(objects!=null&&objects.length>0){
			for(int i=0;i<objects.length;i++){
				pstm.setObject(i+1, objects[i]);
			}
		}
		ResultSet i;
		i = pstm.executeQuery();
		int a = i.getInt(0);
		return a;
	}*/

	@Override
	public int update(Connection con, String sql, Object... objects) throws SQLException {
		
		return delete(con,sql,objects);
	}

	@Override
	public int insert(Connection con, String sql, Object... objects) throws SQLException{
		
		return delete(con,sql,objects);
	}

}
