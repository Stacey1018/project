package com.neusoft.servicedao;

import java.sql.Timestamp;
import java.util.List;

import com.neusoft.pojo.Orders;



public interface  OrdersServiceDAO {
	List<List<Object>> getAllType();
	int delete( int orderid);
	int add(Timestamp ordertime,String proname,int num,double price,double totalprice ,
			String transport ,
			String buyname,
			int buyphone,
			String address,
			int state,
			int userid,
			int proid);
	 Orders getOneorder(int id) ;
	  int modify(int orderid,int state);
	 
	  
	  
	  
	  
	  
}
