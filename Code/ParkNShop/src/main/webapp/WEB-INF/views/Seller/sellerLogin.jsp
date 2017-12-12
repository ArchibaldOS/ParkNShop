<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>seller login</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" href="assets/cssLogin/log-reg-style.css" />
</head>
<body>

<div class="login-container" style="width:70%">
	<h1>ParkNShop</h1>
	
	<div class="connect">
		<p>seller login</p>
	</div>
	
	<form action="/loginSeller" method="post" id="loginForm">
		<div>
			<input type="text" name="sellerEmail" class="sellerEmail" placeholder="E-mail" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="sellerPassword" class="password" placeholder="Password" oncontextmenu="return false" onpaste="return false" />
		</div>
		<button id="submit" type="submit">Sign in</button>
	</form>

	<a href="/sellerRegister">
		<button type="button" class="register-tis">Create an account ?</button>
	</a>

</div>

<script src="assets/jsLogin/jquery.min.js"></script>
<script src="assets/jsLogin/common.js"></script>

<script src="assets/jsLogin/supersized.3.2.7.min.js"></script>
<script src="assets/jsLogin/supersized-init.js"></script>

<script src="assets/jsLogin/jquery.validate.min.js?var1.14.0"></script>
</body>
<%
	 if(request.getAttribute("logfail") != null){
	 
		 	out.println("<script type=\"text/javascript\">alert('Login Failed! Please check your account or password...')</script>");
		}

	 
%> 
</html>