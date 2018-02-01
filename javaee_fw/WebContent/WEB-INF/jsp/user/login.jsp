<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>用户登陆</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="icon" href="<%=basePath%>/images/bitbug_favicon.ico" type="image/x-icon" />
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
	<div id="preloader">
		<div id="loading"></div>
	</div>
	<header class="header2"> <section class="top-md-menu">
	<div class="container">
		<div class="col-sm-3">
			<div class="logo">
				<h6>
					<a href="front/index">
						<img src="images/logo.jpg" alt="logo" />
					</a>
				</h6>
			</div>
		</div>
		<div class="col-sm-6">
			<form action="<%=basePath%>front/search" style="width:700px">
				<input type="text" id="text1" name="cateName" style="display:none" value="all"> <input
					type="text" id="text2" name="seachType" style="display:none" value="sale">
				<div class="well carousel-search hidden-phone">
					<div class="btn-group" style="width: 100px;">
						<a class="btn dropdown-toggle btn-select" data-toggle="dropdown" href="#"
							aria-expanded="false" style=" width: 100px;">
							类别搜索<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<c:if test="${!empty cateList}">
								<li>
									<a class="joe1" value="all">所有类别</a>
								</li>
								<c:forEach items="${cateList}" var="cl" varStatus="vs">
									<li>
										<a value="${cl.categoryType}" class="joe1">${cl.categoryType }</a>
									</li>
								</c:forEach>
							</c:if>
							<c:if test="${empty cateList}">
								<li>
									<a>没有商品类别</a>
								</li>
							</c:if>
						</ul>
					</div>

					<div class="btn-group" style="width: 100px;">
						<a class="btn dropdown-toggle btn-select" data-toggle="dropdown" href="#"
							style="width: 100px;">
							出售搜索<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a value="sale" class="joe2">出售搜索</a>
							</li>
							<li>
								<a value="wish" class="joe2">求购搜索</a>
							</li>
						</ul>
					</div>

					<div class="search">
						<input type="text" placeholder="输入您想要搜索的商品" name="goodName">
					</div>
					<div class="btn-group">
						<button type="submit" id="btnSearch" class="btn btn-primary">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		<!--  -->
		<div class="main-menu">
			<nav class="navbar navbar-inverse navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" data-hover="dropdown"
				data-animations=" fadeInLeft fadeInUp fadeInRight">
				<ul class="nav navbar-nav">
					<li class="all-departments dropdown">
						<a href="index.html" class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-expanded="false">
							<span> 商品类别</span> <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
						<ul class="dropdown-menu dropdownhover-bottom" role="menu">
							<li class="dropdown">
								<a href="#">
									<img src="images/menu-icon9.png" alt="menu-icon2" /> 图书教材
								</a>
							</li>
							<li class="dropdown">
								<a href="#">
									<img src="images/computer.png" alt="menu-icon2" /> 闲置电脑
								</a>
							</li>
							<li class="dropdown">
								<a href="#">
									<img src="images/music.png" alt="menu-icon2" /> 数码耳机
								</a>
							</li>
							<li class="dropdown">
								<a href="#">
									<img src="images/music2.png" alt="menu-icon2" /> 数码音响
								</a>
							</li>
							<li class="dropdown">
								<a href="#">
									<img src="images/women.png" alt="menu-icon2" /> 美妆衣物
								</a>
							</li>
							<li class="dropdown">
								<a href="#">
									<img src="images/phone.png" alt="menu-icon2" /> 闲置手机
								</a>
							</li>
							<li class="dropdown">
								<a href="#">
									<img src="images/bike.png" alt="menu-icon2" /> 代步工具
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			</nav>
		</div>
		<!--  -->
	</div>
	</section> </header>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12" style="background-image: url(images/background.jpg);">
				<div class="row" style="margin-bottom: 20px;">
					<div class="col-md-1"></div>
					<div class="col-md-7"></div>
					<div class="col-md-3"
						style="margin-top: 20px; margin-bottom: 20px; background-color: white; border-radius: 10px;">
						<form role="form" style="margin-top: 20px;" action="user/loginCheck" method="post">
							<div class="form-group">

								<label for="exampleInputEmail1"> 账号 </label>
								<input type="text" class="form-control" id="exampleInputEmail1" name="userAccount" />
							</div>
							<div class="form-group">

								<label for="exampleInputPassword1"> 密码 </label>
								<input type="password" class="form-control" id="exampleInputPassword1" name="userPwd" />
							</div>

							<div class="form-group">
								<button type="submit" class="btn btn-default"
									style="width: 446px; margin-top: 20px; background-color: #B22222; color: white;">
									登陆</button>
							</div>
						</form>
						<a href="<%=basePath%>user/register">
							<button type="button" class="btn btn-default"
								style="margin-bottom: 20px; width: 446px; background-color: #B22222; color: white;">
								注册</button>
						</a>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>
	</div>
	<p id="back-top">
		<a href="#top">
			<i class="fa fa-chevron-up" aria-hidden="true"></i>
		</a>
	</p>
	<script src="<%=basePath%>/js/jquery.js"></script>
	<script src="<%=basePath%>/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>/js/bootstrap-dropdownhover.min.js"></script>
	<script src="<%=basePath%>/js/custom.js"></script>
	<script src="<%=basePath%>/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('form').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {
					userAccount : {
						message : '用户名验证失败',
						validators : {
							notEmpty : {
								message : '用户名不能为空'
							}
						}
					},
					userPwd : {
						validators : {
							notEmpty : {
								message : '密码不能为空'
							}
						}
					}
				}
			});
		});
	</script>
</body>
</html>
