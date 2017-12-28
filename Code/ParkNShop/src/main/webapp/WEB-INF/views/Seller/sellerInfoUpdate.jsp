<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <title>Modify Information</title>
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

<!-- Fonts Online -->
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">


<!-- JavaScripts -->
<script src="assets/js3/vendors/modernizr.js"></script>

<style type="text/css">
.aaa{
border-radius: 20px;
background-color: blue;
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
  <c:set var="s" value="${requestScope.seller }" /> 
   <form class="form-horizontal" role="form" action="/updateSeller" method="post" enctype="multipart/form-data" name="formen">
   
   <div class="form-group" style="margin-top:20px">
      <label class="col-sm-5 control-label">seller name</label>
      <div class="col-sm-3">
         <input class="form-control" type="text" name="sellerName" autocomplete="off" value="${s.sellerName}"/>
      </div>
   </div>

    <div class="form-group">
      <label class="col-sm-5 control-label">shop name</label>
      <div class="col-sm-3">
         <input type="text" class="form-control" name="shopName"  value="${s.shopName}"/>
      </div>
   </div>

   <div class="form-group">
      <label for="firstname" class="col-sm-5 control-label">shop E-mail</label>
      <div class="col-sm-3">
         <input type="text" class="form-control" name="sellerEmail" value="${s.sellerEmail}" />
      </div>
   </div>

	<div class="form-group">
      <label for="firstname" class="col-sm-5 control-label">shop phone</label>
      <div class="col-sm-3">
         <input type="text" class="form-control" name="sellerPhone" value="${s.sellerPhone}" />
      </div>
   </div>
  
   <div class="form-group">
      <label for="lastname" class="col-sm-5 control-label" >shop introduction</label>
      <div class="col-sm-5">
         <textarea class="input-xlarge" id="textarea" rows="3" cols="37" name="shopIntroduction" style="overflow-x:hidden;">${s.shopIntroduction}</textarea>
      </div>
   </div>

   <div class="form-actions" style="margin-left: 45%;">
        <button class="btn  btn-default add-cart aaa" type="submit">
                Update</button>
   </div>
	
</form>


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
<%
	 if(request.getAttribute("emailUsed") != null){
	 
		 	out.println("<script type=\"text/javascript\">alert('Update Fails! The E-mail has been registered...')</script>");
		}
	 
%> 
</html>
   
