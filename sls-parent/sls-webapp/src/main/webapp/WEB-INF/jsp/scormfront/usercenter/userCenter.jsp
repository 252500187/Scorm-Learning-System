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
<%--头部--%>
<div class="header navbar navbar-fixed-top" style="height:60px" >
    <div class="header-inner">
        <a class="navbar-brand" href="">
            <img src="assets/img/logo-big.png" alt="logo" class="img-responsive"/>
        </a>
    </div>

</div>

<%--主体--%>
<!-- BEGIN CONTAINER -->
<div class="page-container" style="margin-top: 60px">
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
<!-- 搜索框 -->
<li class="sidebar-search-wrapper">
    <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
    <form class="sidebar-search" action="extra_search.html" method="POST">
        <div class="form-container">
            <div class="input-box">
                <a href="javascript:;" class="remove">
                </a>
                <input type="text" placeholder="Search CourseWare"/>
                <input type="button" class="submit" value=" "/>
            </div>
        </div>
    </form>
    <!-- END RESPONSIVE QUICK SEARCH FORM -->
</li>
<!-- 第一个菜单  个人资料-->
<li>
    <a onclick="addTab('个人资料','user/scormfront/usercenter/personnelInfo')">
        <i class="fa fa-home"></i>
						<span class="title">
							个人资料
						</span>
    </a>
</li>
<!-- 第二个菜单  上传课件 -->
<li>
    <a href="">
        <i class="fa fa-home"></i>
						<span class="title">
							上传课件
						</span>
    </a>
</li>
<!-- 第三个菜单  我的课件 -->
<li>
    <a href="javascript:;">
        <i class="fa fa-gift"></i>
						<span class="title">
							我的课件
						</span>
						<span class="arrow">
						</span>
    </a>
    <ul class="sub-menu">
        <li class="tooltips" data-container="body" data-placement="right" data-html="true"
            data-original-title="Complete E-Commerce Frontend Theme For Metronic Admin">
            <a href="http://keenthemes.com/preview/index.php?theme=metronic_ecommerce" target="_blank">
								<span class="title">
                                   已注册课件
								</span>
            </a>
        </li>
        <li class="tooltips" data-container="body" data-placement="right" data-html="true"
            data-original-title="Complete Multipurpose Corporate Frontend Theme For Metronic Admin">
            <a href="http://keenthemes.com/preview/index.php?theme=metronic_frontend" target="_blank">
								<span class="title">
									已完成课件
								</span>
            </a>
        </li>
    </ul>
</li>
<!-- 第四个菜单  我的收藏 -->
<li class="start ">
    <a href="">
        <i class="fa fa-home"></i>
						<span class="title">
							我的收藏
						</span>
    </a>
</li>
<!-- 第五个菜单  我的笔记本 -->

<li class="last ">
    <a href="charts.html">
        <i class="fa fa-bar-chart-o"></i>
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
<div class="page-content" id="content">
    <h1>我是默认的页面</h1>
    <h1>我是默认的页面</h1>
    <h1>我是默认的页面</h1>
    <h1>我是默认的页面</h1>
    <h1>我是默认的页面</h1>
</div>
</div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="footer-inner">
        2014 &copy; Sls By Seek.
    </div>
    <div class="footer-tools">
		<span class="go-top">
			<i class="fa fa-angle-up"></i>
		</span>
    </div>
</div>
</body>
</html>
<script>
    jQuery(document).ready(function () {
        App.init();
        EcommerceIndex.init();
    });
    function initTab() {
        $('#content').tabs({
            fit: true,
            border: true
        });
    }
    function addTab(title, src) {
        initTab();
        var contents = '<iframe frameborder="0" id="ifrm" style="width:100%; height:100%" src="' + src + '"></iframe>';
        document.getElementById("content").innerHTML = contents;
        $('#myTab a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        })
    }
</script>