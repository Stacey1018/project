package com.neusoft.servicedao;

import java.util.List;

import com.neusoft.pojo.Admin;
import com.neusoft.pojo.Productinfo;

public interface AdminServiceDAO {
	/**
	 * 显示所有的用户信息
	 * @return
	 */
	List<List<Object>> getAllUser();
	
	List<List<Object>> getAllUser(String name,String value);
	/**
	 * 删除用户
	 * @return
	 */
	int deleteUser( int adid);
	
	/**
	 * 修改用户
	 */
	 int modify(Admin admin);
	/**
	 * 添加用户
	 */
     int add(Admin a); 
     Admin getOne(int adid) ;
}
