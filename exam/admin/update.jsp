<%@page import="java.sql.*" errorPage="error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 编辑用户—彭漫 </title>

 </head>

 <body>

  <jsp:include page="header.jsp"/>
<center>

<%
String id = request.getParameter("id");
String user = "";
String pass = "";
String email = "";
try {
	String dbUrl = "jdbc:mysql://127.0.0.1:3306/exam";
	String dbUser = "root";
	String dbPass = "";
	Connection conn  = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbUrl,dbUser,dbPass);

String sql = "select * from pengman_user where id=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		user = rs.getString("username");
		pass = rs.getString("password");
		email = rs.getString("email");
	}

	rs.close();
	pstmt.close();
	conn.close();

} catch (ClassNotFoundException e) {
	System.out.println("--驱动加载失败-----");
}

%>
修改<%=user %> 的信息<br><br>
<form method="post" action="update_do.jsp">

	<input type="hidden" name="id" value="<%=id%>">

	密码：<input type="password" name="pass" value="<%=pass%>"><br><br>
	邮箱：<input type="text" name="email" value="<%=email%>"><br><br>

	<input type="submit" value="提交">
</form>
</center>

 </body>
</html>
