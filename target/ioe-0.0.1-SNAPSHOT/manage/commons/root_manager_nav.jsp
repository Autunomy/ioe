<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--导航栏--%>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <%--logo部分--%>
        <div class="navbar-header">
            <div class="navbar-brand">功能</div>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <%--按钮部分--%>
                <li><a href="${pageContext.request.contextPath}/manage/showUserMessage">用户信息管理</a></li>
                <li><a href="${pageContext.request.contextPath}/manage/showIOEMessage">订单信息管理</a></li>
                <li><a href="${pageContext.request.contextPath}/manage/showAllCommonManager">普通管理员管理</a></li>
                <li><a href="${pageContext.request.contextPath}/manage/root_manager/add_common_manager.jsp">设置管理员</a></li>
                <li><a href="${pageContext.request.contextPath}/manage/logout">注销</a></li>
                <li><a href="${pageContext.request.contextPath}/">回到首页</a></li>
            </ul>
        </div>
    </div>
</nav>
