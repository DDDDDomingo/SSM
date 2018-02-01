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

<title>搜索结果</title>

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
					<li class="breadcrumb-item active">搜索结果</li>
				</ol>
			</div>
			<div class="col-sm-3 col-md-3">
				<div class="weight">
					<div class="title">
						<h2>类别搜寻</h2>
					</div>
					<div class="product-categories">
						<ul>
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
					</div>
				</div>
			</div>
			<div class="col-sm-9 col-md-9">
				<!-- 心愿搜索 -->
				<c:if test="${!empty wishlistAll}">
					<div class="new-arrivals">
						<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="tab" href="#home">心愿搜索结果</a>
							</li>
						</ul>
						<div class="tab-content">
							<div id="home" class="tab-pane fade in active">
								<div class="owl-demo-outer">
									<div id="owl-demo8" class="deals-wk2">
										<div class="item">
											<c:if test="${!empty wishlistAll}">
												<c:forEach items="${wishlistAll}" var="wlAll" varStatus="vs">
													<div class="col-xs-12 col-sm-6 col-md-4">
														<div class="pro-text text-center">
															<div class="pro-img">
																<img src="<%=basePath%>${wlAll.wlistImg}" style="width:206px;height:210px" />
															</div>
															<div class="pro-text-outer">
																<span>${wlAll.typeName}</span>
																<h4>${wlAll.wlistName}</h4>
																<a class="add-btn">联系卖家:${wlAll.userPhone }</a>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:if>
										</div>
									</div>
								</div>
							</div>

						</div>
				</c:if>
				<!-- 条件搜索 -->
				<c:if test="${!empty searchWish}">
					<div class="new-arrivals">
						<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="tab" href="#home">心愿搜索结果</a>
							</li>
						</ul>
						<div class="tab-content">
							<div id="home" class="tab-pane fade in active">
								<div class="owl-demo-outer">
									<div id="owl-demo8" class="deals-wk2">
										<div class="item">
											<c:if test="${!empty searchWish}">
												<c:forEach items="${searchWish}" var="seaW" varStatus="vs">
													<div class="col-xs-12 col-sm-6 col-md-4">
														<div class="pro-text text-center">
															<div class="pro-img">
																<img src="<%=basePath%>${seaW.wlistImg}" style="width:206px;height:210px" />
															</div>
															<div class="pro-text-outer">
																<span>${seaW.typeName}</span>
																<h4>${seaW.wlistName}</h4>
																<a class="add-btn">联系卖家:${seaW.userPhone }</a>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:if>
										</div>
									</div>
								</div>
							</div>

						</div>
				</c:if>
				<!--  -->
				<c:if test="${((empty listAll && empty salelistByCate) && empty wishlistAll)&& empty searchWish}">
					<div class="new-arrivals">
						<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="tab" href="#home">最新发布</a>
							</li>
							<li>
								<a data-toggle="tab" href="#menu1">价格降序</a>
							</li>
							<li>
								<a data-toggle="tab" href="#menu2">价格升序</a>
							</li>
						</ul>
						<div class="tab-content">
							<div id="home" class="tab-pane fade in active">
								<div class="owl-demo-outer">
									<div id="owl-demo8" class="deals-wk2">
										<div class="item">
											<!--item1-->
											<c:if test="${!empty sjList}">
												<c:forEach items="${sjList}" var="sjL" varStatus="vs">
													<div class="col-xs-12 col-sm-6 col-md-4">
														<div class="pro-text text-center">
															<div class="pro-img">
																<img src="<%=basePath%>${sjL.saleImg}" style="width:206px;height:214px" />
															</div>
															<div class="pro-text-outer">
																<span>${sjL.cateName}</span>
																<a href="front/singleGood?saleId=${sjL.saleId }">
																	<h4>${sjL.saleName}</h4>
																</a>
																<p class="wk-price">￥ ${sjL.salePrice}</p>
																<a href="front/singleGood?saleId=${sjL.saleId }" class="add-btn">立即购买</a>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:if>
											<!-- 没有新发布商品  -->
											<c:if test="${empty sjList}">
												<c:out value="没有搜索到商品" />
											</c:if>
											<!--item1-->

											<!--item1-->
											<c:if test="${!empty listAll}">
												<c:forEach items="${listAll}" var="allL" varStatus="vs">
													<div class="col-xs-12 col-sm-6 col-md-4">
														<div class="pro-text text-center">
															<div class="pro-img">
																<img src="<%=basePath%>${allL.saleImg}" style="width:206px;height:214px" />
															</div>
															<div class="pro-text-outer">
																<span>${allL.cateName}</span>
																<a href="front/singleGood?saleId=${allL.saleId }">
																	<h4>${allL.saleName}</h4>
																</a>
																<p class="wk-price">￥ ${allL.salePrice}</p>
																<a href="front/singleGood?saleId=${allL.saleId }" class="add-btn">立即购买</a>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:if>

										</div>
									</div>
								</div>
							</div>
							<div id="menu1" class="tab-pane fade">
								<div class="owl-demo-outer">
									<div id="owl-demo7" class="deals-wk2">
										<div class="item">
											<!--item1-->
											<c:if test="${!empty jgDescList}">
												<c:forEach items="${jgDescList}" var="descL" varStatus="vs">
													<div class="col-xs-12 col-sm-6 col-md-4">
														<div class="pro-text text-center">
															<div class="pro-img">
																<img src="<%=basePath%>${descL.saleImg}" style="width:206px;height:214px" />
															</div>
															<div class="pro-text-outer">
																<span>${descL.cateName}</span>
																<a href="front/singleGood?saleId=${descL.saleId }">
																	<h4>${descL.saleName}</h4>
																</a>
																<p class="wk-price">￥ ${descL.salePrice}</p>
																<a href="front/singleGood?saleId=${descL.saleId }" class="add-btn">立即购买</a>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:if>
											<!-- 没有新发布商品  -->
											<c:if test="${empty jgDescList}">
												<c:out value="没有搜索到商品" />
											</c:if>
											<!--item1-->
										</div>

									</div>
								</div>
							</div>
							<div id="menu2" class="tab-pane fade">
								<div class="owl-demo-outer">
									<div id="owl-demo6" class="deals-wk2">
										<div class="item">
											<!--item1-->
											<c:if test="${!empty jgAscList}">
												<c:forEach items="${jgAscList}" var="ascL" varStatus="vs">
													<div class="col-xs-12 col-sm-6 col-md-4">
														<div class="pro-text text-center">
															<div class="pro-img">
																<img src="<%=basePath%>${ascL.saleImg}" style="width:206px;height:214px" />
															</div>
															<div class="pro-text-outer">
																<span>${ascL.cateName}</span>
																<a href="front/singleGood?saleId=${ascL.saleId }">
																	<h4>${ascL.saleName}</h4>
																</a>
																<p class="wk-price">￥ ${ascL.salePrice}</p>
																<a href="front/singleGood?saleId=${ascL.saleId }" class="add-btn">立即购买</a>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:if>
											<!-- 没有新发布商品  -->
											<c:if test="${empty jgAscList}">
												<c:out value="没有搜索到商品" />
											</c:if>
											<!--item1-->
										</div>

									</div>
								</div>
							</div>
						</div>
				</c:if>
				<c:if test="${(!empty listAll) && (empty salelistByCate)}">
					<div class="new-arrivals">
						<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="tab" href="#home">最新发布</a>
							</li>
						</ul>
						<div class="tab-content">
							<div id="home" class="tab-pane fade in active">
								<div class="owl-demo-outer">
									<div id="owl-demo8" class="deals-wk2">
										<div class="item">
											<c:if test="${!empty listAll}">
												<c:forEach items="${listAll}" var="allL" varStatus="vs">
													<div class="col-xs-12 col-sm-6 col-md-4">
														<div class="pro-text text-center">
															<div class="pro-img">
																<img src="<%=basePath%>${allL.saleImg}" style="width:206px;height:210px" />
															</div>
															<div class="pro-text-outer">
																<span>${allL.cateName}</span>
																<a href="front/singleGood?saleId=${allL.saleId }">
																	<h4>${allL.saleName}</h4>
																</a>
																<p class="wk-price">￥ ${allL.salePrice}</p>
																<a href="front/singleGood?saleId=${allL.saleId }" class="add-btn">立即购买</a>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:if>

										</div>
									</div>
								</div>
							</div>

						</div>
				</c:if>
				<c:if test="${(empty listAll) && (!empty salelistByCate)}">
					<div class="new-arrivals">
						<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="tab" href="#home">${cate.categoryType }</a>
							</li>
						</ul>
						<div class="tab-content">
							<div id="home" class="tab-pane fade in active">
								<div class="owl-demo-outer">
									<div id="owl-demo8" class="deals-wk2">
										<div class="item">
											<!--  -->
											<c:if test="${!empty salelistByCate}">
												<c:forEach items="${salelistByCate}" var="slbc" varStatus="vs">
													<div class="col-xs-12 col-sm-6 col-md-4">
														<div class="pro-text text-center">
															<div class="pro-img">
																<img src="<%=basePath%>${slbc.saleImg}" style="width:206px;height:210px" />
															</div>
															<div class="pro-text-outer">
																<span>${slbc.cateName}</span>
																<a href="front/singleGood?saleId=${slbc.saleId }">
																	<h4>${slbc.saleName}</h4>
																</a>
																<p class="wk-price">￥ ${slbc.salePrice}</p>
																<a href="front/singleGood?saleId=${slbc.saleId }" class="add-btn">立即购买</a>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:if>
											<!--  -->
											<c:if test="${empty salelistByCate}">
												<c:out value="该类别没有商品" />
											</c:if>
										</div>
									</div>
								</div>
							</div>

						</div>
				</c:if>
			</div>
			<!--  -->
			<c:if test="${(empty listAll) && (!empty salelistByCate)}">
				<div class="col-xs-12">
					<div class="grid-spr pag">
						<div class="col-xs-12 col-sm-6 col-md-6 text-right">
							<from>
							<ul class="pagination">
								<li class="active">
									<a href="<%=basePath%>front/getByCata?saleCata=${cate.categoryId}&start=0">首页</a>
								</li>
								<li>
									<a
										href="<%=basePath%>front/getByCata?saleCata=${cate.categoryId}&start=${page.start-page.countadd}">上一页</a>
								</li>
								<li>
									<a
										href="<%=basePath%>front/getByCata?saleCata=${cate.categoryId}&start=${page.start+page.count}">下一页</a>
								</li>
								<li>
									<a href="<%=basePath%>front/getByCata?saleCata=${cate.categoryId}&start=${page.last}">末页</a>
								</li>
							</ul>
							</from>
						</div>
					</div>
				</div>
			</c:if>
			<!--  -->
			<%-- 			<c:if test="${(!empty listAll) && (empty salelistByCate)}">
				<div class="col-xs-12">
					<div class="grid-spr pag">
						<div class="col-xs-12 col-sm-6 col-md-6 text-right">
							<from>
							<ul class="pagination">
								<li class="active">
									<a href="<%=basePath%>front/getByCata?saleCata=${cate.categoryId}&start=0">首页</a>
								</li>
								<li>
									<a
										href="<%=basePath%>front/getByCata?saleCata=${cate.categoryId}&start=${page.start-page.countadd}">上一页</a>
								</li>
								<li>
									<a
										href="<%=basePath%>front/getByCata?saleCata=${cate.categoryId}&start=${page.start+page.count}">下一页</a>
								</li>
								<li>
									<a href="<%=basePath%>front/getByCata?saleCata=${cate.categoryId}&start=${page.last}">末页</a>
								</li>
							</ul>
							</from>
						</div>
					</div>
				</div>
			</c:if> --%>
			<!--  -->
		</div>
	</div>
	</div>
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
