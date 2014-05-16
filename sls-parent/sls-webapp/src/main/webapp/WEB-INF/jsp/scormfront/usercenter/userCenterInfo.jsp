<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | SLS User Center Information</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/common.jsp" %>
</head>
<body>
<div class="page-container">
<div class="page-content-wrapper">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <h3>前往学粉之路总进度</h3>

            <div class="progress progress-striped active">
                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="40"
                     aria-valuemin="0"
                     aria-valuemax="100" style="width: 80%">
                        <span class="sr-only">
                             40% Complete (success)
                        </span>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-5">
            <div class="portlet box">
                <div class="portlet-body">
                    <h3>学习情况分布</h3>

                    <div id="pie_chart" class="chart">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="tab-pane active" id="tab_1">
            <!-- BEGIN FILTER -->
            <div class="margin-top-10">
                <ul class="mix-filter">
                    <li class="filter" data-filter="all">
                        All
                    </li>
                    <li class="filter" data-filter="category_1">
                        UI Design
                    </li>
                    <li class="filter" data-filter="category_2">
                        Web Development
                    </li>
                    <li class="filter" data-filter="category_3">
                        Photography
                    </li>
                    <li class="filter" data-filter="category_3 category_1">
                        Wordpress and Logo
                    </li>
                </ul>
                <div class="row mix-grid">
                    <div class="col-md-3 col-sm-4 mix category_1">
                        <div class="mix-inner">
                            <img class="img-responsive" src="../../assets/admin/pages/media/works/img1.jpg" alt="">

                            <div class="mix-details">
                                <h4>Cascusamus et iusto odio</h4>
                                <a class="mix-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="mix-preview fancybox-button"
                                   href="../../assets/admin/pages/media/works/img2.jpg" title="Project Name"
                                   data-rel="fancybox-button">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 mix category_2">
                        <div class="mix-inner">
                            <img class="img-responsive" src="../../assets/admin/pages/media/works/img2.jpg" alt="">

                            <div class="mix-details">
                                <h4>Cascusamus et iusto accusamus</h4>
                                <a class="mix-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="mix-preview fancybox-button"
                                   href="../../assets/admin/pages/media/works/img2.jpg" title="Project Name"
                                   data-rel="fancybox-button">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 mix category_3">
                        <div class="mix-inner">
                            <img class="img-responsive" src="../../assets/admin/pages/media/works/img3.jpg" alt="">

                            <div class="mix-details">
                                <h4>Cascusamus et iusto accusamus</h4>
                                <a class="mix-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="mix-preview fancybox-button"
                                   href="../../assets/admin/pages/media/works/img3.jpg" title="Project Name"
                                   data-rel="fancybox-button">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 mix category_1 category_2">
                        <div class="mix-inner">
                            <img class="img-responsive" src="../../assets/admin/pages/media/works/img4.jpg" alt="">

                            <div class="mix-details">
                                <h4>Cascusamus et iusto accusamus</h4>
                                <a class="mix-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="mix-preview fancybox-button"
                                   href="../../assets/admin/pages/media/works/img4.jpg" title="Project Name"
                                   data-rel="fancybox-button">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 mix category_2 category_1">
                        <div class="mix-inner">
                            <img class="img-responsive" src="../../assets/admin/pages/media/works/img5.jpg" alt="">

                            <div class="mix-details">
                                <h4>Cascusamus et iusto accusamus</h4>
                                <a class="mix-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="mix-preview fancybox-button"
                                   href="../../assets/admin/pages/media/works/img5.jpg" title="Project Name"
                                   data-rel="fancybox-button">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 mix category_1 category_2">
                        <div class="mix-inner">
                            <img class="img-responsive" src="../../assets/admin/pages/media/works/img6.jpg" alt="">

                            <div class="mix-details">
                                <h4>Cascusamus et iusto accusamus</h4>
                                <a class="mix-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="mix-preview fancybox-button"
                                   href="../../assets/admin/pages/media/works/img6.jpg" title="Project Name"
                                   data-rel="fancybox-button">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 mix category_2 category_3">
                        <div class="mix-inner">
                            <img class="img-responsive" src="../../assets/admin/pages/media/works/img1.jpg" alt="">

                            <div class="mix-details">
                                <h4>Cascusamus et iusto accusamus</h4>
                                <a class="mix-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="mix-preview fancybox-button"
                                   href="../../assets/admin/pages/media/works/img1.jpg" title="Project Name"
                                   data-rel="fancybox-button">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 mix category_1 category_2">
                        <div class="mix-inner">
                            <img class="img-responsive" src="../../assets/admin/pages/media/works/img2.jpg" alt="">

                            <div class="mix-details">
                                <h4>Cascusamus et iusto accusamus</h4>
                                <a class="mix-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="mix-preview fancybox-button"
                                   href="../../assets/admin/pages/media/works/img2.jpg" title="Project Name"
                                   data-rel="fancybox-button">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 mix category_3">
                        <div class="mix-inner">
                            <img class="img-responsive" src="../../assets/admin/pages/media/works/img4.jpg" alt="">

                            <div class="mix-details">
                                <h4>Cascusamus et iusto accusamus</h4>
                                <a class="mix-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="mix-preview fancybox-button"
                                   href="../../assets/admin/pages/media/works/img4.jpg" title="Project Name"
                                   data-rel="fancybox-button">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 mix category_1">
                        <div class="mix-inner">
                            <img class="img-responsive" src="../../assets/admin/pages/media/works/img3.jpg" alt="">

                            <div class="mix-details">
                                <h4>Cascusamus et iusto accusamus</h4>
                                <a class="mix-link">
                                    <i class="fa fa-link"></i>
                                </a>
                                <a class="mix-preview fancybox-button"
                                   href="../../assets/admin/pages/media/works/img3.jpg" title="Project Name"
                                   data-rel="fancybox-button">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END FILTER -->
        </div>
    </div>
</div>
</div>
</body>
</html>
<script>
    jQuery(document).ready(function () {
        Metronic.init();
        Layout.init();
        Charts.init();
        Charts.initPieCharts();
        Portfolio.init();
    });
</script>