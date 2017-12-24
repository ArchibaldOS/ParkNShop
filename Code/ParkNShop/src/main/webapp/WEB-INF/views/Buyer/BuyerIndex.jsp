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
  <title>Home</title>

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
          <li><a href="/sellerLogin">Seller Center</a></li>
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
              <div class="media-left"> <a href="/BuyerProductDetail?productId=${buyerItem.getProduct().productId}" class="thumb"> <img src="${pageContext.request.contextPath}/upload/productPicture/${buyerItem.getProduct().productPicture}" class="img-responsive" alt="" > </a> </div>
              <div class="media-body"> <a href="/BuyerProductDetail?productId=${buyerItem.getProduct().productId}" class="tittle"></a> <span> ${buyerItem.getProduct().getProductPrice()}* ${buyerItem.getAmount()}</span> </div>
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
  <!-- 广告栏 -->
  <div class="slider-container">
    <div class="slider">
      <!-- Slider Image -->
      <div id="mainslider" class="nivoSlider slider-image">
        <%--此处需要修改图片--%>
        <img src="assets/img/slider/42.jpg" alt="main slider" title="#htmlcaption1" />
        <img src="assets/img/slider/41.jpg" alt="main slider" title="#htmlcaption2" />
      </div>
      <!-- Slider Caption 1 -->
      <div id="htmlcaption1" class="nivo-html-caption slider-caption-1">
        <div class="slider-progress"></div>
        <div class="slide1-text slide-1 hidden-xs">
          <div class="middle-text">
            <div class="cap-dec wow bounceInLeft" data-wow-duration="0.9s" data-wow-delay="0s">
              <h1>The Best Fashion</h1>
            </div>
            <div class="cap-title wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
              <h3>Save Your Time and Money</h3>
            </div>
            <div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
              <a href="#">Shop Now</a>
            </div>
          </div>
        </div>
      </div>
      <!-- Slider Caption 2 -->
      <div id="htmlcaption2" class="nivo-html-caption slider-caption-2">
        <div class="slider-progress"></div>
        <div class="slide1-text slide-2 hidden-xs">
          <div class="middle-text">
            <div class="cap-dec wow bounceInLeft" data-wow-duration="0.9s" data-wow-delay="0s">
              <h1>The Best Fashion</h1>
            </div>
            <div class="cap-title wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
              <h3>Save Your Time and Money</h3>
            </div>
            <div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
              <a href="#">Shop Now</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <!-- Content -->
  <div id="content">

    <!-- Shipping Info -->
    <section class="shipping-info">
      <div class="container">
        <ul>

          <!-- Free Shipping -->
          <li>
            <div class="media-left"> <i class="flaticon-delivery-truck-1"></i> </div>
            <div class="media-body">
              <h5>Free Shipping</h5>
              <span>On order over $99</span></div>
          </li>
          <!-- Money Return -->
          <li>
            <div class="media-left"> <i class="flaticon-arrows"></i> </div>
            <div class="media-body">
              <h5>Money Return</h5>
              <span>30 Days money return</span></div>
          </li>
          <!-- Support 24/7 -->
          <li>
            <div class="media-left"> <i class="flaticon-operator"></i> </div>
            <div class="media-body">
              <h5>Support 24/7</h5>
              <span>Hotline: (+086) 666</span></div>
          </li>
          <!-- Safe Payment -->
          <li>
            <div class="media-left"> <i class="flaticon-business"></i> </div>
            <div class="media-body">
              <h5>Safe Payment</h5>
              <span>Protect online payment</span></div>
          </li>
        </ul>
      </div>
    </section>

    <!-- tab Section -->
    <section class="featur-tabs padding-top-60 padding-bottom-60">
      <div class="container">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs nav-pills margin-bottom-40" role="tablist">
          <li role="presentation" class="active"><a href="#featur" aria-controls="featured" role="tab" data-toggle="tab">Featured</a></li>
          <li role="presentation"><a href="#special" aria-controls="special" role="tab" data-toggle="tab">Special</a></li>
          <li role="presentation"><a href="#on-sal" aria-controls="on-sal" role="tab" data-toggle="tab">Onsale</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
          <!-- Featured -->
          <div role="tabpanel" class="tab-pane active fade in" id="featured">
            <!-- Items Slider -->
            <div class="item-slide-5 with-nav">
              <c:forEach var="featuredProduct" items="${featuredProducts}">
              <!-- Product -->
              <div class="product">
                <article> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${featuredProduct.productPicture}" alt="" >
                  <!-- Content -->
                  <span class="tag">${featuredProduct.productType}</span> <a href="/BuyerProductDetail?productId=${featuredProduct.productId}" class="tittle">${featuredProduct.productName}</a>
                  <!-- Reviews -->
                  <div class="price">${featuredProduct.productPrice} </div>
                  <a href="/AddToCart?buyerId=${sessionScope.Buyer.buyerId}&productId=${featuredProduct.productId}" class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
              </div>
              </c:forEach>
            </div>
          </div>

          <!-- Special -->
          <div role="tabpanel" class="tab-pane fade" id="special">
            <!-- Items Slider -->
            <div class="item-col-5">
              <c:forEach var="specialProduct" items="${specialProducts}">
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${specialProduct.productPicture}" alt="" >
                    <!-- Content -->
                    <span class="tag">${specialProduct.productType}</span> <a href="/BuyerProductDetail?productId=${specialProduct.productId}" class="tittle">${specialProduct.productName}</a>
                    <!-- Reviews -->
                    <div class="price">${specialProduct.productPrice} </div>
                    <a href="/AddToCart?buyerId=${sessionScope.Buyer.buyerId}&productId=${specialProduct.productId}" class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
              </c:forEach>
            </div>
          </div>

          <!-- on sale -->
          <div role="tabpanel" class="tab-pane fade" id="on-sal">
            <!-- Items Slider -->
            <div class="item-col-5">
              <c:forEach var="onsaleProduct" items="${onsaleProducts}">
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${onsaleProduct.productPicture}" alt="" >
                    <!-- Content -->
                    <span class="tag">${onsaleProduct.productType}</span> <a href="/BuyerProductDetail?productId=${onsaleProduct.productId}" class="tittle">${onsaleProduct.productName}</a>
                    <!-- Reviews -->
                    <div class="price">${onsaleProduct.productPrice} </div>
                    <a href="/AddToCart?buyerId=${sessionScope.Buyer.buyerId}&productId=${onsaleProduct.productId}" class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Top Selling Week -->
    <section class="light-gry-bg padding-top-60 padding-bottom-30">
      <div class="container">

        <!-- heading -->
        <div class="heading">
          <h2>Top Selling of the Week</h2>
          <hr>
        </div>

        <!-- Items -->
        <div class="item-col-5">
          <c:forEach var="topSellingProduct" items="${topSellingProducts}">
          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${topSellingProduct.productPicture}" alt="" >
              <%--打折标识--%>
              <%--<span class="sale-tag">-25%</span>--%>
              <!-- Content -->
              <span class="tag">${topSellingProduct.productType}</span> <a href="/BuyerProductDetail?productId=${topSellingProduct.productId}" class="tittle">${topSellingProduct.productName}</a>
              <!-- Reviews -->
              <div class="price">${topSellingProduct.productPrice} </div>
              <a href="/AddToCart?buyerId=${sessionScope.Buyer.buyerId}&productId=${topSellingProduct.productId}" class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>
        </div>
        </c:forEach>
      </div>
    </section>
    <!-- Top Sales Shop Week -->
    <section class="light-gry-bg padding-top-60 padding-bottom-30">
      <div class="container">

        <!-- heading -->
        <div class="heading">
          <h2>Top Sales Shop Week</h2>
          <hr>
        </div>

        <!-- Items -->
        <div class="item-col-5">
          <c:forEach var="topSalesShop" items="${topSalesShops}">
          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${topSalesShop.productPicture}" alt="" >
                <%--打折标识--%>
                <%--<span class="sale-tag">-25%</span>--%>
              <!-- Content -->
              <%--记得添加店铺链接--%>
               <a href="#." class="tittle">${topSalesShop.shopName}</a>
              <!-- Reviews -->
              <div class="price">${topSalesShop.shopIntroduction} </div>
            </article>
          </div>
        </div>
        </c:forEach>
      </div>
    </section>

    <!-- Main Tabs Sec -->
    <section class="main-tabs-sec padding-top-60 padding-bottom-0">
      <div class="container">
        <ul class="nav margin-bottom-40" role="tablist">
          <li role="presentation" class="active"><a href="#tv-au" aria-controls="featur" role="tab" data-toggle="tab"> <i class="flaticon-computer"></i> TV& Home Theater <span>236 item(s)</span></a></li>
          <li role="presentation"><a href="#smart" aria-controls="special" role="tab" data-toggle="tab"><i class="flaticon-smartphone"></i>Computers & Tablets <span>150 item(s)</span></a></li>
          <li role="presentation"><a href="#deks-lap" aria-controls="on-sal" role="tab" data-toggle="tab"><i class="flaticon-laptop"></i>Cell Phones <span>268 item(s)</span></a></li>
          <li role="presentation"><a href="#game-com" aria-controls="special" role="tab" data-toggle="tab"><i class="flaticon-gamepad-1"></i>Cameras & Camcorders<span>79 item(s)</span></a></li>
          <li role="presentation"><a href="#watches" aria-controls="on-sal" role="tab" data-toggle="tab"><i class="flaticon-computer-1"></i>Audio<span>105 item(s)</span></a></li>
          <li role="presentation"><a href="#access" aria-controls="on-sal" role="tab" data-toggle="tab"><i class="flaticon-keyboard"></i>Video, Games, Movies & Music<span>816 item(s)</span></a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
          <!-- TV& Home Theater -->

          <div role="tabpanel" class="tab-pane active fade in" id="tv-au">
            <!-- Items -->
            <div class="item-col-5">
              <c:forEach var="type1product" items="${type1products}">
              <!-- Product -->
              <div class="product">
                <article> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${type1product.productPicture}" alt="" >

                  <!-- Content -->
                  <span class="tag">${type1product.productType}</span> <a href="/BuyerProductDetail?productId=${type1product.productId}" class="tittle">${type1product.productName}</a>
                  <!-- Reviews -->
                  <div class="price">${type1product.productPrice}</div>
                  <a href="/AddToCart?buyerId=${sessionScope.Buyer.buyerId}&productId=${type1product.productId}" class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
              </div>
              </c:forEach>
            </div>
          </div>

          <!-- Computers & Tablets -->
          <div role="tabpanel" class="tab-pane fade" id="smart">
            <!-- Items -->
            <div class="item-col-5">
              <c:forEach var="type2product" items="${type2products}">
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${type2product.productPicture}" alt="" >

                    <!-- Content -->
                    <span class="tag">${type2product.productType}</span> <a href="/BuyerProductDetail?productId=${type2product.productId}" class="tittle">${type2product.productName}</a>
                    <!-- Reviews -->
                    <div class="price">${type2product.productPrice}</div>
                    <a href="/AddToCart?buyerId=${sessionScope.Buyer.buyerId}&productId=${type2product.productId}" class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
              </c:forEach>
            </div>
          </div>
          <!-- Cell Phones -->
          <div role="tabpanel" class="tab-pane fade" id="game-com">

            <!-- Items -->
            <div class="item-col-5">

              <c:forEach var="type3product" items="${type3products}">
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${type3product.productPicture}" alt="" >

                    <!-- Content -->
                    <span class="tag">${type3product.productType}</span> <a href="/BuyerProductDetail?productId=${type3product.productId}" class="tittle">${type3product.productName}</a>
                    <!-- Reviews -->
                    <div class="price">${type3product.productPrice}</div>
                    <a href="/AddToCart?buyerId=${sessionScope.Buyer.buyerId}&productId=${type3product.productId}" class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
              </c:forEach>
            </div>
          </div>
          <!-- Cameras & Camcorders -->
          <div role="tabpanel" class="tab-pane fade" id="watches">

            <!-- Items -->
            <div class="item-col-5">

              <c:forEach var="type4product" items="${type4products}">
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${type4product.productPicture}" alt="" >

                    <!-- Content -->
                    <span class="tag">${type4product.productType}</span> <a href="/BuyerProductDetail?productId=${type4product.productId}" class="tittle">${type4product.productName}</a>
                    <!-- Reviews -->
                    <div class="price">${type4product.productPrice}</div>
                    <a href="/AddToCart?buyerId=${sessionScope.Buyer.buyerId}&productId=${type4product.productId}" class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
              </c:forEach>

            </div>
          </div>
          <!-- Audio  -->
          <div role="tabpanel" class="tab-pane fade" id="access">

            <!-- Items -->
            <div class="item-col-5">

              <c:forEach var="type5product" items="${type5products}">
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${type5product.productPicture}" alt="" >

                    <!-- Content -->
                    <span class="tag">${type5product.productType}</span> <a href="/BuyerProductDetail?productId=${type5product.productId}" class="tittle">${type5product.productName}</a>
                    <!-- Reviews -->
                    <div class="price">${type5product.productPrice}</div>
                    <a href="/AddToCart?buyerId=${sessionScope.Buyer.buyerId}&productId=${type5product.productId}" class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
              </c:forEach>


            </div>
          </div>

          <!-- Video, Games, Movies & Music  -->
          <div role="tabpanel" class="tab-pane fade" id="fun">

            <!-- Items -->
            <div class="item-col-5">

              <c:forEach var="type7product" items="${type7products}">
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${type7product.productPicture}" alt="" >

                    <!-- Content -->
                    <span class="tag">${type7product.productType}</span> <a href="/BuyerProductDetail?productId=${type7product.productId}" class="tittle">${type7product.productName}</a>
                    <!-- Reviews -->
                    <div class="price">${type7product.productPrice}</div>
                    <a href="/AddToCart?buyerId=${sessionScope.Buyer.buyerId}&productId=${type7product.productId}" class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
              </c:forEach>


            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <!-- End Content -->

  <!-- Footer -->
  <footer>
    <hr>
    <div class="container">

      <!-- Footer Upside Links -->

      <div class="row">

        <!-- Contact -->
        <div class="col-md-9">
          <h4>Contact ParkNShop!</h4>
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
          Copyright © 2017-2018  www.ParkNShop.com
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