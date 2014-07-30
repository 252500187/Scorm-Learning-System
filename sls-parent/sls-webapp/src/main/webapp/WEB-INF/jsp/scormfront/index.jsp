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
                <div class="col-md-6" style="padding-left: 35px">
                    <div onclick="scormInfo('${recommendIndexScorms[0].scormId}')">
                        <img src="${recommendIndexScorms[0].imgPath}" alt="${recommendIndexScorms[0].scormName}"
                             style="height: 300px;width: 440px"/>
                    </div>
                    <span>${recommendIndexScorms[0].scormName}</span>
                </div>
            </c:if>

            <div class="col-md-6">
                <div class="row">

                    <c:if test="${recommendIndexScorms[1]!=null}">
                        <div class="col-md-6">
                            <div onclick="scormInfo('${recommendIndexScorms[1].scormId}')">
                                <img src="${recommendIndexScorms[1].imgPath}" alt="${recommendIndexScorms[1].scormName}"
                                     style="height: 150px;width: 220px"/>
                            </div>
                            <span>${recommendIndexScorms[1].scormName}</span>
                        </div>
                    </c:if>
                    <c:if test="${recommendIndexScorms[2]!=null}">
                        <div class="col-md-6">
                            <div onclick="scormInfo('${recommendIndexScorms[2].scormId}')">
                                <img src="${recommendIndexScorms[2].imgPath}" alt="${recommendIndexScorms[2].scormName}"
                                     style="height: 150px;width: 220px"/>
                            </div>
                            <span>${recommendIndexScorms[2].scormName}</span>
                        </div>
                    </c:if>
                    <c:if test="${recommendIndexScorms[3]!=null}">
                        <div class="col-md-6">
                            <div onclick="scormInfo('${recommendIndexScorms[3].scormId}')">
                                <img src="${recommendIndexScorms[3].imgPath}" alt="${recommendIndexScorms[3].scormName}"
                                     style="height: 150px;width: 220px"/>
                            </div>
                            <span>${recommendIndexScorms[3].scormName}</span>
                        </div>
                    </c:if>
                    <c:if test="${recommendIndexScorms[4]!=null}">
                        <div class="col-md-6">
                            <div onclick="scormInfo('${recommendIndexScorms[4].scormId}')">
                                <img src="${recommendIndexScorms[4].imgPath}" alt="${recommendIndexScorms[4].scormName}"
                                     style="height: 150px;width: 220px"/>
                            </div>
                            <span>${recommendIndexScorms[4].scormName}</span>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <br/>
        <div class="row">
            <c:if test="${recommendIndexScorms[5]!=null}">
                <div class="col-md-3" style="padding-left: 35px">
                    <div onclick="scormInfo('${recommendIndexScorms[5].scormId}')">
                        <img src="${recommendIndexScorms[5].imgPath}" alt="${recommendIndexScorms[5].scormName}"
                             style="height: 150px;width: 220px"/>
                    </div>
                    <span>${recommendIndexScorms[5].scormName}</span>
                </div>
            </c:if>
            <c:if test="${recommendIndexScorms[6]!=null}">
                <div class="col-md-3">
                    <div onclick="scormInfo('${recommendIndexScorms[6].scormId}')">
                        <img src="${recommendIndexScorms[6].imgPath}" alt="${recommendIndexScorms[6].scormName}"
                             style="height: 150px;width: 220px"/>
                    </div>
                    <span>${recommendIndexScorms[6].scormName}</span>
                </div>
            </c:if>
            <c:if test="${recommendIndexScorms[7]!=null}">
                <div class="col-md-3">
                    <div onclick="scormInfo('${recommendIndexScorms[7].scormId}')">
                        <img src="${recommendIndexScorms[7].imgPath}" alt="${recommendIndexScorms[7].scormName}"
                             style="height: 150px;width: 220px"/>
                    </div>
                    <span>${recommendIndexScorms[7].scormName}</span>
                </div>
            </c:if>
            <c:if test="${recommendIndexScorms[8]!=null}">
                <div class="col-md-3">
                    <div onclick="scormInfo('${recommendIndexScorms[8].scormId}')">
                        <img src="${recommendIndexScorms[8].imgPath}" alt="${recommendIndexScorms[8].scormName}"
                             style="height: 150px;width: 220px"/>
                    </div>
                    <span>${recommendIndexScorms[8].scormName}</span>
                </div>
            </c:if>
        </div>
        <br/>
        <div class="row">
            <div class="col-md-12" style="padding-left: 40px;">
                <div class="portlet">
                    <div class="portlet-title sidebar-title">
                        <h2>
                            <div class="caption-sidebar">分类</div>
                        </h2>
                    </div>
                    <div class="portlet-body">
                        <ul class="feeds list-inline">
                            <c:forEach var="label" items="${labels}">
                                <li style="background-color: #fff;">
                                    <a onclick="sortByLabel('${label.labelId}')"
                                       style="text-decoration: none;cursor: pointer;">
                                        <i class="fa fa-tags"></i> ${label.labelName}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3" style="margin-top: -35px">
        <div class="portlet">
            <div class="portlet-title">
                <h1>
                    <div class="caption-sidebar">最新上传</div>
                </h1>
            </div>
            <div class="portlet-body">
                <ul class="feeds">
                    <c:forEach var="latest" items="${latestScorms}">
                        <li style="background-color: #fff;">
                            <div class="col1">
                                <div class="cont">
                                    <div class="cont-col1">
                                        <div>
                                            <img style="width: 100px;height: 60px;" src="${latest.imgPath}"
                                                 class="img-rounded">
                                        </div>
                                    </div>
                                    <div class="cont-col2">
                                        <div class="desc-sidebar">${latest.scormName}</div>
                                        <div class="date-sidebar">${latest.uploadDate}</div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12" style="padding-left: 40px;">
        <div class="mix-grid">
            <hr/>
            <h2>
                <div class="caption-sidebar">推荐用户</div>
            </h2>
            <br/>
            <br/>

            <div class="tiles">
                <c:forEach var="user" items="${recommendUsers}">
                    <div class="tile image" onclick="userInfo('${user.userId}')">
                        <div class="tile-body">
                            <img src="${user.imgUrl}" alt="${user.userName}" style="width: 150px;height: 150px;"
                                 class="img-rounded">
                        </div>
                        <div class="tile-object">
                            <div class="number">
                                    ${user.userName}
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12" style="padding-left: 40px;">
        <div class="mix-grid">
            <hr/>
            <h2>
                <div class="caption-sidebar">课件评分</div>
            </h2>
            <br/>
            <br/>
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
            <hr/>
            <h2>
                <div class="caption-sidebar">推荐等级</div>
            </h2>
            <br/>
            <br/>
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
            <hr/>
            <h2>
                <div class="caption-sidebar">学习时间</div>
            </h2>
            <br/>
            <br/>
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
            <hr/>
            <h2>
                <div class="caption-sidebar">注册人数</div>
            </h2>
            <br/>
            <br/>
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
<br/>
<hr/>
<br/>
</div>
<%@include file="index/footer.jsp" %>
</body>
</html>
<script type="text/javascript">
    $(function () {
        Metronic.init();
        Layout.init();
        Portfolio.init();
    });
</script>

