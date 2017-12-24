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
                <a href="/AdminShopList" class="list-group-item active">ShopList</a>
                <a href="/AdminSearchShopByID" class="list-group-item">SearchShop</a>
                <a href="/AdminBlackList" class="list-group-item">BlackList Management</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>Shop Management</h1>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th class="hidden">sellerId</th>
                    <th>Seller Name</th>
                    <th>Shop Name</th>
                    <th>Shop Introduction</th>
                    <th class="hidden">shopStatus</th>
                    <th>Operations</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="approvedShop" items="${approvedShops}">
                <tr>
                    <td class="hidden"><c:out value="${approvedShop.sellerId}"></c:out></td>
                    <td><c:out value="${approvedShop.sellerName}"></c:out></td>
                    <td><c:out value="${approvedShop.shopName}"></c:out></td>
                    <td><c:out value="${approvedShop.shopIntroduction}"></c:out></td>
                    <td><div role="presentation" class="dropdown">
                        <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Onclick <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="/AdminShopDetail?sellerId=${approvedShop.sellerId}">View</a></li>
                            <li><a href="/AdminShopModify?sellerId=${approvedShop.sellerId}">modify</a></li>
                            <li><a href="/AdminDeleteShop?sellerId=${approvedShop.sellerId}">delete</a></li>
                        </ul>
                    </div></td>
                </tr>
                </c:forEach>
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
<script src="assets/javascripts/Chart.js"></script>
<script src="assets/javascripts/script.js"></script>
</body>
</html>
