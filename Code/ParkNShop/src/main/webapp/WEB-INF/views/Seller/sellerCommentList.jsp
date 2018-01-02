<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <title>Comment Management</title>
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Mobile Specific Meta  -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,700,900,100' rel='stylesheet' type='text/css'>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css1/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css1/font-awesome.min.css" />
    <!-- Custom CSS -->
    <link href="style1.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/rs-plugin/css/settings.css" media="screen" />

    <!-- StyleSheets -->
    <link rel="stylesheet" href="assets/css2/ionicons.min.css">
    <link rel="stylesheet" href="assets/css2/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css2/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css2/main.css">
    <link rel="stylesheet" href="assets/css2/style.css">
    <link rel="stylesheet" href="assets/css2/responsive.css">
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
                        try {
                            String user = (String) session.getAttribute("seller");

                            if (user == null) {
                    %>
                    <ul>
                        <li><a href="/sellerLogin">login</a></li>
                        <li><a href="/sellerRegister">register</a></li>
                    </ul>
                    <%
                        }
                    } catch (Exception e) {
                    %>
                    <li>${ sessionScope.seller.sellerEmail}</li>
                    <%
                            out.println("<li><a href = '/sellerLogout' >log out</a></li>");
                        }
                    %>
                    <li><a href="#">Contact Manager</a></li>
                    <li><a href="#">FAQ </a></li>
                </ul>
            </div>
        </div>
    </div>
    <header>
        <nav  class="navbar nav-pills ownmenu" style="background-color:#009ACD;">
        <div class="container" style="margin:10px;">
		<div class="logo" style="float:left;margin-left:40px;"> <a href="#"><img src="assets/images/logo.png" alt="" ></a> </div>
        <div style="float:right;">
          <ul class="nav navbar-nav bbb" >
            <li><a href="/sellerHome">Home</a></li>
            <li><a href="/sellerProduct">Product</a></li>
            <li><a href="/sellerOrderPage">Order</a></li>
            <li><a href="/sellerSalesIncome">Sales</a></li>
            <li><a href="/listCommentBySellerId">Comment</a></li>
          </ul>
        </div>
		</div>
    </nav>

        

    </header>

    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-10">
         				<c:set var="commentsItems" value="${requestScope.commentsItems }" />
         				<c:choose>
							<c:when test="${commentsItems ne null and commentsItems.list.size() gt 0 }">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>CommentId</th>
                                        <th>product</th>
                                        <th>productName</th>
                                        <th>buyer</th>
                                        <th>Content</th>
                                        <th>reply</th>
                                        <th>Time</th>
                                        <th>Operation</th>
                                    </tr>
                                    </thead>
								<tbody>
											<c:forEach items="${commentsItems.list }" var="c">
												<tr>
													<td>${c.comments.commentId }</td>
													<td><img src="${pageContext.request.contextPath}/upload/productPicture/${c.product.productPicture}" alt="shopping"/></td>
													<td>${c.product.productName }</td>
													<td>${c.buyer.buyerName }</td>
													<td>${c.comments.content }</td>
													<c:if test="${c.comments.reply eq null }">
														<form action="/replyCommentById" method="post" name="form" onsubmit="return checkReply(this);">
														<td>
															<input type="hidden" name="commentId" value="${c.comments.commentId }"/>
															<textarea rows="3" name="reply" style="overflow-x: hidden;"></textarea>
														</td>
														<td>${c.comments.commentTime }</td>
														<td>
															<input type="submit" value="reply"/>
															<input type="reset" value="reset"/>
														</td>
														</form>
													</c:if>
													<c:if test="${c.comments.reply ne null }">
														<td>
															${c.comments.reply }
														</td>
														<td>${c.comments.commentTime }</td>
														<td></td>
													</c:if>
													
												</tr>
											</c:forEach>
											</tbody>
                                		</table>
										</c:when>
										<c:otherwise>
											<div style="text-align: center;"><font size="10px"><strong>no found data!</strong></font></div>
										</c:otherwise>
									</c:choose>
								
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- JavaScripts -->
<script type="text/javascript">
function checkReply(form){
	if(form.reply.value==''){
		alert('The reply can not be null');
		form.reply.focus();
		return false;
	}else
		return true;
}
</script>
<script src="assets/js/vendors/modernizr.js"></script>
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
<script src="assets/js/vendors/modernizr.js"></script>



</body>
</html>