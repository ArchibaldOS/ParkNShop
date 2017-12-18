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
                    <a href="/AdminSalesModifyCommission" class="list-group-item">Modify&nbsp;&nbsp;&nbsp;&nbsp; Commission</a>
                    <a href="/AdminSalesCommissionHistory" class="list-group-item">Commission&nbsp;&nbsp;&nbsp;&nbsp; Management</a>
                </div>
            </div>
            <div class="col-md-10">
                <div class="page-header">
                    <h1>Sales Management</h1>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <input size="100" type="date" id="month" name="month" value="Choose Month">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="">
                                    Sales
                                </a>
                            </li>
                            <li class="nav nav-tabs">
                                <a href="#">
                                    ADs
                                </a>
                            </li>
                        </ul >
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#">
                                    Daily
                                </a>
                            </li>
                            <li class="nav nav-tabs">
                                <a href="#">
                                    Weekly
                                </a>
                            </li>
                            <li class="nav nav-tabs">
                                <a href="#">
                                    Monthly
                                </a>
                            </li>
                            <li class="nav nav-tabs">
                                <a href="#">
                                    Yearly
                                </a>
                            </li>
                        </ul>
                        <div class="panel-heading">Sales's Condition</div>
                        <div class="panel-body">
                            <canvas id="canvas" class="col-md-12"></canvas>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <span>Commission:0.2</span>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Aspect</th>
                                <th>Income</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">Sales</th>
                                <td>50000</td>
                            </tr>
                            <tr>
                                <th scope="row">ADs</th>
                                <td>10000</td>
                            </tr>
                            </tbody>
                        </table>
                        <span>Income:60000</span>
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
