<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<title>AdminIndex</title>
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
								admin
							</a>
						</li>
						<li><a href="/AdminLogin"><span class="glyphicon glyphicon-off"></span>&nbsp;退出</a></li>
					</ul>
				</div>
				<!--导航-->
			</div>
		</nav>
		<!--导航-->

		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-default">
						  <div class="panel-heading">网站统计数据</div>
						  <div class="panel-body">
						    <table class="table table-hover">
							  <thead>
							  	<tr>
							  		<th>统计项目</th>
							  		<th>今日</th>
							  		<th>昨日</th>
							  	</tr>
							  </thead>
							  <tbody>
							  	<tr>
							  		<th scope="row">注册会员</th>
							  		<td>200</td>
							  		<td>400</td>
							  	</tr>
							  	<tr>
							  		<th scope="row">登录会员</th>
							  		<td>200</td>
							  		<td>400</td>
							  	</tr>
							  	<tr>
							  		<th scope="row">今日发帖</th>
							  		<td>200</td>
							  		<td>400</td>
							  	</tr>
							  	<tr>
							  		<th scope="row">昨日发帖</th>
							  		<td>200</td>
							  		<td>400</td>
							  	</tr>
							  	
							  </tbody>
							</table>
						  </div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="panel panel-default">
						  <div class="panel-heading">今日访客统计</div>
						  <div class="panel-body">
						  	<canvas id="canvas" class="col-md-12"></canvas>
						  </div>
					</div>
				</div>
				
				<div class="col-md-12">
					<div class="panel panel-default">
						  <div class="panel-heading">备份</div>
						  <div class="panel-body">
						  	<div class="col-md-7">
								<div class="panel panel-default">
									<div class="panel-heading">
										当前备份状态
									</div>
									<div class="panel-body">
										<ul class="list-group">
											<li class="list-group-item">正常</li>
										</ul>
									</div>
								</div>
						  	</div>
						  	<div class="col-md-5">
						  		<div class="panel panel-default">
						  			<div class="panel-heading">
						  				团队联系手册
						  			</div>
						  			<div class="panel-body">
						  				<ul class="list-group">
						  					<li class="list-group-item">站长：<span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;1234567891</li>
						  				</ul>
						  			</div>
						  		</div>
						  	</div>
						  </div>
					</div>
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
		<script src="assets/javascripts/Chart.js"></script>
		<script src="assets/javascripts/script.js"></script>
	</body>
</html>
