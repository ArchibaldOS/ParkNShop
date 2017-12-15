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
                <a href="/AdminOrderManagement" class="list-group-item active">Order&nbsp;&nbsp;&nbsp;&nbsp; Management</a>
                <a href="/AdminOrderSearchByID" class="list-group-item">SerachOrder</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>Order Modify</h1>
            </div>
            <form class="form-horizontal" role="form" action="/AdminOrderModifyDo">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Order ID</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput6" type="text" name="orderId" value="${order.orderid}" READONLY>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Buyer ID</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput5" type="text" name="buyerId" value="${order.buyerid}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Seller ID</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput" type="text" name="sellerId" value="${order.sellerid}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Product ID</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput2" type="text" name="productId" value="${order.productid}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Count</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput3" type="text" name="count" value="${order.count}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Order Total Price</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput4" type="text" name="totalPrice" value="${order.totalprice}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Order Address</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput8" type="text" name="address" value="${order.address}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Order Status</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="orderStatus">
                            <option value="1">未付款</option>
                            <option value="2">已付款，未发货</option>
                            <option value="3">已付款，已发货</option>
                            <option value="4">已签收</option>
                        </select>
                    </div>
                </div>

                <div style="margin:0 auto;width:200px;">
                    <div style="width:50%;padding:0;margin:0;float:left">
                        <button type="submit" class="btn btn-success">Modify</button>
                    </div>
                    <button type="button" class="btn btn-danger" onclick="location='/AdminOrderManagement'">Cancel</button>
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
<script src="assets/javascripts/Chart.js"></script>
<script src="assets/javascripts/script.js"></script>
</body>
</html>

