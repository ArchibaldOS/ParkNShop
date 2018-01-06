<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <title>Shop ad</title>
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

.bbb{
border-radius: 20px;
background-color: blue;
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
        <nav  class="navbar nav-pills ownmenu" style="background-color:#009ACD;">
            <div class="container" style="margin:10px;">
                <div class="logo" style="float:left;margin-left:40px;"> <a href="#"><img src="assets/images/logo.png" alt="" ></a> </div>
                <div style="float:right;">
                    <ul class="nav navbar-nav " >
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

    <div class="container">
        <div class="row">
            <div class="col-md-2" style="margin-top:9%">
                <div class="list-group">
                    <a href="/sellerADPage" class="list-group-item active">Shop Ad</a>
                    <a href="/sellerProductADPage" class="list-group-item">Product Ad</a>
                </div>
            </div>
            <div class="col-md-10">
                <div class="page-header">
                    <h4>Shop Advertising History</h4>
                </div>
                <c:set var="ads" value="${requestScope.shopAD }" />
                <table class="table">
                    <thead>
                    <tr>
                        <th>AD Id</th>
                        <th>Status</th>
                        <th>Ad name</th>
                        <th>AD Price</th>
                        <th>AD Description</th>
                        <th>StartDate</th>
                        <th>AD Time</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="ad" items="${ads}">
                        <tr>
                            <td><c:out value="${ad.ADId}"></c:out></td>
                            <c:choose>
                                <c:when test="${ad.ADStatus eq 1}"><td>Applying</td></c:when>
                                <c:when test="${ad.ADStatus eq 2}"><td>Showing</td></c:when>
                                <c:when test="${ad.ADStatus eq 3}"><td>End</td></c:when>
                            </c:choose>
                            <td><c:out value="${ad.ADName}"></c:out></td>
                            <td>HK$${ad.ADPrice}</td>
                            <td><c:out value="${ad.ADDescription}"></c:out></td>
                            <td><c:out value="${ad.ADStartDate}"></c:out></td>
                            <td><c:out value="${ad.ADTime}"></c:out></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
               
            </div>
            
        </div>
        <div class="page-header" style="width:60%;margin-left:200px;">
                <h4>Shop Advertising Application</h4>
          </div> 
            <div style="float:left;margin-left:150px;">
            <form class="form-horizontal" role="form" onsubmit="return check()" action="/sellerAD" method="post" enctype="multipart/form-data" name="formen">

                <div class="form-group">

                    <label class="col-sm-5 control-label" for="fileInput">AD Name</label>
                    <div class="col-sm-3">
                        <input id="ADName" type="text" class="form-control" name="ADName" autocomplete="off">
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastname" class="col-sm-5 control-label" >AD Photo</label>
                    <div class="col-sm-5">
                        <input type="file" name="file" id="file" style="display:none" onChange="document.formen.path.value=this.value"/>
                        <input name="path" readonly/> <input type="button" value="Browse" onclick="document.formen.file.click()"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastname" class="col-sm-5 control-label" >AD Time</label>
                    <div class="col-sm-5" style="display: inline-block;">
                        <input id="ADTime" onChange="clearStore(this)" type="number" max="90" class="form-control" name="ADTime" autocomplete="off" value="1">
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastname" class="col-sm-5 control-label" >AD Price</label>
                    <div class="col-sm-5" id="adprice" style="margin-top:8px;">
                        HK$200
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastname" class="col-sm-5 control-label" >AD Description</label>
                    <div class="col-sm-5">
                        <textarea class="input-xlarge" id="ADDescription" rows="3" cols="37" name="ADDescription" style="overflow-x:hidden;"></textarea>
                    </div>
                </div>

                <div class="form-actions" style="margin-left: 45%;">
                    <button class="btn  btn-default bbb" type="submit">
                        Submit</button>
                </div>
            </form>
            
    </div>
</div>
<script>
	function priceChange(){
		var time = document.getElementById("adtime").value;
		var price = document.getElementById("adprice");
		price.innerHTML = 'HK$' + time * 200;
	}
	function check(){
		var name = document.getElementById("ADName");
		var file = document.getElementById("file");
		var time = document.getElementById("ADTime");
		var introduction = document.getElementById("ADDescription");
		
		if(name.value == ''){
			alert("please input AD name!");
			return false;
		}else if(file.value == ''){
			alert("please upload AD picture!");
			return false;
		}else if(time.value == ''){
			alert("please input AD time!");
			return false;
		}else if(introduction.value == ''){
			alert("please input AD description!");
			return false;
		}else{
			return true;
		}
		
		
	}
	function clearStore(obj){ 
	    obj.value = obj.value.replace(/[^\d]/g,"");  //清除“数字”和“.”以外的字符  
	   
	   
	    if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额 
	        obj.value= parseFloat(obj.value); 
	    } 
	    var price = document.getElementById("adprice");
		price.innerHTML = 'HK$' + obj.value * 200;
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