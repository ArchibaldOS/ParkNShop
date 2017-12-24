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
<link rel="stylesheet" href="assets/css/ionicons.min.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">

<!-- Fonts Online -->
<link href="https://fonts.googleapis.com/css?family=Lato:100i,300,400,700,900" rel="stylesheet">

<!-- JavaScripts -->
<script src="assets/js/vendors/modernizr.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>

<!-- Page Wrapper -->
<div id="wrap"> 
  
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
    </header>
  
  <!-- Content -->
  <div id="content"> 
    
    <!-- Linking -->
    <div class="linking">
      <div class="container">
        <ol class="breadcrumb">
          <li><a href="#">Home</a></li>
          <li class="active">Contact</li>
        </ol>
      </div>
    </div>
    
    <!-- Contact -->
    <section class="contact-sec padding-top-40 padding-bottom-80">
      <div class="container">

        <!-- Conatct -->
        <div class="contact">
          <div class="contact-form"> 
            <!-- FORM  -->
            <form role="form" id="contact_form" class="contact-form" method="post" onSubmit="return false">
              <div class="row">
                <div class="col-md-8"> 
                  
                  <!-- Payment information -->
                  <div class="heading">
                    <h2>Dou You have a Question for Us ?</h2>
                  </div>
                  <ul class="row">
                    <li class="col-sm-6">
                      <label>First Name
                        <input type="text" class="form-control" name="name" id="name" placeholder="">
                      </label>
                    </li>
                    <li class="col-sm-6">
                      <label>Last Name
                        <input type="text" class="form-control" name="email" id="email" placeholder="">
                      </label>
                    </li>
                    <li class="col-sm-12">
                      <label>Message
                        <textarea class="form-control" name="message" id="message" rows="5" placeholder=""></textarea>
                      </label>
                    </li>
                    <li class="col-sm-12 no-margin">
                      <button type="submit" value="submit" class="btn-round" id="btn_submit" onClick="proceed();">Send Message</button>
                    </li>
                  </ul>
                </div>
                
                <!-- Conatct Infomation -->
                <div class="col-md-4">
                  <div class="contact-info">
                    <h5>SmartTech</h5>
                    <p>The most powerful PSD for Digital & Electronic!</p>
                    <hr>
                    <h6> Address:</h6>
                    <p>45 Grand Central Terminal New York, NY 1017
                      United State USA</p>
                    <h6>Phone:</h6>
                    <p>(+100) 123 456 7890</p>
                    <p>(+100) 987 654 3210 </p>
                    <h6>Email:</h6>
                    <p>Support@smarttech.com
                      Support24/7@smarttech.com</p>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    
    <!-- Clients img -->
    
    <!-- Newslatter -->
      <section class="newslatter">
          <div class="container">
              <div class="row">
              </div>
          </div>
      </section>
  </div>
  <!-- End Content --> 
  
  <!-- Footer -->
    <footer>
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
<!-- Begin Map Script--> 
<script src="http://ditu.google.cn/maps/api/js?v=3.exp"></script> 
<script src="assets/js/vendors/map.js"></script>
</body>
</html>
