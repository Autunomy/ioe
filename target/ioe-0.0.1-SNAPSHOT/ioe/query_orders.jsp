<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 黄天佑
  Date: 2022-04-15
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单信息查询页面</title>
    <%@ include file="/commons/bootstrap.jsp"%>
</head>
<body>
<%--导航栏--%>
<%@ include file="/commons/nav.jsp"%>

<%--提示框--%>
<div class="row">
    <h2 id="msg" style="text-align: center;color: white;background-color: hotpink">
        ${msg}
    </h2>
</div>

<div class="col-md-4 col-md-offset-4">
    <form class="form" role="search" style="text-align: center" action="${pageContext.request.contextPath}/ioe/queryOrders">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="可以根据学号搜索" name="search">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
    </form>
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
        </tr>
    </c:forEach>
    </tbody>
</table>

<%--页面底部--%>
<%@ include file="/commons/footer.jsp"%>
</body>
</html>
