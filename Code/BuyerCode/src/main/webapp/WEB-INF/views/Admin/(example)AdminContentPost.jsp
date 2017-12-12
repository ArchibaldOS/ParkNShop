<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<title>网站后台管理</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="assets/css/bootstrap-maizi.css"/>
	</head>
	
	
	
	<body>
		<!--导航-->
		<nav class="navbar navbar-default">
			<div class="container">
				<!--小屏幕导航按钮和logo-->
				<div class="navbar-header">
					<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a href="/AdminIndex" class="navbar-brand">ParkNShop</a>
				</div>
				<!--小屏幕导航按钮和logo-->
				<!--导航-->
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="/AdminShopManagement"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Shop Management</a></li>
						<li><a href="/AdminCustomerManagement"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Customer Management</a></li>
						<li><a href="/AdminOrderManagement"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Order Management</a></li>
						<li><a href="/AdminADManagement"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;AD Management</a></li>
						<li><a href="/AdminSalesManagement"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Sales</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<c:out value="${sessionScope.adminAccount}"></c:out>
							</a>
						</li>
						<li><a href="/AdminLogout"><span class="glyphicon glyphicon-off"></span>&nbsp;退出</a></li>
					</ul>
				</div>
				<!--导航-->
			</div>
		</nav>
		<!--导航-->
		
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<div class="list-group">
						<a href="(example)AdminContent.jsp" class="list-group-item">内容管理</a>
						<a href="##" class="list-group-item active">添加内容</a>
						
					</div>
				</div>
				<div class="col-md-10">
					<div class="page-header">
						<h1>用户管理</h1>
					</div>
					<ul class="nav nav-tabs">
						<li>
							<a href="(example)AdminContent.jsp">内容管理</a>
						</li>
						<li class="active">
							<a href="##">添加内容</a>
						</li>
					</ul>
					
					<form action="#" class="mar_t15">
						<div class="form-group">
							<label for="title">标题</label>
							<input type="text" id="title" class="form-control" placeholder="请输入文章标题"/>
						</div>
						<div class="form-group">
							<label for="content">正文</label>
							<textarea id="content" class="form-control" rows="15" cols="10" placeholder="请输入文章正文部分"></textarea>
						</div>
						<div class="checkbox">
							<label for="">
								<input type="checkbox" />全局置顶
							</label>
							<button type="submit" class="btn btn-default pull-right">发布文章</button>
						</div>
					</form>
					
				</div>
			</div>
		</div>
		
		
		
		
		<!--footer-->
		<footer>
		    <div class="container">
		        <div class="row">
		            <div class="col-md-12">
		                <p>
							Copyright&nbsp;©&nbsp;2017-2018&nbsp;&nbsp;www.ParkNShop.com&nbsp;&nbsp;陕ICP备666666号-6
		                </p>
		            </div>
		        </div>
		    </div>
		</footer>
		<!--footer-->
		
		
		<script src="assets/javascripts/jquery.min.js"></script>
		<script src="assets/javascripts/bootstrap.min.js"></script>
	</body>
</html>
