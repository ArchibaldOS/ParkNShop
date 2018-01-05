<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <title>Sales Management</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Mobile Specific Meta  -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css2/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css2/font-awesome.min.css" />
    <!-- Custom CSS -->
    <link href="style1.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
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
                        <li><a href="Userlogin.jsp">login</a></li>
                        <li><a href="Userregister.jsp">register</a></li>
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
            <li><a href="/listCommentBySellerId">Comment</a></li>
          </ul>
        </div>
		</div>
    </nav>

        

    </header>

    <div class="container">
        <div class="row">
            <div class="col-md-2" style="margin-top:9%">
                <div class="list-group" style="text-align: center;">
                    <a href="/sellerSalesIncome" class="list-group-item active">Shop Income</a>
                    <a href="/sellerSalesHistory" class="list-group-item">Sales History</a>
                </div>
            </div>
            <div class="col-md-10">
                <div class="page-header">
                    <h5>Sales Management</h5>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <form action="#">
                            <div class="panel-body" id="select_time_div">
                                <span>Please Select the Time of Sales</span><br>
                                <Span>Type</Span>
                                <select id="select_time_type" onchange="selected_type()" name="select_type" style="height:25px">
                                    <option value=""></option>
                                    <option value="Daily">Daily</option>
                                    <option value="Weekly">Weekly</option>
                                    <option value="Monthly">Monthly</option>
                                    <option value="Yearly">Yearly</option>
                                </select>
                                <select id="time_select_year" name="time_year" hidden></select>
                                <input type="date" name="time" id="time_select" style="height:25px"hidden>
                                <input type="submit" value="Search" id="search_submit" hidden>
                            </div>
                        </form>
                        <c:if test="${counts != null}">
                            <div class="panel-heading"><c:out value="${time}"></c:out> Sales's Condition is Below：</div>
                        </c:if>

                        <div class="panel-heading">Sales's Count Condition</div>
                        <div class="panel-body">
                            <canvas id="countChart" class="col-md-12"></canvas>
                        </div><div class="panel-heading">Sales's Money Condition</div>
                        <div class="panel-body">
                            <canvas id="moneyChart" class="col-md-12"></canvas>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <span>Commission : ${commission} </span>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Total income</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>HK$${requestScope.income }</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- JavaScripts -->
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
        var currentWeek = (((new Date())-(new Date("2017-01-01")))/(24*60*60*7*1000)|0) - 51;// 2018 年减去 2017 的周数
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
                if(currentWeek < 10){
                    time.value = currentYear + "-W0" + currentWeek;
                }else{
                    time.value = currentYear + "-W" + currentWeek;
                }
                console.log(currentYear);
                console.log(currentWeek);
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

<script>
    var ctx = document.getElementById("countChart").getContext("2d");
    var lineChartData = {
        //X坐标数据
        labels : ["${labels[0]}", "${labels[1]}","${labels[2]}","${labels[3]}",
            "${labels[4]}","${labels[5]}","${labels[6]}","${labels[7]}","${labels[8]}","${labels[9]}","${labels[10]}","${labels[11]}"],
        datasets : [
            {
                //统计表的背景颜色
                fillColor : "rgba(0,0,255,0.5)",
                //统计表画笔颜色
                strokeColor : "#f60",
                //点的颜色
                pointColor : "#000;",
                //点边框的颜色
                pointStrokeColor : "red",
                //鼠标触发时点的颜色
                pointHighlightFill : "red",
                //鼠标触发时点边框的颜色
                pointHighlightStroke : "#000",
                //Y坐标数据,以数组中的最大值来确定y轴的最大值
                data : [${counts[0]}, ${counts[1]},${counts[2]},${counts[3]},${counts[4]},${counts[5]}, ${counts[6]},
                    ${counts[7]},${counts[8]},${counts[9]},${counts[10]}, ${counts[11]}]
            }
        ]
    };
    var myNewChart = new Chart(ctx).Line(lineChartData, {
        responsive: true
    });

    var ctx = document.getElementById("moneyChart").getContext("2d");
    var lineChartData = {
        //X坐标数据
        labels : ["${labels[0]}", "${labels[1]}","${labels[2]}","${labels[3]}",
            "${labels[4]}","${labels[5]}","${labels[6]}","${labels[7]}","${labels[8]}","${labels[9]}","${labels[10]}","${labels[11]}"],
        datasets : [
            {
                fillColor : "rgba(0,255,0,0.5)",
                strokeColor : "rgba(92, 184, 92, 1)",
                pointColor : "rgba(23, 126, 23, 1)",
                pointStrokeColor : "#fff",
                pointHighlightFill : "#fff",
                pointHighlightStroke : "rgba(151,187,205,1)",
                data : [${moneys[0]}, ${moneys[1]}, ${moneys[2]},${moneys[3]},${moneys[4]},${moneys[5]}, ${moneys[6]},
                    ${moneys[7]}, ${moneys[8]},${moneys[9]},${moneys[10]},${moneys[11]}]
            }
        ]
    };
    var myNewChart2 = new Chart(ctx).Line(lineChartData, {
        responsive: true
    });
</script>


</body>
</html>
