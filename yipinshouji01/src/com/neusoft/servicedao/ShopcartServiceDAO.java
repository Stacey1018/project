package com.neusoft.servicedao;

import java.util.List;

public interface ShopcartServiceDAO {
	/**
	 * ��ʾ���й��ﳵ����
	 * @return
	 */
	
	List<List<Object>> getAllcar();
	List<List<Object>> getCartinfo();
	List<List<Object>> getOneCartinfo(int proid);
	
	
	
	/**
	 * ��������
	 */
	int cartInsert(int userid,int proid,int pronum);
	
	int delete(int proid);
	int num();
	
	
	
}
