<%@ page import="top.autunomy.pojo.Manager" %><%--
  Created by IntelliJ IDEA.
  User: 黄天佑
  Date: 2022-04-18
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加一个普通管理员</title>
    <%@ include file="/commons/bootstrap.jsp"%>
    <script type="text/javascript">
        $(function(){
            $("#sub").click(function(){
                var username = $("#username").val();
                var password = $("#password").val();
                if(username === "" || username == null){
                    $("#msg").text("用户名不能为空");
                    return false;
                } else if(password === "" || password == null) {
                    $("#msg").text("密码不能为空");
                    return false;
                }
            });

        });
    </script>
</head>
<body>
<%--导航--%>
<%@ include file="/manage/commons/root_manager_nav.jsp"%>

<%--提示框--%>
<div class="row">
    <h2 id="msg" style="text-align: center;color: white;background-color: hotpink">
        ${msg}
    </h2>
</div>

<div class="container">
    <div class="col-md-4 col-md-offset-4">
        <form role="form" action="${pageContext.request.contextPath}/manage/addCommonManager" method="post">
            <div class="form-group">
                <label for="username">用户名<sup style="color: red">*</sup></label>
                <input type="text" class="form-control" id="username" placeholder="" name="username">
            </div>
            <div class="form-group">
                <label for="password">密码<sup style="color: red">*</sup></label>
                <input type="password" class="form-control" id="password" placeholder="" name="password">
            </div>
            <div style="text-align: center;">
                <button type="submit" class="btn btn-primary" value="修改" id="sub">添加</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
