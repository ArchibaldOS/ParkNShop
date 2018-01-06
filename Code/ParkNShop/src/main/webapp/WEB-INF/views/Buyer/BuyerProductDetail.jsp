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
  <title>Product Detail</title>

  <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
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
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="assets/css/bootstrap.min2.css" />
  <link rel="stylesheet" href="assets/css/font-awesome.min2.css" />
  <!-- Custom CSS -->
  <link href="assets/css/style3.css" rel="stylesheet">


  <!-- JavaScripts -->
  <script src="assets/js/vendors/modernizr.js"></script>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<style type="text/css">
        #comment{
            border:1px solid #E4E4E4;
        }
        .comment-content{
            width:700px;
        }
        .comment-buyer{
            width: 200px;
            text-align:center
        }
    </style>
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
              out.println( "<li><a href = '/BuyerLogout' >Logout</a></li>" );

            }
          %>
          <li><a href="/viewMyOrdersClick">View orders</a></li>
          <li><a href="/ContactManager">Contact Manager</a></li>
        </ul>
      </div>
    </div>
  </div>

  <!-- Header -->
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
              <span>${buyerCart.getProductAmount()} item(s) - ${buyerCart.getTotalPrice()}</span></a>
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


    <!-- Content -->
    <div id="content">
      <c:set var="p" value="${requestScope.product }" />
      <!-- Products -->
      <section class="padding-top-40 padding-bottom-60">
        <div class="container">
          <div class="row">

            <!-- Products -->
            <div class="col-md-9">
              <div class="product-detail">
                <div class="product">

                    <!-- Slider Thumb -->
                    <div class="col-xs-5">
                      <article class="slider-item on-nav">
                        <div class="thumb-slider">
                          <ul class="slides">
                            <li data-thumb="images/item-img-1-3.jpg"> <img src="${pageContext.request.contextPath}/upload/productPicture/${p.productPicture}" alt="${p.productName}" > </li>
                          </ul>
                        </div>
                      </article>
                    </div>
                    <!-- Item Content -->
                    <div class="col-xs-7">
                      <span class="tags">
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
                      <h5>${p.productName}</h5>
                     
                      <div class="row">
                        <div class="col-sm-6"><span class="price">HK$${p.productPrice} </span></div>
                        <div class="col-sm-6">
                          <p>Availability: <span class="in-stock">In stock(${p.storeCount})</span></p>
                        </div>
                      </div>
                      <!-- List Details -->
                      <ul class="bullet-round-list">
                        ${p.productIntroduction}
                      </ul>
                      <!-- Compare Wishlist -->
                      <ul class="cmp-list">
                        <li><a href="/sellerFontHome?sellerId=${p.sellerId }" style="font-size: 20px;color:blue;">view shop>>></a></li>
                      </ul>
                      <!-- Quinty -->
                      <form action="/AddToCart" method="get" onsubmit="return checkNum();">
                      <div class="quinty">
                      <input type="number" name="productNum" id="productNum" value="1" onchange="checkNum();"/>

                        <input type="hidden" name="productId" value="${p.productId}">
                      </div>
                        <button type="submit" class="btn-default"><i class="icon-basket-loaded margin-right-5"></i> Add to Cart</button>
                      </form>
                  </div>

              </div>


              </div>




            </div>

          </div>
          <!-- Details Tab Section-->
          <div class="item-tabs-sec">

            <!-- Nav tabs -->
            <ul class="nav" role="tablist">

              <li role="presentation" class="active"><a href="#cus-rev"  role="tab" data-toggle="tab">Customer Reviews</a></li>

            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
				    <table id="comment">
        <tr>
            <th colspan="2" class="comment-content" style="font-size:25px;text-align:center;">Content</th>
            <th class="comment-buyer" style="font-size:25px;text-align:center;">Buyer</th>
        </tr>
        <tr>
            <td colspan="3"><hr style="width:100%; text-align:center; border:1px solid #E4E4E4" /></td>
        </tr>
                      <c:forEach items="${commentsItem.list}" var="commentItem">
        <tr>
            <td style="width: 100px;"></td>
            <td class="comment-content"><p style="font-size: 18px">${commentItem.comments.content}</p><br/>
                <div style="background-color:#E4E4E4;padding:5px 10px;"><span style="color: orangered">Reply:&nbsp;&nbsp;&nbsp;&nbsp;${commentItem.comments.reply}</span></div><br/>
                <span style="color:#808080 ">${commentItem.comments.commentTime}</span>
            </td>
            <td class="comment-buyer"style="font-size: 20px">${commentItem.buyer.buyerName}</td>
        </tr>
        <tr>
            <td colspan="3"><hr style="width:100%; text-align:center; border:1px solid #E4E4E4" /></td>
        </tr>
                      </c:forEach>

    </table> 	
			
            </div>
          </div>
        </div>
      </section>


    </div>
    <!-- End Content -->


    <!-- GO TO TOP  -->
    <a href="#" class="cd-top"><i class="fa fa-angle-up"></i></a>
    <!-- GO TO TOP End -->
</div>
<!-- End Page Wrapper -->
<script>
	function checkNum(){
		
		var num = document.getElementById("productNum").value;
		var store = ${p.storeCount};
		if(num>store){
			alert("The quantity of goods exceeds the stock!");
			return false;
		}else if(num<1){
			alert("The quantity of goods must be greater than zero!");
			return false;
		}else
			return true;
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
