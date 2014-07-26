<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<div class="page-header navbar navbar-fixed-top" style="box-shadow: 1px 1px 10px #969696;">
    <div class="page-header-inner">
        <div class="page-logo">
            <a href="">
                <img src="img/logo/index_logo.png" alt="logo" class="logo-default"
                     style="margin-top: 2px"/>
            </a>
        </div>

        <div class="hor-menu hor-menu-light hidden-sm hidden-xs" style="margin-top: 2px">
            <ul class="nav navbar-nav">
                <li class="mega-menu-dropdown">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle" data-toggle="dropdown"
                       data-hover="dropdown"
                       style="font-size: 20px;" data-close-others="true">
                        课件分类<i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="mega-menu-content">
                                <ul class="mega-menu-submenu">
                                    <li>
                                        <a href="">
                                            <p>
                                                全部课件&nbsp;<i class="m-icon-swapright"></i>
                                            </p>
                                        </a>
                                    </li>
                                    <li class="divider">
                                    </li>
                                    <c:forEach var="label" items="${sessionScope.labels}">
                                        <li>
                                            <a onclick="findByLabel('${label.labelName}')">
                                                <i class="fa fa-tags"></i>${label.labelName}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="input-group" style="margin-top: 15px">
            <input type="text" class="form-control" placeholder="搜索您感兴趣的内容..." id="queryInfo" name="query"
                   style="width: 400px;height: 50px;"/>
            <span class="input-group-btn" style="background-color: #4AA1FF;width: 80px;height: 50px;">
                 <a style="color: #fff;margin-left: 18px;font-size: 20px;line-height: 50px;cursor: pointer;text-decoration: none;"
                    onclick="findScorm()">搜索</a>
            </span>
        </div>

        <div class="top-menu" style="margin-top: -50px">
            <ul class="nav navbar-nav pull-right">
                <c:if test="${sessionScope.userId==null||sessionScope.userId==''}">
                    <li class="dropdown dropdown-extended dropdown-notification" id="header_task_bar">
                        <a href="login" style="font-size: 20px;" class="dropdown-toggle">
                            <i class="fa fa-user"></i>注册&nbsp;&nbsp;&nbsp;
                        </a>
                    </li>
                    <li class="dropdown dropdown-extended dropdown-tasks" id="header_task_bar">
                        <a href="login" style="font-size: 20px;" class="dropdown-toggle">
                            <i class="fa fa-sign-in"></i>登陆&nbsp;&nbsp;&nbsp;
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.userId!=null&&sessionScope.userId!=''}">
                    <c:if test="${sessionScope.messageNum+sessionScope.questionNum+sessionScope.answerNum>0}">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                               data-close-others="true">
                                <span class="username" style="font-size: 20px;">新消息</span>
                                <span class="badge badge-success">${sessionScope.messageNum+sessionScope.questionNum+sessionScope.answerNum}</span>
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <c:if test="${sessionScope.answerNum>0}">
                                    <li>
                                        <a onclick="">
                                            <span class="label label-sm label-icon label-success">
                                                <i class="fa fa-comment-o"></i>
                                            </span>您的问题有${sessionScope.answerNum}个回答&nbsp;&nbsp;
                                        </a>
                                    </li>
                                    <li class="divider">
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.questionNum>0}">
                                    <li>
                                        <a onclick="">
                                                <span class="label label-sm label-icon label-success">
                                                    <i class="fa fa-question"></i>
                                                </span>有${sessionScope.questionNum}位用户向您提问&nbsp;&nbsp;
                                        </a>
                                    </li>
                                    <li class="divider">
                                    </li>
                                </c:if>
                                <c:forEach var="attentionUser" items="${sessionScope.attentionUsers}">
                                    <c:if test="${attentionUser.newMessage>0}">
                                        <li>
                                            <a onclick="userInfo('${attentionUser.userAttentionId}')">
                                                <span class="label label-sm label-icon label-success">
                                                    <i class="fa fa-user"></i>
                                                </span>${attentionUser.userName}
                                                <c:if test="${attentionUser.newMessage>0}">
                                                    <span style="color: red">${attentionUser.newMessage}</span>
                                                </c:if>
                                            </a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:if>
                    <li class="dropdown dropdown-user">
                        <a href="user/center/userCenterDo" class="dropdown-toggle" data-toggle="dropdown"
                           data-hover="dropdown" data-close-others="true">
                            <img id="userTopImg" alt="${sessionScope.userName}" style="height: 40px;width: 40px"
                                 src="${sessionScope.userImg}"/>
                            <span class="username" id="userTopName"
                                  style="font-size: 20px;">${sessionScope.userName}</span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="">
                                    <i class="fa fa-bookmark-o"></i>首页
                                </a>
                            </li>
                            <li class="divider">
                            </li>
                            <li class="dropdown-submenu">

                                <a href="user/center/userCenterDo">
                                    <i class="fa fa-user"></i>个人中心</a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="">
                                            <i class="fa fa-user"></i>个人资料</a>
                                    </li>
                                    <li>
                                        <a href="">
                                            <i class="fa fa-user"></i>我的课件</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa fa-key"></i>修改密码</a>
                            </li>
                            <li class="divider">
                            </li>
                            <li>
                                <a href="logout">
                                    <i class="fa fa-sign-out"></i> 退出 </a>
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
    function findScorm() {
        if ($("#queryInfo").val() != "") {
            top.window.open(basePath + "tourist/findScorm?queryInfo=" + $("#queryInfo").val());
        }
    }

    $(function () {
        $.sessionTimeout({
            title: '提示',
            message: '您已经学习很久了（20分钟），请注意保护眼睛。',
            keepAliveUrl: '',
            redirUrl: 'logout',
            logoutUrl: 'logout',
            warnAfter: 1200000,
            redirAfter: 1210000
        });

        $("#queryInfo").bind("keydown", function (e) {
            if (e.which == 13) {
                findScorm();
            }
        });
    })

    function scormInfo(scormId) {
        top.window.open(basePath + "tourist/scormInfo?scormId=" + scormId);
    }

    function findByLabel(label) {
        top.window.open(basePath + "tourist/findScorm?queryInfo=" + label);
    }

    function userInfo(userId) {
        top.window.open(basePath + "tourist/userInfo?userId=" + userId);
    }
</script>