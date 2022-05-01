<%@ page import="top.autunomy.pojo.Manager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员</title>
    <%@include file="/commons/bootstrap.jsp"%>
</head>
<body>
<%--导航栏--%>
<% if (((Manager)session.getAttribute("manager")).getIs_root() == 0){%>
<%@ include file="/manage/commons/common_manager_nav.jsp"%>
<%}else{%>
<%@ include file="/manage/commons/root_manager_nav.jsp"%>
<%}%>

<%--提示框--%>
<div class="row">
    <h2 id="msg" style="text-align: center;color: white;background-color: hotpink">
        ${msg}
    </h2>
</div>

<div class="row">
    <div class="col-md-4 col-md-offset-4">
        <form class="form" role="search" style="text-align: center" action="${pageContext.request.contextPath}/manage/searchOrderByCardOrName">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="可以根据姓名和学号搜索订单" name="search">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/manage/showAllOrder">查看所有订单</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/manage/showTodayOrder">查看今日未取订单</a>
        </form>
    </div>
</div>

<div class="row">
    <div class="col-md-3">
        <h4>总计${users.size()}个用户</h4>
    </div>
</div>

<table class="table table-striped">
    <thead>
    <tr>
        <th>用户编号</th>
        <th>姓名</th>
        <th>学号</th>
        <th>宿舍地址</th>
        <th>手机号</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.user_id}</td>
            <td>${user.user_name}</td>
            <td>${user.user_card}</td>
            <td>${user.user_address}</td>
            <td>${user.user_phone}</td>
            <td>
                <a href="${pageContext.request.contextPath}/manage/deleteUser?user_id=${user.user_id}" class="btn btn-primary">删除用户</a>&nbsp;|&nbsp;
                <a href="#" class="btn btn-primary">拉黑(未开放)</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>

