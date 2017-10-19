package com.newsoft.squtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;




public class SQLUtil {
	private static final String URL="jdbc:mysql://localhost:3306/yipindatabase";
	private static final String USER="root";
	private static final String PASSWORD="123456";
	
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Connection getCon(){
		try {
			return DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static void close(Object ...objects){
		if(objects!=null && objects.length>0){
			try{
				for(int i=0;i<objects.length;i++){//判断第一个参数的对象是否是第二个参数累的对象
					if(objects[i] instanceof Connection){
						((Connection)objects[i]).close();//强制转换
					}
					if(objects[i] instanceof Statement){
						((Statement)objects[i]).close();//强制转换
					}
					if(objects[i] instanceof ResultSet){
						((ResultSet)objects[i]).close();//强制转换
					}
					
				}
				
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
//		for(Userinfo userinfo:listsu){
//			System.out.println(userinfo);
//		}
//		
		
		
	}
//	public static void main(String[] args) {
//		System.out.println(getCon());
//	}
//	
}
