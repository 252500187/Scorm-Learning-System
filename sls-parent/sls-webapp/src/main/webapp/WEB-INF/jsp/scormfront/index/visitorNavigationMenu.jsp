<%--
  Created by IntelliJ IDEA.
  User: qinw
  Date: 14-4-27
  Time: 下午7:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>首页</title>
    <%@include file="../../includes/common.jsp" %>
<body>
<!-- BEGIN TOP NAVIGATION MENU -->
<ul class="nav navbar-nav pull-right">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
           data-close-others="true">
            <span class="username"><a href="login">注册</a></span>
            <i class="icon-angle-down"></i>
        </a>
    </li>
    <!-- BEGIN USER LOGIN DROPDOWN -->
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
           data-close-others="true">
            <span class="username"><a href="login">登录</a></span>
            <i class="icon-angle-down"></i>
        </a>
    </li>
    <!-- END USER LOGIN DROPDOWN -->
</ul>
<!-- END TOP NAVIGATION MENU -->
</body>
</html>