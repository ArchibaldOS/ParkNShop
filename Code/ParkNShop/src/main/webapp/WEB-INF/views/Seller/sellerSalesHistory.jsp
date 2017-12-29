<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <title>Sales History</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Mobile Specific Meta  -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,700,900,100' rel='stylesheet' type='text/css'>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css1/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css1/font-awesome.min.css" />
    <!-- Custom CSS -->
    <link href="style1.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/rs-plugin/css/settings.css" media="screen" />

    <!-- StyleSheets -->
    <link rel="stylesheet" href="assets/css2/ionicons.min.css">
    <link rel="stylesheet" href="assets/css2/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css2/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css2/main.css">
    <link rel="stylesheet" href="assets/css2/style.css">
    <link rel="stylesheet" href="assets/css2/responsive.css">
</head>
<body>
<!-- Page Wrapper -->
<div id="wrap" class="layout-1">
    <!-- Top bar -->
    <div class="top-bar">
        <div class="container">
            <p>Welcome to ParkNShop!</p>
            <div class="right-sec">
                <ul>
                    <%
                        try {
                            String user = (String) session.getAttribute("seller");

                            if (user == null) {
                    %>
                    <ul>
                        <li><a href="/sellerLogin">login</a></li>
                        <li><a href="/sellerRegister">register</a></li>
                    </ul>
                    <%
                        }
                    } catch (Exception e) {
                    %>
                    <li>${ sessionScope.seller.sellerEmail}</li>
                    <%
                            out.println("<li><a href = '/sellerLogout' >log out</a></li>");
                        }
                    %>
                    <li><a href="#">Contact Manager</a></li>
                    <li><a href="#">FAQ </a></li>
                </ul>
            </div>
        </div>
    </div>
    <header>
        <nav  class="navbar nav-pills ownmenu" style="background-color:#009ACD;">
        <div class="container" style="margin:10px;">
		<div class="logo" style="float:left;margin-left:40px;"> <a href="#"><img src="assets/images/logo.png" alt="" ></a> </div>
        <div style="float:right;">
          <ul class="nav navbar-nav bbb" >
            <li><a href="/sellerHome">Home</a></li>
            <li><a href="/sellerProduct">Product</a></li>
            <li><a href="/sellerOrderPage">Order</a></li>
            <li><a href="/sellerSalesIncome">Sales</a></li>
          </ul>
        </div>
		</div>
    </nav>

        

    </header>

    <div class="container">
        <div class="row">
            <div class="col-md-2" style="margin-top:9%">
                <div class="list-group" style="text-align: center;">
                    <a href="/sellerSalesIncome" class="list-group-item">Shop Income</a>
                    <a href="/sellerSalesHistory" class="list-group-item active">Sales History</a>
                </div>
            </div>
            <div class="col-md-10">
                <div class="page-header">
                    <h5>Sales Management</h5>
                </div>
                <div class="row">
                    <div class="col-md-10">
                        <form action="#">
                            <div class="panel-body" id="select_time_div">
                                <span>Please Select the Time of Sales</span><br>
                                <span>Type</span>
                                <select id="select_time_type" onchange="selected_type()" name="select_type" style="height:25px">
                                    <option value=""></option>
                                    <option value="Daily">Daily</option>
                                    <option value="Weekly">Weekly</option>
                                    <option value="Monthly">Monthly</option>
                                    <option value="Yearly">Yearly</option>
                                </select>
                                <select id="time_select_year" name="time_year" hidden></select>
                                <input type="date" name="time" id="time_select" style="height:25px" hidden>
                                <input type="submit" value="Search" id="search_submit" hidden>
   							</div>
                        </form>
                        
                            <div class="panel-heading"><c:out value="${time}"></c:out> Sales's Condition is Below：</div>
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>orderId</th>
                                        <th>Buyer</th>
                                        <th>productId</th>
                                        <th>Count</th>
                                        <th>totalPrice</th>
                                        <th>Address</th>
                                        <th>Time</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td><c:out value="${order.orderId}"></c:out></td>
                                            <td><c:out value="${order.buyerId}"></c:out></td>
                                            <td><c:out value="${order.productId}"></c:out></td>
                                            <td><c:out value="${order.count}"></c:out></td>
                                            <td><c:out value="${order.totalPrice}"></c:out></td>
                                            <td><c:out value="${order.address}"></c:out></td>
                                            <td><c:out value="${order.orderTime}"></c:out></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- JavaScripts -->
<script src="assets/js/vendors/modernizr.js"></script>
<script src="assets/js2/vendors/jquery/jquery.min.js"></script>
<script src="assets/js2/vendors/wow.min.js"></script>
<script src="assets/js2/vendors/bootstrap.min.js"></script>
<script src="assets/js2/vendors/own-menu.js"></script>
<script src="assets/js2/vendors/jquery.sticky.js"></script>
<script src="assets/js2/vendors/owl.carousel.min.js"></script>

<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script type="text/javascript" src="assets/rs-plugin/js/jquery.tp.t.min.js"></script>
<script type="text/javascript" src="assets/rs-plugin/js/jquery.tp.min.js"></script>
<script src="assets/js2/main.js"></script>
<script src="assets/js/vendors/modernizr.js"></script>
<script src="assets/javascripts/Chart.js"></script>

<script>
    // 时间选择控制代码
    function selected_type() {
        var type = document.getElementById("select_time_type");
        var time = document.getElementById("time_select");
        var time_year = document.getElementById("time_select_year");
        var submit = document.getElementById("search_submit");
        var currentTime = new Date();
        var currentYear = currentTime.getFullYear();
        var currentMonth = (currentTime.getMonth() + 1) < 10 ? "0" + (currentTime.getMonth()+ 1): "" + (currentTime.getMonth() + 1);
        var currentWeek = (((new Date())-(new Date("2017-01-01")))/(24*60*60*7*1000)|0) +1;
        var currentDay = currentTime.getDate() < 10 ? "0" + currentTime.getDate(): "" + currentTime.getDate();
        time.hidden = false;
        time_year.hidden = true;
        switch (type.value){
            case "Daily": {
                time.type="date";
                time.value = currentYear + "-" + currentMonth + "-"+ currentDay;
                break;
            }
            case "Weekly": {
                time.type="week";
                time.value = currentYear + "-W" + currentWeek;
                break;
            }
            case "Monthly": {
                time.type="month";
                time.value = currentYear + "-" + currentMonth;
                break;
            }
            case "Yearly": {
                time.hidden=true;
                time_year.hidden = false;
                for(var i = currentYear; i >= 2014; i--){
                    time_year.appendChild(new Option(i + "", i + ""));
                }
                break;
            }
        }
        submit.hidden = false;
    }
</script>
</body>
</html>