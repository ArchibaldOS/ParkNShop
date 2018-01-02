<%@ page import="com.ten.ParkNShop.entity.Seller" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>AdminADDetail</title>
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
                <a href="/AdminADApplyingList" class="list-group-item">Applying AD</a>
                <a href="/AdminADList" class="list-group-item">AD List</a>
                <a href="/AdminADManagement" class="list-group-item">Top10 Products Management</a>
                <a href="/AdminADTop5StoriesManagement" class="list-group-item">Top5 Stories Management</a>
                <a href="/AdminADManagementHistory" class="list-group-item">AD Management History</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>AD Detail</h1>
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
                    <td>AD ID</td>
                    <td >${ad.ADId}</td>
                </tr>
                <tr>
                    <td>AD Type</td>
                    <c:choose>
                        <c:when test="${ad.ADType eq 1}">
                            <td><c:out value="Top10Product"></c:out></td>
                        </c:when>
                        <c:when test="${ad.ADType eq 2}">
                            <td><c:out value="Top5Store"></c:out></td>
                        </c:when>
                        <c:when test="${ad.ADType eq 1}">
                            <td><c:out value="Featured"></c:out></td>
                        </c:when>
                        <c:when test="${ad.ADType eq 1}">
                            <td><c:out value="Special"></c:out></td>
                        </c:when>
                        <c:when test="${ad.ADType eq 1}">
                            <td><c:out value="OnSale"></c:out></td>
                        </c:when>
                    </c:choose>
                </tr>
                <tr>
                    <td>AD Status</td>
                    <c:choose>
                        <c:when test="${ad.ADStatus eq 1}">
                            <td><c:out value="Applying"></c:out></td>
                        </c:when>
                        <c:when test="${ad.ADStatus eq 2}">
                            <td><c:out value="Approved"></c:out></td>
                        </c:when>
                        <c:when test="${ad.ADStatus eq 1}">
                            <td><c:out value="Refused"></c:out></td>
                        </c:when>
                        <c:when test="${ad.ADStatus eq 1}">
                            <td><c:out value="End"></c:out></td>
                        </c:when>
                    </c:choose>
                </tr>
                <tr>
                    <td>AD OtherID</td>
                    <td>${ad.otherId}</td>
                </tr>
                <tr>
                    <td>AD AdminID</td>
                    <td>${ad.adminId}</td>
                </tr>
                <tr>
                    <td>AD Name</td>
                    <td>${ad.ADName}</td>
                </tr>
                <tr>
                    <td>AD PhotoUrl</td>
                    <td><a href="${ad.ADPhotoUrl}">Click to See</a></td>
                </tr>
                <tr>
                    <td>AD ClickUrl</td>
                    <td><a href="${ad.ADClickUrl}">${ad.ADClickUrl}</a></td>
                </tr>
                <tr>
                    <td>AD Description</td>
                    <td>${ad.ADDescription}</td>
                </tr>
                <tr>
                    <td>AD Price</td>
                    <td>${ad.ADPrice}</td>
                </tr>
                <tr>
                    <td>AD Start Time</td>
                    <td>${ad.ADStartDate}</td>
                </tr>
                <tr>
                    <td>AD Time(Day)</td>
                    <td>${ad.ADTime}</td>
                </tr>

                <c:choose>
                    <c:when test="${type eq 'Applying'}">
                        <tr>
                            <td>
                                <div style="margin:0 auto;width:200px;">
                                    <button type="button" class="btn btn-success" onclick="location='/AdminADApprove?adId=${ad.ADId}'">Approve</button>
                                </div>
                            </td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="location='/AdminADDisApprove?adId=${ad.ADId}'">DisApprove</button>
                            </td>
                        </tr>
                    </c:when>
                    <c:when test="${type eq 'All'}">
                        <tr>
                            <td>
                                <div style="margin:0 auto;width:200px;">
                                    <button type="button" class="btn btn-success" onclick="location='/AdminADModify?adId=${ad.ADId}'">Modify</button>
                                </div>
                            </td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="location='/AdminADDelete?adId=${ad.ADId}'">Delete</button>
                            </td>
                        </tr>
                    </c:when>
                </c:choose>
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

