<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 黄天佑
  Date: 2022-04-17
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>普通管理员管理</title>
    <%@include file="/commons/bootstrap.jsp"%>
</head>
<body>

<%@ include file="/manage/commons/root_manager_nav.jsp"%>

<%--提示框--%>
<div class="row">
    <h2 id="msg" style="text-align: center;color: white;background-color: hotpink">
        ${msg}
    </h2>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <h4>总计${managers.size()}个管理员</h4>
        </div>
    </div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>id</th>
            <th>用户名</th>
            <th>密码</th>
            <th>是否是超级管理员</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="manager" items="${managers}">
            <tr>
                <td>${manager.id}</td>
                <td>${manager.username}</td>
                <td>${manager.password}</td>
                <td>${manager.is_root==0?"否":"是"}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/manage/deleteCommonManager?id=${manager.id}" class="btn btn-primary">删除管理员</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
