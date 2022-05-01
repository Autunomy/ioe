<%--
  Created by IntelliJ IDEA.
  User: 黄天佑
  Date: 2022-04-15
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        快递代取
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/ioe/ioe_main.jsp">填写代取订单</a></li>
                        <li><a href="${pageContext.request.contextPath}/ioe/query_orders.jsp">未取订单信息查询</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/ioe_orders.jsp">历史订单查询</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/change_order_message.jsp">订单信息修改</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        个人信息管理
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/user/change_user_message.jsp">个人信息修改</a></li>
                    </ul>
                </li>
                <li><a href="${pageContext.request.contextPath}/user/register.jsp">注册</a></li>
                <li><a href="${pageContext.request.contextPath}/manage/toManagerLogin">管理员登陆</a></li>
                <li><a>敬请期待</a></li>
            </ul>
        </div>
    </div>
</nav>
