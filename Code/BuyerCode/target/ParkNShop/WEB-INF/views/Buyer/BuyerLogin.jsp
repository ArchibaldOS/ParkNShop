<%--
  Created by IntelliJ IDEA.
  User: Xudong
  Date: 2017/12/10
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>PackNShop</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="stylesheet" href="assets/css/log-reg-style.css" />

<body>

<div class="login-container">
    <h1>PackNShop</h1>

    <br>

    <form action="/BuyerLoginClick" method="post" id="buyerLoginForm">
        <div>
            <input type="text" name="buyerAccount" class="username" placeholder="Username" autocomplete="off"/>
        </div>
        <div>
            <input type="password" name="buyerPassword" class="password" placeholder="Password" oncontextmenu="return false" onpaste="return false" />
        </div>
        <button id="submit" type="submit">Sign in</button>
    </form>
    <a href="/BuyerRegister">
        <button type="button" class="register-tis">Create an account ?</button>
    </a>

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