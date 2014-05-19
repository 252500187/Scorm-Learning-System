<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | FindResult</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/common.jsp" %>
</head>
<body class="page-header-fixed">
<%@include file="../index/navigationMenu.jsp" %>
<div class="page-container">
<div class="page-content-wrapper">
<div class="page-content">
<div class="row">
    <div class="col-md-6">
        <h3 class="page-title">
            Result
            <small>"${info}"搜索结果</small>
        </h3>
    </div>
    <div class="col-md-6">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search..." id="findInfo">
                        <span class="input-group-btn">
                            <a class="btn default blue-stripe" onclick="findScorm()">查询</a></span>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <ul class="page-breadcrumb breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a>Home</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a>result</a>
                <i class="fa fa-angle-right"></i>
            </li>
            <li>
                <a>"${info}"</a>
            </li>
        </ul>
    </div>
</div>
<div class="row">
<div class="col-md-12 blog-page">
<div class="row">
<div class="col-md-9 col-sm-8 article-block">
    <h1>按名称</h1>

    <div class="row">
        <div class="col-md-4 blog-img blog-tag-data">
            <img src="" alt="" class="img-responsive">
            <ul class="list-inline">
                <li>
                    <i class="fa fa-calendar"></i>
                    <a>上传日期</a>
                </li>
                <li>
                    <i class="fa fa-comments"></i>
                    <a>评论数</a>
                </li>
            </ul>
            <ul class="list-inline blog-tags">
                <li>
                    <i class="fa fa-tags"></i>
                    <a>标签</a>
                </li>
            </ul>
        </div>
        <div class="col-md-8 blog-article">
            <h3><a>课件名称</a></h3>

            <p>课件详细</p>
            <a class="btn blue">
                详细 <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <hr>
    <h1>按描述</h1>

    <div class="row">
        <div class="col-md-4 blog-img blog-tag-data">
            <img src="" alt="" class="img-responsive">
            <ul class="list-inline">
                <li>
                    <i class="fa fa-calendar"></i>
                    <a>上传日期</a>
                </li>
                <li>
                    <i class="fa fa-comments"></i>
                    <a>评论数</a>
                </li>
            </ul>
            <ul class="list-inline blog-tags">
                <li>
                    <i class="fa fa-tags"></i>
                    <a>标签</a>
                </li>
            </ul>
        </div>
        <div class="col-md-8 blog-article">
            <h3><a>课件名称</a></h3>

            <p>课件详细</p>
            <a class="btn blue">
                详细 <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <hr>
    <h1>按标签</h1>

    <div class="row">
        <div class="col-md-4 blog-img blog-tag-data">
            <img src="" alt="" class="img-responsive">
            <ul class="list-inline">
                <li>
                    <i class="fa fa-calendar"></i>
                    <a>上传日期</a>
                </li>
                <li>
                    <i class="fa fa-comments"></i>
                    <a>评论数</a>
                </li>
            </ul>
            <ul class="list-inline blog-tags">
                <li>
                    <i class="fa fa-tags"></i>
                    <a>标签</a>
                </li>
            </ul>
        </div>
        <div class="col-md-8 blog-article">
            <h3><a>课件名称</a></h3>

            <p>课件详细</p>
            <a class="btn blue">
                详细 <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <hr>
    <h1>按评分</h1>

    <div class="row">
        <div class="col-md-4 blog-img blog-tag-data">
            <img src="" alt="" class="img-responsive">
            <ul class="list-inline">
                <li>
                    <i class="fa fa-calendar"></i>
                    <a>上传日期</a>
                </li>
                <li>
                    <i class="fa fa-comments"></i>
                    <a>评论数</a>
                </li>
            </ul>
            <ul class="list-inline blog-tags">
                <li>
                    <i class="fa fa-tags"></i>
                    <a>标签</a>
                </li>
            </ul>
        </div>
        <div class="col-md-8 blog-article">
            <h3><a>课件名称</a></h3>

            <p>课件详细</p>
            <a class="btn blue">
                详细 <i class="m-icon-swapright m-icon-white"></i>
            </a>
        </div>
    </div>
    <hr>
</div>

<div class="col-md-3 col-sm-4 blog-sidebar">
    <h3>推荐给你</h3>

    <div class="top-news">
        <a href="#" class="btn red">
            <span>课件名</span>
            <em>推荐等级、课件评分</em>
            <em><i class="fa fa-tags"></i>标签</em>
            <i class="fa fa-briefcase top-news-icon"></i>
        </a>
        <a href="#" class="btn green">
            <span>Top Week </span>
            <em>Posted on: April 15, 2013</em>
            <em><i class="fa fa-tags"></i>Internet, Music, People </em>
            <i class="fa fa-music top-news-icon"></i>
        </a>
        <a href="#" class="btn blue">
            <span>Gold Price Falls </span>
            <em>Posted on: April 14, 2013</em>
            <em><i class="fa fa-tags"></i>USA, Business, Apple </em>
            <i class="fa fa-globe top-news-icon"></i>
        </a>
        <a href="#" class="btn yellow">
            <span>Study Abroad </span>
            <em>Posted on: April 13, 2013</em>
            <em><i class="fa fa-tags"></i>Education, Students, Canada </em>
            <i class="fa fa-book top-news-icon"></i>
        </a>
        <a href="#" class="btn purple">
            <span>Top Destinations </span>
            <em>Posted on: April 12, 2013</em>
            <em><i class="fa fa-tags"></i>Places, Internet, Google Map </em>
            <i class="fa fa-bolt top-news-icon"></i>
        </a>
    </div>
    <div class="space20">
    </div>
    <h3>Tabs</h3>

    <div class="tabbable tabbable-custom">
        <ul class="nav nav-tabs">
            <li class="active">
                <a data-toggle="tab" href="#tab_1_1">
                    座右铭</a>
            </li>
            <li>
                <a data-toggle="tab" href="#tab_1_2">
                    哈哈</a>
            </li>
        </ul>
        <div class="tab-content">
            <div id="tab_1_1" class="tab-pane active">
                <p>I'm in Section 1.</p>

                <p>
                    Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper
                    suscipit lobortis nisl ut
                    aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in
                    hendrerit in vulputate velit
                    esse molestie consequat.
                </p>
            </div>
            <div id="tab_1_2" class="tab-pane">
                <p>
                    Howdy, I'm in Section 2.
                </p>

                <p>
                    Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper
                    suscipit lobortis nisl ut
                    aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in
                    hendrerit in vulputate velit
                    esse molestie consequat. Ut wisi enim ad minim veniam, quis nostrud exerci
                    tation.
                </p>
            </div>
        </div>
    </div>
    <div class="space20">
    </div>
    <h3>最近学习</h3>

    <div class="blog-twitter">
        <div class="blog-twitter-block">
            <a>课件名</a>

            <p>上次学习时间:</p>
            <a href="#">
                <em>继续</em>
            </a>
            <i class="fa fa-twitter blog-twiiter-icon"></i>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<%@include file="../index/footer.jsp" %>
<div id="alertModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"></h4>
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
        $("#alertModel").modal('show');
        $(".modal-title").html("课件信息");
        $("#scormInfo").attr("src", "tourist/scormInfo?scormId=" + scormId);
    }

    function findScorm() {
        if ($("#findInfo").val() != "") {
            window.location.href = basePath + "tourist/findScorm?findInfo=" + $("#findInfo").val();
        }
    }

    $(function () {
        Metronic.init();
        Layout.init();
    });
</script>