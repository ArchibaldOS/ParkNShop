<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>AdminSalesManagement</title>
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
                <a href="/AdminSalesManagement" class="list-group-item active">Sales&nbsp;&nbsp;&nbsp;&nbsp; Management</a>
                <a href="/AdminSalesModifyCommission" class="list-group-item">Modify&nbsp;&nbsp;&nbsp;&nbsp; Commission</a>
                <a href="/AdminSalesCommissionHistory" class="list-group-item">Commission&nbsp;&nbsp;&nbsp;&nbsp; Management</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>Sales Management</h1>
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
                    <span>Commission:0.2</span>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>Aspect</th>
                            <th>Income</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">Sales</th>
                            <td>50000</td>
                        </tr>
                        <tr>
                            <th scope="row">ADs</th>
                            <td>10000</td>
                        </tr>
                        </tbody>
                    </table>
                    <span>Income:60000</span>
                </div>
            </div>
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
