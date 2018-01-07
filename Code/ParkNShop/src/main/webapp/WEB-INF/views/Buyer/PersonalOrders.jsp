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

 <link rel="stylesheet" href="assets/css/bootstrap0.min.css">
 <link href="assets/css/components.css" rel="stylesheet">
  <link href="assets/css/style-shop.css" rel="stylesheet" type="text/css">
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
.but{
color:white;
font-size:15px;
width:120px;height:30px;
border:1px solid #1e7db9;
    border-radius: 3px;
box-shadow: 0 1px 2px #8fcaee inset,0 -1px 0 #497897 inset,0 -2px 3px #8fcaee inset;
background: -webkit-linear-gradient(top,#42a4e0,#2e88c0);
background: -moz-linear-gradient(top,#42a4e0,#2e88c0);
background: linear-gradient(top,#42a4e0,#2e88c0);
}
.hidecontent {display:none;}
</style>
  <!-- JavaScripts -->
  <script src="assets/js/vendors/modernizr.js"></script>
  <script src="assets/js/myCart.js"></script>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <!-- <script language="javascript">
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
</script> -->
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
                                    <div class="media-left"> <a href="#." class="thumb"> <img src="${pageContext.request.contextPath}/upload/productPicture/${buyerItem.getProduct().getProductPicture()}" class="img-responsive" alt="" > </a> </div>
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
    
		<!-- <!-- <section class="top-md-menu">
			<div class="container">
				<div class="main-menu">
					 nav 
					<nav class="navbar navbar-inverse navbar-default">
						Brand and toggle get grouped for better mobile display

						Collect the nav links, forms, and other content for toggling
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" data-hover="dropdown" data-animations=" fadeInLeft fadeInUp fadeInRight">
							<ul class="nav navbar-nav">
								
            <li id="tag1"><a href="#" onclick="switchTag('tag1','content1');this.blur();"><span>All Orders</span></a></li>
            <li id="tag2"><a href="#" onclick="switchTag('tag2','content2');this.blur();"><span>已付款</span></a></li>
            <li id="tag3"><a href="#" onclick="switchTag('tag3','content3');this.blur();"><span>待付款</span></a></li>
            <li id="tag4"><a href="#" onclick="switchTag('tag4','content4');this.blur();"><span>待收货</span></a></li>
            <li id="tag5"><a href="#" onclick="switchTag('tag5','content5');this.blur();"><span>待评价</span></a></li>
        
							</ul>
							/.navbar-collapse
						</div>
					</nav>
					/nav end
				</div>
			</div>
		</section> --> 

  </header>

 <div class="container1">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>Shopping Orders</h1>
              <form action="/BuyerOrderSearch">
                  <div class="panel-body" id="select_time_div">
                      <span>Please Select the Time of Orders</span><br>
                      <Span>Type</Span>
                      <select id="select_time_type" onchange="selected_type()" name="select_type" style="height:25px">
                          <option value=""></option>
                          <option value="Daily">Daily</option>
                          <option value="Weekly">Weekly</option>
                          <option value="Monthly">Monthly</option>
                          <option value="Yearly">Yearly</option>
                      </select>
                      <select id="time_select_year" name="time_year" hidden></select>
                      <input type="date" name="time" id="time_select" style="height:25px"hidden>
                      <input type="submit" value="Search" id="search_submit"  href="" hidden>
                  </div>
              </form>
            <div class="goods-page">
              <div class="goods-data clearfix">
                <div class="table-wrapper-responsive">
                 
                <table summary="Shopping cart">
                  <tr>
                    <th class="goods-page-image">Image</th>
                    <th class="goods-page-description">Description</th>
                    <th class="goods-page-price">Unit price</th>
                    <th class="goods-page-quantity">Quantity</th>
                    <th class="goods-page-total">Payment</th>
                    <th class="goods-page-ref-no">Status</th>
                    <th class="goods-page-ref-no">Operate</th>
                  </tr>
                  <c:choose>
       					 <c:when test="${orders eq null}">
          					<tr>
								<td colspan="8">NO order!</td>
							</tr>
        				</c:when>
       			 <c:otherwise>
        				<c:forEach var="buyerItem" items="${orders}">
        				<tr>
   							 <td colspan="8" class="shopInfo">Date：${buyerItem.getOrder().getOrderTime()} &nbsp;&nbsp;&nbsp;OrderID：${buyerItem.getOrder().getOrderId()} &nbsp;&nbsp;&nbsp; Shop：${buyerItem.getSeller().getShopName()}</td>
  						</tr>
                 		<tr>
                    		<td class="goods-page-image">
                      			<a href="javascript:;"><img src="${pageContext.request.contextPath}/upload/productPicture/${buyerItem.getProduct().getProductPicture()}" alt="shopping"></a>
                    		</td>
                    		<td class="goods-page-description" style="width:480px">
                      			<h3><a href="/ProductDetail?productId=${buyerItem.getProduct().getProductId()}">${buyerItem.getProduct().getProductName()}</a></h3><br />
                      				${buyerItem.getProduct().getProductIntroduction()}<br />
                    		</td>
                   			
                    		<td class="goods-page-price">
                      			<strong><span>$</span>${buyerItem.getProduct().getProductPrice()}</strong>
                   			</td>
                   			<td class="goods-page-quantity">
                      			<div class="product-quantity" style="text-aline:center">
                         		<strong> ${buyerItem.getOrder().getCount()}</strong>
                      			</div>
                   			 </td>
                    		<td class="goods-page-total">
                      			<strong><span>$</span>${buyerItem.getOrder().getTotalPrice()}</strong>
                    		</td>
                    		<td class="goods-page-ref-no">
                      			<c:choose>
                               		<c:when test="${buyerItem.getOrder().getOrderStatus() eq 1}">Non-Payment</c:when>
                                	<c:when test="${buyerItem.getOrder().getOrderStatus() eq 2}"></c:when>
                                	<c:when test="${buyerItem.getOrder().getOrderStatus() eq 3}">Paid</c:when>
                                	<c:when test="${buyerItem.getOrder().getOrderStatus() eq 4}">Shipped</c:when>
                                	<c:when test="${buyerItem.getOrder().getOrderStatus() eq 5}">Success</c:when>
                                	<c:when test="${buyerItem.getOrder().getOrderStatus() eq 6}">RefundAndReturning</c:when>
                                	<c:when test="${buyerItem.getOrder().getOrderStatus() eq 7}">Refund succeed</c:when>
                                	<c:when test="${buyerItem.getOrder().getOrderStatus() eq 8}">Refund failed</c:when>
                                    <c:when test="${buyerItem.getOrder().getOrderStatus() eq 9}">Commented</c:when>
                                </c:choose>
                   			</td>
                    		<td class="goods-page-ref-no">
                    		 	<c:choose>
                               		<c:when test="${buyerItem.getOrder().getOrderStatus() eq 1}"><a href='/onPaidSingleClick?orderId=${buyerItem.getOrder().getOrderId()}' ><button class="but">Pay</button></a><br/><br/></c:when>
                                	<c:when test="${buyerItem.getOrder().getOrderStatus() eq 3}">To be Shipped<br/><br/>
                                        <a href='/buyerReturns?orderId=${buyerItem.getOrder().getOrderId()}' ><button class="but">Refunds</button></a><br/>
                                    </c:when>
                                	<c:when test="${buyerItem.getOrder().getOrderStatus() eq 4}"><a href='/onConfirmReceivedClick?orderId=${buyerItem.getOrder().getOrderId()}' ><button class="but">Confirm receipt</button></a><br/><br/>
                                        <a href='/buyerReturns?orderId=${buyerItem.getOrder().getOrderId()}' ><button class="but">Refunds</button></a><br/>
                                    </c:when>
                                	<c:when test="${buyerItem.getOrder().getOrderStatus() eq 5}"><a href='/buyerComment?orderId=${buyerItem.getOrder().getOrderId()}' ><button class="but">Comment</button></a><br/><br/>
                                        <a href='/buyerReturns?orderId=${buyerItem.getOrder().getOrderId()}' ><button class="but">Refunds</button></a><br/>
                                    </c:when>
                                    <c:when test="${buyerItem.getOrder().getOrderStatus() eq 9}"><a href='/buyerReturns?orderId=${buyerItem.getOrder().getOrderId()}' ><button class="but">Refunds</button></a><br/>
                                    </c:when>
                                    </c:choose>
                    		</td>
                 		 </tr>

                 		 </c:forEach>
       			 </c:otherwise>
       			 </c:choose>
                </table>
                </div>
              
          </div>
           </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->


      </div>





  
 
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
          Copyright © 2017-2018  www.ParkNShop.com  
        </div>
      </div>
    </div>
  </footer>
  <!-- End Footer -->

  <!-- GO TO TOP  -->
  <a href="#" class="cd-top"><i class="fa fa-angle-up"></i></a>
  <!-- GO TO TOP End -->
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
    <script src="assets/js/main2.js"></script>
    <script>
        // 时间选择控制代码
        function selected_type() {
            var type = document.getElementById("select_time_type");
            var time = document.getElementById("time_select");
            var time_year = document.getElementById("time_select_year");
            var submit = document.getElementById("search_submit");
            var currentTime = new Date();
            var currentYear = currentTime.getFullYear();
            var currentMonth = (currentTime.getMonth() + 1) < 10 ? "0" + (currentTime.getMonth()+ 1): "" + (currentTime.getMonth() + 1);
            var currentWeek = (((new Date())-(new Date("2017-01-01")))/(24*60*60*7*1000)|0) +1;
            var currentDay = currentTime.getDate() < 10 ? "0" + currentTime.getDate(): "" + currentTime.getDate();
            time.hidden = false;
            time_year.hidden = true;
            switch (type.value){
                case "Daily": {
                    time.type="date";
                    time.value = currentYear + "-" + currentMonth + "-"+ currentDay;
                    break;
                }
                case "Weekly": {
                    time.type="week";
                    time.value = currentYear + "-W" + currentWeek;
                    break;
                }
                case "Monthly": {
                    time.type="month";
                    time.value = currentYear + "-" + currentMonth;
                    break;
                }
                case "Yearly": {
                    time.hidden=true;
                    time_year.hidden = false;
                    for(var i = currentYear; i >= 2014; i--){
                        time_year.appendChild(new Option(i + "", i + ""));
                    }
                    break;
                }
            }
            submit.hidden = false;
        }
    </script>
</body>
</html>