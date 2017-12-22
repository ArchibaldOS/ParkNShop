<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8"/>
        <title>Product Management</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
<link rel="stylesheet" href="assets/css2/button.css">
<!-- Fonts Online -->
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">


<!-- JavaScripts -->
<script src="assets/js3/vendors/modernizr.js"></script>

<style type="text/css">
  #productName{
  	word-break: break-all;white-space: normal;  
  }
  .button{
  	background-color:#FA8072;
  
  }
  .aaa{
border-radius: 20px;

}
 </style>
    </head>
    <body>

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
          <li><a href="contactManager.html">Contact Manager</a></li>
          <li><a href="#.">FAQ </a></li>
        </ul>
       </div>
    </div>
  </div>
  
  <header>
    <div class="container">
      <div class="logo"> <a href="#"><img src="assets/images/logo.png" alt="parknshop" ></a> </div>
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
          <ul class="nav" >
            <li><a href="/sellerHome">Home</a></li>
            <li><a href="/sellerProduct">Product</a></li>
            <li><a href="/sellerOrderPage">Order</a></li>
            <li><a href="/sellerSalesIncome">Sales</a></li>
          </ul>
        </div>
        
        <!-- NAV RIGHT -->
        <div class="nav-right"> </div>
      </div>
    </nav>
   
  </header>

            
            <div style="width:100%;text-align:right">
               <div style="margin-top:20px;width:95%;">
                <button class="button button-highlight button-pill button-large" onclick="window.location.href='/addProduct' ">
                Add new product</button>
               </div>
            </div>
           <c:set var="page" value="${requestScope.page }" /> 
           <c:choose>
           <c:when test="${page ne null and page.list ne null }">
           <div style="margin-left:10%;margin-right:10%;">
		     <c:forEach items="${page.list }" var="p">
			   <!-- single-product-start -->
                <div class="single-product" style="float:left;width:19%;margin-left:2%;margin-right:2%;margin-top:3%" >
                    <div class="single-product-img" style="width:100%;height:270px">
                            <img src="${pageContext.request.contextPath}/upload/productPicture/${p.productPicture}" alt="parknshop" width="100%" height="100%"/>
                    </div>
                    <div class="single-product-content" style="width:100%" id="productName">
                        <div class="product-title">
                            <h5>
                                <a href="#">${p.productName }</a>
                            </h5>
                        </div>                                                                
                        <div class="price-box">
                            <span class="price">￥${p.productPrice }</span>                                            
                        </div>
                        <div style="width:100%;height:50px">
                            <div style="width:100px;height:50px;float:left">
                                <a class="button button-pill button-small" href="/productUpdate?productId=${p.productId}">
                                update</a>
                            </div>
                            <div style="width:100px;height:50px;float:right">
                                <a class="button button-pill button-small" href="/deleteProduct?productId=${p.productId}">
                                delete</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- single-product-end -->
		   </c:forEach>
		    </div>
	       </c:when> 
	       <c:otherwise>
		     <div style="text-align: center;"><font size="10px"><strong>no found data!</strong></font></div>
	       </c:otherwise>                        
         </c:choose>
            <!-- mobile-menu-area-start -->
             <!-- modal-end -->
        <!-- all js here -->
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