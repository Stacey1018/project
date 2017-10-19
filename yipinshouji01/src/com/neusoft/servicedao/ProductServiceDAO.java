package com.neusoft.servicedao;

import java.util.List;

import com.neusoft.pojo.Protype;
import com.neusoft.pojo.Productinfo;

public interface  ProductServiceDAO {
	
	List<List<Object>> getAllUser(String name,String value);
	
	List<List<Object>> getAllType();
	int add(Productinfo product);
	int delete( int proid);
	 Productinfo getOneproduct(int proid) ;
    int modify(Productinfo product);
    List<List<Object>> selectOpro(int id);
}
