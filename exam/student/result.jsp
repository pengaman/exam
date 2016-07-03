
<%@page import="java.util.*,java.sql.*" errorPage="error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 考试成绩—彭漫 </title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 </head>
 <body>
<jsp:include page="header.jsp"/>
<center>
<%
String name = (String)session.getAttribute("name");
String[] r = request.getParameterValues("r");
String[] c = request.getParameterValues("c");
String[] st = request.getParameterValues("st");
int total = 0;
for(int i=0;i<r.length;i++){
	int r1 = Integer.parseInt(r[i]);
	int c1 = Integer.parseInt(c[i]);
	c1= (c1+123)/24578;
	String img = "<img src='w.png'/>";
	if(r1==c1){
		img = "<img src='r.png'/>";
		total=total+100/r.length;
	}
%>
<h1><%=st[i]+r[i]+img %> </h1>
<%
}
if(total>=99){
	total=100;
}
java.util.Date date=new java.util.Date();
%>

<h1><%=name %> 您最后的得分是: <%=total %> 分,考试时间是
<%=date %></h1>
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
		Statement stmt = conn.createStatement();	
		String sql = "INSERT INTO score (id, username, score, date) VALUES (NULL, '"+name+"', '"+total+"', '"+date+"')";	
		stmt.execute(sql);
	
	
} catch (SQLException e) {
	System.out.println("--------数据库操作失败-----");	
}

%>
<a href="history.jsp">查看历史成绩</a>
</center>
 </body>
</html>
