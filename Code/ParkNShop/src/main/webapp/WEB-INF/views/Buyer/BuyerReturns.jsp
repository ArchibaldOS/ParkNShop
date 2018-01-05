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
  <title>Apply Refund</title>

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
  <style type="text/css">
.apply-refund{
            margin-left:auto;
            margin-right:auto;
            width: 1100px;

            background: #F7F7F7;
            font: 12px Georgia, "Times New Roman", Times, serif;
            color: #888;
            text-shadow: 1px 1px 1px #FFF;
            border:1px solid #E4E4E4;
            float:left;
        }
        .apply-left{
            margin:20px 40px;
            width:65%;
            float:left;
            display:inline;
        }
        .apply-center{
            width:2px;
            height:100%;
            float:left;
            display:inline;
            background:#E4E4E4;

        }
        .apply-right{
            margin:20px 40px;
            width:20%;
            float:left;
            display:inline;

        }
        hr{border:1px solid #E4E4E4 }
        span{

            font-family: "微软雅黑light";
            font-size: 18px;
        }
        .details span{
            font-size: 12px;
        }
        .apply-left {
            color: #000000;
        }
         .button {
            width: 150px;
            background: #E27575;
            border: none;
            padding: 10px 25px 10px 25px;
            color: #FFF;
            box-shadow: 1px 1px 5px #B6B6B6;
            border-radius: 3px;
            text-shadow: 1px 1px 1px #9E3F3F;
            cursor: pointer;
            margin-left: 200px;
        }
         .button:hover {
            background: #CF7A7A
        }
        textarea{
            border-radius: 3px;
            border: 1px solid #DADADA;
            height:100px;
            margin-bottom: 1px;
            margin-right: 6px;
            outline: 0 none;
            padding: 3px 3px 3px 5px;
            width: 400px;
            font-size: 15px;
            line-height:15px;
            box-shadow: inset 0px 1px 4px #ECECEC;
            -moz-box-shadow: inset 0px 1px 4px #ECECEC;
            -webkit-box-shadow: inset 0px 1px 4px #ECECEC;
            resize:none;
        }
        .refunds{
            margin: 20px;
        }

        .refunds label>span {
            float: left;
            text-align: right;
            padding-right: 10px;
        }

        .refunds select {
            color: #000000;
            border-radius: 3px;
            height: 30px;
            line-height: 25px;
        }
        .refundMoney{
            color: red;
            border-radius: 3px;
            height: 25px;
            line-height: 25px;
            font-size: 20px;
            border: 1px solid #DADADA;
        }
  </style>
  

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
          <li><a href="/ContactManager">Contact Manager</a></li>
        </ul>
      </div>
    </div>
  </div>


  <%

  %>
  <!-- Header -->
  <header>
    <div class="container">
      <div class="logo"> <a href="/BuyerIndex"><img src="assets/images/logo.png"></a> </div>
    </div>
  </header>
  <!-- Content -->
   <div id="content">
      <c:set var="orderItem" value="${requestScope.orderItem }" />
        <div class="container">
			<div class="apply-refund">
			    <div class="apply-left">
			        <form action="/buyerReturnsConfirm" method="post">
			            <div class="refunds">
			                <label>
			                    <span>The refund product:</span><img src="${pageContext.request.contextPath}/upload/productPicture/${orderItem.getProduct().getProductPicture()}" alt="shopping">
			                    <h5>${orderItem.getProduct().productName}</h5>
			                </label>
			            </div>
			            <c:choose>
                           <c:when test="${orderItem.getOrder().getOrderStatus() eq 5}">
                                <div class="refunds">
                                    <label>
                                        <span>The return address:</span>
                                        <span>${orderItem.seller.shopAddress}</span>
                                    </label>
                                </div>
                            </c:when>
                            <c:when test="${orderItem.getOrder().getOrderStatus() eq 3}">
                                <div class="refunds">
                                    <label>
                                        <span>The return address:</span>
                                        <span>${orderItem.seller.sellerAddress}</span>
                                    </label>
                                </div>
                            </c:when>
                       </c:choose>
			            <div class="refunds">
			                <label>
			                    <span>The reason of refund:</span>
			                    <select id="select-reason" >
			                        <option  style="display: none">Please select</option>
			                        <option value="1">Don't like/Don't want</option>
			                        <option value="2">Air parcel</option>
			                        <option value="3">Shipment is not made according to the agreed time</option>
			                        <option value="4">The express has never been delivered</option>
			                        <option value="5">The goods are damaged and refused to be signed</option>
			                        <option value="6">Return for 7 days without reason</option>
			                    </select><br/>
			                </label>
			            </div>
			            <div class="refunds">
			                <label>
			                    <span>The money of refund:</span>
                                HK$${orderItem.order.totalPrice}
			                </label>
			            </div>
			            <div class="refunds">
			               <label>
			                   <span>Refund &nbsp;&nbsp;&nbsp;instructions:</span>
			                    <textarea id="message" name="message" placeholder="Refund instructions"></textarea>
			               </label>
			            </div>
			            <div class="refunds">
			                <label>
			                   <span>&nbsp;</span>
                                <input type="hidden" name="orderId" value="${orderItem.order.orderId}">
			                   <input type="submit" class="button" value="Apply" />
			                </label>
			            </div>
			        </form>
			    </div>
			    <div class="apply-center">
			    </div>
			    <div class="apply-right">
			         <h2>Order ：</h2>
			        <hr/>
			        <div>
			          	  ${orderItem.getProduct().getProductName()}
			        </div>
			        <hr/>
			        <div class="details">
			            <span>Shop：</span><a>${orderItem.getSeller().getShopName()}</a><br/><br/>
			            <span>OrderId：</span><a>${orderItem.getOrder().getOrderId()}</a><br/><br/>
			            <span>Unit Price：</span>${orderItem.getProduct().getProductPrice()}<br/><br/>
			            <span>Quantity：</span>${orderItem.getOrder().getCount()}<br/><br/>
			            <span>Total Price：</span>${orderItem.getOrder().getTotalPrice()}<br/><br/>
			        </div>
			    </div>
			</div>
		</div>
		
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
