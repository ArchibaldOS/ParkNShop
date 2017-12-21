<%@ page import="java.util.List" %>
<%@ page import="com.ten.ParkNShop.entity.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!-- Document Title -->
  <title>My Orders</title>

  <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
  <link rel="stylesheet" type="text/css" href="assets/rs-plugin/css/settings.css" media="screen" />

  <!-- StyleSheets -->
  <link rel="stylesheet" href="assets/css2/ionicons.min.css">
  <link rel="stylesheet" href="assets/css2/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css2/font-awesome.min.css">
  <link rel="stylesheet" href="assets/css2/main.css">
  <link rel="stylesheet" href="assets/css2/style.css">
  <link rel="stylesheet" href="assets/css2/responsive.css">
  <link rel="stylesheet" href="assets/css/myCart.css">

  <!-- Fonts Online -->
  <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

  <link href='https://fonts.googleapis.com/css?family=Lato:400,300,700,900,100' rel='stylesheet' type='text/css'>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="assets/css/bootstrap.min2.css" />
  <link rel="stylesheet" href="assets/css/font-awesome.min2.css" />
  <!-- Custom CSS -->
  <link href="assets/css/style3.css" rel="stylesheet">
	<!-- Latest Bootstrap min CSS -->
	<link rel="stylesheet" href="assets/css/orderbootstrap.min.css" type="text/css">
	<!-- Style CSS -->
	<link rel="stylesheet" href="assets/css/ordernav.css" type="text/css">
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
<style type="text/css">

.hidecontent {display:none;}
</style>
  <!-- JavaScripts -->
  <script src="assets/js/vendors/modernizr.js"></script>
  <script src="assets/js/myCart.js"></script>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <script language="javascript">
    function switchTag(tag,content)
    {
        for(i=1; i<6; i++)
        {
            if ("tag"+i==tag)
            {
                document.getElementById(tag).getElementsByTagName("a")[0].className="selectli"+i;
                document.getElementById(tag).getElementsByTagName("a")[0].getElementsByTagName("span")
                        [0].className="selectspan"+i;
            }else{
                document.getElementById("tag"+i).getElementsByTagName("a")[0].className="";
                document.getElementById("tag"+i).getElementsByTagName("a")[0].getElementsByTagName("span")
                        [0].className="";
            }
            if ("content"+i==content)
            {
                document.getElementById(content).className="";
            }else{
                document.getElementById("content"+i).className="hidecontent";
            }
            document.getElementById("content").className=content;
        }
    }
</script>
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
            try{
              String user = (String)session.getAttribute( "Buyer" );
              if ( user == null )
              {
          %>
          <ul>
            <li><a href="/BuyerLogin">Login</a></li>
            <li><a href="/BuyerRegister">Register</a></li>
          </ul>
          <%
            }
          }catch(Exception e){
          %>
          <li>${ sessionScope.Buyer.buyerAccount}</li>
          <%
              out.println( "<a href = '/buyerLogout' >Logout</a>" );

            }
          %>
          <li><a href="/BuyerAccount">My Account</a></li>
          <li><a href="/ContactManager">Contact Manager</a></li>
        </ul>
      </div>
    </div>
  </div>

  <!-- Header -->
  <header>
    <div class="container">
      <div class="logo"> <a href="/BuyerIndex"><img src="assets/images/logo.png"></a> </div>
      <form class="search-cate" action="/buyerSearchProduct">
        <select class="selectpicker" name="searchType">
          <option value="0"> All Categories</option>
          <option value="1"> TV& Home Theater</option>
          <option value="2"> Computers & Tablets</option>
          <option value="3"> Cell Phones</option>
          <option value="4"> Cameras & Camcorders</option>
          <option value="5"> Audio</option>
          <option value="6"> Car Electronics & GPS</option>
          <option value="7"> Video, Games, Movies & Music </option>
          <option value="8"> Health, Fitness & Sports</option>
          <option value="9"> Home & Office</option>
        </select>
        <input type="search" placeholder="Search entire store here..." name="searchInfo">
        <button class="submit" type="submit"><i class="icon-magnifier"></i></button>
      </form>

      <!-- Cart Part -->
      <%--添加一个判断--%>
      <%--判断是否为游客，若为游客则点击购物车跳转到用户登录界面--%>
      <%--若不是游客，则判断其购物车是否为空，若为空则显示购物车内暂无商品--%>
      <%--若购物车内有商品则显示购物车内商品--%>
      <%
        try{
          String user = (String)session.getAttribute( "Buyer" );
          if ( user == null )
          {
      %>
      <ul class="nav navbar-right cart-pop" href="/BuyerLogin"></ul>
      <%
        }
      }catch(Exception e) {

        }
      %>
      
      <ul class="nav navbar-right cart-pop">
        <c:choose>
        <c:when test="${buyerCart.getItems eq null}">
          <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          <span class="itm-cont">0</span> <i class="flaticon-shopping-bag"></i>
          <strong>My Cart</strong> <br>
          <span>0 item - $0</span></a>
          <ul class="dropdown-menu">
              No product yet
          </ul>
        </li>
        </c:when>
        <c:otherwise>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          <span class="itm-cont">${buyerCart.getProductAmount}</span> <i class="flaticon-shopping-bag"></i>
          <strong>My Cart</strong> <br>
          <span>${buyerCart.getProductAmount} item(s) - ${buyerCart.getTotalPrice}</span></a>
          <ul class="dropdown-menu">
            <c:forEach var="buyerItem" items="${buyerCart.getItems}">
            <li>
              <div class="media-left"> <a href="#." class="thumb"> <img src="assets/images/item-img-1-1.jpg" class="img-responsive" alt="" > </a> </div>
              <div class="media-body"> <a href="#." class="tittle"></a> <span> ${buyerItem.getProduct.getProductPrice}* ${buyerItem.getAmount}</span> </div>
            </li></c:forEach>
            <li class="btn-cart"> <a href="/BuyerCart" class="btn-round">View Cart</a> </li>
          </ul>
        </li>
        </c:otherwise>
        </c:choose>
      </ul>
    </div>
    <br>
		<section class="top-md-menu">
			<div class="container">
				<div class="main-menu">
					<!--  nav  -->
					<nav class="navbar navbar-inverse navbar-default">
						<!-- Brand and toggle get grouped for better mobile display -->

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" data-hover="dropdown" data-animations=" fadeInLeft fadeInUp fadeInRight">
							<ul class="nav navbar-nav">
								
            <li id="tag1"><a href="#" onclick="switchTag('tag1','content1');this.blur();"><span>All Orders</span></a></li>
            <li id="tag2"><a href="#" onclick="switchTag('tag2','content2');this.blur();"><span>已付款</span></a></li>
            <li id="tag3"><a href="#" onclick="switchTag('tag3','content3');this.blur();"><span>待付款</span></a></li>
            <li id="tag4"><a href="#" onclick="switchTag('tag4','content4');this.blur();"><span>待收货</span></a></li>
            <li id="tag5"><a href="#" onclick="switchTag('tag5','content5');this.blur();"><span>待评价</span></a></li>
        
							</ul>
							<!-- /.navbar-collapse -->
						</div>
					</nav>
					<!-- /nav end -->
				</div>
			</div>
		</section>
	
  </header>
 
 


  <!-- Content -->
 <div id="content">
 <div id="content1">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
 <form action="" method="post" name="myform">
  <tr>
    <td class="title_2" colspan="2">宝贝</td>
    <td class="title_4">单价（元）</td>
    <td class="title_5">数量</td>
    <td class="title_6">实付款（元）</td>
    <td class="title_6">交易状态</td>
    <td class="title_7">操作</td>
  </tr>
  <tr>
    <td colspan="8" class="line"></td>
  </tr>
  <c:choose>
        <c:when test="${buyerCart.getItems eq null}">
          <tr>
				<td colspan="8">NO order!</td>
		</tr>
        </c:when>
        <c:otherwise>
        	<c:forEach var="buyerItem" items="${buyerCart.getItems}">
        	<tr>
   				 <td colspan="8" class="shopInfo">时间：  订单号：店铺：<a href="#">${buyerItem.getProduct.getproductsellerId}</a></td>
  			</tr>
  			<tr id="product1">
    			<td class="cart_td_2"><img src="${buyerItem.getProduct.getproductPicture}" alt="shopping"/></td>
   				<td class="cart_td_3"><a href="#">${buyerItem.getProduct.getproductName}</a><br />
        				${buyerItem.getProduct.getproductIntroduction}<br />
       			 </td>
    			<td class="cart_td_5">${buyerItem.getProduct.getProductPrice}</td>
    			<td class="cart_td_6">${buyerItem.getAmount}</td>
    			<td class="cart_td_7"></td>
    			<td class="cart_td_5">交易成功</td>
    			<td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  			</tr>
  			</c:forEach>
        </c:otherwise>
        </c:choose>
 
 
 
  <tr>
    <td colspan="8" class="shopInfo">时间： 订单号： 店铺：<a href="#">纤巧百媚时尚鞋坊</a></td>
  </tr>
   <tr id="product1">
    <td class="cart_td_2"><img src="assets/images/taobao_cart_01.jpg" alt="shopping"/></td>
    <td class="cart_td_3"><a href="#">日韩流行风时尚美眉最爱独特米字拼图金属坡跟公主靴子黑色</a><br />
        颜色：棕色 尺码：37<br />
        </td>
    <td class="cart_td_5">138.00</td>
    <td class="cart_td_6">1</td>
    <td class="cart_td_7"></td>
    <td class="cart_td_5">交易成功</td>
    <td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  </tr>
   <tr id="product2">
    <td class="cart_td_2"><img src="assets/images/taobao_cart_02.jpg" alt="shopping"/></td>
    <td class="cart_td_3"><a href="#">chanel/香奈尔/香奈尔炫亮魅力唇膏3.5g</a><br />
        </td>
    <td class="cart_td_5">265.00</td>
    <td class="cart_td_6">1</td>
    <td class="cart_td_7"></td>
    <td class="cart_td_5">交易成功</td>
    <td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  </tr>
  </form>
</table>
</div>

<div id="content2">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
 <form action="" method="post" name="myform">
  <tr>
    <td class="title_2" colspan="2">宝贝</td>
    <td class="title_4">单价（元）</td>
    <td class="title_5">数量</td>
    <td class="title_6">实付款（元）</td>
    <td class="title_6">交易状态</td>
    <td class="title_7">操作</td>
  </tr>
  <tr>
    <td colspan="8" class="line"></td>
  </tr>
  <c:choose>
        <c:when test="${buyerCart.getItems eq null}">
          <tr>
				<td colspan="8">NO order!</td>
		</tr>
        </c:when>
        <c:otherwise>
        	<c:forEach var="buyerItem" items="${buyerCart.getItems}">
        	<tr>
   				 <td colspan="8" class="shopInfo">时间：  订单号：店铺：<a href="#">${buyerItem.getProduct.getproductsellerId}</a></td>
  			</tr>
  			<tr id="product1">
    			<td class="cart_td_2"><img src="${buyerItem.getProduct.getproductPicture}" alt="shopping"/></td>
   				<td class="cart_td_3"><a href="#">${buyerItem.getProduct.getproductName}</a><br />
        				${buyerItem.getProduct.getproductIntroduction}<br />
       			 </td>
    			<td class="cart_td_5">${buyerItem.getProduct.getProductPrice}</td>
    			<td class="cart_td_6">${buyerItem.getAmount}</td>
    			<td class="cart_td_7"></td>
    			<td class="cart_td_5">已付款</td>
    			<td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  			</tr>
  			</c:forEach>
        </c:otherwise>
        </c:choose>
 
 
 
  <tr>
    <td colspan="8" class="shopInfo">时间： 订单号： 店铺：<a href="#">纤巧百媚时尚鞋坊</a></td>
  </tr>
   <tr id="product1">
    <td class="cart_td_2"><img src="assets/images/taobao_cart_01.jpg" alt="shopping"/></td>
    <td class="cart_td_3"><a href="#">日韩流行风时尚美眉最爱独特米字拼图金属坡跟公主靴子黑色</a><br />
        颜色：棕色 尺码：37<br />
        </td>
    <td class="cart_td_5">138.00</td>
    <td class="cart_td_6">1</td>
    <td class="cart_td_7"></td>
    <td class="cart_td_5">已付款</td>
    <td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  </tr>
   <tr id="product2">
    <td class="cart_td_2"><img src="assets/images/taobao_cart_02.jpg" alt="shopping"/></td>
    <td class="cart_td_3"><a href="#">chanel/香奈尔/香奈尔炫亮魅力唇膏3.5g</a><br />
        </td>
    <td class="cart_td_5">265.00</td>
    <td class="cart_td_6">1</td>
    <td class="cart_td_7"></td>
    <td class="cart_td_5">已付款</td>
    <td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  </tr>
  </form>
</table>
</div>

<div id="content3">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
 <form action="" method="post" name="myform">
  <tr>
    <td class="title_2" colspan="2">宝贝</td>
    <td class="title_4">单价（元）</td>
    <td class="title_5">数量</td>
    <td class="title_6">实付款（元）</td>
    <td class="title_6">交易状态</td>
    <td class="title_7">操作</td>
  </tr>
  <tr>
    <td colspan="8" class="line"></td>
  </tr>
  <c:choose>
        <c:when test="${buyerCart.getItems eq null}">
          <tr>
				<td colspan="8">NO order!</td>
		</tr>
        </c:when>
        <c:otherwise>
        	<c:forEach var="buyerItem" items="${buyerCart.getItems}">
        	<tr>
   				 <td colspan="8" class="shopInfo">时间：  订单号：店铺：<a href="#">${buyerItem.getProduct.getproductsellerId}</a></td>
  			</tr>
  			<tr id="product1">
    			<td class="cart_td_2"><img src="${buyerItem.getProduct.getproductPicture}" alt="shopping"/></td>
   				<td class="cart_td_3"><a href="#">${buyerItem.getProduct.getproductName}</a><br />
        				${buyerItem.getProduct.getproductIntroduction}<br />
       			 </td>
    			<td class="cart_td_5">${buyerItem.getProduct.getProductPrice}</td>
    			<td class="cart_td_6">${buyerItem.getAmount}</td>
    			<td class="cart_td_7"></td>
    			<td class="cart_td_5">待付款</td>
    			<td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  			</tr>
  			</c:forEach>
        </c:otherwise>
        </c:choose>
 
 
 
  <tr>
    <td colspan="8" class="shopInfo">时间： 订单号： 店铺：<a href="#">纤巧百媚时尚鞋坊</a></td>
  </tr>
   <tr id="product1">
    <td class="cart_td_2"><img src="assets/images/taobao_cart_01.jpg" alt="shopping"/></td>
    <td class="cart_td_3"><a href="#">日韩流行风时尚美眉最爱独特米字拼图金属坡跟公主靴子黑色</a><br />
        颜色：棕色 尺码：37<br />
        </td>
    <td class="cart_td_5">138.00</td>
    <td class="cart_td_6">1</td>
    <td class="cart_td_7"></td>
    <td class="cart_td_5">待付款</td>
    <td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  </tr>
   <tr id="product2">
    <td class="cart_td_2"><img src="assets/images/taobao_cart_02.jpg" alt="shopping"/></td>
    <td class="cart_td_3"><a href="#">chanel/香奈尔/香奈尔炫亮魅力唇膏3.5g</a><br />
        </td>
    <td class="cart_td_5">265.00</td>
    <td class="cart_td_6">1</td>
    <td class="cart_td_7"></td>
    <td class="cart_td_5">待付款</td>
    <td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  </tr>
  </form>
</table>
</div>

<div id="content4">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
 <form action="" method="post" name="myform">
  <tr>
    <td class="title_2" colspan="2">宝贝</td>
    <td class="title_4">单价（元）</td>
    <td class="title_5">数量</td>
    <td class="title_6">实付款（元）</td>
    <td class="title_6">交易状态</td>
    <td class="title_7">操作</td>
  </tr>
  <tr>
    <td colspan="8" class="line"></td>
  </tr>
  <c:choose>
        <c:when test="${buyerCart.getItems eq null}">
          <tr>
				<td colspan="8">NO order!</td>
		</tr>
        </c:when>
        <c:otherwise>
        	<c:forEach var="buyerItem" items="${buyerCart.getItems}">
        	<tr>
   				 <td colspan="8" class="shopInfo">时间：  订单号：店铺：<a href="#">${buyerItem.getProduct.getproductsellerId}</a></td>
  			</tr>
  			<tr id="product1">
    			<td class="cart_td_2"><img src="${buyerItem.getProduct.getproductPicture}" alt="shopping"/></td>
   				<td class="cart_td_3"><a href="#">${buyerItem.getProduct.getproductName}</a><br />
        				${buyerItem.getProduct.getproductIntroduction}<br />
       			 </td>
    			<td class="cart_td_5">${buyerItem.getProduct.getProductPrice}</td>
    			<td class="cart_td_6">${buyerItem.getAmount}</td>
    			<td class="cart_td_7"></td>
    			<td class="cart_td_5">待收货</td>
    			<td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  			</tr>
  			</c:forEach>
        </c:otherwise>
        </c:choose>
 
 
 
  <tr>
    <td colspan="8" class="shopInfo">时间： 订单号： 店铺：<a href="#">纤巧百媚时尚鞋坊</a></td>
  </tr>
   <tr id="product1">
    <td class="cart_td_2"><img src="assets/images/taobao_cart_01.jpg" alt="shopping"/></td>
    <td class="cart_td_3"><a href="#">日韩流行风时尚美眉最爱独特米字拼图金属坡跟公主靴子黑色</a><br />
        颜色：棕色 尺码：37<br />
        </td>
    <td class="cart_td_5">138.00</td>
    <td class="cart_td_6">1</td>
    <td class="cart_td_7"></td>
    <td class="cart_td_5">待收货</td>
    <td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  </tr>
   <tr id="product2">
    <td class="cart_td_2"><img src="assets/images/taobao_cart_02.jpg" alt="shopping"/></td>
    <td class="cart_td_3"><a href="#">chanel/香奈尔/香奈尔炫亮魅力唇膏3.5g</a><br />
        </td>
    <td class="cart_td_5">265.00</td>
    <td class="cart_td_6">1</td>
    <td class="cart_td_7"></td>
    <td class="cart_td_5">待收货</td>
    <td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  </tr>
  </form>
</table>
</div>

<div id="content5">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
 <form action="" method="post" name="myform">
  <tr>
    <td class="title_2" colspan="2">宝贝</td>
    <td class="title_4">单价（元）</td>
    <td class="title_5">数量</td>
    <td class="title_6">实付款（元）</td>
    <td class="title_6">交易状态</td>
    <td class="title_7">操作</td>
  </tr>
  <tr>
    <td colspan="8" class="line"></td>
  </tr>
  <c:choose>
        <c:when test="${buyerCart.getItems eq null}">
          <tr>
				<td colspan="8">NO order!</td>
		</tr>
        </c:when>
        <c:otherwise>
        	<c:forEach var="buyerItem" items="${buyerCart.getItems}">
        	<tr>
   				 <td colspan="8" class="shopInfo">时间：  订单号：店铺：<a href="#">${buyerItem.getProduct.getproductsellerId}</a></td>
  			</tr>
  			<tr id="product1">
    			<td class="cart_td_2"><img src="${buyerItem.getProduct.getproductPicture}" alt="shopping"/></td>
   				<td class="cart_td_3"><a href="#">${buyerItem.getProduct.getproductName}</a><br />
        				${buyerItem.getProduct.getproductIntroduction}<br />
       			 </td>
    			<td class="cart_td_5">${buyerItem.getProduct.getProductPrice}</td>
    			<td class="cart_td_6">${buyerItem.getAmount}</td>
    			<td class="cart_td_7"></td>
    			<td class="cart_td_5">待评价</td>
    			<td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  			</tr>
  			</c:forEach>
        </c:otherwise>
        </c:choose>
 
 
 
  <tr>
    <td colspan="8" class="shopInfo">时间： 订单号： 店铺：<a href="#">纤巧百媚时尚鞋坊</a></td>
  </tr>
   <tr id="product1">
    <td class="cart_td_2"><img src="assets/images/taobao_cart_01.jpg" alt="shopping"/></td>
    <td class="cart_td_3"><a href="#">日韩流行风时尚美眉最爱独特米字拼图金属坡跟公主靴子黑色</a><br />
        颜色：棕色 尺码：37<br />
        </td>
    <td class="cart_td_5">138.00</td>
    <td class="cart_td_6">1</td>
    <td class="cart_td_7"></td>
    <td class="cart_td_5">待评价</td>
    <td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  </tr>
   <tr id="product2">
    <td class="cart_td_2"><img src="assets/images/taobao_cart_02.jpg" alt="shopping"/></td>
    <td class="cart_td_3"><a href="#">chanel/香奈尔/香奈尔炫亮魅力唇膏3.5g</a><br />
        </td>
    <td class="cart_td_5">265.00</td>
    <td class="cart_td_6">1</td>
    <td class="cart_td_7"></td>
    <td class="cart_td_5">待评价</td>
    <td class="cart_td_8"><a>评价</a></br><a href="javascript:deleteRow('product1');">删除订单</a></td>
  </tr>
  </form>
</table>
</div>


</div>
  <!-- End Content -->
  <section>
    <hr>
  </section>
  <!-- Footer -->
  <footer>
    <div class="container">

      <!-- Footer Upside Links -->

      <div class="row">

        <!-- Contact -->
        <div class="col-md-9">
          <h4>Contact Park N Shop!</h4>
          <br>
          <p>Address: Xidian University,Xi'an,China</p>
          <p>Phone: (+100) 666</p>
          <p>Email: 666@666.com</p>
        </div>

        <div class="col-md-3">
          <h4>Information</h4>
          <ul class="links-footer">
            <li><a href="/About"> About Us</a></li>
            <li><a href="/BuyerFAQs"> FAQs</a></li>
            <li><a href="/SecureShopping"> Secure Shopping</a></li>
            <li><a href="/JoinUs"> Join Us</a></li>
          </ul>
        </div>

        <div class="col-md-12" align="center">
          <br>
          Copyright © 2017-2018  www.ParkNShop.com  陕ICP备666666号-6
        </div>
      </div>
    </div>
  </footer>
  <!-- End Footer -->

  <!-- GO TO TOP  -->
  <a href="#" class="cd-top"><i class="fa fa-angle-up"></i></a>
  <!-- GO TO TOP End -->
</div>
<!-- End Page Wrapper -->

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

<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
<!-- bootstrap js -->
<%--<script src="assets/js/bootstrap.min.js"></script>--%>
<!-- owl.carousel js -->
<script src="assets/js/owl.carousel.min.js"></script>
<!-- meanmenu js -->
<script src="assets/js/jquery.meanmenu.js"></script>
<!-- countdown js -->
<script src="assets/js/countdown.js"></script>
<!-- jquery.nivo.slider.pack js -->
<script src="assets/js/jquery.nivo.slider.pack.js"></script>
<!-- jquery-ui.min.js -->
<script src="assets/js/jquery-ui.min.js"></script>
<!-- wow js -->
<script src="assets/js/wow.min.js"></script>
<!-- plugins js -->
<script src="assets/js/plugins.js"></script>
<!-- main js -->
<script src="assets/js/main2.js"></script>
</body>
</html>