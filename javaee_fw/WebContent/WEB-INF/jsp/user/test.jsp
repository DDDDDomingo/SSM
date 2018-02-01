<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'test.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="<%=basePath%>/assets/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>/assets/css/bootstrap-dropdownhover.min.css"
	type="text/css">
<link rel="stylesheet" href="<%=basePath%>/assets/font/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>/assets/simple-line-icon/css/simple-line-icons.css"
	type="text/css">
<link rel="stylesheet" href="<%=basePath%>/assets/css/style.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>/assets/css/bootstrapValidator.min.css" type="text/css">

</head>

<body>

	<form action="<%=basePath %>user/testCheck" method="post" enctype="multipart/form-data">
		<input type="file" name="file" /> <input type="submit" value="上 传" />
	</form>
</body>

</html>
