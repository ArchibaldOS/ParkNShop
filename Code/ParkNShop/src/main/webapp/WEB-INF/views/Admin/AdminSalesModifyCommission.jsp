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
                <a href="/AdminSalesManagement" class="list-group-item">Sales&nbsp;&nbsp;&nbsp;&nbsp; Management</a>
                <a href="/AdminSalesModifyCommission" class="list-group-item active">Modify&nbsp;&nbsp;&nbsp;&nbsp; Commission</a>
                <a href="/AdminSalesCommissionHistory" class="list-group-item">Commission&nbsp;&nbsp;&nbsp;&nbsp; Management</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>Sales Modify Commission</h1>
            </div>
            <form class="form-horizontal" role="form" action="/AdminSalesModifyCommissionDo">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Old Commission</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput1" type="text" name="oldCommission" value="${oldCommission}" READONLY>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">New Commission</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput2" type="text" name="newCommission" value="0.0">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Operator</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput3" type="text" name="adminAccount" value="${sessionScope.adminAccount}" READONLY>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">AdminPassword</label>
                    <div class="col-sm-10">

                        <input type="password" class="password" id="focusedInput4" type="text" name="adminPassWord" value="">
                    </div>
                </div>
                <div style="margin:0 auto;width:200px;">
                    <div style="width:50%;padding:0;margin:0;float:left">
                        <button type="submit" class="btn btn-success">Modify</button>
                    </div>
                    <button type="button" class="btn btn-danger" onclick="location='/AdminCommissionModify'">Cancel</button>
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
<script src="assets/javascripts/script.js"></script>
</body>
</html>

