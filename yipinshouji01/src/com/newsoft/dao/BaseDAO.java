package com.newsoft.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface BaseDAO {
	/**
	 * 根据sql语句的不同 实现  不同对象的查找
	 * 有多个对象查找 ， 单个对象查找 即：有条件的查找
	 * @param con
	 * @param sql
	 * @param object
	 * @return
	 */
	//查找
	List<List<Object>> select(Connection con,String sql,Object ...objects) throws SQLException;
	
	//删除
	int delete(Connection con,String sql,Object ...objects) throws SQLException;
	
	int query(Connection con,String sql,Object ...objects) throws SQLException;
	
	/*int delete1(Connection con,String sql,Object ...objects) throws SQLException;*/
	//改
	int update(Connection con,String sql,Object ...objects) throws SQLException;
	
	//插
	int insert(Connection con,String sql,Object ...objects) throws SQLException;
	
	
	
	
	
	
	
	
	
} 
