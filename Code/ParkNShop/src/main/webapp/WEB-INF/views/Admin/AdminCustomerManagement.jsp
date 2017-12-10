<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>AdminCustomerManagement</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/bootstrap-maizi.css"/>
</head>



<body>
    <!--导航-->
    <nav class="navbar navbar-default">
        <div class="container">
            <!--小屏幕导航按钮和logo-->
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/AdminIndex" class="navbar-brand">ParkNShop</a>
            </div>
            <!--小屏幕导航按钮和logo-->
            <!--导航-->
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/AdminShopManagement"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Shop Management</a></li>
                    <li><a href="/AdminCustomerManagement"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Customer Management</a></li>
                    <li><a href="/AdminOrderManagement"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Order Management</a></li>
                    <li><a href="/AdminADManagement"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;AD Management</a></li>
                    <li><a href="/AdminSalesManagement"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Sales</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <c:out value="${sessionScope.adminAccount}"></c:out>
                        </a>
                    </li>
                    <li><a href="/AdminLogout"><span class="glyphicon glyphicon-off"></span>&nbsp;退出</a></li>
                </ul>
            </div>
            <!--导航-->
        </div>
    </nav>
    <!--导航-->

    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <div class="list-group">
                    <a href="(example)AdminUserList.jsp" class="list-group-item active">用户管理</a>
                    <a href="(example)AdminUserSearch.jsp" class="list-group-item">用户搜索</a>
                    <a href="(example)AdminUserList.jsp" class="list-group-item">添加用户</a>

                </div>
            </div>
            <div class="col-md-10">
                <div class="page-header">
                    <h1>用户管理</h1>
                </div>
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="(example)AdminUserList.jsp">用户列表</a>
                    </li>
                    <li>
                        <a href="(example)AdminUserSearch.jsp">用户搜索</a>
                    </li>
                    <li>
                        <a href="(example)AdminUserList.jsp">添加用户</a>
                    </li>
                </ul>
                <table class="table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>用户名</th>
                        <th>邮箱</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>张三</td>
                        <td>132456@qq.com</td>
                        <td><div role="presentation" class="dropdown">
                            <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="###">编辑</a></li>
                                <li><a href="###">删除</a></li>
                                <li><a href="###">锁定</a></li>
                                <li><a href="###">修改密码</a></li>
                            </ul>
                        </div></td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>张三</td>
                        <td>132456@qq.com</td>
                        <td>
                            <div role="presentation" class="dropdown">
                                <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="###">编辑</a></li>
                                    <li><a href="###">删除</a></li>
                                    <li><a href="###">锁定</a></li>
                                    <li><a href="###">修改密码</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>张三</td>
                        <td>132456@qq.com</td>
                        <td><div role="presentation" class="dropdown">
                            <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="###">编辑</a></li>
                                <li><a href="###">删除</a></li>
                                <li><a href="###">锁定</a></li>
                                <li><a href="###">修改密码</a></li>
                            </ul>
                        </div></td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>张三</td>
                        <td>132456@qq.com</td>
                        <td><div role="presentation" class="dropdown">
                            <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="###">编辑</a></li>
                                <li><a href="###">删除</a></li>
                                <li><a href="###">锁定</a></li>
                                <li><a href="###">修改密码</a></li>
                            </ul>
                        </div></td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>张三</td>
                        <td>132456@qq.com</td>
                        <td><div role="presentation" class="dropdown">
                            <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="###">编辑</a></li>
                                <li><a href="###">删除</a></li>
                                <li><a href="###">锁定</a></li>
                                <li><a href="###">修改密码</a></li>
                            </ul>
                        </div></td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>张三</td>
                        <td>132456@qq.com</td>
                        <td><div role="presentation" class="dropdown">
                            <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="###">编辑</a></li>
                                <li><a href="###">删除</a></li>
                                <li><a href="###">锁定</a></li>
                                <li><a href="###">修改密码</a></li>
                            </ul>
                        </div></td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>张三</td>
                        <td>132456@qq.com</td>
                        <td><div role="presentation" class="dropdown">
                            <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="###">编辑</a></li>
                                <li><a href="###">删除</a></li>
                                <li><a href="###">锁定</a></li>
                                <li><a href="###">修改密码</a></li>
                            </ul>
                        </div></td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>张三</td>
                        <td>132456@qq.com</td>
                        <td><div role="presentation" class="dropdown">
                            <button class="dropdown-toggle btn btn-default" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">操作 <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="###">编辑</a></li>
                                <li><a href="###">删除</a></li>
                                <li><a href="###">锁定</a></li>
                                <li><a href="###">修改密码</a></li>
                            </ul>
                        </div></td>
                    </tr>
                    </tbody>
                </table>
                <nav class="pull-right">
                    <ul class="pagination">
                        <li class="disabled">
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <!--footer-->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <p>
                        Copyright&nbsp;©&nbsp;2017-2018&nbsp;&nbsp;www.ParkNShop.com&nbsp;&nbsp;陕ICP备666666号-6
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <!--footer-->


<script src="assets/javascripts/jquery.min.js"></script>
<script src="assets/javascripts/bootstrap.min.js"></script>
<script src="assets/javascripts/Chart.js"></script>
<script src="assets/javascripts/script.js"></script>
</body>
</html>
