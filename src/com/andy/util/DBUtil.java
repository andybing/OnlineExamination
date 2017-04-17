package com.andy.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	private static Connection conn=null;
	private static Statement stm=null;
	
	public static Connection getConnection(){
		String url="jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String userName="scott";
		String password="tiger";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(url, userName, password);
			stm=conn.createStatement();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return conn;
	}
	public static ResultSet executeQuery(String sql){
		ResultSet rs=null;
		try {
			rs=stm.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	public static int executeUpdate(String sql){
		int count=0;
		try {
			count=stm.executeUpdate(sql);
		} catch (SQLException e) {
			count=0;
			e.printStackTrace();
		}
		return count;
		
	}
	public static void commit(){
		try {
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(){
		try {
			if(stm!=null){
				stm.close();
				stm=null;
			}
			if(conn!=null){
				conn.close();
				conn=null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
