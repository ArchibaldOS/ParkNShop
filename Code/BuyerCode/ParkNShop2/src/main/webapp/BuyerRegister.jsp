<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>PackNShop</title>
<link rel="stylesheet" href="css/log-reg-style.css" />
<body>

<div class="register-container">
	<h1>ShareLink</h1>
	
	<div class="connect">
		<p>Link the world. Share to world.</p>
	</div>
	
	<form action="" method="post" id="registerForm">
		<div>
			<input type="text" name="username" class="username" placeholder="Your username" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="password" class="password" placeholder="Enter password" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="password" name="confirm_password" class="confirm_password" placeholder="Enter password again" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="text" name="phone_number" class="phone_number" placeholder="Enter phone number" autocomplete="off" id="number"/>
		</div>
		<div>
			<input type="email" name="email" class="email" placeholder="Enter E-mail" oncontextmenu="return false" onpaste="return false" />
		</div>

		<button id="submit" type="submit">Sign Up</button>
	</form>
	<a href="userlogin.html">
		<button type="button" class="register-tis">Already have an account?</button>
	</a>

</div>


<script src="js/log-reg-js/jquery.min.js"></script>
<script src="js/log-reg-js/common.js"></script>
<!--背景图片自动更换-->
<script src="js/log-reg-js/supersized.3.2.7.min.js"></script>
<script src="js/log-reg-js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/log-reg-js/jquery.validate.min.js?var1.14.0"></script>

</body>
</html>
<!--
本代码由js代码收集并编辑整理;
尊重他人劳动成果;
转载请保留js代码链接 - www.jsdaima.com
-->