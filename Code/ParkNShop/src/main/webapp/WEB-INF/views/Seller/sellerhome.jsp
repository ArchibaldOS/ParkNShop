<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <title>Seller Home</title>
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

table.hovertable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: rgba(169,163,174,0.51);
	font-size:20px;
}
  .aaa{
border-radius: 20px;

}
.mybtn{
	border-radius: 20px;
	width:100px;
	height:30px;
	background-color:rgb(81, 130, 187);
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
        
        <div style="text-align: center;">
         <c:set var="s" value="${sessionScope.seller }" />
        	<table class="table table-striped hovertable" style="width:80%;margin-left:10%;margin-right:10%;margin-top:5%;">
        		<tr onmouseover="this.style.backgroundColor='#ADD8E6';" onmouseout="this.style.backgroundColor='#F7F7F7';">
        			<td width="200px" style="font-size: 20px;">shop name</td>
        			<td>${s.shopName }</td>
        		</tr>
        		<tr  onmouseover="this.style.backgroundColor='#ADD8E6';" onmouseout="this.style.backgroundColor='#FFFFFF';">
        			<td width="200px" style="font-size: 20px;">owner name</td>
        			<td>${s.sellerName }</td>
        		</tr>
        		<tr  onmouseover="this.style.backgroundColor='#ADD8E6';" onmouseout="this.style.backgroundColor='#F7F7F7';">
        			<td width="200px" style="font-size: 20px;">shop phone</td>
        			<td>${s.sellerPhone }</td>
        		</tr>
        		<tr  onmouseover="this.style.backgroundColor='#ADD8E6';" onmouseout="this.style.backgroundColor='#FFFFFF';">
        			<td width="200px" style="font-size: 20px;">shop E-mail</td>
        			<td>${s.sellerEmail }</td>
        		</tr>
				<tr onmouseover="this.style.backgroundColor='#ADD8E6';" onmouseout="this.style.backgroundColor='#F7F7F7';">
        			<td width="200px" style="font-size: 20px;">balance</td>
        			<td>$${s.sellerBalance }</td>
        		</tr>
        		<tr  onmouseover="this.style.backgroundColor='#ADD8E6';" onmouseout="this.style.backgroundColor='#FFFFFF';">
        			<td width="200px" style="font-size: 20px;">shop Introduction</td>
        			<td>${s.shopIntroduction }</td>
        		</tr>
        		<tr  onmouseover="this.style.backgroundColor='#ADD8E6';" onmouseout="this.style.backgroundColor='#F7F7F7';">
        			<td width="200px" style="font-size: 20px;">shop status</td>
        			<c:if test="${s.shopStatus ==0}">
        			 <td><font color="#FFA500">Being processed</font></td>
        			</c:if>
        			<c:if test="${s.shopStatus ==1}">
        			 <td><font color="green">Application Passed</font></td>
        			</c:if>
        			<c:if test="${s.shopStatus ==2}">
        			 <td><font color="red">Application Rejected</font></td>
        			</c:if>
        			<c:if test="${s.shopStatus ==3}">
        			 <td><strong>On Blacklist</strong></td>
        			</c:if>
        		</tr>
        	</table>
            <div class="form-actions" style="text-align:center;margin-top:2%;">
        		<button class="mybtn" type="submit" onclick="window.location.href='/sellerUpdate'">
                Update</button>
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
<%
	if(request.getAttribute("status")!=null){
	 if((int)request.getAttribute("status") == 0){
	 
		 	out.println("<script type=\"text/javascript\">alert(\"Can't operate because your shop is being audited...\")</script>");
	 }
	 if((int)request.getAttribute("status") == 2){
	 
 		    out.println("<script type=\"text/javascript\">alert(\"Can't operate because your application has been rejected...\")</script>");
	 }
	 if((int)request.getAttribute("status") == 3){
		 
		    out.println("<script type=\"text/javascript\">alert(\"Can't operate because you are on the Black List...\")</script>");
	 } 
	}

	 
%> 
</html>