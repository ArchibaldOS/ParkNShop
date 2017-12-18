<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>ParkNShop</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="stylesheet" href="assets/css/log-reg-style.css" />

<body>

<div class="login-container">
    <h1>ParkNShop</h1>

    <br>

    <form action="/AdminLoginClick" method="post" id="loginForm">
        <div>
            <input type="text" name="username" class="username" placeholder="AdminAccount" autocomplete="off"/>
        </div>
        <div>
            <input type="password" name="password" class="password" placeholder="Password" oncontextmenu="return false" onpaste="return false" />
        </div>
        <button id="submit" type="submit">Sign in</button>
    </form>


</div>

<script src="assets/javascripts/jquery.min2.js"></script>
<script src="assets/javascripts/common.js"></script>
<!--背景图片自动更换-->
<script src="assets/javascripts/supersized.3.2.7.min.js"></script>
<script src="assets/javascripts/supersized-init.js"></script>
<!--表单验证-->
<script src="assets/javascripts/jquery.validate.min.js?var1.14.0"></script>

</body>
</html>