<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>ParkNShop</title>
<link rel="stylesheet" href="assets/css/log-reg-style.css" />
<body>

<div class="register-container">
	<h1>ParkNShop</h1>
	
	<div class="connect">
		<p>buyer register</p>
	</div>
	
	<form action="/BuyerRegisterClick" method="post" id="registerForm">
		<div>
			<input type="text" name="buyerName" class="username" placeholder="Your username" autocomplete="off"/>
		</div>
		<div>
			<input type="email" name="buyerAccount" class="email" placeholder="Enter E-mail" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="text" name="buyerPhone" class="phone_number" placeholder="Enter phone number" autocomplete="off" id="number"/>
		</div>
		<div>
			<input type="text" name="buyerAddress" class="username" placeholder="Your address" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="buyerPassword" class="password" placeholder="Enter password" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="password" name="confirm_password" class="confirm_password" placeholder="Enter password again" oncontextmenu="return false" onpaste="return false" />
		</div>
		<button id="submit" type="submit">Sign Up</button>
	</form>
	<a href="/BuyerLogin">
		<button type="button" class="register-tis">Already have an account?</button>
	</a>

</div>


<script src="assets/js/log-reg-js/jquery.min.js"></script>
<script src="assets/js/log-reg-js/common.js"></script>
<!--背景图片自动更换-->
<script src="assets/js/log-reg-js/supersized.3.2.7.min.js"></script>
<script src="assets/js/log-reg-js/supersized-init.js"></script>
<!--表单验证-->
<script src="assets/js/log-reg-js/jquery.validate.min.js?var1.14.0"></script>

</body>
</html>
<!--
本代码由js代码收集并编辑整理;
尊重他人劳动成果;
转载请保留js代码链接 - www.jsdaima.com
-->