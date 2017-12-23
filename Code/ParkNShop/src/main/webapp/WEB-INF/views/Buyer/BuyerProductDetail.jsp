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
                    <div class="media-left"> <a href="#." class="thumb"> <img src="assets/images/item-img-1-1.jpg" class="img-responsive" alt="" > </a> </div>
                    <div class="media-body"> <a href="#." class="tittle"></a> <span> ${buyerItem.getProduct().getProductPrice()}* ${buyerItem.getAmount()}</span> </div>
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
          
          <!-- Shop Side Bar -->
          <div class="col-md-3">
            <div class="shop-side-bar"> 
              
              <!-- Categories -->
              <h6>Categories</h6>
              <div class="checkbox checkbox-primary">
                <ul>
                  <li>
                    <input id="cate1" class="styled" type="checkbox" >
                    <label for="cate1"> Home Audio & Theater </label>
                  </li>
                  <li>
                    <input id="cate2" class="styled" type="checkbox" >
                    <label for="cate2"> TV & Video</label>
                  </li>
                  <li>
                    <input id="cate3" class="styled" type="checkbox" >
                    <label for="cate3"> Camera, Photo & Video</label>
                  </li>
                  <li>
                    <input id="cate4" class="styled" type="checkbox" >
                    <label for="cate4"> Cell Phones & Accessories</label>
                  </li>
                  <li>
                    <input id="cate5" class="styled" type="checkbox" >
                    <label for="cate5"> Headphones</label>
                  </li>
                  <li>
                    <input id="cate6" class="styled" type="checkbox" >
                    <label for="cate6"> Video Games</label>
                  </li>
                  <li>
                    <input id="cate7" class="styled" type="checkbox" >
                    <label for="cate7"> Bluetooth & Wireless Speakers</label>
                  </li>
                  <li>
                    <input id="cate8" class="styled" type="checkbox" >
                    <label for="cate8"> Gaming Console</label>
                  </li>
                </ul>
              </div>
              
              <!-- Categories -->
              <h6>Price</h6>
              <!-- PRICE -->
              <div class="cost-price-content">
                <div id="price-range" class="price-range"></div>
                <span id="price-min" class="price-min">20</span> <span id="price-max" class="price-max">80</span> <a href="#." class="btn-round" >Filter</a> </div>
              
              <!-- Featured Brands -->
              <h6>Featured Brands</h6>
              <div class="checkbox checkbox-primary">
                <ul>
                  <li>
                    <input id="brand1" class="styled" type="checkbox" >
                    <label for="brand1"> Apple <span>(217)</span> </label>
                  </li>
                  <li>
                    <input id="brand2" class="styled" type="checkbox" >
                    <label for="brand2"> Acer <span>(79)</span> </label>
                  </li>
                  <li>
                    <input id="brand3" class="styled" type="checkbox" >
                    <label for="brand3"> Asus <span>(283)</span> </label>
                  </li>
                  <li>
                    <input id="brand4" class="styled" type="checkbox" >
                    <label for="brand4">Samsung <span>(116)</span> </label>
                  </li>
                  <li>
                    <input id="brand5" class="styled" type="checkbox" >
                    <label for="brand5"> LG <span>(29)</span> </label>
                  </li>
                  <li>
                    <input id="brand6" class="styled" type="checkbox" >
                    <label for="brand6"> Electrolux <span>(179)</span> </label>
                  </li>
                  <li>
                    <input id="brand7" class="styled" type="checkbox" >
                    <label for="brand7"> Toshiba <span>(38)</span> </label>
                  </li>
                  <li>
                    <input id="brand8" class="styled" type="checkbox" >
                    <label for="brand8"> Sharp <span>(205)</span> </label>
                  </li>
                  <li>
                    <input id="brand9" class="styled" type="checkbox" >
                    <label for="brand9"> Sony <span>(35)</span> </label>
                  </li>
                </ul>
              </div>
              
              <!-- Rating -->
              <h6>Rating</h6>
              <div class="rating">
                <ul>
                  <li><a href="#."><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i> <span>(218)</span></a></li>
                  <li><a href="#."><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i> <span>(178)</span></a></li>
                  <li><a href="#."><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i> <span>(79)</span></a></li>
                  <li><a href="#."><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i> <span>(188)</span></a></li>
                </ul>
              </div>
              
              <!-- Colors -->
              <h6>Size</h6>
              <div class="sizes"> <a href="#.">S</a> <a href="#.">M</a> <a href="#.">L</a> <a href="#.">XL</a> </div>
              
              <!-- Colors -->
              <h6>Colors</h6>
              <div class="checkbox checkbox-primary">
                <ul>
                  <li>
                    <input id="colr1" class="styled" type="checkbox" >
                    <label for="colr1"> Red <span>(217)</span> </label>
                  </li>
                  <li>
                    <input id="colr2" class="styled" type="checkbox" >
                    <label for="colr2"> Yellow <span> (179) </span> </label>
                  </li>
                  <li>
                    <input id="colr3" class="styled" type="checkbox" >
                    <label for="colr3"> Black <span>(79)</span> </label>
                  </li>
                  <li>
                    <input id="colr4" class="styled" type="checkbox" >
                    <label for="colr4">Blue <span>(283) </span></label>
                  </li>
                  <li>
                    <input id="colr5" class="styled" type="checkbox" >
                    <label for="colr5"> Grey <span> (116)</span> </label>
                  </li>
                  <li>
                    <input id="colr6" class="styled" type="checkbox" >
                    <label for="colr6"> Pink<span> (29) </span></label>
                  </li>
                  <li>
                    <input id="colr7" class="styled" type="checkbox" >
                    <label for="colr7"> White <span> (38)</span> </label>
                  </li>
                  <li>
                    <input id="colr8" class="styled" type="checkbox" >
                    <label for="colr8">Green <span>(205)</span></label>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          
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
                          <li data-thumb="images/item-img-1-1.jpg"> <img src="assets/images/item-img-1-1.jpg" alt="" > </li>
                          <li data-thumb="images/item-img-1-2.jpg"> <img src="assets/images/item-img-1-2.jpg" alt="" > </li>
                          <li data-thumb="images/item-img-1-3.jpg"> <img src="assets/images/item-img-1-3.jpg" alt="" > </li>
                        </ul>
                      </div>
                    </article>
                  </div>
                  <!-- Item Content -->
                  <div class="col-xs-7"> <span class="tags">Smartphones</span>
                    <h5>Power Smartphone 7s Silver 128GB/ Camera 7.5”</h5>
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="row">
                      <div class="col-sm-6"><span class="price">$480.00 </span></div>
                      <div class="col-sm-6">
                        <p>Availability: <span class="in-stock">In stock</span></p>
                      </div>
                    </div>
                    <!-- List Details -->
                    <ul class="bullet-round-list">
                      <li>Screen: 1920 x 1080 pixels</li>
                      <li>Processor: 2.5 GHz None</li>
                      <li>RAM: 8 GB</li>
                      <li>Hard Drive: Flash memory solid state</li>
                      <li>Graphics : Intel HD Graphics 520 Integrated</li>
                      <li>Card Description: Integrated</li>
                    </ul>
                    <!-- Colors -->
                    <div class="row">
                      <div class="col-xs-5">
                        <div class="clr"> <span style="background:#068bcd"></span> <span style="background:#d4b174"></span> <span style="background:#333333"></span> </div>
                      </div>
                      <!-- Sizes -->
                      <div class="col-xs-7">
                        <div class="sizes"> <a href="#.">S</a> <a class="active" href="#.">M</a> <a href="#.">L</a> <a href="#.">XL</a> </div>
                      </div>
                    </div>
                    <!-- Compare Wishlist -->
                    <ul class="cmp-list">
                      <li><a href="#."><i class="fa fa-heart"></i> Add to Wishlist</a></li>
                      <li><a href="#."><i class="fa fa-navicon"></i> Add to Compare</a></li>
                      <li><a href="#."><i class="fa fa-envelope"></i> Email to a friend</a></li>
                    </ul>
                    <!-- Quinty -->
                    <div class="quinty">
                      <input type="number" value="1">
                    </div>
                    <a href="#." class="btn-round"><i class="icon-basket-loaded margin-right-5"></i> Add to Cart</a> </div>
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
                      <li>Power Smartphone 7s G930F 128GB International version - Silver</li>
                      <li> 2G bands: GSM 850 / 900 / 1800 / 1900 3G bands: HSDPA 850 / 900 / 1900 / 2100 4G bands: LTE 700 / 800 / 850<br>
                        900 / 1800 / 1900 / 2100 / 2600</li>
                      <li> Dimensions: 142.4 x 69.6 x 7.9 mm (5.61 x 2.74 x 0.31 in) Weight 152 g (5.36 oz)</li>
                      <li> IP68 certified - dust proof and water resistant over 1.5 meter and 30 minutes</li>
                      <li> Internal: 128GB, 4 GB RAM </li>
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
                  <article> <img class="img-responsive" src="assets/images/item-img-1-1.jpg" alt="" >
                    <!-- Content --> 
                    <span class="tag">Latop</span> <a href="#." class="tittle">Laptop Alienware 15 i7 Perfect For Playing Game</a> 
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00 </div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="assets/images/item-img-1-2.jpg" alt="" > <span class="sale-tag">-25%</span>
                    
                    <!-- Content --> 
                    <span class="tag">Tablets</span> <a href="#." class="tittle">Mp3 Sumergible Deportivo Slim Con 8GB</a> 
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00 <span>$200.00</span></div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
                
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="assets/images/item-img-1-3.jpg" alt="" >
                    <!-- Content --> 
                    <span class="tag">Appliances</span> <a href="#." class="tittle">Reloj Inteligente Smart Watch M26 Touch </a> 
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00</div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
                
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="assets/images/item-img-1-4.jpg" alt="" > <span class="new-tag">New</span>
                    
                    <!-- Content --> 
                    <span class="tag">Accessories</span> <a href="#." class="tittle">Teclado Inalambrico Bluetooth Con Air Mouse</a> 
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00</div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
                
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="assets/images/item-img-1-5.jpg" alt="" >
                    <!-- Content --> 
                    <span class="tag">Appliances</span> <a href="#." class="tittle">Funda Para Ebook 7" 128GB full HD</a> 
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00</div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
                
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="assets/images/item-img-1-6.jpg" alt="" > <span class="sale-tag">-25%</span>
                    
                    <!-- Content --> 
                    <span class="tag">Tablets</span> <a href="#." class="tittle">Mp3 Sumergible Deportivo Slim Con 8GB</a> 
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00 <span>$200.00</span></div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
                
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="assets/images/item-img-1-7.jpg" alt="" >
                    <!-- Content --> 
                    <span class="tag">Appliances</span> <a href="#." class="tittle">Reloj Inteligente Smart Watch M26 Touch </a> 
                    <!-- Reviews -->
                    <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
                    <div class="price">$350.00</div>
                    <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
                </div>
                
                <!-- Product -->
                <div class="product">
                  <article> <img class="img-responsive" src="assets/images/item-img-1-8.jpg" alt="" > <span class="new-tag">New</span>
                    
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
            <article> <img class="img-responsive" src="assets/images/item-img-1-1.jpg" alt="" >
              <!-- Content --> 
              <span class="tag">Latop</span> <a href="#." class="tittle">Laptop Alienware 15 i7 Perfect For Playing Game</a> 
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00 </div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>
          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="assets/images/item-img-1-2.jpg" alt="" > <span class="sale-tag">-25%</span>
              
              <!-- Content --> 
              <span class="tag">Tablets</span> <a href="#." class="tittle">Mp3 Sumergible Deportivo Slim Con 8GB</a> 
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00 <span>$200.00</span></div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>
          
          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="assets/images/item-img-1-3.jpg" alt="" >
              <!-- Content --> 
              <span class="tag">Appliances</span> <a href="#." class="tittle">Reloj Inteligente Smart Watch M26 Touch Bluetooh </a> 
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00</div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>
          
          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="assets/images/item-img-1-4.jpg" alt="" > <span class="new-tag">New</span>
              
              <!-- Content --> 
              <span class="tag">Accessories</span> <a href="#." class="tittle">Teclado Inalambrico Bluetooth Con Air Mouse</a> 
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00</div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>
          
          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="assets/images/item-img-1-5.jpg" alt="" >
              <!-- Content --> 
              <span class="tag">Appliances</span> <a href="#." class="tittle">Funda Para Ebook 7" 128GB full HD</a> 
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00</div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>
          
          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="assets/images/item-img-1-6.jpg" alt="" > <span class="sale-tag">-25%</span>
              
              <!-- Content --> 
              <span class="tag">Tablets</span> <a href="#." class="tittle">Mp3 Sumergible Deportivo Slim Con 8GB</a> 
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00 <span>$200.00</span></div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>
          
          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="assets/images/item-img-1-7.jpg" alt="" >
              <!-- Content --> 
              <span class="tag">Appliances</span> <a href="#." class="tittle">Reloj Inteligente Smart Watch M26 Touch Bluetooh </a> 
              <!-- Reviews -->
              <p class="rev"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <span class="margin-left-10">5 Review(s)</span></p>
              <div class="price">$350.00</div>
              <a href="#." class="cart-btn"><i class="icon-basket-loaded"></i></a> </article>
          </div>
          
          <!-- Product -->
          <div class="product">
            <article> <img class="img-responsive" src="assets/images/item-img-1-8.jpg" alt="" > <span class="new-tag">New</span>
              
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
          <li><img src="assets/images/c-img-1.png" alt="" ></li>
          <li><img src="assets/images/c-img-2.png" alt="" ></li>
          <li><img src="assets/images/c-img-3.png" alt="" ></li>
          <li><img src="assets/images/c-img-4.png" alt="" ></li>
          <li><img src="assets/images/c-img-5.png" alt="" ></li>
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
  
  <!-- Rights -->
  <div class="rights">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
        </div>
        <div class="col-sm-6 text-right"> <img src="assets/images/card-icon.png" alt=""> </div>
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
