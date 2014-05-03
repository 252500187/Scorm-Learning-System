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
<%@include file="../index/navigationMenu.jsp" %>

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
<!-- 用户信息 -->
<li class="sidebar-search-wrapper">
    <div class="info-container">
        用户资料

    </div>
</li>
<!-- 第一个菜单  个人资料-->
<li>
    <a onclick="addTab('个人资料','user/center/personnelInfoDo')">
        <i class="fa fa-user"></i>
						<span class="title">
							个人资料
						</span>
    </a>
</li>
<!-- 第二个菜单  上传课件 -->
<li>
    <a onclick="addTab('上传课件','user/center/upScormDo')">
        <i class="fa fa-upload"></i>
						<span class="title">
							上传课件
						</span>
    </a>
</li>
<!-- 第三个菜单  我的课件 -->
<li>
    <a href="javascript:;">
        <i class="fa fa-file"></i>
						<span class="title">
							我的课件
						</span>
						<span class="arrow">
						</span>
    </a>
    <ul class="sub-menu">
        <li class="tooltips" data-container="body" data-placement="right" data-html="true"
            data-original-title="Complete E-Commerce Frontend Theme For Metronic Admin">
            <a onclick="addTab('已注册课件','user/center/registeredScormDo')" target="_blank">
								<span class="title">
                                   已注册课件
								</span>
            </a>
        </li>
        <li class="tooltips" data-container="body" data-placement="right" data-html="true"
            data-original-title="Complete Multipurpose Corporate Frontend Theme For Metronic Admin">
            <a onclick="addTab('已完成课件','user/center/finishedScormDo')" target="_blank">
								<span class="title">
									已完成课件
								</span>
            </a>
        </li>
    </ul>
</li>
<!-- 第四个菜单  我的收藏 -->
<li class="start ">
    <a onclick="addTab('我的收藏','user/center/collectionDo')">
        <i class="fa fa-star"></i>
						<span class="title">
							我的收藏
						</span>
    </a>
</li>
<!-- 第五个菜单  我的笔记本 -->

<li class="last ">
    <a onclick="addTab('我的笔记本','user/center/noteDo')">
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
<div class="page-content" id="content" style="margin-left: 225px">
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
        var height = $('#content').height();
        initTab();
        var contents = '<iframe frameborder="0" id="ifrm" style="width:100%; height: ' + height + 'px" src="' + src + '"></iframe>';
        document.getElementById("content").innerHTML = contents;
        $('#myTab a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        })
    }
</script>