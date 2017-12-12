<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>seller register</title>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="cssLogin/log-reg-style.css" />
</head>
<body>

<div class="register-container" style="width:70%;">
	<h1>ParkNShop</h1>
	
	<div class="connect">
		<p>seller register</p>
	</div>
	
	<form action="/registSeller" method="post" id="registerForm">
			<div>
				<input type="text" name="sellerName" class="username" placeholder="Your username" autocomplete="off"/>
			</div>
			<div>
				<input type="text" name="shopName" class="username" placeholder="Shop name" autocomplete="off"/>
			</div>
			<div>
				<input type="password" name="sellerPassword" class="password" placeholder="Enter password" oncontextmenu="return false" onpaste="return false" />
			</div>
			<div>
				<input type="password" name="confirm_password" class="confirm_password" placeholder="Enter password again" oncontextmenu="return false" onpaste="return false" />
			</div>
			<div>
				<input type="text" name="sellerPhone" class="phone_number" placeholder="Enter phone number" autocomplete="off" id="number"/>
			</div>
			<div>
				<input  id="txtEmail"  name="sellerEmail"  placeholder="Enter E-mail"  />
			</div>
			<div>
			    <textarea name="shopIntroduction" class="shopIntroduction" rows="5" style="overflow-x: hidden;">Enter Introduction</textarea>
			</div>
	        
			
		<button id="submit" type="submit">Sign Up</button>
	</form>
	<a href="/sellerLogin">
		<button type="button" class="register-tis">Already have an account?</button>
	</a>

</div>


<script src="jsLogin/jquery.min.js"></script> 
<script src="jsLogin/common.js"></script>

<script src="jsLogin/supersized.3.2.7.min.js"></script>
<script src="jsLogin/supersized-init.js"></script>

<script src="jsLogin/jquery.validate.min.js?var1.14.0"></script> 
</body>
<%
	 if(request.getAttribute("emailUsed") != null){
	 
		 	out.println("<script type=\"text/javascript\">alert('Registration Fails! The E-mail has been registered...')</script>");
		}
	 
%> 
</html>
