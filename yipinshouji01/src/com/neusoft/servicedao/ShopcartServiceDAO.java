package com.neusoft.servicedao;

import java.util.List;

public interface ShopcartServiceDAO {
	/**
	 * 显示所有购物车内容
	 * @return
	 */
	
	List<List<Object>> getAllcar();
	List<List<Object>> getCartinfo();
	List<List<Object>> getOneCartinfo(int proid);
	
	
	
	/**
	 * 插入数据
	 */
	int cartInsert(int userid,int proid,int pronum);
	
	int delete(int proid);
	int num();
	
	
	
}
