<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="../../includes/common.jsp" %>

<div class="header navbar navbar-inverse navbar-fixed-top" style="height: 60px">
    <div class="header-inner">
        <a class="navbar-brand" href="">
            <img src="assets/img/logo-big.png" alt="logo" class="img-responsive"/>
        </a>
    </div>
    <c:if test="${userId!=null&&userId!=''}">
        <ul class="nav navbar-nav pull-right">
            <li class="dropdown user" style="margin-top: 10px">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                   data-close-others="true">
                    <img alt="" id="userPhoto"/>
                    <span class="username">注册用户</span>
                    <i class="icon-angle-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="user/center/userCenterDo"><i class="icon-user"></i> 个人中心</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="logout"><i class="icon-key"></i> 退出</a>
                    </li>
                </ul>
            </li>
        </ul>
    </c:if>

    <c:if test="${userId==null||userId==''}">
        <ul class="nav navbar-nav pull-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                   data-close-others="true">
                    <span class="username"><a href="login">登录</a></span>
                    <i class="icon-angle-down"></i>
                </a>
            </li>
        </ul>
    </c:if>
</div>
<script>
    $("#userPhoto").attr("src", basePath + "assets/img/avatar1_small.jpg");
</script>