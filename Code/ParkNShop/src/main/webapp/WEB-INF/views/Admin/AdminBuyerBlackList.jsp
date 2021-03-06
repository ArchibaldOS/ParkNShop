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
                <a href="/AdminBuyerBlackList" class="list-group-item active">BlackList Management</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>Buyer Management</h1>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th class="hidden">Buyer ID</th>
                    <th>Buyer Account</th>
                    <th>Buyer Name</th>
                    <th>Buyer Address</th>
                    <th>Buyer Phone</th>
                    <th>Buyer Balance</th>
                    <th class="hidden">shopStatus</th>
                    <th>Operations</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="blacklistBuyer" items="${blacklistBuyers}">
                    <tr>
                        <td class="hidden"><c:out value="${blacklistBuyer.buyerId}"></c:out></td>
                        <td><c:out value="${blacklistBuyer.buyerAccount}"></c:out></td>
                        <td><c:out value="${blacklistBuyer.buyerName}"></c:out></td>
                        <td><c:out value="${blacklistBuyer.buyerAddress}"></c:out></td>
                        <td><c:out value="${blacklistBuyer.buyerPhone}"></c:out></td>
                        <td><c:out value="${blacklistBuyer.buyerBalance}"></c:out></td>
                        <td class="hidden"><c:out value="${blacklistBuyer.buyerStatus}"></c:out></td>
                        <td><div role="presentation" class="dropdown">
                            <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Onclick <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="/AdminBuyerDetail?buyerId=${blacklistBuyer.buyerId}">View</a></li>
                                <li><a href="/AdminSetBuyerStatusToNormal?buyerId=${blacklistBuyer.buyerId}">Remove</a></li>
                            </ul>
                        </div></td>
                    </tr>
                </c:forEach>
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
