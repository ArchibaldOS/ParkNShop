<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="M_Adnan" />
<!-- Document Title -->
<title></title>

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
          <li>${sessionScope.Buyer.buyerAccount}</li>
          <%
              out.println( "<a href = '/buyerLogout' >Logout</a>" );

            }
          %>
          <li><a href="/BuyerAccount">My Account</a></li>
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
                    <div class="media-left"> <a href="/BuyerProductDetail?productId=${buyerItem.getProduct.productId}" class="thumb"> <img src="${pageContext.request.contextPath}/upload/productPicture/${buyerItem.getProduct.productPicture}" class="img-responsive" alt="" > </a> </div>
                    <div class="media-body"> <a href="/BuyerProductDetail?productId=${buyerItem.getProduct.productId}" class="tittle"></a> <span> ${buyerItem.getProduct.getProductPrice}* ${buyerItem.getAmount}</span> </div>
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
    
    <!-- Products -->
    <section class="padding-top-40 padding-bottom-60">
      <div class="container">
        <div class="row"> 
          
          <!-- Shop Side Bar -->

          
          <!-- Products -->
          <div class="col-md-12">

            <!-- Short List -->
            <div class="short-lst">
              <h2>
                <c:choose>
                  <c:when test="${param.searchType eq 0}">All Categories</c:when>
                  <c:when test="${param.searchType eq 1}">TV& Home Theater</c:when>
                  <c:when test="${param.searchType eq 2}">Computers & Tablets</c:when>
                  <c:when test="${param.searchType eq 3}">Cell Phones</c:when>
                  <c:when test="${param.searchType eq 4}">Cameras & Camcorders</c:when>
                  <c:when test="${param.searchType eq 5}">Audio</c:when>
                  <c:when test="${param.searchType eq 6}">Car Electronics & GPS</c:when>
                  <c:when test="${param.searchType eq 7}">Video, Games, Movies & Music</c:when>
                  <c:when test="${param.searchType eq 8}">Health, Fitness & Sports</c:when>
                  <c:when test="${param.searchType eq 9}">Home & Office</c:when>
                </c:choose>
              </h2>
              <ul>
                <!-- Short List -->
                <li>
                  <p>Showing ${searchNum} results</p>
                </li>
              </ul>
            </div>
            
            <!-- Items -->
            <div class="col-list"> 
              <!-- Product -->
              <div class="product">
                <article>
                  <c:forEach var="searchProduct" items="${searchProducts}">
                  <!-- Product img -->
                  <div class="media-left">
                    <div class="item-img"> <img class="img-responsive" src="${pageContext.request.contextPath}/upload/productPicture/${searchProduct.productPicture}" >  </div>
                  </div>                  
                  <!-- Content -->
                  <div class="media-body">
                    <div class="row">                       
                      <!-- Content Left -->
                      <div class="col-sm-7"> <span class="tag">${searchProduct.productType}</span> <a href="/BuyerProductDetail?productId=${searchProduct.productId}" class="tittle">${searchProduct.productName}</a>
                        <!-- Reviews -->
                        <p>${searchProduct.productIntroduction}</p>
                      </div>                      
                      <!-- Content Right -->
                      <div class="col-sm-5 text-center"> <a href="/MoveToBuyerFavorite?productId=${searchProduct.productId}&buyerId=${sessionScope.Buyer.buyerId}" class="heart"><i class="fa fa-heart"></i></a> <a href="#." class="heart navi"><i class="fa fa-navicon"></i></a>
                        <div class="position-center-center">
                          <div class="price">$${searchProduct.productPrice}</div>
                          <c:choose>
                            <c:when test="${searchProduct.storeCount gt 0}">
                              <p>Availability: <span class="in-stock">In stock</span></p>
                            </c:when>
                            <c:otherwise>
                              <p>Availability: <span class="sold-out">Sold out</span></p></c:otherwise>
                          </c:choose>

                          <a href="/AddToCart?buyerId=${sessionScope.Buyer.buyerId}&productId=${searchProduct.productId}" class="btn-round"><i class="icon-basket-loaded"></i> Add to Cart</a> </div>
                      </div>
                    </div>
                  </div>
                </article>
              </div>
              </c:forEach>
              <!-- pagination -->
              <ul class="pagination">
                <li> <a href="#" aria-label="Previous"> <i class="fa fa-angle-left"></i> </a> </li>
                <li><a class="active" href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li> <a href="#" aria-label="Next"> <i class="fa fa-angle-right"></i> </a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

  <!-- Footer -->
  <footer>
    <hr>
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
<script src="assets/js/vendors/jquery/jquery.min.js"></script>
<script src="assets/js/vendors/wow.min.js"></script>
<script src="assets/js/vendors/bootstrap.min.js"></script>
<script src="assets/js/vendors/own-menu.js"></script>
<script src="assets/js/vendors/jquery.sticky.js"></script>
<script src="assets/js/vendors/owl.carousel.min.js"></script>

<!-- SLIDER REVOLUTION 4.x SCRIPTS  --> 
<script type="text/javascript" src="assets/rs-plugin/js/jquery.tp.t.min.js"></script>
<script type="text/javascript" src="assets/rs-plugin/js/jquery.tp.min.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/vendors/jquery.nouislider.min.js"></script>
<script>
jQuery(document).ready(function($) {
  
 
    $("#price-range").noUiSlider({
    range: {
      'min': [ 0 ],
      'max': [ 1000 ]
    },
    start: [40, 940],
        connect:true,
        serialization:{
            lower: [
        $.Link({
          target: $("#price-min")
        })
      ],
      upper: [
        $.Link({
          target: $("#price-max")
        })
      ],
      format: {
      
        decimals: 2,
        prefix: '$'
      }
        }
  })
})

</script>
</body>
</html>
