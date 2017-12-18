<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="author" content="M_Adnan" />
    <!-- Document Title -->
    <title>Service Center</title>

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
    <style type="text/css">
       .services{

           width:100%;
           height: 550px;

           background: url(" ../../../assets/images/service.png") center center no-repeat;
       }
        .logo{
            margin-left: 10%;
            width: 200px;
            float:left;

        }
       .service{
           text-align: center;
           margin:0 auto;
           width: 100%;
           float:left;
           font-family:"幼圆";


       }

        .cosumer{
            margin-top: 20%;
            margin-left: 30%;
            float:left;
            display:inline;
        }
       .bussiness{
           margin-top: 20%;
           margin-right: 30%;
           float:right;
           display:inline;
       }
    </style>
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
<div class="services">
    <div class="logo"> <a href="assets/index.jsp"><img src="assets/images/logo.png" alt="" ></a> </div>
    <div class="service"><h3>Service Center</h3></div>
    <div class="cosumer"> <a href="assets/index.jsp"><img src="assets/images/cosumer.png" alt="" ></a> </div>
    <div class="bussiness"> <a href="assets/index.jsp"><img src="assets/images/business.png" alt="" ></a> </div>


</div>
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
