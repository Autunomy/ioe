<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
    <%@ include file="/commons/bootstrap.jsp"%>
    <script type="text/javascript">
        $(function(){
            $("#sub").click(function(){
                var user_card = $("#user_card").val();
                var expressdeliveryid = $("#expressdeliveryid").val();
                if(user_card === "" || user_card == null){
                    $("#msg").text("学号不能为空");
                    return false;
                }
                else if(expressdeliveryid === "" || expressdeliveryid == null){
                    $("#msg").text("快递存放点不能为空");
                    return false;
                }
                // var mail = $('#email').val();
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
<%@ include file="/commons/nav.jsp"%>

<div class="container">
    <%--占位--%>
    <div class="row">
        <h2 id="msg" style="text-align: center;color: white;background-color: hotpink">
            ${msg}
        </h2>
    </div>


    <div class="row">
        <div class="row">
            <div class="col-md-4 col-md-offset-4" style="text-align: center;">
                <h2>快捷提交订单</h2>
            </div>
        </div>
        <div class="col-md-4">
            <h3 style="color: red;text-align: center" >公告栏</h3> <br>
            公告具体信息公告具体信息公告具体信息公告具体信息公告具体信息公告具体信息公告具体信息公告具体信息公告具体信息公告具体信息公告具体信息公告具体信息
        </div>
        <div class="col-md-4">
            <form role="form" action="${pageContext.request.contextPath}/ioe/addOrder" method="get">
                <div class="form-group">
                    <label for="user_card">学号<sup style="color: red">*</sup></label>
                    <input type="text" class="form-control" id="user_card" placeholder="请输入学号" name="user_card">
                </div>
                <div class="form-group">
                    <label for="expressdeliveryid">快递存放点<sup style="color: red">*</sup></label>
                    <input type="text" class="form-control" id="expressdeliveryid" placeholder="例(西区水房菜鸟驿站1-1-1)" name="expressdeliveryid">
                </div>
                <div style="text-align: center;">
                    <button type="submit" class="btn btn-primary" value="提交" id="sub">提交</button>
                </div>
            </form>
            <h5 style="color: blue;text-align: center"><a href="${pageContext.request.contextPath}/user/register.jsp">没有注册？点击这里进行注册</a></h5>
        </div>
        <div class="col-md-3 col-md-offset-1">
            <h4>联系我，项目前端正在招人</h4>
            QQ:1156388927 <br>
            微信:hty15336132318 <br>
            邮箱:1156388927@qq.com <br>
            <br>
            <br>
            <br>
            <br>
            <h4>骑手招募联系</h4>
            QQ:1136678360 <br>
            微信:gslin666
        </div>
    </div>
    <%@ include file="/commons/footer.jsp"%>
</div>
</body>
</html>
