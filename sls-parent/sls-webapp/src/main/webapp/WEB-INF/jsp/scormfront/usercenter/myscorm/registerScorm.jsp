<%--@elvariable id="allScorm" type="java.util.List"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../../includes/common.jsp" %>
    <title>SLS | Register</title>
</head>
<body class="page-header-fixed" style="background-color: transparent">
<div class="page-content" style="min-height:780px">
    <div class="row">
        <div class="col-md-12">
            <div class="tabbable tabbable-custom boxless">
                <div class="tab-content">
                    <div class="tab-pane active" id="tab_1">
                        <!-- BEGIN FILTER -->
                        <div class="margin-top-10">

                            <ul class="mix-filter">
                                <li class="filter" data-filter="all">
                                    所有课件
                                </li>
                                <li class="filter" data-filter="category_1">
                                    进行中
                                </li>
                                <li class="filter" data-filter="category_2">
                                    已完成
                                </li>
                            </ul>
                            <div class="row mix-grid">
                                <div class="col-md-3 col-sm-4 mix mix_all category_1 "
                                     style=" display: block; opacity: 1;">
                                    <div class="mix-inner">
                                        <img class="img-responsive"
                                             src="metronic/assets/admin/pages/media/works/img1.jpg"
                                             alt="">

                                        <div class="mix-details">
                                            <h4>Cascusamus et iusto odio</h4>
                                            <a class="mix-link">
                                                <i class="fa fa-link"></i>
                                            </a>
                                            <a class="mix-preview fancybox-button"
                                               href="metronic/assets/admin/pages/media/works/img1.jpg"
                                               title="Project Name"
                                               data-rel="fancybox-button">
                                                <i class="fa fa-search"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 mix mix_all category_2"
                                     style=" display: block; opacity: 1;">
                                    <div class="mix-inner">
                                        <img class="img-responsive"
                                             src="metronic/assets/admin/pages/media/works/img2.jpg"
                                             alt="">

                                        <div class="mix-details">
                                            <h4>Cascusamus et iusto accusamus</h4>
                                            <a class="mix-link">
                                                <i class="fa fa-link"></i>
                                            </a>
                                            <a class="mix-preview fancybox-button"
                                               href="metronic/assets/admin/pages/media/works/img2.jpg"
                                               title="Project Name"
                                               data-rel="fancybox-button">
                                                <i class="fa fa-search"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-4 mix mix_all category_1"
                                     style=" display: block; opacity: 1;">
                                    <div class="mix-inner">
                                        <img class="img-responsive"
                                             src="metronic/assets/admin/pages/media/works/img3.jpg"
                                             alt="">

                                        <div class="mix-details">
                                            <h4>Cascusamus et iusto accusamus</h4>
                                            <a class="mix-link">
                                                <i class="fa fa-link"></i>
                                            </a>
                                            <a class="mix-preview fancybox-button"
                                               href="metronic/assets/admin/pages/media/works/img3.jpg"
                                               title="Project Name"
                                               data-rel="fancybox-button">
                                                <i class="fa fa-search"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <c:forEach var="scormInfo" items="${allScorm}">
                                    <div class="col-md-3 col-sm-4 mix mix_all
                                    <c:if test="${scormInfo.completeDate==''}">
                                        category_1
                                    </c:if>
                                    <c:if test="${scormInfo.completeDate != ''}">
                                        category_2
                                    </c:if>
                                    "
                                     style=" display: block; opacity: 1;">
                                        <div class="mix-inner">
                                            <img id="${scormInfo.scormId}" class="img-responsive" alt="${scormInfo.scormId}">

                                            <div class="mix-details">
                                                <h4>${scormInfo.scormName}</h4>
                                                <h4>${scormInfo.imgPath}</h4>
                                                <a class="mix-link">
                                                    <i class="fa fa-link"></i>
                                                </a>
                                                    <%--<a class="mix-preview fancybox-button"--%>
                                                    <%--href="metronic/assets/admin/pages/media/works/img1.jpg" title="Project Name"--%>
                                                    <%--data-rel="fancybox-button">--%>
                                                    <%--<i class="fa fa-search"></i>--%>
                                                    <%--</a>--%>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- END FILTER -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        <c:forEach var="scormInfo" items="${allScorm}">
             $("#" + "${scormInfo.scormId}").attr("src", basePath + "${scormInfo.imgPath}");
        </c:forEach>
        Portfolio.init();
    })
</script>