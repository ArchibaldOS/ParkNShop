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
						<li><a href="/AdminBuyerManagement"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Buyer Management</a></li>
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
						<a href="(example)AdminContent.jsp" class="list-group-item active">内容管理</a>
						<a href="(example)AdminContentPost.jsp" class="list-group-item">添加内容</a>
						
					</div>
				</div>
				<div class="col-md-10">
					<div class="page-header">
						<h1>用户管理</h1>
					</div>
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="(example)AdminContent.jsp">内容管理</a>
						</li>
						<li>
							<a href="(example)AdminContentPost.jsp">添加内容</a>
						</li>
						
					</ul>
					<table class="table">
						<thead>
							<tr>
								<th>文章标题</th>
								<th>作者</th>
								<th>发布时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">泛Mooc职业教育， 效果和就业为王</th>
								<td>张三</td>
								<td>2018/08/08</td>
								<td><div role="presentation" class="dropdown">
									    <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
									    </button>
									    <ul class="dropdown-menu">
									      <li><a href="###">编辑</a></li>
									      <li><a href="###">删除</a></li>
									      <li><a href="###">全局置顶</a></li>
									    </ul>
									</div></td>
							</tr>
							<tr>
								<th scope="row">泛Mooc职业教育， 效果和就业为王</th>
								<td>张三</td>
								<td>2018/08/08</td>
								<td><div role="presentation" class="dropdown">
									    <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
									    </button>
									    <ul class="dropdown-menu">
									      <li><a href="###">编辑</a></li>
									      <li><a href="###">删除</a></li>
									      <li><a href="###">全局置顶</a></li>
									    </ul>
									</div></td>
							</tr>
							<tr>
								<th scope="row">泛Mooc职业教育， 效果和就业为王</th>
								<td>张三</td>
								<td>2018/08/08</td>
								<td><div role="presentation" class="dropdown">
									    <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
									    </button>
									    <ul class="dropdown-menu">
									      <li><a href="###">编辑</a></li>
									      <li><a href="###">删除</a></li>
									      <li><a href="###">全局置顶</a></li>
									    </ul>
									</div></td>
							</tr>
							<tr>
								<th scope="row">泛Mooc职业教育， 效果和就业为王</th>
								<td>张三</td>
								<td>2018/08/08</td>
								<td><div role="presentation" class="dropdown">
									    <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
									    </button>
									    <ul class="dropdown-menu">
									      <li><a href="###">编辑</a></li>
									      <li><a href="###">删除</a></li>
									      <li><a href="###">全局置顶</a></li>
									    </ul>
									</div></td>
							</tr>
							<tr>
								<th scope="row">泛Mooc职业教育， 效果和就业为王</th>
								<td>张三</td>
								<td>2018/08/08</td>
								<td><div role="presentation" class="dropdown">
									    <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
									    </button>
									    <ul class="dropdown-menu">
									      <li><a href="###">编辑</a></li>
									      <li><a href="###">删除</a></li>
									      <li><a href="###">全局置顶</a></li>
									    </ul>
									</div></td>
							</tr>
							<tr>
								<th scope="row">泛Mooc职业教育， 效果和就业为王</th>
								<td>张三</td>
								<td>2018/08/08</td>
								<td><div role="presentation" class="dropdown">
									    <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
									    </button>
									    <ul class="dropdown-menu">
									      <li><a href="###">编辑</a></li>
									      <li><a href="###">删除</a></li>
									      <li><a href="###">全局置顶</a></li>
									    </ul>
									</div></td>
							</tr>
							<tr>
								<th scope="row">泛Mooc职业教育， 效果和就业为王</th>
								<td>张三</td>
								<td>2018/08/08</td>
								<td><div role="presentation" class="dropdown">
									    <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
									    </button>
									    <ul class="dropdown-menu">
									      <li><a href="###">编辑</a></li>
									      <li><a href="###">删除</a></li>
									      <li><a href="###">全局置顶</a></li>
									    </ul>
									</div></td>
							</tr>

						</tbody>
					</table>
					<nav class="pull-right">
					  <ul class="pagination">
					    <li class="disabled">
					      <a href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    <li class="active"><a href="#">1</a></li>
					    <li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
					    <li>
					      <a href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
		
		
		
		
		<!--footer-->
		<footer>
		    <div class="container">
		        <div class="row">
		            <div class="col-md-12">
		                <p>
							Copyright&nbsp;©&nbsp;2017-2018&nbsp;&nbsp;www.ParkNShop.com
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
