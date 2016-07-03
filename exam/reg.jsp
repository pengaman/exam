<%@page import="java.util.*" errorPage="error.jsp" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title> 注册—彭漫</title>
  <script src="js/jquery.min.js"></script>
<style>
span{
	font-size:12px;
	color:red;
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



function check(){
	var name = $("#user").val();
	if(name=="" ||name==null){
	$("#msg").html("对不起，"+name+" 名字不能为空").css("color","red");
	}
	else{
	$.ajax({
		url:'checkuser.jsp',
		data:{"user":name},
		type:"POST",
		success:function(info){
			if(info==0){
				$("#msg").html("恭喜你，"+name+"可以使用").css("color","green");
			}else{
				$("#msg").html("对不起，"+name+" 已被注册").css("color","red");
				$("#user").val("");
			}
		}
	});
}
}
function checkform(){

	if($("#user").val()==""||$("#user").val()==null||$("#pass").val()==""||$("#pass").val()==null||$("#email").val()==""||$("#email").val()==null){
		return false;
	}else{
			return true;
		}
}
function checkpass(){
	if($("#pass").val().length<=4){
		$("#passRule").html("您的密码太短了").css("color","red");
		$("#pass").val("");
	}
	else if($("#pass").val().length>30){
		$("#passRule").html("您的密码太长了").css("color","red");
		$("#pass").val("");
	}
	else{
		$("#passRule").html("密码格式正确").css("color","green");
	}
}
function checkemail(){
	var reg=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	if(reg.test($("#email").val())){
		$("#emailRule").html("邮箱格式正确").css("color","green");
	}
	else{
		$("#emailRule").html("邮箱格式错误").css("color","red");
		$("#email").val("");
	}
}
</script>
 </head>

 <body>

  <jsp:include page="header.jsp"/>
<center>
<h3>用户注册</h3>
<form method="post" action="reg_do.jsp" onsubmit="return checkform()">
	用户名：<input type="text" name="user" id="user" onblur="check()"><span id="msg"></span>
	<br><br>
	密码：<input type="password" name="pass" id="pass" onblur="checkpass()"><span id="passRule"></span><br><br>
	邮箱：<input type="text" name="email" id="email" onblur="checkemail()"><span id="emailRule"></span><br><br>

	<input type="submit" class="btn" value="注册">
	<input type="reset" class="btn" value="重置">
</form>
</center>

 </body>
</html>
