<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <title>Add Product</title>
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
            <li><a href="/listCommentBySellerId">Comment</a></li>
            <li><a href="/sellerADPage">Advertisement</a></li>
          </ul>
        </div>
		</div>
    </nav>

        

    </header>
   <form class="form-horizontal" role="form" action="/productAdd" method="post" onsubmit="return check();" enctype="multipart/form-data" name="formen">
   <div class="form-group" style="margin-top:20px">
      <label class="col-sm-5 control-label">product name</label>
      <div class="col-sm-3">
         <input id="productName" class="form-control" type="text" name="productName" autocomplete="off">
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
         <input id="productPrice" onkeyup="clearNoNum(this)" type="text" class="form-control" name="productPrice" autocomplete="off">
      </div>
   </div>

   <div class="form-group">
      <label for="firstname" class="col-sm-5 control-label">store count</label>
      <div class="col-sm-3">
         <input id="storeCount" onkeyup="clearStore(this)" type="number" max="10000" class="form-control" name="storeCount" autocomplete="off">
      </div>
   </div>

   <div class="form-group">
      <label for="lastname" class="col-sm-5 control-label" >product introduction</label>
      <div class="col-sm-5">
         <textarea id="productIntroduction" class="input-xlarge" id="textarea" rows="3" cols="37" name="productIntroduction" style="overflow-x:hidden;"></textarea>

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
        <button class="btn  btn-default add-cart aaa" type="submit">
                Upload</button>
    </div>
	
	
</form>
</div>
<script>
function check(){
	var name = document.getElementById("productName");
	var price = document.getElementById("productPrice");
	var store = document.getElementById("storeCount");
	var introduction = document.getElementById("productIntroduction");
	
	if(name.value == ''){
		alert("please input product name!");
		return false;
	}else if(price.value == ''){
		alert("please input product price!");
		return false;
	}else if(store.value == ''){
		alert("please input product store count!");
		return false;
	}else if(introduction.value == ''){
		alert("please input product introduction!");
		return false;
	}else{
		return true;
	}
	
	
}

function clearNoNum(obj){ 
    obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符  
    obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的  
    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数  
    if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额 
        obj.value= parseFloat(obj.value); 
    } 
} 
function clearStore(obj){ 
    obj.value = obj.value.replace(/[^\d]/g,"");  //清除“数字”和“.”以外的字符  
   
   
    if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额 
        obj.value= parseFloat(obj.value); 
    } 
} 

</script>

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
   
