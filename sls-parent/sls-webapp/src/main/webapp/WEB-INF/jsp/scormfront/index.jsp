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
<body class="page-header-fixed" style="background-color: #ffffff">
<%@include file="index/navigationMenu.jsp" %>
<div class="page-container">
    <div class="row">
        <div class="col-md-6" style="margin-left: 40px;">
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
                <a id="recommend" class="filter" data-filter="category_1" hidden="true"></a>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-9" style="padding-left: 40px;">
            <div class="mix-grid">
                <c:forEach var="scorm" items="${scormLevel}">
                    <div class="col-md-4 mix mix_all category_1"
                         style=" display: block; opacity: 1;width: 300px;">
                        <div>
                            <div class="thumbnail">
                                <a onclick="showScormInfo('${scorm.scormId}')">
                                    <img src="${scorm.imgPath}" alt="" style="width: 300px;height: 200px;">
                                </a>
                            </div>
                            <span class="span-name">${scorm.scormName}</span>
                        </div>
                        <div>
                            <p style="height: 50px;overflow: hidden"> ${scorm.description}</p>
                        </div>
                    </div>
                </c:forEach>
                <c:forEach var="scorm" items="${scormSum}">
                    <div class="col-md-4 mix mix_all category_2"
                         style=" display: block; opacity: 1;width: 300px;">
                        <div>
                            <div class="thumbnail">
                                <a onclick="showScormInfo('${scorm.scormId}')">
                                    <img src="${scorm.imgPath}" alt="" style="width: 300px;height: 200px;">
                                </a>
                            </div>
                            <span class="span-name">${scorm.scormName}</span>
                        </div>
                        <div>
                            <p style="height: 50px;overflow: hidden"> ${scorm.description}</p>
                        </div>
                    </div>
                </c:forEach>
                <c:forEach var="scorm" items="${scormTime}">
                    <div class="col-md-4 mix mix_all category_3"
                         style=" display: block; opacity: 1;width: 300px;">
                        <div>
                            <div class="thumbnail">
                                <a onclick="showScormInfo('${scorm.scormId}')">
                                    <img src="${scorm.imgPath}" alt="" style="width: 300px;height: 200px;">
                                </a>
                            </div>
                            <span>${scorm.scormName}</span>
                        </div>
                        <div>
                            <p style="height: 50px;overflow: hidden"> ${scorm.description}</p>
                        </div>
                    </div>
                </c:forEach>
                <c:forEach var="scorm" items="${scormScore}">
                    <div class="col-md-4 mix mix_all category_4"
                         style=" display: block; opacity: 1;width: 300px;">
                        <div>
                            <div class="thumbnail">
                                <a onclick="showScormInfo('${scorm.scormId}')">
                                    <img src="${scorm.imgPath}" alt="" style="width: 300px;height: 200px;">
                                </a>
                            </div>
                            <span>${scorm.scormName}</span>
                        </div>
                        <div>
                            <p style="height: 50px;overflow: hidden"> ${scorm.description}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-3" style="padding-right: 50px;">
            <div class="portlet">
                <div class="portlet-title sidebar-title">
                    <div class="caption-sidebar">最新上传</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse">
                        </a>
                    </div>
                </div>
                <div class="portlet-body">
                    <!--begin labels-->
                    <ul class="feeds">
                        <c:forEach var="latest" items="${latestScorms}">
                            <%--<li style="background-color: #fff;">今日上传</li>--%>
                            <li style="background-color: #fff;">
                                <div class="col1">
                                    <div class="cont">
                                        <div class="cont-col1">
                                            <div>
                                                <img style="width: 100px;height: 60px;" src="${latest.imgPath}">
                                            </div>
                                        </div>
                                        <div class="cont-col2">
                                            <div class="desc-sidebar">${latest.scormName}</div>
                                            <div class="date-sidebar">${latest.uploadDate}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col2">
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="portlet">
                <div class="portlet-title sidebar-title">
                    <div class="caption-sidebar">分类查找</div>
                    <div class="tools">
                        <a href="javascript:;" class="collapse">
                        </a>
                    </div>
                </div>
                <div class="portlet-body">
                    <!--begin labels-->
                    <ul class="feeds list-inline">
                        <c:forEach var="label" items="${labels}">
                            <li style="background-color: #fff;">
                                <a onclick="findByLabel('${label.labelName}')"
                                   style="text-decoration: none;cursor: pointer;">
                                    <i class="fa fa-tags"></i> &nbsp; ${label.labelName}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="index/footer.jsp" %>
<div id="alertPrompt" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p id="alertPromptMessage">
                </p>
            </div>
            <div class="modal-footer">
                <button id="promptButton" class="btn blue" data-dismiss="modal">确认</button>
            </div>
        </div>
    </div>
</div>
<div id="alertIframe" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"></h4>
            </div>
            <div>
                <iframe id="iframeInfo" style="width:100%; height:500px;border:1px;" frameborder=no allowfullscreen>
                </iframe>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script src="<c:url value="/metronic/assets/global/plugins/bootstrap-sessiontimeout/jquery.sessionTimeout.js"/>"
        type="text/javascript"></script>
<script type="text/javascript">
    function showScormInfo(scormId) {
        $("#alertIframe").modal('show');
        $(".modal-title").html("课件信息");
        $("#iframeInfo").attr("src", "tourist/scormInfo?scormId=" + scormId);
    }

    function findByLabel(label) {
        window.open(basePath + "tourist/findScorm?queryInfo=" + label);
    }

    $(function () {
        Metronic.init();
        Layout.init();
        Portfolio.init();
        var width = document.documentElement.clientWidth;
        $("#indexCenterImg").css("width", width * 5 / 12 + "px");
        $("#recommend").click();
    });
</script>

