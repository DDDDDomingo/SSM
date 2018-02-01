<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>管理员登陆</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/login.css">

</head>

<body>
	<p />
	<form action="admin/loginCheck" method="POST">
		<div class="login_main">
			<span>用户名：</span><input type="text" name="adminAccount" /><br /> <br />
			<span>密&nbsp;码：</span><input type="password" name="adminPwd" />
		</div>
		<div class="login_btn">
			<input type="submit" value=" 登录 " />
		</div>
	</form>
  </body>
</html>
