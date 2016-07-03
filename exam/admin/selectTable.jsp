<%@page import="java.sql.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 用户查询表—彭漫 </title>
  <style type="text/css" >
  	a{
  	text-decoration: none;
	display:block;
	color:#444;
	padding:5px;
  	}
  	a:hover{
  	background:#2746B4;
  	color:#fff;
  	}
  	th{
  		background:#2746B4;
  		color:#fff;
  		padding:5px;
  	}
  	.shelter{
	width: 100%;
	height: 100%;
	background-color: #666;
	position: fixed;
	left:0;
	top:0;
	opacity: 0.3;
}
.confirm{
	position:fixed;
	top:50%;
	left:50%;
	width:240px;
	height:150px;
	margin-left:-100px;
	margin-top: -75px;
	background-color: #eee;
}
.confirm h1{
	background-color: #2746B4;
	font-size: 25px;
	padding:5px;
	margin:0;
	text-align:left;
	color:#fff;
}
.confirm h1 span{
	float: right;
	font-weight: 500;
	display:block;
	font-size: 25px;
	cursor: pointer;
	width:29px;
	height:29px;
	text-align: center;

}
.confirm button{
	position:absolute;
	bottom: 5px;
	font-size: 16px;
	padding:3px 5px;
}
.confirm .cancel{
	right:18px;
}
.confirm .sure{
	left:18px;
}
  </style>
 </head>

 <body>
<%

String u = (String)session.getAttribute("admin");

if(u==null){
	response.sendRedirect("../login.jsp");
}

%>

  <jsp:include page="header.jsp"/>
<h2 align="center">用户管理</h2>

<table align="center" width="500" >
<tr>
	<th>编号</th>
	<th>用户名</th>
	<th>密码</th>
	<th>邮箱</th>
	<th>删除</th>
	<th>编辑</th>
	<th>查看成绩</th>
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
	Statement stmt = conn.createStatement();
	String sql1="SELECT * FROM pengman_user ORDER BY id ASC ";
	stmt.execute(sql1);
	String sql = "select * from pengman_user";
	
	ResultSet rs = stmt.executeQuery(sql);

	while(rs.next()){
		int id = rs.getInt("id");
		String name = rs.getString("username");
		String pass = rs.getString("password");
		String email = rs.getString("email");
%>
<tr>
	<td><%=id %></td>
	<td><%=name %></td>
	<td><%=pass %></td>
	<td><%=email %></td>
	<td><a href="delete.jsp?id=<%=id%>">删除</a></td>
	<td><a href="update.jsp?id=<%=id%>">编辑</a></td>
	<td><a href="historyAdmin.jsp?name=<%=name%>">查看成绩</a></td>
</tr>
<%		
	}
	System.out.println("--------数据库操作成功-----");	
} catch (SQLException e) {
	System.out.println(e);	
}

%>
</table>
<script type="text/javascript" src="../js/ui1fuchukuang.js"></script>
 </body>
</html>
