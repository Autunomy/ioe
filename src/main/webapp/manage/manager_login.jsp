<%--
  Created by IntelliJ IDEA.
  User: hty
  Date: 2022-03-17
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登陆</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%--导航栏--%>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <%--logo部分--%>
        <div class="navbar-header">
            <div class="navbar-brand">功能</div>
        </div>
        <%--按钮部分--%>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/ioe/ioe_main.jsp">回到首页</a></li>
                <li><a href="">敬请期待</a></li>
            </ul>
        </div>

        <%--搜索框--%>
        <%--        <div class="navbar-right">--%>
        <%--            <form class="navbar-form navbar-left" role="search">--%>
        <%--                <div class="form-group">--%>
        <%--                    <input type="text" class="form-control" placeholder="Search">--%>
        <%--                </div>--%>
        <%--                <button type="submit" class="btn btn-default">搜索</button>--%>
        <%--            </form>--%>
        <%--        </div>--%>
    </div>
</nav>
<div class="container">
    <%--提示信息--%>
    <div class="row">
        <h2 id="msg" style="text-align: center;color: white;background-color: hotpink">
            ${msg}
        </h2>
    </div>

    <div class="row">
        <div class="row">
            <div class="col-md-4 col-md-offset-4" style="text-align: center;">
                <h2>管理员登陆</h2>
                <h4 style="color: red">代取快递业务无需登陆
                    <br>
                    注册过之后每次使用时直接填写订单即可</h4>
            </div>
        </div>
        <div class="col-md-4 col-md-offset-4">
            <form role="form" action="${pageContext.request.contextPath}/manage/managerJudge" method="post">
                <div class="form-group">
                    <label for="username">账号<sup style="color: red">*</sup></label>
                    <input type="text" class="form-control" id="username" placeholder="请输入账号" name="username">
                </div>
                <div class="form-group">
                    <label for="password">密码<sup style="color: red">*</sup></label>
                    <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password">
                </div>
                <div style="text-align: center;">
                    <button type="submit" class="btn btn-primary" value="提交" id="sub">登陆</button>
                </div>
            </form>
        </div>
    </div>
    <%@ include file="/commons/footer.jsp"%>
</body>
</html>
