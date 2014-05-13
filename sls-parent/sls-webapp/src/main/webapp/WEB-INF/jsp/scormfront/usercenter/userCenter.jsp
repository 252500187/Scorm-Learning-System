<%--@elvariable id="user" type="com.sls.util.LoginUserUtil"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="no-js">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>个人中心</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@include file="../../includes/common.jsp" %>
</head>
<body class="page-header-fixed">

<%@include file="../index/navigationMenu.jsp" %>

<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar-wrapper">
        <div class="page-sidebar navbar-collapse collapse">
            <!-- BEGIN SIDEBAR MENU -->
            <ul class="page-sidebar-menu" data-auto-scroll="false" data-auto-speed="200">
                <!-- 隐藏框 点击一下变成小图标 -->               <!--  -->
                <li class="sidebar-toggler-wrapper">
                    <div class="sidebar-toggler"></div>
                </li>
                <!-- 用户信息 -->
                <li class="start">
                    <a onclick="changeIframe('user/center/userCenterInfo')">
                        <i class="fa fa-user"></i><br/>
                        <span class="title" style="margin-left: 30px">
                            <big id="userName">昵称:&nbsp;&nbsp;${user.userName}</big></span><br/>
                        <span class="title" style="margin-left: 30px">
                            <big id="userLevel">等级:&nbsp;&nbsp;${user.levelName}</big></span>

                        <div class="info-container" align="center" style="margin-top:0px;">
                            <table>
                                <tr>
                                    <td align="top"><span class="title">
                                        <big id="userPhoto">头像:&nbsp;&nbsp;</big></span>
                                    </td>

                                    <td>
                                        <img id="userHeadPhoto" class="img-polaroid" alt="用户头像"
                                             style="width:100px;height:100px"/>
                                    <td>
                                </tr>
                            </table>

                        </div>
                    </a>
                </li>
                <!-- 第一个菜单  个人资料-->
                <li>
                    <a onclick="changeIframe('user/center/userInfoDo')">
                        <i class="fa fa-italic"></i>
						<span class="title">
							个人资料
						</span>
                    </a>
                </li>
                <!-- 第二个菜单  上传课件 -->
                <li>
                    <a onclick="changeIframe('user/center/upScormDo')">
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
                            <a onclick="changeIframe('user/center/registerScormDo')">
                                <i class="fa fa-bullhorn"></i>
                                <span class="title">
                                    已注册课件
                                </span>
                            </a>
                        </li>
                        <li>
                            <a onclick="changeIframe('user/center/finishScormDo')">
                                <i class="fa fa-bullhorn"></i>
                                <span class="title">
									已完成课件
								</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- 第四个菜单  我的收藏 -->
                <li>
                    <a onclick="changeIframe('user/center/collectScormDo')">
                        <i class="fa fa-star"></i>
						<span class="title">
							我的收藏
						</span>
                    </a>
                </li>
                <!-- 第五个菜单  我的笔记本 -->

                <li class="last ">
                    <a onclick="changeIframe('user/center/notesDo')">
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
                <div class="col-md-12">
                    <iframe id="iframe" style="width:100%; height:800px;padding-left: 6px" frameborder=no
                            scrolling="no"
                            allowfullscreen>
                    </iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<%@include file="../index/footer.jsp" %>

<div id="alertModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p id="alertMessage">
                </p>
            </div>
            <div class="modal-footer">
                <button class="btn blue" data-dismiss="modal">确认</button>
            </div>
        </div>
    </div>
</div>
<a href="#alertModel" data-toggle="modal" id="alertButton"/>
</body>
</html>
<script>
    $(function () {
        Metronic.init(); // init metronic core componets
        Layout.init(); // init layout
        Index.init();
        Index.initDashboardDaterange();
        Index.initJQVMAP(); // init index page's custom scripts
        Index.initCalendar(); // init index page's custom scripts
        Index.initCharts(); // init index page's custom scripts
        Index.initChat();
        Index.initMiniCharts();
        Index.initIntro();
        Tasks.initDashboardWidget();
        $("#userHeadPhoto").attr("src", basePath + "${user.imgUrl}");
        changeIframe('user/center/userCenterInfo');
    })

    function changeIframe(src) {
        $("#iframe").attr("src", src);
    }

    $('ul.page-sidebar-menu ').on('click', ' li > a', function (e) {
        var menuContainer = $('ul.page-sidebar-menu ');
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