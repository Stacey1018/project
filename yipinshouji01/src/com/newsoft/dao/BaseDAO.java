package com.newsoft.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface BaseDAO {
	/**
	 * ����sql���Ĳ�ͬ ʵ��  ��ͬ����Ĳ���
	 * �ж��������� �� ����������� �����������Ĳ���
	 * @param con
	 * @param sql
	 * @param object
	 * @return
	 */
	//����
	List<List<Object>> select(Connection con,String sql,Object ...objects) throws SQLException;
	
	//ɾ��
	int delete(Connection con,String sql,Object ...objects) throws SQLException;
	
	int query(Connection con,String sql,Object ...objects) throws SQLException;
	
	/*int delete1(Connection con,String sql,Object ...objects) throws SQLException;*/
	//��
	int update(Connection con,String sql,Object ...objects) throws SQLException;
	
	//��
	int insert(Connection con,String sql,Object ...objects) throws SQLException;
	
	
	
	
	
	
	
	
	
} 
