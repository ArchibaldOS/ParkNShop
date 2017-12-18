<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>AdminSalesManagement</title>
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
        <div class="col-md-2">
            <div class="list-group">
                <a href="/AdminSalesManagement" class="list-group-item active">Sales&nbsp;&nbsp;&nbsp;&nbsp; Management</a>
                <a href="/AdminSalesModifyCommission" class="list-group-item">Modify&nbsp;&nbsp;&nbsp;&nbsp; Management</a>
                <a href="/AdminSalesCommissionHistory" class="list-group-item">Commision&nbsp;&nbsp;&nbsp;&nbsp; Management</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>Sales Management</h1>
            </div>
            <div class="row">
                <span>KKKKKKKK kkkkkkkk</span>
                <form>
                    <select onchange="selectType()" id="selectTimeType">
                        <option></option>
                        <option value="daily">daily</option>
                        <option value="weekly">weekly</option>
                        <option value="monthly">monthly</option>
                        <option value="yearly">yearly</option>
                    </select>
                    <input type="date" id="timeType">
                </form>
                <canvas id="myChart" width="400" height=""></canvas>
                <button onclick="changeChart"> Button</button>
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
<script>
    var ctx = document.getElementById("myChart").getContext("2d");
    var lineChartData = {
        //X坐标数据
        labels : [${label[0]}, ${label[1]},${label[2]},${label[3]},${label[4]},${label[5]}],
        datasets : [
            {
                //统计表的背景颜色
                fillColor : "rgba(0,0,255,0.5)",
                //统计表画笔颜色
                strokeColor : "#f60",
                //点的颜色
                pointColor : "#000;",
                //点边框的颜色
                pointStrokeColor : "red",
                //鼠标触发时点的颜色
                pointHighlightFill : "red",
                //鼠标触发时点边框的颜色
                pointHighlightStroke : "#000",
                //Y坐标数据,以数组中的最大值来确定y轴的最大值
                data : [${data[0]}, ${data[1]},${data[2]},${data[3]},${data[4]},${data[5]}]
            }
        ]
    };
    var myNewChart = new Chart(ctx).Line(lineChartData, {
        responsive: true
    });
</script>
</body>
</html>
