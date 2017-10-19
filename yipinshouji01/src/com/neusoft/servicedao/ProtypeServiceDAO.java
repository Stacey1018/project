package com.neusoft.servicedao;

import java.util.List;

import com.neusoft.pojo.Protype;

public interface ProtypeServiceDAO {
	/**
	 * ��ʾ���е���Ʒ������Ϣ
	 * @return
	 */
	List<List<Object>> getAllType();
	
	/**
	 * ���
	 */
	int add(Protype protype);
	
	
	/**
	 * ɾ����Ʒ����
	 * @return
	 */
	int delete( int typeid);
	
	/**
	 * ����id����һ����¼
	 * @param typeid
	 * @return
	 */
	Protype getOneProtype(int typeid);
	
	int modify(Protype proty);
}
