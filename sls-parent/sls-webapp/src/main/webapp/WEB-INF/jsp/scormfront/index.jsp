<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>我是主页</title>
    <link rel="stylesheet" type="text/css" href="assets/css/pages/timeline.css"/>
    <%@include file="../includes/common.jsp" %>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
</head>
<%--<%@include file="index/test.jsp"%>--%>
<body class="page-header-fixed">
<%@include file="index/navigationMenu.jsp" %>

<div class="clearfix"></div>
<div class="page-container">
<div class="col-md-1"></div>
<div class="col-md-11">
<div class="col-md-2">
    <div class="row">
        <h2>HOT TOP</h2>

        <div class="top-news col-md-12">
            <a class="btn red sliderbar-transparency" onclick="showScormInfo(66)">
                <span> TOP ONE</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
            <a class="btn green" onclick="showScormInfo(66)">
                <span> TOP TWO</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
            <a class="btn blue" onclick="showScormInfo(66)">
                <span> TOP THREE</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
            <a class="btn yellow" onclick="showScormInfo(66)">
                <span> TOP FOUR</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
            <a class="btn purple" onclick="showScormInfo(66)">
                <span> TOP FIVE</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
            <a class="btn red" onclick="showScormInfo(66)">
                <span> TOP ONE</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
            <a class="btn green" onclick="showScormInfo(66)">
                <span> TOP TWO</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
        </div>
    </div>
    <div class="row col-md-12" style="padding-right: 0px; margin-right: 0px; margin-left: 0px; padding-left: 0px;">
        <ul class="timeline">
            <li class="timeline-yellow" style="min-width: 140px">
                <div class="timeline-icon" style="font-size:10px">
                    12.01
                </div>
                <div class="timeline-body">
                    <h2>书名</h2>

                    <div class="timeline-content">
                        <img class="timeline-img pull-left" src="assets/img/blog/2.jpg" alt="">
                        作者
                    </div>
                </div>
            </li>
            <li class="timeline-blue" style="min-width: 140px">
                <div class="timeline-icon" style="font-size:10px">
                    12.01
                </div>
                <div class="timeline-body">
                    <h2>书名</h2>

                    <div class="timeline-content">
                        <img class="timeline-img pull-left" src="assets/img/blog/2.jpg" alt="">
                        作者
                    </div>
                </div>
            </li>
            <li class="timeline-green" style="min-width: 140px">
                <div class="timeline-icon" style="font-size:10px">
                    12.01
                </div>
                <div class="timeline-body">
                    <h2>书名</h2>

                    <div class="timeline-content">
                        <img class="timeline-img pull-left" src="assets/img/blog/2.jpg" alt="">
                        作者
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="col-md-9">
<div class="page-content-wrapper">
<div class="row" style="margin-left: 0;margin-right: 0;">
    <div class="col-md-1"></div>
    <div class="col-md-10" style="margin-top: 5px">
        <div class="page-title">
            <form class="search-form" method="GET" action="extra_search.html">
                <div class="input-group">
                    <input class="form-control" type="text" name="query" placeholder="Search...">
                                <span class="input-group-btn">
                                <input class="btn submit" type="button" value=" ">
                                </span>
                </div>
            </form>
        </div>
    </div>
    <div class="col-md-1"></div>
</div>

<div class="row" style="margin-left: 0;margin-right: 0;">
    <div class="col-md-12">
        <!-- BEGIN PAGE CONTENT-->
        <div class="block-carousel">
            <div id="promo_carousel" class="carousel slide">
                <div class="carousel-inner" style="max-height: 300px">
                    <div class="active item">
                        <div class="row" style="margin-left: 0px;margin-right: 0px;">
                            <div class="col-md-7 margin-bottom-20 margin-top-20 animated rotateInUpRight">
                                <h1>Welcome to Metronic..</h1>

                                <p>
                                    At vero eos et accusamus et iusto odio dignissimos ducimus qui
                                    blanditiis
                                    praesentium
                                    voluptatum deleniti atque corrupti quos dolores et quas molestias
                                    excepturi
                                    sint
                                    occaecati cupiditate non provident, similique. Pellentesque viverra
                                    vehicula
                                    sem
                                    ut
                                    volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut
                                    non
                                    libero
                                    magna.
                                    Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.
                                </p>

                                <p>
                                    Lunt in culpa qui officia deserunt mollitia animi, id est laborum et
                                    dolorum
                                    fuga. Et
                                    harum quidem rerum facilis est et expedita distinctio lorem ipsum dolor
                                    sit
                                    amet,
                                    consectetur adipiscing elit. Ut non libero consectetur adipiscing elit
                                    magna.
                                    Sed et
                                    quam lacus. Fusce condimentum eleifend enim a feugiat.
                                </p>
                                <a href="index.html" class="btn red btn-lg m-icon-big">
                                    Take a tour <i class="m-icon-big-swapright m-icon-white"></i>
                                </a>
                            </div>
                            <div class="col-md-5 animated rotateInDownLeft">
                                <a href="index.html">
                                    <img src="assets/img/pages/img1.png" alt="" class="img-responsive">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="row" style="margin-left: 0px;margin-right: 0px;">
                            <div class="col-md-5 animated rotateInUpRight">
                                <a href="index.html">
                                    <img src="assets/img/pages/img1_2.png" alt="" class="img-responsive">
                                </a>
                            </div>
                            <div class="col-md-7 margin-bottom-20 animated rotateInDownLeft">
                                <h1>Buy Metronic Today..</h1>

                                <p>
                                    At vero eos et accusamus et iusto odio dignissimos ducimus qui
                                    blanditiis
                                    praesentium
                                    voluptatum deleniti atque corrupti quos dolores et quas molestias
                                    excepturi
                                    sint
                                    occaecati cupiditate non provident, similique. Pellentesque viverra
                                    vehicula
                                    sem
                                    ut
                                    volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut
                                    non
                                    libero
                                    magna.
                                    Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.
                                </p>

                                <p>
                                    Lunt in culpa qui officia deserunt mollitia animi, id est laborum et
                                    dolorum
                                    fuga. Ut
                                    non libero consectetur adipiscing elit magna. Sed et quam lacus. Fusce
                                    condimentum
                                    eleifend enim a feugiat.
                                </p>
                                <a href="index.html" class="btn green btn-lg m-icon-big">
                                    But it today <i class="m-icon-big-swapright m-icon-white"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control left" href="#promo_carousel" data-slide="prev">
                    <i class="m-icon-big-swapleft"></i>
                </a>
                <a class="carousel-control right" href="#promo_carousel" data-slide="next">
                    <i class="m-icon-big-swapright"></i>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="col-md-12 article-block">

<div class="row blog-page" style="margin-left: 0;margin-right: 0;">
    <div class="headline">
        <h3>文史</h3>
    </div>
    <div class="row thumbnails" style="margin-left: 0px;margin-right: 0px;">
        <div class="col-md-3" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="assets/img/pages/2.jpg">
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
        <div class="col-md-3" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="assets/img/pages/2.jpg">
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
        <div class="col-md-3" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="assets/img/pages/2.jpg">
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
        <div class="col-md-3" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="assets/img/pages/2.jpg">
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

<div class="eow blog-page" style="margin-left: 0;margin-right: 0;">
    <div class="headline">
        <h3>教育</h3>
    </div>
    <div class="row thumbnails" style="margin-left: 0px;margin-right: 0px;">
        <div class="col-md-3" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="assets/img/pages/2.jpg">
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
        <div class="col-md-3" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="assets/img/pages/2.jpg">
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
        <div class="col-md-3" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="assets/img/pages/2.jpg">
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
        <div class="col-md-3" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="assets/img/pages/2.jpg">
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

<div class="eow blog-page" style="margin-left: 0;margin-right: 0;">
    <div class="headline">
        <h3>艺术</h3>
    </div>
    <div class="row thumbnails" style="margin-left: 0px;margin-right: 0px;">
        <div class="col-md-3" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="assets/img/pages/2.jpg">
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
        <div class="col-md-3" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="assets/img/pages/2.jpg">
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
        <div class="col-md-3" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="assets/img/pages/2.jpg">
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
        <div class="col-md-3" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="assets/img/pages/2.jpg">
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
</div>
</div>
</div>
</div>
<%@include file="index/footer.jsp" %>

<div id="alertModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">课件信息</h4>
            </div>
            <div class="modal-body">
                <iframe id="scormInfo" style="width:100%; height:500px;border:0px;" frameborder=no allowfullscreen>
                </iframe>
            </div>
        </div>
    </div>
</div>
<a href="#alertModel" data-toggle="modal" id="alertButton"/>

</body>
</html>
<script type="text/javascript">
    function showScormInfo(scormId) {
        $("#alertButton").click();
        $("#scormInfo").attr("src", "tourist/scormInfo?scormId=" + scormId);
    }

    //    function linkScormInfo(scormId) {
    //        window.location.href = basePath + "tourist/scormInfo?scormId=" + scormId;
    //    }

    $(function () {
        App.init();
    })
    //    $(function () {
    //        $(window).bind('beforeunload', function () {
    //                alert('您输入的内容尚未保存，确定离开此页面吗？');
    //        });
    //    });

    //$(window).onunload(function () {window.location.href=basePath+"/logout";});
    //$("body").bind("onUnload",window.location.href=basePath+"/logout");

</script>

