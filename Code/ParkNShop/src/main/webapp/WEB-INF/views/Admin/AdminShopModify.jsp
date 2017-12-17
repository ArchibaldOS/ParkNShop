<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>AdminShopManagement</title>
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
                <a href="/AdminShopManagement" class="list-group-item">Register Management</a>
                <a href="/AdminShopList" class="list-group-item">ShopList</a>
                <a href="/AdminSearchShopByID" class="list-group-item">SearchShop</a>
                <a href="/AdminBlackList" class="list-group-item">BlackList Management</a>


            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>Shop Management</h1>
            </div>
            <form class="form-horizontal" role="form" action="/AdminShopModifyDO">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Seller ID</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput6" type="text" name="sellerId" value="${seller.sellerId}" READONLY>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Seller Name</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput" type="text" name="sellername" value="${seller.sellerName}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Shop Name</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput2" type="text" name="shopname" value="${seller.shopName}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Shop Introduction</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput3" type="text" name="shopintroduction" value="${seller.shopIntroduction}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Seller Phone</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput4" type="text" name="sellerphone" value="${seller.sellerPhone}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Seller Email</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput5" type="text" name="selleremail" value="${seller.sellerEmail}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">shopStatus</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="sellerstatus">
                            <option value="1">Approved</option>
                            <option value="3">Ban</option>
                        </select>
                    </div>
                </div>

                <div style="margin:0 auto;width:200px;">
                    <div style="width:50%;padding:0;margin:0;float:left">
                        <button type="submit" class="btn btn-success">Modify</button>
                    </div>
                    <button type="button" class="btn btn-danger" onclick="location='/AdminShopList'">Cancel</button>
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
