<%@page import="java.sql.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 成绩查询-彭漫 </title>
 </head>

 <body>
  <jsp:include page="header.jsp"/>
<h2 align="center">成绩管理</h2>

<table border="1" align="center" width="400">
<tr>
	<th>编号</th>
	<th>用户名</th>
	<th>成绩</th>
	<th>考试时间</th>
</tr>
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
//3、执行sql
try {
	String user = request.getParameter("name");
	System.out.println("user is "+user);
	String sql = "select * from score where username=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,user);

	
	ResultSet rs = pstmt.executeQuery();

	while(rs.next()){
		int id = rs.getInt("id");
		String name = rs.getString("username");
		String score = rs.getString("score");
		String date = rs.getString("date");
%>
<tr>
	<td><%=id %></td>
	<td><%=name %></td>
	<td><%=score %></td>
	<td><%=date %></td>
</tr>
<%		
	}

	System.out.println("--------数据库操作成功-----");	
} catch (SQLException e) {
	System.out.println(e);	
}

%>



</table>
 </body>
</html>
