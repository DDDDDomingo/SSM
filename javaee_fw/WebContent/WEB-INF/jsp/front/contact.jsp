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

<title>联系卖家</title>
<link rel="icon" href="<%=basePath%>/images/bitbug_favicon.ico" type="image/x-icon" />
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
<link rel="stylesheet" href="<%=basePath%>/assets/css/animate.min.css" type="text/css">
<link rel="stylesheet" href="<%=basePath%>/assets/css/style.css" type="text/css">

</head>

<body>
	<div id="preloader">
		<div id="loading"></div>
	</div>
	<header>
	<div class="top-header">
		<div class="container">

			<div class="col-md-6">
				<div class="top-header-left">
					<ul>
						<li>
							<span style="font-size: 20px;">校园二手市场</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-6">
				<div class="top-header-right">
					<ul>
						<li>
							<div class="dropdown">
								<a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
									data-hover="dropdown">
									<i class="icon-settings icons" aria-hidden="true"></i> 个人设置
								</a>
								<ul class="dropdown-menu">
									<li>
										<a href="user/personal?id=${userId}">个人中心</a>
									</li>
									<li>
										<a href="user/quit">退出登陆</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<section class="top-md-menu">
	<div class="container">
		<div class="col-sm-3">
			<div class="logo">
				<h6>
					<img src="images/logo.jpg" alt="logo" />
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

		<div class="col-sm-1" style="margin-left:150px">
			<div class="cart-menu">
				<ul>
					<li>
						<a href="<%=basePath%>/front/cart">
							<i class="icon-basket-loaded icons" aria-hidden="true"></i>
						</a>
						<strong>购物清单</strong>
					</li>
				</ul>
			</div>
		</div>
		<!-- 侧边导航 -->
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
								<a href="<%=basePath%>front/getByCata?saleCata=1">
									<img src="images/menu-icon9.png" alt="menu-icon2" /> 图书教材
								</a>
							</li>
							<li class="dropdown">
								<a href="<%=basePath%>front/getByCata?saleCata=2">
									<img src="images/computer.png" alt="menu-icon2" /> 闲置电脑
								</a>
							</li>
							<li class="dropdown">
								<a href="<%=basePath%>front/getByCata?saleCata=3">
									<img src="images/music.png" alt="menu-icon2" /> 数码耳机
								</a>
							</li>
							<li class="dropdown">
								<a href="<%=basePath%>front/getByCata?saleCata=4">
									<img src="images/music2.png" alt="menu-icon2" /> 数码音响
								</a>
							</li>
							<li class="dropdown">
								<a href="<%=basePath%>front/getByCata?saleCata=5">
									<img src="images/women.png" alt="menu-icon2" /> 美妆衣物
								</a>
							</li>
							<li class="dropdown">
								<a href="<%=basePath%>front/getByCata?saleCata=6">
									<img src="images/phone.png" alt="menu-icon2" /> 闲置手机
								</a>
							</li>
							<li class="dropdown">
								<a href="<%=basePath%>front/getByCata?saleCata=9">
									<img src="images/bike.png" alt="menu-icon2" /> 代步工具
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			</nav>
		</div>
		<!-- 侧边导航 -->
	</div>
	</section> </header>
	<!-- 头结束 -->
	<section class="shopping-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="#">首页</a>
					</li>
					<li class="breadcrumb-item active">与卖家联系</li>
				</ol>
			</div>
			<div class="col-md-12 contact-info">
				<div class="contact-form">
					<form action="<%=basePath%>/front/sendLetter" method="post" id="commentform"
						class="comment-form">
						<input type="text" name="senderId" value="${buyer.userId}" style="display:none"> <input
							type="text" name="recieverId" value="${seller.userId}" style="display:none"> <input
							type="text" name="letterState" value="${salelistInfo.saleId}" style="display:none">
						<div class="row">
							<div class="col-md-12">
								<div class="contact-bg">
									<h2>联系卖家</h2>
									<p>卖家昵称：${seller.userName}</p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="lable">
									买家昵称 <span>*</span>
								</div>
								<p class="comment-form-author">
									<input id="author" size="30" type="text" value="${buyer.userName}" disabled>
								</p>
							</div>
							<div class="col-md-6">
								<div class="lable">
									购买商品<span>*</span>
								</div>
								<p class="comment-form-email">
									<input size="30" type="text" value="${salelistInfo.saleName}" disabled>
								</p>
							</div>
							<div class="col-md-12">
								<div class="lable">
									信息内容 <span>*</span>
								</div>
								<p class="comment-form-comment">
									<textarea id="comment" name="letterContent" cols="45" rows="8" placeholder="请输入您想表达的信息"
										aria-required="true"></textarea>
								</p>
							</div>
							<div class="col-md-12" style="margin-left: 750px;">
								<p class="form-submit">
									<input class="btn btn-secondary" value="发送信息" type="submit">
								</p>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</section>
</body>
<script src="<%=basePath%>/js/jquery.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/bootstrap-dropdownhover.min.js"></script>
<script src="<%=basePath%>/js/custom.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".joe1").click(function() {
			var a = $(this).attr("value");
			$("#text1").val(a);
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".joe2").click(function() {
			var a = $(this).attr("value");
			$("#text2").val(a);
		});
	});
</script>
</html>
