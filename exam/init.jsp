<%@page import="java.sql.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 数据库初始化—彭漫</title>
 </head>

 <body>
 <%!
	String dbUrl = "jdbc:mysql://127.0.0.1:3306/exam";
	String dbUser = "root";
	String dbPass = "";
%>
<%

Connection conn  = null;
//1、注册驱动
try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbUrl,dbUser,dbPass);

	String sqlcheck= "CREATE TABLE score (id INT (8) UNSIGNED AUTO_INCREMENT, username VARCHAR (30), score TINYINT (4) UNSIGNED, date VARCHAR (30),  PRIMARY KEY(id)) ";

	PreparedStatement pstmt = conn.prepareStatement(sqlcheck);
	pstmt.execute();
	sqlcheck="CREATE TABLE pengman_user (id INT (8) UNSIGNED AUTO_INCREMENT, username VARCHAR (30), password VARCHAR (30) , email VARCHAR (30), role VARCHAR (30), PRIMARY KEY(id)) ";
	pstmt = conn.prepareStatement(sqlcheck);
	pstmt.execute();
	sqlcheck="INSERT INTO pengman_user (id, username, password, email, role) VALUES (NULL, 'admin', '', '', 'admin')";
	pstmt = conn.prepareStatement(sqlcheck);
	pstmt.execute();
	pstmt.close();
	conn.close();	
	out.println("数据库初始化成功，2秒跳回首页");
	response.setHeader("refresh","2;url=index.jsp");
} catch (SQLException e) {
	System.out.println("--------数据库操作失败-----");	
}

%>
 </body>
</html>
