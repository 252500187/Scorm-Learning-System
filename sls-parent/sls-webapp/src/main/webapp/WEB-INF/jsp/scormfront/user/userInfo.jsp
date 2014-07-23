<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | ${user.userName}的主页</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/common.jsp" %>
</head>
<body class="page-header-fixed" style="background-color: #ffffff;overflow-x:hidden">
<%@include file="../index/navigationMenu.jsp" %>
<div class="page-container">
    <!--左侧旁白-->
    <div class="col-md-2">
    </div>
    <div class="col-md-8">
        <!--基本信息-->
        <div class="row">
            <div class="col-md-4">
                <ul class="list-unstyled profile-nav">
                    <li>
                        <img src="${user.imgUrl}" class="img-responsive" alt=""/>
                    </li>
                </ul>
            </div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-8 profile-info">
                        <h1 style="font-weight:bold;">${user.userName}
                            <c:if test="${showAttention}">
                                <c:if test="${isAttention}">
                                    <a class="btn blue" name="userAttention" onclick="userAttention('${user.userId}')">关注</a>
                                </c:if>
                                <c:if test="${!isAttention}">
                                    <a class="btn blue" name="userAttention" onclick="userAttention('${user.userId}')">取消关注</a>
                                </c:if>
                            </c:if>
                        </h1>
                        <br/>

                        <p>
                            爱好：
                            <c:forEach var="label" items="${labels}">
                                <a onclick="findByLabel('${label.labelName}')">${label.labelName},</a>
                            </c:forEach>
                        </p><br/>

                        <p>
                            等级：<span style="font-weight:bold;"> ${user.levelName}</span>&nbsp;&nbsp;${user.score}分
                        </p>

                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                 aria-valuemin="0"
                                 aria-valuemax="100"
                                 style="width:${user.finalScore}%">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="portlet sale-summary">
                            <div class="portlet-title">
                                <div class="caption">
                                </div>
                            </div>
                            <div class="portlet-body">
                                <ul class="list-unstyled">
                                    <li>
                                        <span class="sale-info">上传课件数<i class="fa fa-img-down"></i></span>
                                        <span class="sale-num">${fn:length(upScorms)}</span>
                                    </li>
                                    <li>
                                        <span class="sale-info">注册课件数<i class="fa fa-img-up"></i></span>
                                        <span class="sale-num">${fn:length(registerScorms)}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <h3 class="form-section">上传的课件</h3>
            <hr/>

            <c:forEach var="scorm" items="${upScorms}">
                <a onclick="scormInfo('${scorm.scormId}')">
                    <div class="col-md-2 mix mix_all" style=" display: block;">
                        <img src="${scorm.imgPath}" width="80px" height="80px" class="img-rounded"/>

                        <p>
                            <img src="${scorm.showRecommendLevel}"
                                 style="width: 15px;height: 15px"/>&nbsp;${scorm.scormName}
                        </p>
                    </div>
                </a>
            </c:forEach>
        </div>
        <div class="row">
            <h3 class="form-section">注册的课件</h3>
            <hr/>

            <c:forEach var="scorm" items="${registerScorms}">
                <a onclick="scormInfo('${scorm.scormId}')">
                    <div class="col-md-2 mix mix_all" style=" display: block;">
                        <img src="${scorm.imgPath}" width="80px" height="80px" class="img-rounded"/>

                        <p>
                            <img src="${scorm.showRecommendLevel}"
                                 style="width: 15px;height: 15px"/>&nbsp;${scorm.scormName}
                        </p>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</div>
<%@include file="../index/footer.jsp" %>
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
</body>
</html>
<script type="text/javascript">
    $(function () {
        Metronic.init();
        Layout.init();
    });

    function userAttention(userId) {
        $.ajax({
            url: basePath + "user/info/userAttention?userAttentionId=" + userId,
            type: "GET",
            success: function () {
                var ele = $("[name = 'userAttention']");
                if (ele.html() == "关注") {
                    $("#alertPromptMessage").html("关注成功");
                    $("#alertPrompt").modal("show");
                    ele.html("取消关注");
                } else {
                    $("#alertPromptMessage").html("取消关注成功");
                    $("#alertPrompt").modal("show");
                    ele.html("关注");
                }
            },
            error: doError
        })
    }
</script>