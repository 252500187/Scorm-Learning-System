<%--@elvariable id="user" type="com.sls.util.LoginUserUtil"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>个人中心</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@include file="../../includes/common.jsp" %>
</head>
<body class="page-header-fixed">

<%@include file="../index/navigationMenu.jsp" %>

<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar-wrapper">
        <div class="page-sidebar navbar-collapse collapse">
            <!-- BEGIN SIDEBAR MENU -->
            <ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
                <!-- 隐藏框 点击一下变成小图标 -->               <!--  -->
                <li class="sidebar-toggler-wrapper">
                    <div class="sidebar-toggler hidden-phone">
                    </div>

                </li>
                <!-- 用户信息 -->
                <li>
                    <a>
                        <i class="fa fa-user"></i>
                        <span class="title"> <big>昵称:${user.userName}</big></span>
                        <br/>
                        <span class="title" style="margin-left: 30px">等级:&nbsp;&nbsp;${user.levelName} </span>

                        <div class="info-container" align="center" style="margin-top:0px;">

                            <img id="userHeadPhoto" class="avatar img-responsive" alt="用户头像"
                                 style="width:155px;height:100px"/>

                        </div>

                    </a>
                </li>
                <!-- 第一个菜单  个人资料-->
                <li>
                    <a onclick="addTab('user/center/userInfoDo')">
                        <i class="fa fa-italic"></i>
						<span class="title">
							个人资料
						</span>
                    </a>
                </li>
                <!-- 第二个菜单  上传课件 -->
                <li>
                    <a onclick="addTab('user/center/upScormDo')">
                        <i class="fa fa-upload"></i>
						<span class="title">
							上传课件
						</span>
                    </a>
                </li>
                <!-- 第三个菜单  我的课件 -->
                <li>

                    <a href="javascript:;">
                        <i class="fa fa-briefcase"></i>
						<span class="title">
							我的课件
						</span>
						<span class="arrow">
						</span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a onclick="addTab('user/center/registerScormDo')">
                                <i class="fa fa-bullhorn"></i>
                                <span class="title">
                                    已注册课件
                                </span>
                            </a>
                        </li>
                        <li>
                            <a onclick="addTab('user/center/finishScormDo')">
                                <i class="fa fa-bullhorn"></i>
                                <span class="title">
									已完成课件
								</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- 第四个菜单  我的收藏 -->
                <li class="start ">
                    <a onclick="addTab('user/center/collectScormDo')">
                        <i class="fa fa-star"></i>
						<span class="title">
							我的收藏
						</span>
                    </a>
                </li>
                <!-- 第五个菜单  我的笔记本 -->

                <li class="last ">
                    <a onclick="addTab('user/center/notesDo')">
                        <i class="fa fa-book"></i>
						<span class="title">
							我的笔记本
						</span>
                    </a>
                </li>
            </ul>
            <!-- END SIDEBAR MENU -->
        </div>
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="row">
                <iframe id="ifra" style="width:100%; height:800px;border:0px" frameborder=no scrolling="no"
                        allowfullscreen>
                </iframe>
            </div>
        </div>
    </div>
    <!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<%@include file="../index/footer.jsp" %>
</body>
</html>
<script>
    jQuery(document).ready(function () {
        App.init();
    });

    function addTab(src) {
        $("#ifra").attr("src", src);
    }

    $(function () {
        addTab('user/center/userInfoDo');
        $("#userHeadPhoto").attr("src","http://www.placehold.it/200x150/EFEFEF/AAAAAA &amp;text=no+image");
        if ("${user.imgUrl}" != "") {
            $("#userHeadPhoto").attr("src", basePath + "${user.imgUrl}");
        }
    })

    $('.page-sidebar ul').on('click', ' li > a', function (e) {
        var menuContainer = $('.page-sidebar ul');
        menuContainer.children('li.active').removeClass('active');
        menuContainer.children('arrow.open').removeClass('open');
        $(this).parents('li').each(function () {
            $(this).addClass('active');
            $(this).children('a > span.arrow').addClass('open');
        });
        $(this).parents('li').addClass('active');
        $('.selected').remove();
        $(this).parents('li').find("a").append('<span class="selected" ></span>');
    });
</script>