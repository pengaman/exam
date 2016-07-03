<%@page import="java.sql.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> jdbc测试—彭漫 </title>
 </head>

 <body>
 <%!
	String dbUrl = "jdbc:mysql://127.0.0.1:3306/exam";
	String dbUser = "root";
	String dbPass = "";
%>
<%
String user = request.getParameter("user");
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
	String sqlcheck= "select * from pengman_user where username=?";
	PreparedStatement pstmt = conn.prepareStatement(sqlcheck);
	pstmt.setString(1,user);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		out.println(user+" 已经存在，请换一个用户名！");
		response.setHeader("refresh","2;url=reg.jsp");
	}else{
		Statement stmt = conn.createStatement();	
		String sql = "INSERT INTO pengman_user (id, username, password, email) VALUES (NULL, '"+user+"', '"+pass+"', '"+email+"')";	
		stmt.execute(sql);
		out.println(user+" 注册成功，2秒后跳转回登录页面");
		response.setHeader("refresh","2;url=login.jsp");
	}
	
	
} catch (SQLException e) {
	System.out.println("--------数据库操作失败-----");	
}

%>
 </body>
</html>
