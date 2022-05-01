<%@ page import="top.autunomy.pojo.Manager" %><%--
  Created by IntelliJ IDEA.
  User: 黄天佑
  Date: 2022-04-17
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改个人密码</title>
    <%@ include file="/commons/bootstrap.jsp"%>
    <script type="text/javascript">
        $(function(){
            $("#sub").click(function(){
                var oldPassword = $("#oldPassword").val();
                var newPassword = $("#newPassword").val();
                var confirmPassword = $("#confirmPassword").val();
                if(oldPassword === "" || oldPassword == null){
                    $("#msg").text("旧密码不能为空");
                    return false;
                } else if(newPassword === "" || newPassword == null){
                    $("#msg").text("新密码不能为空");
                    return false;
                }else if(confirmPassword === "" || confirmPassword == null){
                    $("#msg").text("确认密码不能为空");
                    return false;
                }
            });

        });
    </script>
</head>
<body>

<%--导航--%>
<%@ include file="/manage/commons/common_manager_nav.jsp"%>

<%--提示框--%>
<div class="row">
    <h2 id="msg" style="text-align: center;color: white;background-color: hotpink">
        ${msg}
    </h2>
</div>

<div class="container">
    <div class="col-md-4 col-md-offset-4">
        <form role="form" action="${pageContext.request.contextPath}/manage/updateCommonManagerPassword" method="post">
            <h3>用户名:<%=((Manager)session.getAttribute("manager")).getUsername()%></h3>
            <div class="form-group">
                <label for="oldPassword">旧密码<sup style="color: red">*</sup></label>
                <input type="password" class="form-control" id="oldPassword" placeholder="" name="oldPassword">
            </div>
            <div class="form-group">
                <label for="newPassword">新密码<sup style="color: red">*</sup></label>
                <input type="password" class="form-control" id="newPassword" placeholder="" name="newPassword">
            </div>
            <div class="form-group">
                <label for="confirmPassword">确认密码<sup style="color: red">*</sup></label>
                <input type="password" class="form-control" id="confirmPassword" placeholder="" name="confirmPassword">
            </div>
            <div style="text-align: center;">
                <button type="submit" class="btn btn-primary" value="修改" id="sub">修改</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
