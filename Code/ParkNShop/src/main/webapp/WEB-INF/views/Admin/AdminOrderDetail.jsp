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
                <a href="/AdminOrderManagement" class="list-group-item">Order&nbsp;&nbsp;&nbsp;&nbsp; Management</a>
                <a href="/AdminOrderSearchById" class="list-group-item">SearchOrder</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>Order Detail</h1>
            </div>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Attributes</th>
                    <th>Information</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Order ID</td>
                    <td >${order.orderId}</td>
                </tr>
                <tr>
                    <td>Seller ID</td>
                    <td>${order.sellerId}</td>
                </tr>
                <tr>
                    <td>Buyer ID</td>
                    <td>${order.buyerId}</td>
                </tr>
                <tr>
                    <td>Product ID</td>
                    <td>${order.productId}</td>
                </tr>
                <tr>
                    <td>Count</td>
                    <td>${order.count}</td>
                </tr>
                <tr>
                    <td>Total Price</td>
                    <td>${order.totalPrice}</td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>${order.address}</td>
                </tr>
                <tr>
                    <td>Status</td>
                    <c:choose>

                        <c:when test="${order.orderStatus eq 1}"><td>Submitted,Unpaid</td></c:when>
                        <c:when test="${order.orderStatus eq 2}"><td>Cancelled</td></c:when>
                        <c:when test="${order.orderStatus eq 3}"><td>Paid,Unshipped</td></c:when>
                        <c:when test="${order.orderStatus eq 4}"><td>Paid,Shipped</td></c:when>
                        <c:when test="${order.orderStatus eq 5}"><td>Success</td></c:when>
                        <c:when test="${order.orderStatus eq 6}"><td>Refunding</td></c:when>
                        <c:when test="${order.orderStatus eq 7}"><td>Refund Succeed</td></c:when>
                        <c:when test="${order.orderStatus eq 8}"><td>Refund Failed</td></c:when>
                        <c:when test="${order.orderStatus eq 9}"><td>Commented</td></c:when>


                    </c:choose>


                </tr>
                <tr>
                    <td>Time</td>
                    <td>${order.orderTime}</td>
                </tr>
                <tr>
                    <td>
                        <div style="margin:0 auto;width:200px;">
                            <button type="button" class="btn btn-success" onclick="location='/AdminOrderModify?orderId=${order.orderId}'">Modify</button>
                        </div>
                    </td>
                    <td>
                        <%--<div style="margin:0 auto;width:200px;">--%>
                        <button type="button" class="btn btn-danger" onclick="location='/AdminOrderManagement'">Cancel</button>
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

