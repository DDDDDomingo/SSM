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

<title>校园二手市场</title>

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
				<input type="text" id="text1" name="cateName" style="display:none" value="all"> 
				<input type="text" id="text2" name="seachType" style="display:none" value="sale">
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
						<a href="<%=basePath%>front/cart">
							<i class="icon-basket-loaded icons" aria-hidden="true"></i>
						</a>
						<strong>购物清单</strong>
					</li>
				</ul>
			</div>
		</div>
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
							<span> 商品类型</span> <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
						<ul class="dropdown-menu dropdownhover-bottom all-open" role="menu">
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
	</div>
	</section> <section class="header-outer">
	<div class="header-slider">
		<div id="home-slider" class="carousel slide carousel-fade" data-ride="carousel">
			<!-- .home-slider -->
			<div class="carousel-inner">
				<div class="item active"
					style="background-image: url(images/home-header1.jpg);  background-repeat: no-repeat; background-position: top;">
					<div class="container">
						<div class="caption">
							<div class="caption-outer">
								<div class="col-xs-12 col-sm-12 col-md-4"></div>
								<div class="col-xs-12 col-sm-6 col-md-6">
									<h3>智能手机</h3>
									<h2 class="animated wow slideInUp" data-wow-delay="0ms" data-wow-duration="1500ms">三星galaxy
										S4</h2>
									<h4>只需500元</h4>
									<p class="animated wow fadeInRight">三星Galaxy
										S4配有1300万像素摄像头，运行Android4.2.2+TouchWiz系统，机身厚度为7.9mm，内置Rom16/32/64GB，RAM为2GB。</p>
									<a data-scroll class="btn get-start animated fadeInUp" data-wow-delay="0ms"
										data-wow-duration="1500ms" href="front/singleGood?saleId=22">立刻购买</a>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-2">
									<div class="save-price animated wow slideInUp" data-wow-delay="0ms"
										data-wow-duration="1500ms">
										<span class="save-text">原价</span> <span class="saveprice-no"><sup>￥</sup>2000</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item"
					style="background-image: url(images/home-header2.jpg);  background-repeat: no-repeat; background-position: top;">
					<div class="container">
						<div class="caption">
							<div class="caption-outer">
								<div class="col-xs-12 col-sm-12 col-md-4"></div>
								<div class="col-xs-12 col-sm-6 col-md-6">
									<h3>无线耳机</h3>
									<h2 class="animated wow slideInUp" data-wow-delay="0ms" data-wow-duration="1500ms">Sony
										WH-H900N</h2>
									<h4>只需1099元</h4>
									<p class="animated wow fadeInRight">支持高解析度音频，聆听出众的音质。内置40mm驱动单元，配备圆顶镀钛的振膜，具有从低频到40kHz高频的高带宽音频性能（在开启电源并且连接耳机线时)，尽享音乐的精彩之处。</p>
									<a data-scroll class="btn get-start animated fadeInUp" data-wow-delay="0ms"
										data-wow-duration="1500ms" href="front/singleGood?saleId=23">立刻购买</a>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-2">
									<div class="save-price animated wow slideInUp" data-wow-delay="0ms"
										data-wow-duration="1500ms">
										<span class="save-text">原价</span> <span class="saveprice-no"><sup>￥</sup>1999</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item"
					style="background-image: url(images/home-header3.jpg);  background-repeat: no-repeat; background-position: top;">
					<div class="container">
						<div class="caption">
							<div class="caption-outer">
								<div class="col-xs-12 col-sm-12 col-md-4"></div>
								<div class="col-xs-12 col-sm-6 col-md-6">
									<h3>无线音响</h3>
									<h2 class="animated wow slideInUp" data-wow-delay="0ms" data-wow-duration="1500ms">Sony
										SRS-HG2</h2>
									<h4>只需899元</h4>
									<p class="animated wow fadeInRight">支持高解析度音源,EXTRA
										BASS一键重低音,NFC/Bluetooth/Wi-Fi/MusicCenterLink,2.0声道+2个被动振膜</p>
									<a data-scroll class="btn get-start animated fadeInUp" data-wow-delay="0ms"
										data-wow-duration="1500ms" href="front/singleGood?saleId=24">立刻购买</a>
								</div>
								<div class="col-xs-12 col-sm-6 col-md-2">
									<div class="save-price animated wow slideInUp" data-wow-delay="0ms"
										data-wow-duration="1500ms">
										<span class="save-text">原价</span> <span class="saveprice-no"><sup>￥</sup>1299</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<ol class="carousel-indicators">
				<li data-target="#home-slider" data-slide-to="0" class="active"></li>
				<li data-target="#home-slider" data-slide-to="1"></li>
				<li data-target="#home-slider" data-slide-to="2"></li>
			</ol>
		</div>
	</div>
	</section> </header>
	<section class="banner">
	<div class="container"></div>
	</section>
	<section class="deal-section">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="new-arrivals">
					<ul class="nav nav-tabs">
						<li class="active">
							<a data-toggle="tab" href="#home">最新发布</a>
						</li>
						<li>
							<a data-toggle="tab" href="#menu1">火热商品</a>
						</li>
					</ul>
					<div class="tab-content">
						<div id="home" class="tab-pane fade in active">
							<div class="owl-demo-outer">
								<div id="owl-demo8" class="deals-wk2">
									<div class="item">
										<!--item1-->
										<c:if test="${!empty newSale}">
											<c:forEach items="${newSale}" var="ns" varStatus="vs">
												<div class="col-xs-12 col-sm-6 col-md-4">
													<div class="pro-text text-center">
														<div class="pro-img">
															<img src="<%=basePath%>${ns.saleImg}" style="width:206px;height:214px" />
														</div>
														<div class="pro-text-outer">
															<span>${ns.cateName}</span>
															<a href="front/singleGood?saleId=${ns.saleId }">
																<h4>${ns.saleName}</h4>
															</a>
															<p class="wk-price">￥ ${ns.salePrice}</p>
															<a href="front/singleGood?saleId=${ns.saleId }" class="add-btn">立即购买</a>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:if>
										<!-- 没有新发布商品  -->
										<c:if test="${empty newSale}">
											<c:out value="没有新发布商品" />
										</c:if>
										<!--item1-->
									</div>
								</div>
							</div>
						</div>
						<!--menu1-->
						<div id="menu1" class="tab-pane fade">
							<div class="owl-demo-outer">
								<div id="owl-demo7" class="deals-wk2">
									<div class="item">
										<!-- one -->
										<c:if test="${!empty hotSale}">
											<c:forEach items="${hotSale}" var="hs" varStatus="vs">
												<div class="col-xs-12 col-sm-6 col-md-4">
													<div class="pro-text text-center">
														<div class="pro-img">
															<img src="<%=basePath%>${hs.saleImg}" style="width:206px;height:214px" />
														</div>
														<div class="pro-text-outer">
															<span>${hs.cateName}</span>
															<a href="front/singleGood?saleId=${ns.saleId }">
																<h4>${hs.saleName}</h4>
															</a>
															<p class="wk-price">￥ ${hs.salePrice}</p>
															<a href="front/singleGood?saleId=${hs.saleId }" class="add-btn">立即购买</a>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:if>
										<!-- 没有新发布商品  -->
										<c:if test="${empty hotSale}">
											<c:out value="没有新发布商品" />
										</c:if>
										<!-- one -->
									</div>
								</div>
							</div>
						</div>
						<!--menu1-->
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
