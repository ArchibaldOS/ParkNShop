<%@ page import="com.ten.ParkNShop.entity.Seller" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>AdminADModify</title>
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
                <h1>AD Modify</h1>
            </div>
            <form class="form-horizontal" role="form" action="/AdminADModifyDo">
                <div class="form-group">
                    <label class="col-sm-2 control-label">AD ID</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput6" type="text" name="adId" value="${ad.ADId}" READONLY>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">AD Other ID</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput10" type="text" name="adId" value="${ad.otherId}" READONLY>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">AD Status</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="adStatus" id="adStatus">
                            <option value=1>Applying</option>
                            <option value=2>Approved</option>
                            <option value=3>Refused</option>
                            <option value=4>End</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">AD Type</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="adType" id="adType">
                            <option value=1>Top10Product</option>
                            <option value=2>Top5Store</option>
                            <option value=3>Featured</option>
                            <option value=4>Special</option>
                            <option value=5>OnSale</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">AD Photo Url</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput2" type="text" name="adPhotoUrl" value="${ad.ADPhotoUrl}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">AD Click Url</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput5" type="text" name="adClickUrl" value="${ad.ADClickUrl}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">AD Description</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput9" type="text" name="adDescription" value="${ad.ADDescription}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">AD Price</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput7" type="text" name="adPrice" value="${ad.ADPrice}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">AD Time</label>
                    <div class="col-sm-10">
                        <input class="form-control" id="focusedInput8" type="text" name="adTime" value="${ad.ADTime}">
                    </div>
                </div>


                <div style="margin:0 auto;width:200px;">
                    <div style="width:50%;padding:0;margin:0;float:left">
                        <button type="submit" class="btn btn-success">Modify</button>
                    </div>
                    <button type="button" class="btn btn-danger" onclick="location='/AdminADManagement'">Cancel</button>
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
<script  type = "text/javascript" >
    function change(){
        document.getElementById("adStatus")[${ad.ADStatus - 1}].selected=true;
        document.getElementById("adType")[${ad.ADType - 1}].selected=true;
    }
    window.onload = change;
</script>
</body>
</html>

