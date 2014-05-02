<%--
  Created by IntelliJ IDEA.
  User: qinw
  Date: 14-4-27
  Time: 下午7:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>首页</title>
    <%@include file="../../includes/common.jsp" %>
</head>
<body>
<div class="clearfix">
</div>
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
<div class="page-content">
<!-- BEGIN TWO PRODUCTS & PROMO -->
<div class="row margin-bottom-35" style="margin-top: 50px;">
    <!-- BEGIN PROMO -->
    <div class="col-md-12">
        <div class="content-slider">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="ls-layer ls-layer1"
                             style="slidedirection: right; transition2d: 24,25,27,28; ">
                            <img src="<%=basePath%>ecommerce/assets/temp/sliders/slide1/bg.jpg" class="ls-bg"
                                 alt="Slide background">

                            <div class="ls-s-1 title"
                                 style=" top: 96px; left: 35%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                                Tones of <strong>shop UI features</strong> designed
                            </div>
                            <div class="ls-s-1 mini-text"
                                 style=" top: 338px; left: 35%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; showuntil : 4000; white-space: nowrap;">
                                Lorem ipsum dolor sit amet constectetuer diam<br> adipiscing elit euismod ut
                                laoreet dolore.
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="ls-layer ls-layer1"
                             style="slidedirection: right; transition2d: 24,25,27,28; ">
                            <img src="<%=basePath%>ecommerce/assets/temp/sliders/slide2/bg.jpg" class="ls-bg"
                                 alt="Slide background">

                            <div class="ls-s-1 title"
                                 style=" top: 96px; left: 35%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                                Tones of <strong>shop UI features</strong> designed
                            </div>
                            <div class="ls-s-1 mini-text"
                                 style=" top: 338px; left: 35%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; showuntil : 4000; white-space: nowrap;">
                                Lorem ipsum dolor sit amet constectetuer diam<br> adipiscing elit euismod ut
                                laoreet dolore.
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="ls-layer ls-layer1"
                             style="slidedirection: right; transition2d: 24,25,27,28; ">
                            <img src="<%=basePath%>ecommerce/assets/temp/sliders/slide3/bg.jpg" class="ls-bg"
                                 alt="Slide background">

                            <div class="ls-s-1 title"
                                 style=" top: 96px; left: 35%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                                Tones of <strong>shop UI features</strong> designed
                            </div>
                            <div class="ls-s-1 mini-text"
                                 style=" top: 338px; left: 35%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; showuntil : 4000; white-space: nowrap;">
                                Lorem ipsum dolor sit amet constectetuer diam<br> adipiscing elit euismod ut
                                laoreet dolore.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END PROMO -->
</div>
<!-- END TWO PRODUCTS & PROMO -->

<!-- BEGIN PAGE CONTENT-->
<div class="row margin-bottom-40 ">
    <div class="sidebar col-md-3 col-sm-4">
        <h2>HOT TOP</h2>
        <ul class="list-group margin-bottom-25 sidebar-menu">
            <li class="list-group-item clearfix">
                <a href="product-list.html">
                    <i class="fa fa-angle-right"></i>
                    Top One
                </a>
            </li>
            <li class="list-group-item clearfix">
                <a href="product-list.html">
                    <i class="fa fa-angle-right"></i>
                    Top Two
                </a>
            </li>
            <li class="list-group-item clearfix">
                <a href="product-list.html">
                    <i class="fa fa-angle-right"></i>
                    Top Three
                </a>
            </li>
            <li class="list-group-item clearfix">
                <a href="product-list.html">
                    <i class="fa fa-angle-right"></i>
                    Top Four
                </a>
            </li>
            <li class="list-group-item clearfix">
                <a href="product-list.html">
                    <i class="fa fa-angle-right"></i>
                    Top Five
                </a>
            </li>
            <li class="list-group-item clearfix">
                <a href="product-list.html">
                    <i class="fa fa-angle-right"></i>
                    Top Six
                </a>
            </li>
            <li class="list-group-item clearfix">
                <a href="product-list.html">
                    <i class="fa fa-angle-right"></i>
                    Top Seven
                </a>
            </li>
        </ul>
    </div>

    <div class="col-md-9 col-sm-8">
        <h2>文史</h2>

        <div class="bxslider-wrapper">
            <div class="bx-wrapper" style="max-width: 1200px;">
                <div class="col-md-3" style="margin-left: 100px">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image4.jpg" alt="" class="img-responsive">

                                <div style="background-image:url('<%=basePath%>/img/bookmarks/mark2.png');position:absolute; left:-70px; top:20px;width: 70px;z-index:-1">
                                    我是分数
                                </div>
                                <div style="background-image:url('<%=basePath%>/img/bookmarks/mark2.png');position:absolute; left:-70px; top:80px;width: 70px;z-index:-1">
                                    我是标签
                                </div>
                                <ul class="list-inline">
                                    <li>
                                        <a href="#">书名</a>
                                    </li>
                                    <li>
                                        <a href="#" style="color:darkgray">
                                            read more...
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3" style="margin-left: 100px">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image4.jpg" alt="">

                                <div style="background-image:url('<%=basePath%>/img/bookmarks/mark2.png');position:absolute; left:-70px; top:20px;width: 80px;z-index:-1">
                                    我是分数
                                </div>
                                <div style="background-image:url('<%=basePath%>/img/bookmarks/mark2.png');position:absolute; left:-70px; top:80px;width: 80px;z-index:-1">
                                    我是标签
                                </div>
                                <ul class="list-inline">
                                    <li>
                                        <a href="#">书名</a>
                                    </li>
                                    <li>
                                        <a href="#" style="color:darkgray">
                                            read more...
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3" style="margin-left: 100px">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image4.jpg" alt="">

                                <div style="background-image:url('<%=basePath%>/img/bookmarks/mark2.png');position:absolute; left:-70px; top:20px;width: 80px;z-index:-1">
                                    我是分数
                                </div>
                                <div style="background-image:url('<%=basePath%>/img/bookmarks/mark2.png');position:absolute; left:-70px; top:80px;width: 80px;z-index:-1">
                                    我是标签
                                </div>
                                <ul class="list-inline">
                                    <li>
                                        <a href="#">书名</a>
                                    </li>
                                    <li>
                                        <a href="#" style="color:darkgray">
                                            read more...
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class=""></div>
        </div>
    </div>
    <div class="col-md-9 col-sm-8">
        <h2>文史</h2>

        <div class="bxslider-wrapper">
            <div class="bx-wrapper" style="max-width: 1200px;">
                <div class="col-md-3" style="margin-left: 100px">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image4.jpg" alt="" class="img-responsive">

                                <div style="background-image:url('<%=basePath%>/img/bookmarks/mark2.png');position:absolute; left:-70px; top:20px;width: 70px;z-index:-1">
                                    我是分数
                                </div>
                                <div style="background-image:url('<%=basePath%>/img/bookmarks/mark2.png');position:absolute; left:-70px; top:80px;width: 70px;z-index:-1">
                                    我是标签
                                </div>
                                <ul class="list-inline">
                                    <li>
                                        <a href="#">书名</a>
                                    </li>
                                    <li>
                                        <a href="#" style="color:darkgray">
                                            read more...
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3" style="margin-left: 100px">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image4.jpg" alt="">

                                <div style="background-image:url('<%=basePath%>/img/bookmarks/mark2.png');position:absolute; left:-70px; top:20px;width: 80px;z-index:-1">
                                    我是分数
                                </div>
                                <div style="background-image:url('<%=basePath%>/img/bookmarks/mark2.png');position:absolute; left:-70px; top:80px;width: 80px;z-index:-1">
                                    我是标签
                                </div>
                                <ul class="list-inline">
                                    <li>
                                        <a href="#">书名</a>
                                    </li>
                                    <li>
                                        <a href="#" style="color:darkgray">
                                            read more...
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3" style="margin-left: 100px">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image4.jpg" alt="">

                                <div style="background-image:url('<%=basePath%>/img/bookmarks/mark2.png');position:absolute; left:-70px; top:20px;width: 80px;z-index:-1">
                                    我是分数
                                </div>
                                <div style="background-image:url('<%=basePath%>/img/bookmarks/mark2.png');position:absolute; left:-70px; top:80px;width: 80px;z-index:-1">
                                    我是标签
                                </div>
                                <ul class="list-inline">
                                    <li>
                                        <a href="#">书名</a>
                                    </li>
                                    <li>
                                        <a href="#" style="color:darkgray">
                                            read more...
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class=""></div>
        </div>
    </div>
</div>
<!-- END PAGE CONTENT-->
</div>
<!-- END CONTENT -->
</div>
</body>
<!-- END BODY -->
</html>