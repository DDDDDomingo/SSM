<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>管理员首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">

					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
							class="icon-bar"></span><span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="">二手市场管理员首页</a>
				</div>

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li>
							<a>${admin.adminName }</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								操作<strong class="caret"></strong>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="#">退出登陆</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>

				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
				<div class="list-group">
					<a class="list-group-item active">管理项目</a>
					<a href="/admin/page?id=${admin.adminId }" class="list-group-item">网站首页图片管理</a>
					<a href="/admin/user?id=${admin.adminId }" class="list-group-item">用户管理</a>
					<a href="/admin/sale?id=${admin.adminId }" class="list-group-item">商品管理</a>
					<a href="/admin/cate?id=${admin.adminId }" class="list-group-item">类别管理</a>
					<a class="list-group-item active" href="">
						<span class="badge"></span>
					</a>
				</div>
			</div>
			<div class="col-md-5">
				<div class="row">
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="Bootstrap Thumbnail First"
								src="http://lorempixel.com/output/people-q-c-600-200-1.jpg" />
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi
									porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
								<p>
									<a class="btn btn-primary" href="#">Action</a>
									<a class="btn" href="#">Action</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="Bootstrap Thumbnail Second"
								src="http://lorempixel.com/output/city-q-c-600-200-1.jpg" />
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi
									porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
								<p>
									<a class="btn btn-primary" href="#">Action</a>
									<a class="btn" href="#">Action</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="Bootstrap Thumbnail Third"
								src="http://lorempixel.com/output/sports-q-c-600-200-1.jpg" />
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi
									porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
								<p>
									<a class="btn btn-primary" href="#">Action</a>
									<a class="btn" href="#">Action</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="row">
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="Bootstrap Thumbnail First"
								src="http://lorempixel.com/output/people-q-c-600-200-1.jpg" />
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi
									porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
								<p>
									<a class="btn btn-primary" href="#">Action</a>
									<a class="btn" href="#">Action</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="Bootstrap Thumbnail Second"
								src="http://lorempixel.com/output/city-q-c-600-200-1.jpg" />
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi
									porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
								<p>
									<a class="btn btn-primary" href="#">Action</a>
									<a class="btn" href="#">Action</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="thumbnail">
							<img alt="Bootstrap Thumbnail Third"
								src="http://lorempixel.com/output/sports-q-c-600-200-1.jpg" />
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi
									porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
								<p>
									<a class="btn btn-primary" href="#">Action</a>
									<a class="btn" href="#">Action</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
