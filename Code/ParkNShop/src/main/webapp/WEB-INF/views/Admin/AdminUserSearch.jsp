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
				<div class="col-md-2">
					<div class="list-group">
						<a href="AdminUserList.jsp" class="list-group-item">用户管理</a>
						<a href="AdminUserSearch.jsp" class="list-group-item active">用户搜索</a>
						<a href="###" role="button" class="list-group-item" data-toggle="modal" data-target="#myModal">添加用户</a>
						
					</div>
				</div>
				<div class="col-md-10">
					<div class="page-header">
						<h1>用户管理</h1>
					</div>
					<ul class="nav nav-tabs">
						<li>
							<a href="AdminUserList.jsp">用户列表</a>
						</li>
						<li class="active">
							<a href="AdminUserList.jsp">用户搜索</a>
						</li>
						<li>
							<a href="" role="button" data-toggle="modal" data-target="#myModal">添加用户</a>
						</li>
					</ul>
					
					<form action="#" class="user_search">
						<div class="alert alert-info" role="alert">	
							<strong>技巧提示： </strong>支持模糊搜索和匹配搜索，匹配搜索使用*代替！		
						</div>
						<div class="form-group">
							<label for="name">用户名</label>
							<input type="text" id="name" class="form-control" placeholder="请输入用户名" />
						</div>
						<div class="form-group">
							<label for="uid">UID</label>
							<input type="text" id="uid" class="form-control" placeholder="请输入用户ID" />
						</div>
						<div class="form-group">
							<label for="ugroup">选择用户组名</label>

							<select id="ugroup" class="form-control">
								<option value="">限制会员</option>
								<option value="">新手上路</option>
								<option value="">注册会员</option>
								<option value="">中级会员</option>
								<option value="">高级会员</option>
							</select>
						</div>
						
						<button type="submit" class="btn btn-default">提交</button>
					</form>
					
				</div>
				
				
				
				
			</div>
		</div>
		
		

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">添加用户</h4>
		      </div>
		      <div class="modal-body">
		      	<div class="form-group">
					<label for="name">用户名</label>
					<input type="text" id="name" class="form-control" placeholder="请输入用户名" />
				</div>
				<div class="form-group">
					<label for="password">用户密码</label>
					<input type="password" id="password" class="form-control" placeholder="请输入用户密码" />
				</div>
				<div class="form-group">
					<label for="repassword">确认用户密码</label>
					<input type="password" id="repassword" class="form-control" placeholder="请确认用户密码" />
				</div>
				<div class="form-group">
					<label for="uemial">用户邮箱</label>
					<input type="text" id="uemial" class="form-control" placeholder="请输入用户邮箱" />
				</div>
				<div class="form-group">
					<label for="ugroup">选择用户组名</label>

					<select id="ugroup" class="form-control">
						<option value="">限制会员</option>
						<option value="">新手上路</option>
						<option value="">注册会员</option>
						<option value="">中级会员</option>
						<option value="">高级会员</option>
					</select>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary">提交</button>
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
	</body>
</html>
