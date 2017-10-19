package com.neusoft.servicedao;

import java.util.List;

public interface  PayServiceDAO {
	
	
	List<List<Object>> getAllType();
	int delete( int payid);
	List<List<Object>> getAllUser(String name,String value);
}
