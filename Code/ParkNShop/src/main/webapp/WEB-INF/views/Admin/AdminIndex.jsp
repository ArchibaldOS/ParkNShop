<%@ page import="java.text.SimpleDateFormat" %>
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
						<li><a href="/AdminLogout"><span class="glyphicon glyphicon-off"></span>&nbsp;LOG OUT</a></li>
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
						  <div class="panel-heading">Website statistics</div>
						  <div class="panel-body">
						    <table class="table table-hover">
							  <thead>
							  	<tr>
							  		<th>Statistics Project</th>
							  		<th>Statistics Data</th>
							  	</tr>
							  </thead>
							  <tbody>
							  	<tr>
							  		<th scope="row">Registered Buyers</th>
							  		<td>${registeredBuyers}</td>
							  	</tr>
							  	<tr>
							  		<th scope="row">Registered Sellers</th>
									<td>${registeredSellers}</td>
								</tr>
								<tr>
									<th scope="row">Official Sellers</th>
									<td>${officialSellers}</td>
								</tr>
								<tr>
									<th scope="row">BlackList Sellers</th>
									<td>${blackListSellers}</td>
								</tr>
							  	<tr>
							  		<th scope="row">Incomplete Orders</th>
									<td>${incompleteOrders}</td>
								</tr>
							  	<tr>
							  		<th scope="row">Completed Orders</th>
									<td>${completedOrders}</td>
								</tr>
							  </tbody>
							</table>
						  </div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="panel panel-default">
						  <div class="panel-heading">Today's visitor statistics</div>
						  <div class="panel-body">
						  	<canvas id="canvas-index" class="col-md-12"></canvas>
						  </div>
					</div>
				</div>
				
				<div class="col-md-12">
					<div class="panel panel-default">
						  <div class="panel-heading">Backup</div>
						  <div class="panel-body">
						  	<div class="col-md-7">
								<div class="panel panel-default">
									<div class="panel-heading">
										Click here to backup --->
										<%--<button style="float: right" onclick="location='/AdminBackup?adminAccount=${sessionScope.adminAccount}'">click</button>--%>
										<button style="float: right" onclick="backup()">click</button>
                                        <script type="text/javascript">
                                            function backup(){
                                                bootbox.confirm({
                                                    title: "Backup?",
                                                    message: "Do you want to backup database?",
                                                    buttons: {
                                                        cancel: {
                                                            label: '<i class="fa fa-times"></i> No'
                                                        },
                                                        confirm: {
                                                            label: '<i class="fa fa-check"></i> Yes'
                                                        }
                                                    },
                                                    callback: function (result) {
                                                        console.log('This was logged in the callback: ' + result);
                                                        if (result == false){
                                                            return;
                                                        }
                                                        else{
                                                            window.location="/AdminBackup?adminAccount=${sessionScope.adminAccount}";
                                                        }
                                                    }
                                                });
                                            }
                                        </script>
									</div>
									<br>
									<div class="panel-heading">
										Backup history
									</div>
									<div class="panel-body">
										<table class="table">
											<thead>
											<tr>
												<th hidden>Backup ID</th>
												<th>Account</th>
												<th>Backup Date</th>
												<th>Recover</th>
											</tr>
											</thead>
											<tbody>

											<c:forEach var="backupHistory" items="${backupHistorys}">
												<tr>
													<td>${backupHistory.backupid}</td>
													<td>${backupHistory.backupaccount}</td>
													<td>${backupHistory.backupdate}</td>
													<td>
														<button class="btn btn-success" onclick="location='/AdminRecover?backupId=${backupHistory.backupid}'">recover</button>
														<%--<button class="btn btn-success" onclick="recover()">recover</button>--%>
                                                            <script>
                                                                function recover() {
                                                                    bootbox.confirm({
                                                                        title: "Recover?",
                                                                        message: "Are you sure to recover this version?",
                                                                        buttons: {
                                                                            cancel: {
                                                                                label: '<i class="fa fa-times"></i> No'
                                                                            },
                                                                            confirm: {
                                                                                label: '<i class="fa fa-check"></i> Yes'
                                                                            }
                                                                        },
                                                                        callback: function (result) {
                                                                            console.log('This was logged in the callback: ' + result);
                                                                            if (result == false){
                                                                                return;
                                                                            }
                                                                            else{
                                                                                window.location="/AdminRecover?backupId=${backupHistory.backupdate}";

                                                                            }
                                                                        }
                                                                    });
                                                                }
                                                            </script>
													</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
						  	</div>
						  	<div class="col-md-5">
						  		<div class="panel panel-default">
						  			<div class="panel-heading">
										Contact team
						  			</div>
						  			<div class="panel-body">
						  				<ul class="list-group">
											<li class="list-group-item">Bin Liu：<span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;13772463395</li>
											<li class="list-group-item">TianFei Wei：<span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;15002970314</li>
											<li class="list-group-item">YingJing Wu：<span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;13772191265</li>
											<li class="list-group-item">XuDong Wang：<span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;15002972015</li>
											<li class="list-group-item">HongYang Cai：<span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;15829295904</li>
											<li class="list-group-item">XiuHuang Chen：<span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;13022875541</li>
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
		                    Copyright&nbsp;©&nbsp;2017-2018&nbsp;&nbsp;www.ParkNShop.com
		                </p>
		            </div>
		        </div>
		    </div>
		</footer>
		<!--footer-->
		
		
		<script src="assets/javascripts/jquery.min.js"></script>
		<script src="assets/javascripts/bootstrap.min.js"></script>
		<script src="assets/javascripts/Chart.js"></script>
		<script src="assets/javascripts/bootbox.min.js"></script>

		<script>
            var ctx = document.getElementById("canvas-index").getContext("2d");
            var lineChartData = {
                //X坐标数据
                labels : ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],
                datasets : [
                    {
                        //统计表的背景颜色
                        fillColor : "rgba(255,255,255,0.5)",
                        //统计表画笔颜色
                        strokeColor : "#000",
                        //点的颜色
                        pointColor : "#000;",
                        //点边框的颜色
                        pointStrokeColor : "black",
                        //鼠标触发时点的颜色
                        pointHighlightFill : "black",
                        //鼠标触发时点边框的颜色
                        pointHighlightStroke : "#000",
                        //Y坐标数据,以数组中的最大值来确定y轴的最大值
                        data : [${sessionScope.counts[0]}, ${sessionScope.counts[1]},${sessionScope.counts[2]},
							${sessionScope.counts[3]},${sessionScope.counts[4]},${sessionScope.counts[5]}, ${sessionScope.counts[6]}]
                    }
                ]
            };
            var myNewChart = new Chart(ctx).Line(lineChartData, {
                responsive: true
            });


		</script>

	</body>
</html>
