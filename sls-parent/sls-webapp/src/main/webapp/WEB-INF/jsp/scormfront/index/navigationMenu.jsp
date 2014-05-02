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
    <!-- BEGIN USER LOGIN DROPDOWN -->
    <li class="dropdown user" style="margin-top: 10px">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
           data-close-others="true">
            <img alt="" src="<%=basePath%>assets/img/avatar1_small.jpg"/>
            <span class="username">注册用户</span>
            <i class="icon-angle-down"></i>
        </a>
        <ul class="dropdown-menu">
            <li><a href=""><i class="icon-user"></i> 个人中心</a>
            </li>
            <li><a href=""><i class="icon-calendar"></i> 修改资料</a>
            </li>
            <li><a href=""><i class="icon-envelope"></i> 上传课件</a>
            </li>
            <li class="divider"></li>
            <li><a href="logout"><i class="icon-key"></i> 退出</a>
            </li>
        </ul>
    </li>
    <!-- END USER LOGIN DROPDOWN -->
</ul>
<!-- END TOP NAVIGATION MENU -->
</body>
</html>