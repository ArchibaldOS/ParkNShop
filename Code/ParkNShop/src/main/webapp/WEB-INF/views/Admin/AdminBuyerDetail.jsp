<%@ page import="com.ten.ParkNShop.entity.Seller" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>AdminBuyerManagement</title>
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
                <a href="/AdminBuyerManagement" class="list-group-item">BuyerList</a>
                <a href="/AdminSearchBuyerByID" class="list-group-item">SearchBuyer</a>
                <a href="/AdminBuyerBlackList" class="list-group-item">BlackList Management</a>

            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>Buyer Management</h1>
            </div>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Attributes</th>
                    <th>Information</th>
                </tr>
                </thead>
                <tbody>
                <tr class="hidden">
                    <td>Buyer ID</td>
                    <td >${buyer.buyerId}</td>
                </tr>
                <tr>
                    <td>Buyer Account</td>
                    <td>${buyer.buyerAccount}</td>
                </tr>
                <tr>
                    <td>Buyer Name</td>
                    <td>${buyer.buyerName}</td>
                </tr>
                <tr>
                    <td>Buyer Address</td>
                    <td>${buyer.buyerAddress}</td>
                </tr>
                <tr>
                    <td >Buyer Phone</td>
                    <td>${buyer.buyerPhone}</td>
                </tr>
                <tr>
                    <td >Buyer Balance</td>
                    <td>${buyer.buyerBalance}</td>
                </tr>
                <tr>
                    <td>shopStatus</td>
                    <c:choose>
                        <c:when test="${buyer.buyerStatus eq 1}"><td>Normal</td></c:when>
                        <c:when test="${buyer.buyerStatus eq 2}"><td>Frozen</td></c:when>
                        <c:when test="${buyer.buyerStatus eq 3}"><td>BlackList</td></c:when>
                    </c:choose>
                </tr>
                <tr>
                    <td>
                        <div style="margin:0 auto;width:200px;">
                            <button type="button" class="btn btn-success" onclick="location='/AdminBuyerModify?buyerId=${buyer.buyerId}'">Modify</button>
                        </div>
                    </td>
                    <td>
                        <%--<div style="margin:0 auto;width:200px;">--%>
                        <button type="button" class="btn btn-danger" onclick="location='/AdminBuyerManagement'">Cancel</button>
                        <%--</div>--%>
                    </td>
                </tr>
                </tbody>
            </table>

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
