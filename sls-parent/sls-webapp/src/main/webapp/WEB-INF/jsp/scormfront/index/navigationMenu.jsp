<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<div class="page-header navbar navbar-fixed-top">
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner">
        <!-- BEGIN LOGO -->
        <div class="page-logo">
            <a href="">
                <img src="img/logo/logoSmall.png" alt="logo" class="logo-default"/>
            </a>
        </div>
        <!-- END LOGO -->

        <a onclick="studyScorm('90')">
            studyScorm
        </a>
        <a onclick="registerScorm('90')">
            注册课件
        </a>
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <div class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
        </div>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- BEGIN TOP NAVIGATION MENU -->
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">
                <c:if test="${sessionScope.userId==null||sessionScope.userId==''}">
                    <li class="dropdown dropdown-extended dropdown-tasks" id="header_task_bar">
                        <a href="login">
                            <i class="fa  fa-play"></i>登陆
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.userId!=null&&sessionScope.userId!=''}">
                    <!-- BEGIN USER LOGIN DROPDOWN -->
                    <li class="dropdown dropdown-user">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                           data-close-others="true">
                            <img alt="Hello" class="img-circle"
                                 src="metronic/assets/admin/layout/img/avatar3_small.jpg"/>
					<span class="username">
					角色名 </span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="user/center/userCenterDo">
                                    <i class="fa fa-user"></i> 个人中心 </a>
                            </li>
                            <li class="divider">
                            </li>
                            <li>
                                <a href="logout">
                                    <i class="fa fa-key"></i> 退出 </a>
                            </li>
                        </ul>
                    </li>
                    <!-- END USER LOGIN DROPDOWN -->
                </c:if>
            </ul>
        </div>
        <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>

<script>
    $("#userPhoto").attr("src", "metronic/assets/admin/layout/img/avatar3_small.jpg");

    function studyScorm(id) {
        window.location.href = basePath + "user/scorm/studyScorm?scormId=" + id;
    }

    function registerScorm(id) {
        $.ajax({
            url: basePath + "user/scorm/registerScorm?scormId=" + id,
            dataType: "json",
            type: "GET",
            success: function (message) {
                alert(message);
            },
            error: doError
        })
    }
</script>