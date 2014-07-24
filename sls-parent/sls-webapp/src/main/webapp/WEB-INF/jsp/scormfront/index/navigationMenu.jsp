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
                     style="max-height: 40px;"/>
            </a>
        </div>
        <div class="col-md-5" style="margin: 15px;">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="搜索您感兴趣的内容..." id="queryInfo"
                       style="width: 400px;height: 50px;"/>
                    <span class="input-group-btn" style="background-color: #4AA1FF;width: 80px;height: 50px;">
                         <a style="color: #fff;margin-left: 18px;font-size: 20px;line-height: 50px;cursor: pointer;text-decoration: none;"
                            onclick="findScorm()">搜索</a>
                    </span>
            </div>
        </div>
        <div class="top-menu" style="margin: 17px">
            <ul class="nav navbar-nav pull-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                       style="font-size: 20px;" data-close-others="true">
                        课件分类
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu extended notification">
                        <li>
                            <ul class="dropdown-menu-list scroller"
                                style="height: ${fn:length(sessionScope.labels)*30>400?400:fn:length(sessionScope.labels)*30}px;">
                                <c:forEach var="label" items="${sessionScope.labels}">

                                    <li>
                                        <a onclick="findByLabel('${label.labelName}')">
                                            <span class="label label-sm label-icon label-success">
                                                <i class="fa fa-tags"></i>
                                            </span>
                                                ${label.labelName}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                            <a href="">
                                全部课件<i class="m-icon-swapright"></i>
                            </a>
                        </li>
                    </ul>
                </li>
                <c:if test="${sessionScope.userId==null||sessionScope.userId==''}">
                    <li class="dropdown dropdown-extended dropdown-tasks" id="header_task_bar">
                        <a href="login" style="font-size: 20px;">
                            <i class="fa fa-user" style="font-size: 20px"></i>注册
                        </a>
                    </li>
                    <li class="dropdown dropdown-extended dropdown-tasks" id="header_task_bar">
                        <a href="login" style="font-size: 20px;">
                            <i class="fa fa-sign-in" style="font-size: 20px"></i>登陆
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.userId!=null&&sessionScope.userId!=''}">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                           style="font-size: 20px;" data-close-others="true">
                            关注用户
                            <c:if test="${sessionScope.messageNum>0}">
                                <span class="badge">${sessionScope.messageNum}</span>
                            </c:if>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu extended notification">
                            <c:if test="${fn:length(sessionScope.attentionUsers)>0}">
                                <li>
                                    <ul class="dropdown-menu-list scroller"
                                        style="height: ${fn:length(sessionScope.attentionUsers)*30>400?400:fn:length(sessionScope.attentionUsers)*30}px;">
                                        <c:forEach var="attentionUser" items="${sessionScope.attentionUsers}">
                                            <li>
                                                <a onclick="userInfo('${attentionUser.userAttentionId}')">
                                                <span class="label label-sm label-icon label-success">
                                                    <i class="fa fa-user"></i>
                                                </span>
                                                        ${attentionUser.userName}
                                                    <c:if test="${attentionUser.newMessage>0}">
                                                        <span style="color: red">${attentionUser.newMessage}</span>
                                                    </c:if>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${fn:length(sessionScope.attentionUsers)<1}">
                                <li class="divider">
                                </li>
                                <li>
                                    <p>
                                        还未关注其他用户
                                    </p>
                                </li>
                            </c:if>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                           data-close-others="true" style="font-size: 20px;padding: 10px">
                            <img id="userTopImg" alt="Hello" style="height: 40px;" src="${sessionScope.userImg}"/>
                            <span class="username" id="userTopName">${sessionScope.userName}</span><i
                                class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu extended notification">
                            <li>
                                <a href="">
                                    <i class="fa fa-bookmark-o"></i>首页
                                </a>
                            </li>
                            <li class="divider">
                            </li>
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