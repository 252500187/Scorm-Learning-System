<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | Welcome to SLS</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../includes/common.jsp" %>
</head>
<body class="page-header-fixed">
<%@include file="index/navigationMenu.jsp" %>
<div class="page-container">
    <div class="page-content">
        <div class="row">
            <div class="col-md-1">
            </div>
            <div class="col-md-8">
                <img src="img/index/2.jpg" style="max-height:600px ">
            </div>
            <div class="col-md-3"><br/>

                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search...">
                    <span class="input-group-btn"><a class="btn default blue-stripe" href="#">查询</a></span>
                </div>
            </div>
        </div>
        <HR>
        <div class="row">
            <div class="col-md-12">
                <ul class="mix-filter">
                    <li class="filter" data-filter="category_1">
                        <i class="fa fa-bookmark-o"></i>推荐等级
                    </li>
                    <li class="filter" data-filter="category_2">
                        <i class="fa fa-users"></i>注册人数
                    </li>
                    <li class="filter" data-filter="category_3">
                        <i class="fa fa-clock-o"></i>学习时间
                    </li>
                    <li class="filter" data-filter="category_4">
                        <i class="fa fa-star"></i>课件评分
                    </li>
                </ul>
            </div>
            <div class="row mix-grid">
                <div class="col-md-3 mix mix_all category_1"
                     style=" display: block; opacity: 1;">
                    <div class="thumbnail">
                        <img src="img/bookmarks/book1.jpg" alt="" style="width: 300px;height: 200px;">

                        <div class="caption">
                            <h3>课件1</h3>

                            <p>
                                课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介
                            </p>

                            <p>
                                <a onclick="showScormInfo('92')" class="btn blue">
                                    查看 </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mix mix_all category_2"
                     style=" display: block; opacity: 1;">
                    <div class="thumbnail">
                        <img src="img/bookmarks/book1.jpg" alt="" style="width: 300px;height: 200px;">

                        <div class="caption">
                            <h3>课件1</h3>

                            <p>
                                课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介
                            </p>

                            <p>
                                <a onclick="showScormInfo('91')" class="btn purple">
                                    查看 </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mix mix_all category_3"
                     style=" display: block; opacity: 1;">
                    <div class="thumbnail">
                        <img src="img/bookmarks/book1.jpg" alt="" style="width: 300px;height: 200px;">

                        <div class="caption">
                            <h3>课件1</h3>

                            <p>
                                课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介
                            </p>

                            <p>
                                <a onclick="showScormInfo('90')" class="btn red">
                                    查看 </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mix mix_all category_4"
                     style=" display: block; opacity: 1;">
                    <div class="thumbnail">
                        <img src="img/bookmarks/book1.jpg" alt="" style="width: 300px;height: 200px;">
                        <div class="caption">
                            <h3>课件1</h3>
                            <p>
                                课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介课件1简介
                            </p>
                            <p>
                                <a onclick="showScormInfo('78')" class="btn yellow">
                                    查看 </a>
                            </p>
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
        $("#scormInfo").attr("src", "tourist/scormInfo?scormId=" + scormId + "&type=-1");
    }

    $(function () {
        Metronic.init();
        Layout.init();
        Portfolio.init();
    });
</script>

