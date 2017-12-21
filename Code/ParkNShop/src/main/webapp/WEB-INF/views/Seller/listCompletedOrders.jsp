<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <title>Order Management</title>
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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="assets/rs-plugin/css/settings.css" media="screen" />

    <!-- StyleSheets -->
    <link rel="stylesheet" href="assets/css2/ionicons.min.css">
    <link rel="stylesheet" href="assets/css2/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css2/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css2/main.css">
    <link rel="stylesheet" href="assets/css2/style.css">
    <link rel="stylesheet" href="assets/css2/responsive.css">
    <link rel="stylesheet" href="assets/css2/bootstrap-maizi.css">
    <!-- Fonts Online -->
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">


    <!-- JavaScripts -->
    <script src="assets/js/vendors/modernizr.js"></script>

    <style type="text/css">
        table.hovertable {
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;
        }

        table.hovertable tr {
            background-color:#d4e3e5;
        }
        table.hovertable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
            font-size:20px;
        }
        li .aaa{
            width:200px;
            margin:0 auto;

        }

    </style>
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
        <div class="container">
            <div class="logo"> <a href="#"><img src="assets/images/logo.png" alt="" ></a> </div>
            <div class="search-cate">
                <select class="selectpicker">
                    <option> All Categories</option>
                    <option> TV& Home Theater</option>
                    <option> Computers & Tablets</option>
                    <option> Cell Phones</option>
                    <option> Cameras & Camcorders</option>
                    <option> Audio</option>
                    <option> Car Electronics & GPS</option>
                    <option> Video, Games, Movies & Music </option>
                    <option> Health, Fitness & Sports</option>
                    <option> Home & Office</option>
                </select>
                <input type="search" placeholder="Search entire store here...">
                <button class="submit" type="submit"><i class="icon-magnifier"></i></button>
            </div>
        </div>

        <!-- Nav -->
        <nav class="navbar ownmenu">
            <div class="container">



                <!-- NAV -->
                <div class="collapse navbar-collapse" id="nav-open-btn">
                    <ul class="nav aaa" >
					<li><a href="/sellerHome">Home</a></li>
					<li><a href="/sellerProduct">Product</a></li>
					<li><a href="/sellerOrderPage">Order</a></li>
				</ul>
                </div>

                <!-- NAV RIGHT -->
                <div class="nav-right"> </div>
            </div>
        </nav>

    </header>

    <div class="container">
        <div class="row">
            <div class="col-md-2" style="margin-top:9%">
                <div class="list-group">
                    <a href="/sellerOrderManagement" class="list-group-item active">Completed order</a>
                    <a href="/sellerUncompletedOrder" class="list-group-item">Uncompleted order</a>
                </div>
            </div>
            <div class="col-md-10">
                <div class="page-header">
                    <h1>Order Management</h1>
                </div>
                <c:set var="orders" value="${requestScope.page }" />
                <table class="table">
                    <thead>
                    <tr>
                        <th>orderId</th>
                        <th>Seller</th>
                        <th>Buyer</th>
                        <th>productId</th>
                        <th>Count</th>
                        <th>totalPrice</th>
                        <th>Address</th>
                        <th>Time</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orders.list}">
                        <tr>
                            <td><c:out value="${order.orderId}"></c:out></td>
                            <td><c:out value="${order.sellerId}"></c:out></td>
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
                <nav class="pull-right">
                    <ul class="pagination">
						<c:if test="${orders.current gt 1 }">
							<li class="disabled">
                            	<a href="/sellerOrderManagement?cur=${orders.current-1 }" aria-label="Previous">
                                	<span aria-hidden="true">&laquo;</span>
                            	</a>
                        	</li>
                        </c:if>
                        <c:forEach begin="1" end="${orders.total }" var="cur">
                        	<li><a href="/sellerOrderManagement?cur=${cur}">${cur }</a></li>
                        </c:forEach>
                        <c:if test="${orders.current lt orders.total }">
                        	<li>
                            	<a href="/sellerOrderManagement?cur=${orders.current+1 }" aria-label="Next">
                                	<span aria-hidden="true">&raquo;</span>
                            	</a>
                        	</li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
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
</body>

</html>