<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>我是主页</title>
    <%@include file="../includes/common.jsp" %>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
</head>

<body>
<%@include file="index/navigationMenu.jsp" %>

<div class="clearfix">
</div>
<!-- BEGIN CONTENT -->
<div class="page-container">

<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse" style="margin-top: 50px">
        <h2>HOT TOP</h2>

        <div class="top-news">
            <a class="btn red sliderbar-transparency" href="#">
                <span> TOP ONE</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
            <a class="btn green" href="#">
                <span> TOP TWO</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
            <a class="btn blue" href="#">
                <span> TOP THREE</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
            <a class="btn yellow" href="#">
                <span> TOP FOUR</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
            <a class="btn purple" href="#">
                <span> TOP FIVE</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
            <a class="btn red" href="#">
                <span> TOP ONE</span>
                <em>书名</em>
                <em>
                    <i class="fa fa-tags"></i>
                    还有 100,000人在看
                </em>
                <i class="fa fa-briefcase top-news-icon"></i>
            </a>
            <a class="btn green" href="#">
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
</div>

<div class="page-content-wrapper">
<div class="page-content">

<div class="row" style="margin-left: 5px">
    <%--<div class="col-md-12">--%>
    <!--begin search-->
    <div class="search-form" style="margin-top: 50px">
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
<!--end search-->
<div class="row" style="margin-left: 5px">
<div class="promo-page">
<!-- BEGIN PAGE CONTENT-->
<div class="block-carousel">
    <div id="promo_carousel" class="carousel slide">
        <div class="container" style="height: 400px">
            <div class="carousel-inner">
                <div class="active item">
                    <div class="row">
                        <div class="col-md-7 margin-bottom-20 margin-top-20 animated rotateInUpRight">
                            <h1>Welcome to Metronic..</h1>

                            <p>
                                At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium
                                voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint
                                occaecati cupiditate non provident, similique. Pellentesque viverra vehicula sem ut
                                volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna.
                                Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.
                            </p>

                            <p>
                                Lunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et
                                harum quidem rerum facilis est et expedita distinctio lorem ipsum dolor sit amet,
                                consectetur adipiscing elit. Ut non libero consectetur adipiscing elit magna. Sed et
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
                    <div class="row">
                        <div class="col-md-5 animated rotateInUpRight">
                            <a href="index.html">
                                <img src="assets/img/pages/img1_2.png" alt="" class="img-responsive">
                            </a>
                        </div>
                        <div class="col-md-7 margin-bottom-20 animated rotateInDownLeft">
                            <h1>Buy Metronic Today..</h1>

                            <p>
                                At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium
                                voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint
                                occaecati cupiditate non provident, similique. Pellentesque viverra vehicula sem ut
                                volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna.
                                Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.
                            </p>

                            <p>
                                Lunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Ut
                                non libero consectetur adipiscing elit magna. Sed et quam lacus. Fusce condimentum
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

<div class="block-transparent">
    <div>
        <h2 class="caption">文史</h2>

        <div class="bxslider-wrapper">
            <div class="bx-wrapper">
                <div class="col-md-2" style="margin-left: 5%">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2">
                                <img src="<%=basePath%>assets/img/gallery/image1.jpg" alt="" class="img-responsive">

                                <img src="<%=basePath%>img/bookmarks/mark22.jpg" alt=""
                                     style="position:absolute; left:-40px; top:20px;width: 40px;z-index:-1"/>
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
                <div class="col-md-2" style="margin-left: 8%">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image1.jpg" alt="">

                                <img src="<%=basePath%>img/bookmarks/mark22.jpg" alt=""
                                     style="position:absolute; left:-40px; top:20px;width: 40px;z-index:-1"/>

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
                <div class="col-md-2" style="margin-left: 8%">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image1.jpg" alt="">

                                <img src="<%=basePath%>img/bookmarks/mark22.jpg" alt=""
                                     style="position:absolute; left:-40px; top:20px;width: 40px;z-index:-1"/>

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
                <div class="col-md-2" style="margin-left: 8%">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image1.jpg" alt="">

                                <img src="<%=basePath%>img/bookmarks/mark22.jpg" alt=""
                                     style="position:absolute; left:-40px; top:20px;width: 40px;z-index:-1"/>

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
<div class="block-transparent">
    <div>
        <h2 class="caption">文史</h2>

        <div class="bxslider-wrapper">
            <div class="bx-wrapper">
                <div class="col-md-2" style="margin-left: 5%">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image1.jpg" alt="" class="img-responsive">

                                <img src="<%=basePath%>img/bookmarks/mark22.jpg" alt=""
                                     style="position:absolute; left:-40px; top:20px;width: 40px;z-index:-1"/>

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
                <div class="col-md-2" style="margin-left: 8%">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image1.jpg" alt="">

                                <img src="<%=basePath%>img/bookmarks/mark22.jpg" alt=""
                                     style="position:absolute; left:-40px; top:20px;width: 40px;z-index:-1"/>

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
                <div class="col-md-2" style="margin-left: 8%">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image1.jpg" alt="">

                                <img src="<%=basePath%>img/bookmarks/mark22.jpg" alt=""
                                     style="position:absolute; left:-40px; top:20px;width: 40px;z-index:-1"/>

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
                <div class="col-md-2" style="margin-left: 8%">
                    <div class="booking-result">
                        <div class="booking-img">
                            <div style="position:relative;z-index:2;">
                                <img src="<%=basePath%>assets/img/gallery/image1.jpg" alt="">

                                <img src="<%=basePath%>img/bookmarks/mark22.jpg" alt=""
                                     style="position:absolute; left:-40px; top:20px;width: 40px;z-index:-1"/>

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
</div>
</div>

</div>
<!-- END CONTENT -->

<%@include file="index/footer.jsp" %>
</body>
</html>
<script>
    jQuery(document).ready(function () {
        App.init(); // initlayout and core plugins
    });
</script>