<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="top.autunomy.pojo.Manager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hty
  Date: 2022-03-11
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单管理</title>
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
        <h4>总计${ioes.size()}条订单</h4>
    </div>
</div>

<table class="table table-striped">
    <thead>
    <tr>
        <th>订单编号</th>
        <th>学号</th>
        <th>姓名</th>
        <th>邮箱</th>
        <th>宿舍地址</th>
        <th>快件存放点</th>
        <th>状态</th>
        <th>日期</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="ioe" items="${ioes}">
        <tr>
            <td>${ioe.id}</td>
            <td>${ioe.user_card}</td>
            <td>${ioe.user.user_name}</td>
            <td>${ioe.user.user_email}</td>
            <td>${ioe.user.user_address}</td>
            <td>${ioe.expressdeliveryid}</td>
            <td>${ioe.status}</td>
            <td>${sf.format(ioe.date)}</td>
            <td>
                <a href="${pageContext.request.contextPath}/manage/changeStatus?id=${ioe.id}" class="btn btn-primary">完成订单</a>&nbsp;|&nbsp;
                <a href="${pageContext.request.contextPath}/manage/deleteOrder?id=${ioe.id}" class="btn btn-primary">删除订单</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
