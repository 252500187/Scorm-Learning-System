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
</head>
<body class="page-header-fixed">
<%@include file="index/navigationMenu.jsp" %>
<div class="page-container">
<div class="page-content">

<%--搜索部分--%>
<div class="row">
    <div class="col-md-2">
    </div>
    <div class="col-md-8">
        <h2>搜索方面</h2>
    </div>
    <div class="col-md-2">
    </div>
</div>

<%--轮播部分--%>
<div class="row">
    <div class="col-md-12">
        <div id="myCarousel" class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="active item">
                    <img src="img/bookmarks/book5.jpg">

                    <div class="carousel-caption">
                        <h4>First Thumbnail label</h4>

                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id
                            elit
                            non mi porta gravida
                            at eget metus. Nullam id dolor id nibh ultricies vehicula ut id
                            elit.
                        </p>
                    </div>
                </div>
                <div class="item">
                    <img src="img/bookmarks/book2.jpg">

                    <div class="carousel-caption">
                        <h4>Second Thumbnail label</h4>

                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id
                            elit
                            non mi porta gravida
                            at eget metus. Nullam id dolor id nibh ultricies vehicula ut id
                            elit.
                        </p>
                    </div>
                </div>
                <div class="item">
                    <img src="img/bookmarks/book3.jpg">

                    <div class="carousel-caption">
                        <h4>Third Thumbnail label</h4>

                        <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id
                            elit
                            non mi porta gravida
                            at eget metus. Nullam id dolor id nibh ultricies vehicula ut id
                            elit.
                        </p>
                    </div>
                </div>
            </div>
            <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
        </div>
    </div>
</div>

<%--下方部分--%>
<div class="row">
<div class="col-md-1">
</div>
<div class="col-md-2">
    <div class="row">
        <div class="col-md-12">
            <h2>左下偏上方</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <a class="btn red sliderbar-transparency" onclick="toScormInfo(78)">
                <span> TOP ONE</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <a class="btn green" onclick="showScormInfo(78)">
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


    <div class="row">
        <div class="col-md-12">
            <h2>左下方</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <%--todo左下方--%>
        </div>
    </div>
</div>
<div class="col-md-1">
</div>
<div class="col-md-8">
    <div class="row">
        <div class="col-md-12">
            <div class="headline">
                <h2>右下方</h2>

                <h3>文史</h3>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <div class="col-index-page">
                <div class="meet-our-team">
                    <img class="img-responsive" alt="" src="img/bookmarks/book1.jpg">
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
        </div>
        <div class="col-md-2">
            <div class="col-index-page">
                <div class="meet-our-team">
                    <img class="img-responsive" alt="" src="img/bookmarks/book1.jpg">
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
        </div>
        <div class="col-md-2">
            <div class="col-index-page">
                <div class="meet-our-team">
                    <img class="img-responsive" alt="" src="img/bookmarks/book1.jpg">
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
        </div>
        <div class="col-md-2">
            <div class="col-index-page">
                <div class="meet-our-team">
                    <img class="img-responsive" alt="" src="img/bookmarks/book1.jpg">
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
        </div>
        <div class="col-md-2">
            <div class="col-index-page">
                <div class="meet-our-team">
                    <img class="img-responsive" alt="" src="img/bookmarks/book1.jpg">
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
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="headline">
                <h3>文史</h3>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <div class="col-index-page">
                <div class="meet-our-team">
                    <img class="img-responsive" alt="" src="img/bookmarks/book1.jpg">
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
        </div>
        <div class="col-md-2">
            <div class="col-index-page">
                <div class="meet-our-team">
                    <img class="img-responsive" alt="" src="img/bookmarks/book1.jpg">
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
        </div>
        <div class="col-md-2">
            <div class="col-index-page">
                <div class="meet-our-team">
                    <img class="img-responsive" alt="" src="img/bookmarks/book1.jpg">
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
        </div>
        <div class="col-md-2">
            <div class="col-index-page">
                <div class="meet-our-team">
                    <img class="img-responsive" alt="" src="img/bookmarks/book1.jpg">
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
        </div>
        <div class="col-md-2">
            <div class="col-index-page">
                <div class="meet-our-team">
                    <img class="img-responsive" alt="" src="img/bookmarks/book1.jpg">
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
            <div>
                <iframe id="scormInfo" style="width:100%; height:500px;border:1px;" frameborder=no allowfullscreen>
                </iframe>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    function showScormInfo(scormId) {
        $('#alertModel').modal('show');
        $("#scormInfo").attr("src", "tourist/scormInfo?scormId=" + scormId + "&type=-1");
    }

    function toScormInfo(scormId) {
        window.location.href = "tourist/scormInfo?scormId=" + scormId;
    }

    $(function () {
        Metronic.init();
        Layout.init();
        $('.carousel').carousel({
            interval: 6000
        })
    });
</script>

