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
                  <li><a href="userlogin.jsp">Login</a></li>
                  <li><a href="register.jsp">Register</a></li>
                  <li><a href="#.">My Account</a></li>
                  <li><a href="#.">Seller Center</a></li>
                  <li><a href="#.">Contact Manager</a></li>
                  <li><a href="#.">FAQ </a></li>
              </ul>
          </div>
      </div>
  </div>

  <!-- Header -->
  <header>
      <div class="container">
          <div class="logo"> <a href="assets/index.jsp"><img src="assets/images/logo.png" alt="" ></a> </div>
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

          <!-- Cart Part -->
          <ul class="nav navbar-right cart-pop">
              <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="itm-cont">3</span> <i class="flaticon-shopping-bag"></i> <strong>My Cart</strong> <br>
                  <span>3 item(s) - $500.00</span></a>
                  <ul class="dropdown-menu">
                      <li>
                          <div class="media-left"> <a href="#." class="thumb"> <img src="assets/images/item-img-1-1.jpg" class="img-responsive" alt="" > </a> </div>
                          <div class="media-body"> <a href="#." class="tittle">Funda Para Ebook 7" 128GB full HD</a> <span>250 x 1</span> </div>
                      </li>
                      <li>
                          <div class="media-left"> <a href="#." class="thumb"> <img src="assets/images/item-img-1-2.jpg" class="img-responsive" alt="" > </a> </div>
                          <div class="media-body"> <a href="#." class="tittle">Funda Para Ebook 7" full HD</a> <span>250 x 1</span> </div>
                      </li>
                      <li class="btn-cart"> <a href="#." class="btn-round">View Cart</a> </li>
                  </ul>
              </li>
          </ul>
      </div>

      <!-- Nav -->
      <nav class="navbar ownmenu">
          <div class="container">

              <!-- Categories -->
              <div class="cate-lst"> <a  data-toggle="collapse" class="cate-style" href="#cater"><i class="fa fa-list-ul"></i> Our Categories </a>
                  <div class="cate-bar-in">
                      <div id="cater" class="collapse">
                          <ul>
                              <li><a href="#."> TV& Home Theater</a></li>
                              <li><a href="#."> Computers & Tablets</a></li>
                              <li><a href="#."> Cell Phones</a></li>
                              <li class="sub-menu"><a href="#.">Cameras & Camcorders</a>
                                  <!--<ul>-->
                                  <!--<li><a href="#."> TV & Video</a></li>-->
                                  <!--<li><a href="#."> Camera, Photo & Video</a></li>-->
                                  <!--<li><a href="#."> Cell Phones & Accessories</a>-->
                                  <!--</ul>-->
                              </li>
                              <li><a href="#."> Audio</a></li>
                              <li><a href="#."> Car Electronics & GPS</a></li>
                              <li class="sub-menu"><a href="#.">Video, Games, Movies & Music</a>
                                  <!--<ul>-->
                                  <!--<li><a href="#."> TV & Video</a></li>-->
                                  <!--<li><a href="#."> Camera, Photo & Video</a></li>-->
                                  <!--<li><a href="#."> Cell Phones & Accessories</a>-->
                                  <!--</ul>-->
                              </li>
                              <li class="sub-menu"><a href="#.">Health, Fitness & Sports</a>
                                  <!--<ul>-->
                                  <!--<li><a href="#."> TV & Video</a></li>-->
                                  <!--<li><a href="#."> Camera, Photo & Video</a></li>-->
                                  <!--<li><a href="#."> Cell Phones & Accessories</a>-->
                                  <!--</ul>-->
                              </li>
                              <li><a href="#."> Home & Office</a></li>
                          </ul>
                      </div>
                  </div>
              </div>

              <!-- Navbar Header -->
              <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-open-btn" aria-expanded="false"> <span><i class="fa fa-navicon"></i></span> </button>
              </div>
              <!-- NAV -->
              <div class="collapse navbar-collapse" id="nav-open-btn">
                  <ul class="nav">
                      <li><a href="assets/index.jsp">Home </a></li>
                      <li><a href="About.jsp"> About </a></li>
                      <li><a href="ListProducts.jsp"> List Products </a></li>
                      <li><a href="BuyerProductDetail.jsp"> Product Details </a></li>
                      <li><a href="contact.jsp"> Contact </a></li>
                  </ul>
              </div>

              <!-- NAV RIGHT -->
              <div class="nav-right"> <span class="call-mun"><i class="fa fa-phone"></i> <strong>Hotline:</strong> (+100) 123 456 7890</span> </div>
          </div>
      </nav>
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
        <div class="col-md-4">
          <h4>Contact SmartTech!</h4>
          <p>Address: 45 Grand Central Terminal New York, NY 1017
            United State USA</p>
          <p>Phone: (+100) 123 456 7890</p>
          <p>Email: Support@smarttech.com</p>
          <!-- Social Links -->
          <div class="social-links"> <a href="#."><i class="fa fa-facebook"></i></a> <a href="#."><i class="fa fa-twitter"></i></a> <a href="#."><i class="fa fa-linkedin"></i></a> <a href="#."><i class="fa fa-pinterest"></i></a> <a href="#."><i class="fa fa-instagram"></i></a> <a href="#."><i class="fa fa-google"></i></a> </div>
        </div>
        
        <!-- Categories -->
        <div class="col-md-3">
          <h4>Categories</h4>
          <ul class="links-footer">
            <li><a href="#.">Home Audio & Theater</a></li>
            <li><a href="#."> TV & Video</a></li>
            <li><a href="#."> Camera, Photo & Video</a></li>
            <li><a href="#."> Cell Phones & Accessories</a></li>
            <li><a href="#."> Headphones</a></li>
            <li><a href="#."> Video Games</a></li>
            <li><a href="#."> Bluetooth & Wireless</a></li>
          </ul>
        </div>
        
        <!-- Categories -->
        <div class="col-md-3">
          <h4>Customer Services</h4>
          <ul class="links-footer">
            <li><a href="#.">Shipping & Returns</a></li>
            <li><a href="#."> Secure Shopping</a></li>
            <li><a href="#."> International Shipping</a></li>
            <li><a href="#."> Affiliates</a></li>
            <li><a href="#."> Contact </a></li>
          </ul>
        </div>
        
        <!-- Categories -->
        <div class="col-md-2">
          <h4>Information</h4>
          <ul class="links-footer">
            <li><a href="#.">Our Blog</a></li>
            <li><a href="#."> About Our Shop</a></li>
            <li><a href="#."> Secure Shopping</a></li>
            <li><a href="#."> Delivery infomation</a></li>
            <li><a href="#."> Store Locations</a></li>
            <li><a href="#."> FAQs</a></li>
          </ul>
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
