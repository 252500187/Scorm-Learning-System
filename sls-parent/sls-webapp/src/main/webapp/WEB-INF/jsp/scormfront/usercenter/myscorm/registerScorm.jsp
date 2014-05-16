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
    <title>已注册课件</title>
</head>
<body class="page-header-fixed" style="background-color: transparent">
<c:forEach var="scormInfo" items="${allScorm}">
    <div class="row col-md-12">
            <%--课件的左边部分--%>
        <div class="col-md-2" style="float: left;">
            <ul class="list-unstyled profile-nav">
                <li>
                    <img id="${scormInfo.scormId}" class="img-responsive" style="width: 200px;height: 150px"
                         alt="${scorm.scormName}"/>
                    <i href="#" class="profile-edit">
                    </i>
                </li>
            </ul>
        </div>
            <%--课件的右边部分--%>
        <div class="col-md-8">
            <div class="row">
                <div class="col-md-8 profile-info">
                    <div class="row col-md-12">
                        <div class="col-md-8" style="float: left">
                            <h1 style="margin-top: 0px;">${scormInfo.scormName}</h1>
                        </div>
                        <!--已注册未完成-->
                        <div class="col-md-2" style="float: left">
                            <a class="btn btn-lg green m-icon-big" onclick="return false">
                                去学习<i class="m-icon-big-swapright m-icon-white"></i>
                            </a>
                        </div>
                    </div>
                    <div class="row col-md-12">
                        <ul class="list-inline">
                            <li>发布时间:</li>
                            <li>${scormInfo.uploadDate}</li>
                        </ul>
                        <ul class="list-inline">
                            <li>总评分:</li>
                            <li>${scormInfo.score}</li>
                        </ul>
                        <ul class="list-inline">
                            <li>简介:</li>
                            <li>${scormInfo.description}
                            </li>
                        </ul>
                        <ul class="list-inline">
                            <li>
                                点击量:${scormInfo.registerSum}
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>

</c:forEach>

</body>
</html>
<script type="text/javascript">
    <c:forEach var="scormInfo" items="${allScorm}">

        $("#"+ "${scormInfo.scormId}").attr("scr",basePath + "${scormInfo.imgPath}");

    </c:forEach>
</script>