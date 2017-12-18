<%@ page import="com.ten.ParkNShop.entity.Product" %>
<%@ page import="com.ten.ParkNShop.mapper.ProductMapper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta name="author" content="M_Adnan" />
  <!-- Document Title -->
  <title></title>

  <!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
  <link rel="stylesheet" type="text/css" href="rs-plugin/css/settings.css" media="screen" />

  <!-- StyleSheets -->
  <link rel="stylesheet" href="css/ionicons.min.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/responsive.css">

  <!-- Fonts Online -->
  <link href="https://fonts.googleapis.com/css?family=Lato:100i,300,400,700,900" rel="stylesheet">

  <!-- JavaScripts -->
  <script src="js/vendors/modernizr.js"></script>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>

<%!
  ProductMapper productMapper;
  String type;
%>

<%
  int productId = Integer.parseInt(request.getParameter("name"));
  Product product = productMapper.findByProductId(productId);
  switch (product.getProductType()) {
    case 1:
        type = "Home Audio";
        break;
    case 2:
        type = "Theater";
        break;
    case 3:
      type = "TV";
      break;
    case 4:
      type = "Video";
      break;
    case 5:
      type = "Camera";
      break;
    case 6:
      type = "Photo";
      break;
    case 7:
      type = "Cell Phones";
      break;
    case 8:
      type = "Accessories";
      break;
    case 9:
      type = "Headphones";
      break;
    case 10:
      type = "Video Games";
      break;
    case 11:
      type = "Bluetooth";
      break;
    case 12:
      type = "Wireless Speakers";
      break;
    case 13:
      type = "Gaming Console";
      break;
    case 14:
      type = "Computers";
      break;
    case 15:
      type = "Tablets";
      break;
    case 16:
      type = "Monitors";
      break;
    case 17:
      type = "Home Appliances";
      break;
    case 18:
      type = "Office Supplies";
      break;
  }
%>

<!-- Page Wrapper -->
<div id="wrap">

  <!-- Top bar -->
  <div class="top-bar">
    <div class="container">
      <p>Welcome to SmartTech center!</p>
      <div class="right-sec">
        <ul>
          <li><a href="#.">Login/Register </a></li>
          <li><a href="#.">Store Location </a></li>
          <li><a href="#.">FAQ </a></li>
          <li><a href="#.">Newsletter </a></li>
          <li>
            <select class="selectpicker">
              <option>French</option>
              <option>German</option>
              <option>Italian</option>
              <option>Japanese</option>
            </select>
          </li>
          <li>
            <select class="selectpicker">
              <option>(USD)Dollar</option>
              <option>GBP</option>
              <option>Euro</option>
              <option>JPY</option>
            </select>
          </li>
        </ul>
        <div class="social-top"> <a href="#."><i class="fa fa-facebook"></i></a> <a href="#."><i class="fa fa-twitter"></i></a> <a href="#."><i class="fa fa-linkedin"></i></a> <a href="#."><i class="fa fa-dribbble"></i></a> <a href="#."><i class="fa fa-pinterest"></i></a> </div>
      </div>
    </div>
  </div>

  <!-- Header -->
  <header>
    <div class="container">
      <div class="logo"> <a href="index.html"><img src="images/logo.png" alt="" ></a> </div>
      <div class="search-cate">
        <select class="selectpicker">
          <option> All Categories</option>
          <option> Home Audio & Theater</option>
          <option> TV & Video</option>
          <option> Camera, Photo & Video</option>
          <option> Cell Phones & Accessories</option>
          <option> Headphones</option>
          <option> Video Games</option>
          <option> Bluetooth & Wireless </option>
          <option> Gaming Console</option>
          <option> Computers & Tablets</option>
          <option> Monitors </option>
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
              <div class="media-left"> <a href="#." class="thumb"> <img src="images/item-img-1-1.jpg" class="img-responsive" alt="" > </a> </div>
              <div class="media-body"> <a href="#." class="tittle">Funda Para Ebook 7" 128GB full HD</a> <span>250 x 1</span> </div>
            </li>
            <li>
              <div class="media-left"> <a href="#." class="thumb"> <img src="images/item-img-1-2.jpg" class="img-responsive" alt="" > </a> </div>
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
                <li><a href="#."> Home Audio & Theater</a></li>
                <li><a href="#."> TV & Video</a></li>
                <li><a href="#."> Camera, Photo & Video</a></li>
                <li class="sub-menu"><a href="#."> Cell Phones & Accessories</a>
                  <ul>
                    <li><a href="#."> TV & Video</a></li>
                    <li><a href="#."> Camera, Photo & Video</a></li>
                    <li><a href="#."> Cell Phones & Accessories</a>
                  </ul>
                </li>
                <li><a href="#."> Headphones</a></li>
                <li><a href="#."> Video Games</a></li>
                <li class="sub-menu"><a href="#."> Bluetooth & Wireless Speakers</a>
                  <ul>
                    <li><a href="#."> TV & Video</a></li>
                    <li><a href="#."> Camera, Photo & Video</a></li>
                    <li><a href="#."> Cell Phones & Accessories</a>
                  </ul>
                </li>
                <li class="sub-menu"><a href="#."> Gaming Console</a>
                  <ul>
                    <li><a href="#."> TV & Video</a></li>
                    <li><a href="#."> Camera, Photo & Video</a></li>
                    <li><a href="#."> Cell Phones & Accessories</a>
                  </ul>
                </li>
                <li><a href="#."> Computers & Tablets</a></li>
                <li><a href="#."> Monitors</a></li>
                <li><a href="#."> Home Appliances</a></li>
                <li><a href="#."> Office Supplies</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-open-btn" aria-expanded="false"> <span><i class="fa fa-navicon"></i></span> </button>
        </div>

        <!-- NAV -->
        <div class="collapse navbar-collapse" id="nav-open-btn">
          <ul class="nav">
            <li><a href="index.html">Home </a></li>
            <li><a href="About.html"> About </a></li>
            <li><a href="ListProducts.html"> List Products </a></li>
            <li><a href="Product-Details.html"> Product Details </a></li>
            <li><a href="contact.html"> Contact </a></li>
          </ul>
        </div>

        <!-- NAV RIGHT -->
        <div class="nav-right"> </div>
      </div>
    </nav>
  </header>

  <!-- Linking -->
  <div class="linking">
    <div class="container">
      <ol class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li><a href="#">Cell Phones & Accessories</a></li>
        <li class="active">Power Smartphone 7s Silver 128GB/ Camera 7.5”</li>
      </ol>
    </div>
  </div>

  <!-- Content -->
  <div id="content">

    <!-- Products -->
    <section class="padding-top-40 padding-bottom-60">
      <div class="container">
        <div class="row">

          <!-- Products -->
          <div class="col-md-9">
            <div class="product-detail">
              <div class="product">
                <div class="row">
                  <!-- Slider Thumb -->
                  <div class="col-xs-5">
                    <article class="slider-item on-nav">
                      <div class="thumb-slider">
                        <ul class="slides">
                          <li data-thumb="images/item-img-1-1.jpg"> <img src="images/<%product.getProductPicture();%>" alt="" > </li>
                        </ul>
                      </div>
                    </article>
                  </div>
                  <!-- Item Content -->
                  <div class="col-xs-7"> <span class="tags"><%=type%></span>
                    <h5><%product.getProductName();%></h5>
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="row">
                      <div class="col-sm-6"><span class="price"><%product.getProductPrice();%> </span></div>
                      <div class="col-sm-6">
                        <p>Availability: <span class="in-stock">In stock</span></p>
                      </div>
                    </div>
                    <!-- List Details -->
                    <ul class="bullet-round-list">
                      <li><%product.getProductIntroduction();%></li>
                    </ul>
                    <!-- Compare Wishlist -->
                    <ul class="cmp-list">
                      <li><a href="#."><i class="fa fa-heart"></i> Add to Wishlist</a></li>
                      <li><a href="#."><i class="fa fa-navicon"></i> Add to Compare</a></li>
                      <li><a href="#."><i class="fa fa-envelope"></i> Email to a friend</a></li>
                    </ul>
                    <!-- Quinty -->
                    <form action="/AddToBuyerCart">
                      <input name="productId" type="hidden" value="<%product.getProductId();%>"/>
                      <div class="quinty">
                        <input name="productNumber" type="number" value="01">
                      </div>
                      <button class="btn-round" type="submit"><i class="icon-basket-loaded margin-right-5"></i> Add to Cart</button>
                    </form>

                  </div>
                </div>
              </div>

              <!-- Details Tab Section-->
              <div class="item-tabs-sec">

                <!-- Nav tabs -->
                <ul class="nav" role="tablist">
                  <li role="presentation" class="active"><a href="#pro-detil"  role="tab" data-toggle="tab">Product Details</a></li>
                  <li role="presentation"><a href="#cus-rev"  role="tab" data-toggle="tab">Customer Reviews</a></li>
                  <li role="presentation"><a href="#ship" role="tab" data-toggle="tab">Shipping & Payment</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                  <div role="tabpanel" class="tab-pane fade in active" id="pro-detil">
                    <!-- List Details -->
                    <ul class="bullet-round-list">
                      <li> <%product.getProductIntroduction();%> </li>
                    </ul>
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                        <tr>
                          <th>Carrier</th>
                          <th>Compatibility Rating </th>
                          <th>Voice / Text </th>
                          <th>Voice / Text </th>
                          <th>2G Data </th>
                          <th>3G Data </th>
                          <th>4G LTE Data </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                          <td>AT&T </td>
                          <td>Fully Compatible</td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                          <td class="text-center"></td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                          <td class="text-center"></td>
                        </tr>
                        <tr>
                          <td>Sprint </td>
                          <td>No Voice/Text and Partial Data Connection</td>
                          <td class="text-center"></td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                        </tr>
                        <tr>
                          <td>Q-Mobile </td>
                          <td>Partial Data Connection</td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                          <td class="text-center"></td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                        </tr>
                        <tr>
                          <td>Verizon Wireless </td>
                          <td>No Votice/Text and Partial Data Connection</td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                          <td class="text-center"></td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                          <td class="text-center"><i class="fa fa-check"></i></td>
                        </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <div role="tabpanel" class="tab-pane fade" id="cus-rev"></div>
                  <div role="tabpanel" class="tab-pane fade" id="ship"></div>
                </div>
              </div>
            </div>

            <!-- Related Products -->
            <section class="padding-top-30 padding-bottom-0">
              <!-- heading -->
              <div class="heading">
                <h2>Related Products</h2>
                <hr>
              </div>
              <!-- Items Slider -->
              <div class="item-slide-4 with-nav">
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="images/item-img-1-1.jpg" alt="" >
                    <!-- Content -->
                    <span class="tag">Latop</span> <a href="#." class="tittle">Laptop Alienware 15 i7 Perfect For Playing Game</a>
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00 </div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="images/item-img-1-2.jpg" alt="" > <span class="sale-tag">-25%</span>

                    <!-- Content -->
                    <span class="tag">Tablets</span> <a href="#." class="tittle">Mp3 Sumergible Deportivo Slim Con 8GB</a>
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00 <span>$200.00</span></div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>

                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="images/item-img-1-3.jpg" alt="" >
                    <!-- Content -->
                    <span class="tag">Appliances</span> <a href="#." class="tittle">Reloj Inteligente Smart Watch M26 Touch </a>
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00</div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>

                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="images/item-img-1-4.jpg" alt="" > <span class="new-tag">New</span>

                    <!-- Content -->
                    <span class="tag">Accessories</span> <a href="#." class="tittle">Teclado Inalambrico Bluetooth Con Air Mouse</a>
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00</div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>

                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="images/item-img-1-5.jpg" alt="" >
                    <!-- Content -->
                    <span class="tag">Appliances</span> <a href="#." class="tittle">Funda Para Ebook 7" 128GB full HD</a>
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00</div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>

                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="images/item-img-1-6.jpg" alt="" > <span class="sale-tag">-25%</span>

                    <!-- Content -->
                    <span class="tag">Tablets</span> <a href="#." class="tittle">Mp3 Sumergible Deportivo Slim Con 8GB</a>
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00 <span>$200.00</span></div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>

                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="images/item-img-1-7.jpg" alt="" >
                    <!-- Content -->
                    <span class="tag">Appliances</span> <a href="#." class="tittle">Reloj Inteligente Smart Watch M26 Touch </a>
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00</div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>

                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="images/item-img-1-8.jpg" alt="" > <span class="new-tag">New</span>

                    <!-- Content -->
                    <span class="tag">Accessories</span> <a href="#." class="tittle">Teclado Inalambrico Bluetooth Con Air Mouse</a>
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00</div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
              </div>
            </section>
          </div>
        </div>
      </div>
    </section>

    <!-- Your Recently Viewed Items -->
    <section class="padding-bottom-60">
      <div class="container">

        <!-- heading -->
        <div class="heading">
          <h2>Your Recently Viewed Items</h2>
          <hr>
        </div>
        <!-- Items Slider -->
        <div class="item-slide-5 with-nav">
          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="images/item-img-1-1.jpg" alt="" >
              <!-- Content -->
              <span class="tag">Latop</span> <a href="#." class="tittle">Laptop Alienware 15 i7 Perfect For Playing Game</a>
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00 </div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>
          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="images/item-img-1-2.jpg" alt="" > <span class="sale-tag">-25%</span>

              <!-- Content -->
              <span class="tag">Tablets</span> <a href="#." class="tittle">Mp3 Sumergible Deportivo Slim Con 8GB</a>
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00 <span>$200.00</span></div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>

          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="images/item-img-1-3.jpg" alt="" >
              <!-- Content -->
              <span class="tag">Appliances</span> <a href="#." class="tittle">Reloj Inteligente Smart Watch M26 Touch Bluetooh </a>
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00</div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>

          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="images/item-img-1-4.jpg" alt="" > <span class="new-tag">New</span>

              <!-- Content -->
              <span class="tag">Accessories</span> <a href="#." class="tittle">Teclado Inalambrico Bluetooth Con Air Mouse</a>
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00</div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>

          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="images/item-img-1-5.jpg" alt="" >
              <!-- Content -->
              <span class="tag">Appliances</span> <a href="#." class="tittle">Funda Para Ebook 7" 128GB full HD</a>
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00</div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>

          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="images/item-img-1-6.jpg" alt="" > <span class="sale-tag">-25%</span>

              <!-- Content -->
              <span class="tag">Tablets</span> <a href="#." class="tittle">Mp3 Sumergible Deportivo Slim Con 8GB</a>
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00 <span>$200.00</span></div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>

          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="images/item-img-1-7.jpg" alt="" >
              <!-- Content -->
              <span class="tag">Appliances</span> <a href="#." class="tittle">Reloj Inteligente Smart Watch M26 Touch Bluetooh </a>
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00</div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>

          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="images/item-img-1-8.jpg" alt="" > <span class="new-tag">New</span>

              <!-- Content -->
              <span class="tag">Accessories</span> <a href="#." class="tittle">Teclado Inalambrico Bluetooth Con Air Mouse</a>
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00</div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>
        </div>
      </div>
    </section>

    <!-- Clients img -->
    <section class="light-gry-bg clients-img">
      <div class="container">
        <ul>
          <li><img src="images/c-img-1.png" alt="" ></li>
          <li><img src="images/c-img-2.png" alt="" ></li>
          <li><img src="images/c-img-3.png" alt="" ></li>
          <li><img src="images/c-img-4.png" alt="" ></li>
          <li><img src="images/c-img-5.png" alt="" ></li>
        </ul>
      </div>
    </section>

    <!-- Newslatter -->
    <section class="newslatter">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <h3>Subscribe our Newsletter <span>Get <strong>25% Off</strong> first purchase!</span></h3>
          </div>
          <div class="col-md-6">
            <form>
              <input type="email" placeholder="Your email address here...">
              <button type="submit">Subscribe!</button>
            </form>
          </div>
        </div>
      </div>
    </section>
  </div>
  <!-- End Content -->

  <!-- Footer -->
  <footer>
    <div class="container">

      <!-- Footer Upside Links -->
      <div class="foot-link">
        <ul>
          <li><a href="#."> About us </a></li>
          <li><a href="#."> Customer Service </a></li>
          <li><a href="#."> Privacy Policy </a></li>
          <li><a href="#."> Site Map </a></li>
          <li><a href="#."> Search Terms </a></li>
          <li><a href="#."> Advanced Search </a></li>
          <li><a href="#."> Orders and Returns </a></li>
          <li><a href="#."> Contact Us</a></li>
        </ul>
      </div>
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

  <!-- Rights -->
  <div class="rights">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
        </div>
        <div class="col-sm-6 text-right"> <img src="images/card-icon.png" alt=""> </div>
      </div>
    </div>
  </div>

  <!-- End Footer -->

  <!-- GO TO TOP  -->
  <a href="#" class="cd-top"><i class="fa fa-angle-up"></i></a>
  <!-- GO TO TOP End -->
</div>
<!-- End Page Wrapper -->

<!-- JavaScripts -->
<script src="js/vendors/jquery/jquery.min.js"></script>
<script src="js/vendors/wow.min.js"></script>
<script src="js/vendors/bootstrap.min.js"></script>
<script src="js/vendors/own-menu.js"></script>
<script src="js/vendors/jquery.sticky.js"></script>
<script src="js/vendors/owl.carousel.min.js"></script>

<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
<script type="text/javascript" src="rs-plugin/js/jquery.tp.t.min.js"></script>
<script type="text/javascript" src="rs-plugin/js/jquery.tp.min.js"></script>
<script src="js/main.js"></script>
<script src="js/vendors/jquery.nouislider.min.js"></script>
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
