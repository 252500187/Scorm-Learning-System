<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<div class="page-header navbar navbar-fixed-top" style="box-shadow: 1px 1px 10px #969696;">
    <div class="page-header-inner">
        <div class="col-md-4">
            <a href="">
                <img src="img/logo/index_logo.png" alt="logo" class="logo-default"
                     style="max-height: 40px;margin-top:4px"/>
            </a>
        </div>
        <div class="col-md-5" style="margin-top: 15px;">
            <input type="text" class="form-control" placeholder="搜索..." id="queryInfo"
                   style="float: left;width: 400px;height: 50px;">
                            <span style="float: left;height: 50px;background-color: #4AA1FF;width: 80px;">
                                <a id="query" style="color: #fff;margin-left: 18px;font-size: 20px;line-height: 50px;cursor: pointer;text-decoration: none;" onclick="findScorm()">搜索</a>
                            </span>
        </div>
        <div class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
        </div>
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">
                <c:if test="${sessionScope.userId==null||sessionScope.userId==''}">
                    <li class="dropdown dropdown-extended dropdown-tasks" id="header_task_bar">
                        <a href="login" style="font-size: 20px;margin-top: 15px;">
                            <i class="fa fa-sign-in" style="font-size: 20px"></i>登陆
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.userId!=null&&sessionScope.userId!=''}">
                    <li class="dropdown dropdown-user">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                           data-close-others="true">
                            <img id="userTopImg" alt="Hello" style="height: 28px;"
                                 src="${sessionScope.userImg}"/>
                            <span class="username" id="userTopName">${sessionScope.userName}</span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="user/center/userCenterDo">
                                    <i class="fa fa-user"></i> 个人中心
                                </a>
                            </li>
                            <li>
                                <a>
                                    <i class="fa fa-key"></i> 修改密码
                                </a>
                            </li>
                            <li class="divider">
                            </li>
                            <li>
                                <a href="logout">
                                    <i class="fa fa-sign-out"></i> 退出
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
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