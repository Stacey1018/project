package com.neusoft.servicedao;

import java.util.List;






public interface UserServiceDAO {
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
	int deleteUser( int userid);
	
	/**
	 * �޸��û�
	 */
	int updateUser(String sex,String phone,String address,int userid);
	int aupdateUser(int baned,int userid);
	/**
	 * �޸��û�����
	 * @param sex
	 * @param phone
	 * @param address
	 * @param userid
	 * @return
	 */
	
	int updateUserpwd(String password,int userid);
	
	/**
	 * �û�ƥ��
	 */

	List<List<Object>> finOUser(String username,String userpwd);
	
	int userInsert(String username,String userpwd);
	
	List<List<Object>> selectOUser(int id);
	List<List<Object>> findOuser(int id);
	
	
	
}
