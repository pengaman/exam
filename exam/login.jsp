<%@page import="java.util.*" errorPage="error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 登录—彭漫</title>
  <style>
body{
color:#666;
}
#code{
	  width:80px;
}
#msg{
	color:red;
	font-size:12px;
}
.btn{
	padding:8px;
	background:#2746B4;
	margin:20px;
	color:#fff;
	border:none;
	cursor: pointer;
}
  </style>
  <script>
function refreshCode(){
	//alert("code.jsp?"+Math.random());
	document.getElementById("rand").src="code.jsp?"+Math.random();

  }
function f(){
	window.location.replace('reg.jsp');
}
  </script>
 </head>

 <body>

  <jsp:include page="header.jsp"/><p>
<center>

<form method="post" action="check.jsp">

	
	<p>用户名：<input type="text" name="user"></p>
	<p>密&nbsp;码：<input type="password" name="pass"></p>
	<p>验证码：<input type="text" name="code" id="code">
	<img src="code.jsp" title="看不清，点我换一张" id="rand" onclick="refreshCode()"/></p>
	
	<div id="msg">
	<%
	String msg = (String)session.getAttribute("msg");
	if(msg!=null){
		out.println(msg);
	}
	%>
	</div>
	<input type="submit" value="登录" class="btn">
	<input type="button" value="注册" class="btn" onclick="f()">

</form>
</center>
 <%
session.invalidate();
 %>
 </body>
</html>
