<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | WELCOME to SLS</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../includes/common.jsp" %>
    <link rel="stylesheet" type="text/css" href="metronic/assets/admin/pages/css/timeline.css"/>
    <style type="text/css">
        <!--
        .col-index-page {
            position: relative;
            min-height: 1px;
            padding-right: 15px;
            padding-left: 15px;
            float: left;
            width: 20%;
        }

        .page-content {
            min-height: 300px !important;
            padding: 0px 20px 20px !important;
            margin: 0 !important;
            margin-top: 0px;
            padding: 0px;
            background-color: #fff;
        }

        -->
    </style>
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
    <div class="row col-md-12">
        <div class="blog-twitter">
            <h3>最新上架</h3>

            <div class="blog-twitter-block">
                <a href=""> 学科概论 </a>

                <p> 一本特别坑爹的书 </p>
                <a href="#">
                    <em>计算机科学</em>
                </a>
                <span> 10-13 15：40 </span>
                <i class="fa fa-twitter blog-twiiter-icon"></i>
            </div>
            <div class="blog-twitter-block" style="margin-top: 10px">
                <a href=""> 学科概论 </a>

                <p> 一本特别坑爹的书 </p>
                <a href="#">
                    <em>计算机科学</em>
                </a>
                <span> 10-11 16：12 </span>
                <i class="fa fa-twitter blog-twiiter-icon"></i>
            </div>
        </div>
    </div>
</div>
<div class="col-md-9">
<div class="page-content-wrapper">
<div class="page-content" style="min-height:1108px">
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
            <div class="bs-docs-example">
                <div id="myCarousel" class="carousel slide">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active" style="margin-left: 150px; margin-right: 150px;">
                            <img src="img/bookmarks/book5.jpg" style="height: 200px;width: 20%;">

                            <div class="carousel-caption" style="color: #000">
                                <h4>First Thumbnail label</h4>

                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id
                                    elit
                                    non mi porta gravida
                                    at eget metus. Nullam id dolor id nibh ultricies vehicula ut id
                                    elit.</p>
                            </div>
                        </div>
                        <div class="item" style="margin-left: 150px; margin-right: 150px;">
                            <img src="img/bookmarks/book2.jpg" style="height: 200px;width: 20%;">

                            <div class="carousel-caption" style="color: #000">
                                <h4>Second Thumbnail label</h4>

                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id
                                    elit
                                    non mi porta gravida
                                    at eget metus. Nullam id dolor id nibh ultricies vehicula ut id
                                    elit.</p>
                            </div>
                        </div>
                        <div class="item" style="margin-left: 150px; margin-right: 150px;">
                            <img src="img/bookmarks/book3.jpg" style="height: 200px;width: 20%;">

                            <div class="carousel-caption" style="color: #000">
                                <h4>Third Thumbnail label</h4>

                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id
                                    elit
                                    non mi porta gravida
                                    at eget metus. Nullam id dolor id nibh ultricies vehicula ut id
                                    elit.</p>
                            </div>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
                </div>
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book1.jpg"
                     style="height: 150px;width: 100px">
                <ul class="list-inline">
                    <li>
                        <a href="#">书名</a>
                    </li>
                    <li>
                        <a href="#" style="color:darkgray" onclick="toScormInfo(66)">
                            read more...
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book2.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book3.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book5.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book5.jpg"
                     style="height: 150px;width: 100px">
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
<div class="row blog-page" style="margin-left: 0;margin-right: 0;">
    <div class="headline">
        <h3>文史</h3>
    </div>
    <div class="row thumbnails" style="margin-left: 0px;margin-right: 0px;">
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book2.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book1.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book3.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book5.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book2.jpg"
                     style="height: 150px;width: 100px">
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
<div class="row blog-page" style="margin-left: 0;margin-right: 0;">
    <div class="headline">
        <h3>文史</h3>
    </div>
    <div class="row thumbnails" style="margin-left: 0px;margin-right: 0px;">
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book2.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book2.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book3.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book2.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book5.jpg"
                     style="height: 150px;width: 100px">
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
<div class="row blog-page" style="margin-left: 0;margin-right: 0;">
    <div class="headline">
        <h3>文史</h3>
    </div>
    <div class="row thumbnails" style="margin-left: 0px;margin-right: 0px;">
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book2.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book2.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book3.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book2.jpg"
                     style="height: 150px;width: 100px">
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
        <div class="col-index-page" style="min-width: 100px">
            <div class="meet-our-team">
                <img class="img-responsive" alt="" src="img/bookmarks/book2.jpg"
                     style="height: 150px;width: 100px">
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
        $("#scormInfo").attr("src", "tourist/scormInfo?scormId=" + scormId + "&type=-1");
    }

    function toScormInfo(scormId) {
        window.location.href = "tourist/scormInfo?scormId=" + scormId + "&type=1";
    }

    $(function () {
        Metronic.init();
        Layout.init();
        $('.carousel').carousel({
            interval: 20000
        })
    });
</script>

