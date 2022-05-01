<%--
  Created by IntelliJ IDEA.
  User: 黄天佑
  Date: 2022-04-15
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单信息修改</title>
    <%@ include file="/commons/bootstrap.jsp"%>
</head>
<body>
<%--导航栏--%>
<%@ include file="/commons/nav.jsp"%>

<%--提示信息--%>
<div class="row">
    <h2 id="msg" style="text-align: center;color: white;background-color: hotpink">
        ${msg}
    </h2>
</div>

<div class="col-md-4 col-md-offset-4">
    <form class="form" role="search" style="text-align: center" action="${pageContext.request.contextPath}/user/findUpdateOrder">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="请输入要修改的订单编号" name="id">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
    </form>
</div>

<div class="row">
    <div class="row">
        <div class="col-md-4 col-md-offset-4" style="text-align: center;">
            <h2>修改订单信息</h2>
        </div>
    </div>
    <div class="col-md-4">
        <h2></h2> <br>
    </div>
    <div class="col-md-4">
        <form role="form" action="${pageContext.request.contextPath}/user/updateOrder" method="get">
            <div class="form-group">
                <input type="hidden" class="form-control" id="id" name="id" value="${ioe.id==null?"":ioe.id}">
            </div>
            <div class="form-group">
                <label for="user_card">学号<sup style="color: red">*</sup></label>
                <input type="text" class="form-control" id="user_card" name="user_card" value="${ioe.user_card==null?"":ioe.user_card}">
            </div>
            <div class="form-group">
                <label for="expressdeliveryid">快递存放点<sup style="color: red">*</sup></label>
                <input type="text" class="form-control" id="expressdeliveryid" name="expressdeliveryid" value="${ioe.expressdeliveryid==null?"":ioe.expressdeliveryid}">
            </div>
            <div style="text-align: center;">
                <button type="submit" class="btn btn-primary" value="提交" id="sub">修改</button>
            </div>
        </form>
    </div>
</div>

<%--页面底部--%>
<%@ include file="/commons/footer.jsp"%>
</body>
</html>
