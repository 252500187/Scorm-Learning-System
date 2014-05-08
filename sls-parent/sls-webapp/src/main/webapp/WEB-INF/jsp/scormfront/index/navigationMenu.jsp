<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="../../includes/common.jsp" %>

<div class="header navbar navbar-inverse navbar-fixed-top">

    <div class="header navbar navbar-inverse navbar-fixed-top">
        <div class="header-inner">
            <a class="navbar-brand" style="padding-top: 0" href="">
                <img src="img/logo/logo-small.png" alt="SLS" class="img-responsive"/>
            </a>
        </div>
        <a onclick="studyScorm('9')">学习ID为9的课件</a>
        <a onclick="studyScorm('15')">学习ID为15的课件</a>
        <a onclick="studyScorm('16')">学习ID为16的课件</a>
        <a onclick="studyScorm('17')">学习ID为17的课件</a>
        <a onclick="registerScorm('9')">点我注册ID为9的课件</a>
        <a onclick="registerScorm('15')">点我注册ID为15的课件</a>
        <a onclick="registerScorm('16')">点我注册ID为16的课件</a>
        <a onclick="registerScorm('17')">点我注册ID为17的课件</a>
        <ul class="nav navbar-nav pull-right">
            <c:if test="${userId==null||userId==''}">
                <li class="dropdown">
                    <a href="login">登陆</a>
                        <i class="icon-angle-down"></i>
                    </a>
                </li>
            </c:if>
            <c:if test="${userId!=null&&userId!=''}">
                <li class="dropdown user">
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
            </c:if>
        </ul>
    </div>
</div>

<script>
    $("#userPhoto").attr("src", basePath + "assets/img/avatar1_small.jpg");

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