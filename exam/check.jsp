<%@page import="java.sql.*"  pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 验证—彭漫 </title>
 </head>

 <body>
  <jsp:include page="header.jsp"/>
<center>

<%
String rand = (String)session.getAttribute("rand") ;
String code = request.getParameter("code");
if(!code.equals(rand)){
	
	session.setAttribute("msg","验证码错误！");
	response.sendRedirect("login.jsp");
}else{
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	boolean flag = false;
	boolean admin = false;

try {
	String dbUrl = "jdbc:mysql://127.0.0.1:3306/exam";
	String dbUser = "root";
	String dbPass = "";
	Connection conn  = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbUrl,dbUser,dbPass);

String sql = "select * from pengman_user where username=? and password=?";

	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1,user);
	pstmt.setString(2,pass);
	ResultSet rs = pstmt.executeQuery();

	flag = rs.next();
	if(flag){
		String role = rs.getString("role");
		if("admin".equals(role)){
			admin=true;
		}
	}
	rs.close();
	pstmt.close();
	conn.close();

} catch (ClassNotFoundException e) {
	System.out.println("--驱动加载失败-----");
}




	if(flag){
		session.setAttribute("name",user);
		if(admin){
			session.setAttribute("admin",user);
			response.sendRedirect("admin/selectTable.jsp");
		}else{
			response.sendRedirect("student/compute.jsp");
		}
	}else{
		session.setAttribute("msg","用户名或密码错误！");
		response.sendRedirect("login.jsp");
	}

}
%>
</center>
 </body>
</html>
