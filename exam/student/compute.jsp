
<%@page import="java.util.*"  pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 考试试题—彭漫 </title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style >
	a{
	text-decoration: none;
	display:block;
	color:#fff;
	padding:5px 15px;
	background-color:#2746B4;
	position:fixed;
	bottom:0;
	left:0;
	}
	#btn{
	padding:5px;
	}
</style>
 </head>
 <body>
 
 <%@include file="header.jsp" %>
<center>

<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);

String name = (String)session.getAttribute("name");

if(name==null){
	response.sendRedirect("../login.jsp");
}

%>
<h1>欢迎 <%=name%> 进入考试系统</h1>


<form method="post" action="result.jsp">	

 <%
int num = 4;
for(int i=1;i<=num;i++){
	int a =new Random().nextInt(10);
	int b =new Random().nextInt(10);
	int s = new Random().nextInt(2);
	String st = a+" + "+b+" = ";
	int c = (a+b)*24578-123;
	//s=1 认为是 +  ，0是- 
	if(s==0){
		c = (a-b)*24578-123;
		if(a<b){
			c = (b-a)*24578-123;
			int t = a;
			a=b;
			b=t;
		}		
		st = a+" - "+b+" = ";
	}
	
%>
	<h1>
	  <%=st%>  <input type="text" name="r">
	  	<input type="hidden" name="c" value="<%=c%>">
		<input type="hidden" name="st" value="<%=st%>">
	</h1>
<%
}
%>
	<input type="submit" value="提交" id="btn">
</form>
</center>
<a href="../login.jsp">退出</a>
 </body>
</html>
