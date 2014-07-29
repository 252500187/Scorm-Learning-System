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
<body class="page-header-fixed" style="background-color: #ffffff;overflow-x:hidden">
<%@include file="index/navigationMenu.jsp" %>
<div class="page-container">
<div class="row">
<div class="col-md-9">
    <div class="row">
        <c:if test="${recommendIndexScorms[0]!=null}">
            <div class="col-md-6" style="padding-left: 55px">
                <div class="news-blocks">
                    <div style="display: block;">
                        <div>
                            <div class="thumbnail" name="firstScorm">
                                <a onclick="scormInfo('${recommendIndexScorms[0].scormId}')">
                                    <img src="${recommendIndexScorms[0].imgPath}" alt=""
                                         id="firstScormImg" name="firstScorm">
                                </a>
                            </div>
                            <span class="span-name" name="firstScorm">${recommendIndexScorms[0].scormName}</span>
                        </div>
                        <div>
                            <p style="height: 50px;overflow: hidden"> ${recommendIndexScorms[0].description}</p>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <div class="col-md-3">
            <c:if test="${recommendIndexScorms[1]!=null}">
                <div>
                    <div class="thumbnail" style="width: 225px">
                        <a onclick="scormInfo('${recommendIndexScorms[1].scormId}')">
                            <img src="${recommendIndexScorms[1].imgPath}" alt="" style="width: 225px;height: 150px;">
                        </a>
                    </div>
                    <span class="span-name" style="width: 225px;">${recommendIndexScorms[1].scormName}</span>
                </div>
                <div>
                    <p style="height: 50px;overflow: hidden"> ${recommendIndexScorms[1].description}</p>
                </div>
            </c:if>
            <c:if test="${recommendIndexScorms[2]!=null}">
                <div>
                    <div class="thumbnail" style="width: 225px">
                        <a onclick="scormInfo('${recommendIndexScorms[2].scormId}')">
                            <img src="${recommendIndexScorms[2].imgPath}" alt="" style="width: 225px;height: 150px;">
                        </a>
                    </div>
                    <span class="span-name" style="width: 225px;">${recommendIndexScorms[2].scormName}</span>
                </div>
                <div>
                    <p style="height: 50px;overflow: hidden"> ${recommendIndexScorms[2].description}</p>
                </div>
            </c:if>
        </div>
        <div class="col-md-3">
            <c:if test="${recommendIndexScorms[3]!=null}">
                <div>
                    <div class="thumbnail" style="width: 225px">
                        <a onclick="scormInfo('${recommendIndexScorms[3].scormId}')">
                            <img src="${recommendIndexScorms[3].imgPath}" alt="" style="width: 225px;height: 150px;">
                        </a>
                    </div>
                    <span class="span-name" style="width: 225px;">${recommendIndexScorms[3].scormName}</span>
                </div>
                <div>
                    <p style="height: 50px;overflow: hidden"> ${recommendIndexScorms[3].description}</p>
                </div>
            </c:if>
            <c:if test="${recommendIndexScorms[4]!=null}">
                <div>
                    <div class="thumbnail" style="width: 225px">
                        <a onclick="scormInfo('${recommendIndexScorms[4].scormId}')">
                            <img src="${recommendIndexScorms[4].imgPath}" alt="" style="width: 225px;height: 150px;">
                        </a>
                    </div>
                    <span class="span-name" style="width: 225px;">${recommendIndexScorms[4].scormName}</span>
                </div>
                <div>
                    <p style="height: 50px;overflow: hidden"> ${recommendIndexScorms[4].description}</p>
                </div>
            </c:if>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" style="padding-left: 40px;">
            <div class="mix-grid">
                <h2>
                    <div class="caption-sidebar">课件评分</div>
                </h2>
                <br/>
                <hr/>
                <c:forEach var="scorm" items="${scormScore}">
                    <div class="col-md-4 mix mix_all category_1"
                         style=" display: block; opacity: 1;width: 300px;">
                        <div>
                            <div class="thumbnail">
                                <a onclick="scormInfo('${scorm.scormId}')">
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
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12" style="padding-left: 40px;">
            <div class="mix-grid">
                <h2>
                    <div class="caption-sidebar">推荐等级</div>
                </h2>
                <br/>
                <hr/>
                <c:forEach var="scorm" items="${scormLevel}">
                    <div class="col-md-4 mix mix_all category_1"
                         style=" display: block; opacity: 1;width: 300px;">
                        <div>
                            <div class="thumbnail">
                                <a onclick="scormInfo('${scorm.scormId}')">
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
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12" style="padding-left: 40px;">
            <div class="mix-grid">
                <h2>
                    <div class="caption-sidebar">学习时间</div>
                </h2>
                <br/>
                <hr/>
                <c:forEach var="scorm" items="${scormTime}">
                    <div class="col-md-4 mix mix_all category_3"
                         style=" display: block; opacity: 1;width: 300px;">
                        <div>
                            <div class="thumbnail">
                                <a onclick="scormInfo('${scorm.scormId}')">
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
    </div>
    <div class="row">
        <div class="col-md-12" style="padding-left: 40px;">
            <div class="mix-grid">
                <h2>
                    <div class="caption-sidebar">注册人数</div>
                </h2>
                <br/>
                <hr/>
                <c:forEach var="scorm" items="${scormSum}">
                    <div class="col-md-4 mix mix_all category_4"
                         style=" display: block; opacity: 1;width: 300px;">
                        <div>
                            <div class="thumbnail">
                                <a onclick="scormInfo('${scorm.scormId}')">
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
    </div>
</div>
<div class="col-md-3">
    <div class="portlet">
        <div class="portlet-title sidebar-title">
            <h1>
                <div class="caption-sidebar">最新上传</div>
            </h1>
            <%--<div class="tools">--%>
                <%--<a href="javascript:;" class="collapse">--%>
                <%--</a>--%>
            <%--</div>--%>
        </div>
        <div class="portlet-body">
            <ul class="feeds">
                <c:forEach var="latest" items="${latestScorms}">
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
            <h2>
                <div class="caption-sidebar">分类查找</div>
            </h2>
            <%--<div class="tools">--%>
                <%--<a href="javascript:;" class="collapse">--%>
                <%--</a>--%>
            <%--</div>--%>
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
</body>
</html>
<script type="text/javascript">
    $(function () {
        Metronic.init();
        Layout.init();
        Portfolio.init();
        var width = document.documentElement.clientWidth;
        $("[name=firstScorm]").css("width", width * 3 / 8 - 50);
        $("#firstScormImg").css("height", width / 4 - 33);
    });
</script>

