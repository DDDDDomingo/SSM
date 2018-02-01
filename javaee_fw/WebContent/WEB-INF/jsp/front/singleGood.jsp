<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>商品详情</title>
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
								<c:if test="${state==false }">
									<ul class="dropdown-menu">
										<li>
											<a href="user/login">登陆账户</a>
										</li>
										<li>
											<a href="user/register">注册账户</a>
										</li>
									</ul>
								</c:if>
								<c:if test="${state==true }">
									<ul class="dropdown-menu">
										<li>
											<a href="user/personal?id=${userId}">个人中心</a>
										</li>
										<li>
											<a href="user/quit">退出登陆</a>
										</li>
									</ul>
								</c:if>
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
	<section class="grid-shop">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="front/index">首页</a>
					</li>
					<li class="breadcrumb-item active">商品详情</li>
				</ol>
				<div class="row">
					<div class="col-sm-5 col-md-5">
						<div align="center">
							<img src="<%=basePath %>${salelistInfo.saleImg}" style="width: 300px;">
						</div>
					</div>
					<div class="col-sm-7 col-md-7">
						<div class="pro-text product-detail">
							<span class="span1">${salelistInfo.cateName}</span>
							<a>
								<h4>${salelistInfo.saleName}</h4>
							</a>
							<div class="star2">
								<ul>
									<li class="yellow-color">
										<i class="fa fa-star" aria-hidden="true"></i>
									</li>
									<li class="yellow-color">
										<i class="fa fa-star" aria-hidden="true"></i>
									</li>
									<li class="yellow-color">
										<i class="fa fa-star" aria-hidden="true"></i>
									</li>
									<li class="yellow-color">
										<i class="fa fa-star" aria-hidden="true"></i>
									</li>
									<li>
										<i class="fa fa-star" aria-hidden="true"></i>
									</li>
									<li>
										<a> 添加您的评论</a>
									</li>
								</ul>
							</div>
							<p>
								<strong>￥${salelistInfo.salePrice}</strong>
							</p>
							<p class="in-stock">
								商品状态:
								<c:if test="${salelistInfo.saleState== true}">
									<span><c:out value="已经出售" /></span>
								</c:if>
								<c:if test="${salelistInfo.saleState==false}">
									<span><c:out value="未出售" /></span>
								</c:if>

							</p>
							<p>${salelistInfo.saleContent }</p>
							<ul class="ul-content">
								<li>卖家账号：${sell.userName }</li>
								<li>联系电话：${sell.userTel }</li>
								<li>联系邮箱：${sell.userEmail }</li>
							</ul>
							<a
								href="<%=basePath %>front/insertCart?userId=${user.userId}&saleId=${salelistInfo.saleId}&sellerId=${salelistInfo.userId}"
								class="addtocart2">加入清单</a>
							<a
								href="<%=basePath %>front/contact?sellerId=${salelistInfo.userId}&saleId=${salelistInfo.saleId}"
								class="addtocart2" style="margin-left: 10px; ">联系卖家</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="tab-bg" id="test1">
						<ul>
							<li class="active">
								<a data-toggle="tab" href="#home">商品详情</a>
							</li>

							<li>
								<a data-toggle="tab" href="#menu2">评论</a>
							</li>
						</ul>
					</div>
					<div class="tab-content">
						<div id="home" class="tab-pane fade in active">
							<p>${salelistInfo.saleContent }</p>
						</div>

						<div id="menu2" class="tab-pane fade">
							<!-- 查看评论 -->
							<c:if test="${!empty messageList}">
								<c:forEach items="${messageList}" var="ml" varStatus="vs">
									<div class="row">
										<div class="col-md-2">
											<img src="<%=basePath%>${ml.userImg}" class="img-circle"
												style="height: 100px; width: 100px; margin-left: 90px;">
										</div>
										<div class="col-md-10">
											<div class="panel panel-default">
												<div class="panel-heading">
													<h3 class="panel-title">${ml.userName }</h3>
													<p>${ml.plusTime }</p>
												</div>
												<div class="panel-body" style="height: 80px;">${ml.msgContent }</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>

							<c:if test="${empty messageList}">
								<c:out value="暂无评论"></c:out>
							</c:if>
							<!-- 查看评论 -->
							<!-- 发表评论 -->
							<!-- 登陆失败 -->
							<c:if test="${state==false}">
								<form>
									<div class="row" style="margin-left: 200px;">
										<div class="page-header">
											<h3>评论</h3>
										</div>
										<div class="row">
											<div class="col-md-2">
												<img alt="Bootstrap Image Preview" src="<%=basePath%>/img/user/default-img.png"
													style="margin-top: 30px; border-radius: 68px; height: 150px; width: 150px;">
											</div>
											<div class="col-md-10">
												<div class="form-group">
													<fieldset disabled>
														<textarea
															style="height: 160px;width: 576px;margin-left: 30px; margin-top: 30px; resize: none;">
                            						</textarea>
													</fieldset>
													<p class="help-block">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户未登陆，请先登陆</p>
												</div>
												<a href="user/login">
													<button type="button" class="btn btn-default"
														style="margin-bottom: 30px; margin-left: 550px;">登陆</button>
												</a>
											</div>
										</div>
									</div>
								</form>
							</c:if>
							<!-- 登陆成功 -->
							<c:if test="${state==true}">
								<form role="form" action="<%=basePath%>/front/addMes">
									<div class="row" style="margin-left: 200px;">
										<div class="page-header">
											<h3>评论</h3>
										</div>
										<div class="row">
											<div class="col-md-2">
												<img src="<%=basePath %>${user.userAvatar }"
													style="margin-top: 30px; border-radius: 68px; height: 150px; width: 150px;">
											</div>
											<div class="col-md-10">
												<input type="text" name="userId" value="${user.userId}" style="display:none"> <input
													type="text" name="saleitemId" value="${salelistInfo.saleId}" style="display:none">
												<div class="form-group">
													<textarea name="msgContent"
														style="height: 160px;width: 576px;margin-left: 30px; margin-top: 30px; resize: none;">
                            						</textarea>
												</div>
												<button type="submit" class="btn btn-default"
													style="margin-bottom: 30px; margin-left: 550px;">发表</button>
											</div>
										</div>
									</div>
								</form>
							</c:if>
							<!--  -->
						</div>
					</div>
				</div>
			</div>

			<div class="tab-bg">
				<ul>
					<li>相似推荐</li>
				</ul>
			</div>


			<div class="col-md-12">
				<div class="owl-demo-outer">
					<div id="owl-demo8" class="deals-wk2">
						<div class="item">
							<!--相似  -->
							<!-- 获取的list<=4 -->
							<c:if test="${!empty simList && fn:length(simList)<=3}">
								<c:forEach items="${simList}" var="sl" end="3" varStatus="vs">
									<div class="col-xs-12 col-sm-6 col-md-4">
										<div class="pro-text text-center">
											<div class="pro-img">
												<img src="<%=basePath%>${sl.saleImg}" style="width:206px;height:214px" />
											</div>
											<div class="pro-text-outer">
												<span>${sl.cateName}</span>
												<a>
													<h4>${sl.saleName}</h4>
												</a>
												<p class="wk-price">￥ ${sl.salePrice}</p>
												<a href="front/singleGood?saleId=${sl.saleId }" class="add-btn">立即购买</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<!-- 获取的list大于4 -->
							<c:if test="${!empty simList && fn:length(simList)>3}">
								<c:forEach items="${simList}" var="sl" end="3">
									<div class="col-xs-12 col-sm-6 col-md-4">
										<div class="pro-text text-center">
											<div class="pro-img">
												<img src="<%=basePath%>${sl.saleImg}" style="width:206px;height:214px" />
											</div>
											<div class="pro-text-outer">
												<span>${sl.cateName}</span>
												<a>
													<h4>${sl.saleName}</h4>
												</a>
												<p class="wk-price">￥ ${sl.salePrice}</p>
												<a href="front/singleGood?saleId=${sl.saleId }" class="add-btn">立即购买</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<!-- 相似 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<p id="back-top">
		<a href="#top">
			<i class="fa fa-chevron-up" aria-hidden="true"></i>
		</a>
	</p>
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
