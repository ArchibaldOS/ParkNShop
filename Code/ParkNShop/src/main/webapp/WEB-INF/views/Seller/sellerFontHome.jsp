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
    <!-- Fonts Online -->
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,700,900,100' rel='stylesheet' type='text/css'>
    <!-- JavaScripts -->
    <script src="assets/js3/vendors/modernizr.js"></script>

    <style type="text/css">
        #productName{
            word-break: break-all;white-space: normal;
        }

        h3{
            font-family:Microsoft YaHei;
            color:white;
            font-style:italic;
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
              out.println( "<li><a href = '/BuyerLogout' >Logout</a></li>" );

            }
          %>
          <li><a href="/viewMyOrdersClick">View orders</a></li>
          <li><a href="/ContactManager">Contact Manager</a></li>
        </ul>
      </div>
    </div>
  </div>

   <header>
    <div class="container">
      <div class="logo"> <a href="/BuyerIndex"><img src="assets/images/logo.png"></a> </div>
      <form class="search-cate" action="/SearchProducts">
        <select class="selectpicker" name="searchType">
          <option value="0"> All Categories</option>
          <option value="1"> TV& Home Theater</option>
          <option value="2"> Computers & Tablets</option>
          <option value="3"> Cell Phones</option>
          <option value="4"> Cameras & Camcorders</option>
          <option value="5"> Audio</option>
          <option value="6"> Car Electronics & GPS</option>
          <option value="7"> Video, Games, Movies & Music</option>
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
          <c:when test="${buyerCart.getItems() eq null}">
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
              <span class="itm-cont">${buyerCart.getProductAmount()}</span> <i class="flaticon-shopping-bag"></i>
              <strong>My Cart</strong> <br>
              <span>${buyerCart.getProductAmount()} item(s) - HK$${buyerCart.getTotalPrice()}</span></a>
              <ul class="dropdown-menu">
                <c:forEach var="buyerItem" items="${buyerCart.getItems()}">
                  <li>
                    <div class="media-left"> <a href="/ProductDetail?productId=${buyerItem.getProduct().productId}" class="thumb"> <img src="${pageContext.request.contextPath}/upload/productPicture/${buyerItem.getProduct().productPicture}" class="img-responsive" alt="" > </a> </div>
                    <div class="media-body"> <a href="/ProductDetail?productId=${buyerItem.getProduct().productId}" class="tittle"></a> <span> ${buyerItem.getProduct().getProductPrice()}* ${buyerItem.getAmount()}</span> </div>
                  </li></c:forEach>
                <li class="btn-cart"> <a href="/BuyerCart?buyerId=${sessionScope.Buyer.buyerId}" class="btn-round">View Cart</a> </li>
              </ul>
            </li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
    <br>
  </header>

    <div style="font-family:Microsoft YaHei;color:white;max-width:80%;background-color: #1c94c4;border-radius:10px;margin:20px auto;padding:10px;height:10%;">
        <c:set var="s" value="${requestScope.shop }" />
        <h3 style="vertical-align:middle;margin-left:30px;display:inline-block">${s.shopName }</h3>

        <div style="vertical-align:middle;display:inline-block;width:20%;float:right">
            <label>Shop Phone:${s.sellerPhone }</label></br>
            <label>Shop Address:${s.sellerAddress }</label></br>
        </div>

        <div style="vertical-align:middle;display:inline-block;width:30%;float:right">
            <label>Seller Name:${s.sellerName }</label></br>
            <label>Shop Email:${s.sellerEmail }</label></br>
            <label>Introduction:${s.shopIntroduction }</label>
        </div>
    </div>

    <div style="text-align:center;color:white;background-color: #0a95da;padding-bottom:5px;padding-top:5px;max-width:80%;margin:0 auto;border-radius: 20px">Product</div>
    <section class="featur-tabs padding-top-60 padding-bottom-60">
    <div class="container">
        <c:set var="page" value="${requestScope.products }" />
        <c:choose>
            <c:when test="${page ne null and page.list ne null }">
                <div class="item-col-5">
                    <c:forEach items="${page.list }" var="p">
                        <!-- Product -->
                        <div class="product">
                            <article> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${p.productPicture}" alt="" >
                                <!-- Content -->
                            <span class="tag">
                            <c:choose>
                                <c:when test="${p.productType eq 1}">TV& Home Theater</c:when>
                                <c:when test="${p.productType eq 2}">Computers & Tablets</c:when>
                                <c:when test="${p.productType eq 3}">Cell Phones</c:when>
                                <c:when test="${p.productType eq 4}">Cameras & Camcorders</c:when>
                                <c:when test="${p.productType eq 5}">Audio</c:when>
                                <c:when test="${p.productType eq 6}">Car Electronics & GPS</c:when>
                                <c:when test="${p.productType eq 7}">Video, Games, Movies & Music</c:when>
                                <c:when test="${p.productType eq 8}">Health, Fitness & Sports</c:when>
                                <c:when test="${p.productType eq 9}">Home & Office</c:when>
                            </c:choose>
                            </span>
                              <a href="/ProductDetail?productId=${p.productId}" class="tittle">${p.productName}</a>
                            <!-- Reviews -->
                            <div class="price">HK$${p.productPrice} </div>
                                <a href="/AddToCart?buyerId=${sessionScope.Buyer.buyerId}&productId=${p.productId}" class="cart-btn"><div style="margin-top:15px;"><i class="icon-basket-loaded"></i></div></a> </article>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div style="text-align: center;"><font size="10px"><strong>no found data!</strong></font></div>
            </c:otherwise>
        </c:choose>
    </div>
    </section>
</div>
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