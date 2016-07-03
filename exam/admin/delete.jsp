<%@page import="java.sql.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 删除用户—彭漫</title>
 </head>
 <body>
<%
String dbUrl = "jdbc:mysql://127.0.0.1:3306/exam";
String dbUser = "root";
String dbPass = "";
Connection conn  = null;
//1、注册驱动
try {
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("--驱动加载成功-----");
} catch (ClassNotFoundException e) {
	System.out.println("--驱动加载失败-----");
}
//2、建立连接
try {
	conn = DriverManager.getConnection(dbUrl,dbUser,dbPass);
	System.out.println("-----数据库连接成功-----");			
} catch (SQLException e) {
	System.out.println("-----数据库连接失败-----");
}
String id = request.getParameter("id");
//3、执行sql
try {
	Statement stmt = conn.createStatement();
	String sql = "DELETE FROM pengman_user WHERE id="+id;
	
	stmt.execute(sql);
	
    out.print("删除成功");
	response.sendRedirect("selectTable.jsp");
	System.out.println("--------数据库操作成功-----");	
} catch (SQLException e) {
	System.out.println(e);	
}

%>
 </body>
</html>
