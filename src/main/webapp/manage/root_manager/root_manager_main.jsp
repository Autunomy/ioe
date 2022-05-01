<%@ page import="top.autunomy.pojo.Manager" %><%--
  Created by IntelliJ IDEA.
  User: 黄天佑
  Date: 2022-04-15
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>root管理员主页</title>
    <%@ include file="/commons/bootstrap.jsp"%>
</head>
<body>
<%--导航栏--%>
<%@ include file="/manage/commons/root_manager_nav.jsp"%>

<div style="text-align: center">
    <h1>欢迎<%=((Manager)session.getAttribute("manager")).getUsername()%>超级管理员</h1>
</div>
</body>
</html>
