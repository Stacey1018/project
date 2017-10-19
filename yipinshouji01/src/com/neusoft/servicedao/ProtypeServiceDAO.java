package com.neusoft.servicedao;

import java.util.List;

import com.neusoft.pojo.Protype;

public interface ProtypeServiceDAO {
	/**
	 * 显示所有的商品种类信息
	 * @return
	 */
	List<List<Object>> getAllType();
	
	/**
	 * 添加
	 */
	int add(Protype protype);
	
	
	/**
	 * 删除商品种类
	 * @return
	 */
	int delete( int typeid);
	
	/**
	 * 根据id查找一条记录
	 * @param typeid
	 * @return
	 */
	Protype getOneProtype(int typeid);
	
	int modify(Protype proty);
}
