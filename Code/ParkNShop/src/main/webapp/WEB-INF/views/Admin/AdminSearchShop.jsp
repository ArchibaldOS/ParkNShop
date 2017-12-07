<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>AdminShopManagement</title>
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
                    <a href="/AdminShopManagement" class="list-group-item">Register Management</a>
                    <a href="/AdminShopList" class="list-group-item">ShopList</a>
                    <a href="/AdminSearchShop" class="list-group-item active">SearchShop</a>
                    <a href="/AdminBlackList" class="list-group-item">BlackList Management</a>
                </div>
            </div>
            <div class="col-md-10">
                <div class="page-header">
                    <h1>Shop Management</h1>
                </div>
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="AdminUserList.jsp">Search By Shop ID</a>
                    </li>
                    <li class="nav nav-tabs">
                        <a href="AdminUserList.jsp">Search By Shop Name</a>
                    </li>
                    <li class="nav nav-tabs">
                        <a href="AdminUserList.jsp">Search By Seller Name</a>
                    </li>
                </ul>

                <form action="#" class="user_search">
                    <div class="form-group">
                        <label for="name">Shop ID:</label>
                        <input type="text" id="name" class="form-control" placeholder="Please input shop ID:" />
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>

            </div>




        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加用户</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name">用户名</label>
                        <input type="text" id="name" class="form-control" placeholder="请输入用户名" />
                    </div>
                    <div class="form-group">
                        <label for="password">用户密码</label>
                        <input type="password" id="password" class="form-control" placeholder="请输入用户密码" />
                    </div>
                    <div class="form-group">
                        <label for="repassword">确认用户密码</label>
                        <input type="password" id="repassword" class="form-control" placeholder="请确认用户密码" />
                    </div>
                    <div class="form-group">
                        <label for="uemial">用户邮箱</label>
                        <input type="text" id="uemial" class="form-control" placeholder="请输入用户邮箱" />
                    </div>
                    <div class="form-group">
                        <label for="ugroup">选择用户组名</label>

                        <select id="ugroup" class="form-control">
                            <option value="">限制会员</option>
                            <option value="">新手上路</option>
                            <option value="">注册会员</option>
                            <option value="">中级会员</option>
                            <option value="">高级会员</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">提交</button>
                </div>
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
