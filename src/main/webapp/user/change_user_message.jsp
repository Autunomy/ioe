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
    <title>个人信息修改</title>
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
    <form class="form" role="search" style="text-align: center" action="${pageContext.request.contextPath}/user/findUpdateUser">
        <div class="form-group">
            <span style="color: red">输入学号之后点击快速填写就可以将个人信息进行自动填写</span>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" placeholder="请输入学号" name="user_card">
        </div>
        <button type="submit" class="btn btn-default">快速填写</button>
    </form>
</div>

<div class="row">
    <div class="row">
        <div class="col-md-4 col-md-offset-4" style="text-align: center;">
            <h2>修改个人信息</h2>
        </div>
    </div>
    <div class="col-md-4">
        <h2></h2> <br>
    </div>
    <div class="col-md-4">
        <form role="form" action="${pageContext.request.contextPath}/user/updateUser" method="get">
            <div class="form-group">
                <input type="hidden" class="form-control" id="user_id" name="user_id" value="${user.user_id==null?"":user.user_id}">
            </div>
            <div class="form-group">
                <label for="user_name">姓名<sup style="color: red">*</sup></label>
                <input type="text" class="form-control" id="user_name" name="user_name" value="${user.user_name==null?"":user.user_name}">
            </div>
            <div class="form-group">
                <label for="user_card">学号<sup style="color: red">*</sup></label>
                <input type="text" class="form-control" id="user_card" name="user_card" value="${user.user_card==null?"":user.user_card}">
            </div>
            <div class="form-group">
                <label for="user_address">宿舍地址<sup style="color: red">*</sup></label>
                <input type="text" class="form-control" id="user_address" name="user_address" value="${user.user_address==null?"":user.user_address}">
            </div>
            <div class="form-group">
                <label for="user_phone">手机号<sup style="color: red">*</sup></label>
                <input type="text" class="form-control" id="user_phone" name="user_phone" value="${user.user_phone==null?"":user.user_phone}">
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
