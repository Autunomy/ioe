<%--
  Created by IntelliJ IDEA.
  User: 黄天佑
  Date: 2022-04-15
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息注册</title>
    <%@ include file="/commons/bootstrap.jsp"%>
    <script type="text/javascript">
        $(function(){
            $("#sub").click(function(){
                var user_name = $("#user_name").val();
                var user_card = $("#user_card").val();
                var user_phone = $("#user_phone").val();
                var user_address = $("#user_address").val();
                if(user_card === "" || user_card == null){
                    $("#msg").text("学号不能为空");
                    return false;
                }else if(user_name === "" || user_name == null){
                    $("#msg").text("姓名不能为空");
                    return false;
                } else if(user_phone === "" || user_phone == null){
                    $("#msg").text("手机号不能为空");
                    return false;
                }else if(user_address === "" || user_address == null){
                    $("#msg").text("宿舍地址不能为空");
                    return false;
                }

                //判断邮箱格式是否正确
                // var mail = $('#user_phone').val();
                // if (mail != '') {//判断
                //     var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
                //     if (!reg.test(mail)) {
                //         $("#msg").text("邮箱格式有误");
                //         return false;
                //     }
                // }
            });
        });
    </script>
</head>
<body>
<%--导航栏--%>
<%@ include file="/commons/nav.jsp"%>

<div class="container">
    <%--提示信息--%>
    <div class="row">
        <h2 id="msg" style="text-align: center;color: white;background-color: hotpink">
            ${msg}
        </h2>
    </div>


    <div class="row">
        <div class="row">
            <div class="col-md-4 col-md-offset-4" style="text-align: center;">
                <h2>注册</h2>
            </div>
        </div>
        <div class="col-md-4">
            <h2></h2> <br>
        </div>
        <div class="col-md-4">
            <form role="form" action="${pageContext.request.contextPath}/user/addUser" method="post">
                <div class="form-group">
                    <label for="user_name">常用收件人姓名<sup style="color: red">*</sup></label>
                    <input type="text" class="form-control" id="user_name" placeholder="请输入常用收件人姓名" name="user_name">
                </div>
                <div class="form-group">
                    <label for="user_card">学号<sup style="color: red">*</sup></label>
                    <input type="text" class="form-control" id="user_card" placeholder="请输入学号" name="user_card">
                </div>
                <div class="form-group">
                    <label for="user_address">个人收货宿舍地址<sup style="color: red">*</sup></label>
                    <input type="text" class="form-control" id="user_address" placeholder="请输入个人收货宿舍地址" name="user_address">
                </div>
                <div class="form-group">
                    <label for="user_phone">手机号<sup style="color: red">*</sup></label>
                    <input type="text" class="form-control" id="user_phone" placeholder="请输入手机号" name="user_phone">
                </div>
                <div style="text-align: center;">
                    <button type="submit" class="btn btn-primary" value="提交" id="sub">注册</button>
                </div>
            </form>
        </div>
        <div class="col-md-3 col-md-offset-1">
            <h5>联系我，项目正在招人</h5>
            QQ:1156388927 <br>
            微信:hty15336132318 <br>
            邮箱:1156388927@qq.com <br>
        </div>
    </div>
    <%@ include file="/commons/footer.jsp"%>
</div>

</body>
</html>
