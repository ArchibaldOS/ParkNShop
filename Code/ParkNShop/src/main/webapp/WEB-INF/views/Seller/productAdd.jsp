<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <title>Add Product</title>
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
        <%--不知道在哪--%>
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
.aaa{
border-radius: 20px;
background-color: #FFA54F;
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
          <li><a href="contactManager.html">Contact Manager</a></li>
          <li><a href="#.">FAQ </a></li>
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
          <ul class="nav" >
            <li><a href="/sellerHome">Home</a></li>
            <li><a href="/sellerProductList">Product</a></li>
          </ul>
        </div>
        
        <!-- NAV RIGHT -->
        <div class="nav-right"> </div>
      </div>
    </nav>
   
  </header>
   <form class="form-horizontal" role="form" action="/productAdd" method="post" enctype="multipart/form-data" name="formen">
   <div class="form-group" style="margin-top:20px">
      <label class="col-sm-5 control-label">product name</label>
      <div class="col-sm-3">
         <input class="form-control" type="text" name="productName" autocomplete="off">
      </div>
   </div>

   <div class="form-group">
      <label for="disabledSelect" class="col-sm-5 control-label">product type</label>
      <div class="col-sm-3">
        <select id="disabledSelect" name="productType" class="form-control">
          <option value="1">TV& Home Theater</option>
          <option value="2">Computers & Tablets</option>
          <option value="3">Cell Phones</option>
          <option value="4">Cameras & Camcorders</option>
          <option value="5">Audio</option>
          <option value="6">Car Electronics & GPS</option>
          <option value="7">Video, Games, Movies & Music</option>
          <option value="8">Health, Fitness & Sports</option>
          <option value="9">Home & Office</option>
        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-5 control-label">product price</label>
      <div class="col-sm-3">
         <input type="text" class="form-control" name="productPrice" autocomplete="off">
      </div>
   </div>

   <div class="form-group">
      <label for="firstname" class="col-sm-5 control-label">store count</label>
      <div class="col-sm-3">
         <input type="text" class="form-control" name="storeCount" autocomplete="off">
      </div>
   </div>

   <div class="form-group">
      <label for="lastname" class="col-sm-5 control-label" >product introduction</label>
      <div class="col-sm-5">
         <textarea class="input-xlarge" id="textarea" rows="3" cols="37" name="productIntroduction" style="overflow-x:hidden;"></textarea>

      </div>
   </div>
   
   <div class="form-group">
       
     <label class="col-sm-5 control-label" for="fileInput">product picture</label>
     <div class="col-sm-3">
         <input type="file" name="file" id="picpath" style="display:none" onChange="document.formen.path.value=this.value"/>
         <input name="path" readonly/> <input type="button" value="Browse" onclick="document.formen.file.click()"/>
     </div>
   </div>

	
   <div class="form-actions" style="margin-left: 45%;">
        <button class="button  btn-default add-cart aaa" type="submit">
            <%--onclick="window.location.href='/addProduct' "--%>
                Upload</button>
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
</html>
   
