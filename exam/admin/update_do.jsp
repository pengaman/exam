<%@page import="java.sql.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 修改信息—彭漫 </title>
 </head>

 <body>
 <%!
	String dbUrl = "jdbc:mysql://127.0.0.1:3306/exam";
	String dbUser = "root";
	String dbPass = "";
%>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String email = request.getParameter("email");

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
//3、执行sql
try {
	String sql = "UPDATE pengman_user SET password= ?, email= ? WHERE id=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,pass);
	pstmt.setString(2,email);
	pstmt.setString(3,id);

	pstmt.executeUpdate();

	pstmt.close();
	conn.close();

	out.println("--------修改信息操作成功---2秒后跳回管理页面--");	
	response.setHeader("refresh","2;url=selectTable.jsp");
} catch (SQLException e) {
	System.out.println("--------数据库操作失败-----");	
}

%>

 </body>
</html>
