package com.neusoft.servicedao;

import java.util.List;

import com.neusoft.pojo.Admin;
import com.neusoft.pojo.Productinfo;

public interface AdminServiceDAO {
	/**
	 * ��ʾ���е��û���Ϣ
	 * @return
	 */
	List<List<Object>> getAllUser();
	
	List<List<Object>> getAllUser(String name,String value);
	/**
	 * ɾ���û�
	 * @return
	 */
	int deleteUser( int adid);
	
	/**
	 * �޸��û�
	 */
	 int modify(Admin admin);
	/**
	 * ����û�
	 */
     int add(Admin a); 
     Admin getOne(int adid) ;
}
