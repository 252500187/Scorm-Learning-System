<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>我是主页</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@include file="../includes/common.jsp" %>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
</head>
<body>
<%--<c:if test="${userId!=null&&userId!=''}">--%>
<%--你的userId为：${userId}。--%>
<%--<input type="button" onclick="location.href='logout'" value="退出"/>--%>
<%--<input type="button" onclick="window.location.href='user/center/upScormDo'" value="上传课件"/>--%>
<%--<input type="button" onclick="window.location.href='user/center/userCenterDo'" value="个人中心"/>--%>
<%--</c:if>--%>

<!-- BEGIN HEADER -->
<div class="header navbar navbar-inverse navbar-fixed-top" style="height: 60px">
    <!-- BEGIN TOP NAVIGATION BAR -->
    <div class="header-inner">
        <!-- BEGIN LOGO -->
        <a class="navbar-brand" href="">
            <img src="<%=basePath%>assets/img/logo-big.png" alt="logo" class="img-responsive"/>
        </a>
        <!-- END LOGO -->

        <c:if test="${userId!=null&&userId!=''}">
            <%--begin navigation--%>
            <%@include file="index/navigationMenu.jsp" %>
            <%--end navigation--%>
        </c:if>

        <c:if test="${userId==null||userId==''}">
            <%--begin visitorNavigation--%>
            <%@include file="index/visitorNavigationMenu.jsp" %>
            <%--end visitorNavigation--%>
            <%--<input type="button" onclick="window.location.href='login'" value="登录页"/>--%>
        </c:if>
    </div>
    <!--end top navigation bar-->
</div>
<!--end header-->

<!--begin content-->
<%@include file="index/content.jsp" %>
<!--end content-->
</body>
</html>
<script>

</script>