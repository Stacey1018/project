package com.neusoft.servicedao;

import java.util.List;






public interface UserServiceDAO {
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
	int deleteUser( int userid);
	
	/**
	 * 修改用户
	 */
	int updateUser(String sex,String phone,String address,int userid);
	int aupdateUser(int baned,int userid);
	/**
	 * 修改用户密码
	 * @param sex
	 * @param phone
	 * @param address
	 * @param userid
	 * @return
	 */
	
	int updateUserpwd(String password,int userid);
	
	/**
	 * 用户匹配
	 */

	List<List<Object>> finOUser(String username,String userpwd);
	
	int userInsert(String username,String userpwd);
	
	List<List<Object>> selectOUser(int id);
	List<List<Object>> findOuser(int id);
	
	
	
}
