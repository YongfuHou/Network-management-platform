package com.lzw;

import java.sql.*;

public class Getinfo {
	
	java.sql.Connection con = null;
	Statement stmt = null;   
	ResultSet rs = null;  
	
	public Getinfo(String dbname, String user, String pwd){
		try{
			Class.forName("com.mysql.jdbc.Driver");   
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbname+"?useUnicode=true&characterEncoding=GB2312",user,pwd);
		}catch(Exception e){
			System.out.print("����ʧ�ܣ���<br>"+e.toString());
		}
	}
	
	public  int getmsg(String sql){
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
		    rs.last();
			int user_number = rs.getInt("number");
			return user_number; 
		    } catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
			return 0;
		}
		
	}
	
	
	public static void main(String[] args) {
		// TODO �Զ����ɵķ������
		Getinfo getinfo = new Getinfo("test","root","yongfu");
	    int a = getinfo.getmsg("select * from AP1_user_num order by time desc limit 2");
	    System.out.println(a);
	}

}
