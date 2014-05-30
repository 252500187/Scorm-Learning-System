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
    <title>SLS | ScormInfo</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/common.jsp" %>
    <link rel="stylesheet" type="text/css" href="<c:url value="/metronic/assets/admin/pages/css/profile.css"/>"/>
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/js/common/zTree-v3.5.14/css/zTreeStyle/zTreeStyle.css"/>"/>
</head>
<body class="page-header-fixed" style="background-color: #ffffff">
<%@include file="../index/navigationMenu.jsp" %>
<div class="page-container">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <div class="row">
                <div class="col-md-4">
                    <img style="width: 280px" src="img/others/flag_top.png" alt=""/><br/>
                    <img id="scormImg" src="${scormInfo.imgPath}" class="img-polaroid"
                         style="width: 300px;height: 200px" alt=""/><br/>
                    <img style="width: 280px" src="img/others/flag_center.png" alt=""/>
                </div>
                <div class="col-md-1">
                    <h3 class="caption-sidebar">
                        <c:if test="${scormInfo.showRecommendLevel!=''}">
                            <img src="${scormInfo.showRecommendLevel}" width="25px" height="25px">
                        </c:if>
                        <c:if test="${complete}">
                            (已完成)
                        </c:if>
                        ${scormInfo.scormName}
                    </h3><br/>
                    <hr/>
                    <div class="form-group profile-info">
                        <c:if test="${study}">
                            <a class="btn green m-icon" onclick="study('${scormInfo.scormId}')">
                                学习
                            </a>
                            <a class="btn blue" onclick="studyInfo('${scormInfo.scormId}')">
                                学习情况
                            </a>
                        </c:if>
                        <c:if test="${register}">
                            <a class="btn blue" onclick="registerScorm('${scormInfo.scormId}')">
                                注册
                            </a>
                        </c:if>
                        <c:if test="${collect}">
                            <a class="btn blue" onclick="collectScorm('${scormInfo.scormId}')">
                                收藏
                            </a>
                        </c:if>
                        <br/>
                        <ul class="list-inline">
                            <li>评分:</li>
                            <li>${scormInfo.score}分</li>
                            <div class="progress progress-striped active" style="width: 250px;">
                                <div class="progress-bar progress-bar-info"
                                     role="progressbar"
                                     aria-valuemin="0"
                                     aria-valuemax="5" style="width: ${(scormInfo.score/5)*100}%">
                                </div>
                            </div>
                        </ul>
                        <ul class="list-inline">
                            <li>标签:</li>
                            <li></li>
                        </ul>
                        <ul class="list-inline">
                            <li>简介:</li>
                            <li>${scormInfo.description}</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="row">
                        <div class="portlet">
                            <div class="portlet-title sidebar-title">
                                <div class="caption-sidebar">章节列表</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse">
                                    </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <ul class="feeds">
                                    <li style="background-color: #fff;">
                                        <div class="col1">
                                            <div class="cont">
                                                <div class="ztree" id="chapterList"></div>
                                            </div>
                                        </div>
                                        <div class="col2">
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <c:if test="${fn:length(groupScorms)>0}">
                            <div class="portlet">
                                <div class="portlet-title sidebar-title">
                                    <div class="caption-sidebar">本系列课程</div>
                                    <div class="tools">
                                        <a href="javascript:;" class="collapse">
                                        </a>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <ul class="feeds">
                                        <li style="background-color: #fff;">
                                            <div class="col1">
                                                <div class="cont">
                                                    <c:forEach var="groupScorm" items="${groupScorms}">
                                                        <a onclick="scormInfo('${groupScorm.scormId}')">
                                                                ${groupScorm.scormName}
                                                        </a><br/>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="portlet">
                        <div class="portlet-title sidebar-title">
                            <div class="caption-sidebar">评论</div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse">
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <ul class="feeds">
                                <li style="background-color: #fff;">
                                    <div class="cont">
                                        <div class="cont-col2">
                                            <c:if test="${register}">
                                                <div class="chat-form">
                                                    <div class="input-cont">
                                                        <input class="form-control" type="text" id="discuss"
                                                               placeholder="说点什么？"/>
                                                    </div>
                                                    <div class="btn-cont">
                                                        <span class="arrow"></span>
                                                        <a onclick="changeDiscuss()" class="btn blue icn-only">
                                                            <i class="fa fa-check icon-white"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <br/>
                                            </c:if>
                                            <ul class="chats">
                                                <c:forEach var="comment" items="${allComments}">
                                                    <c:if test="${comment.userId!=userId}">
                                                        <li class="in">
                                                    </c:if>
                                                    <c:if test="${comment.userId==userId}">
                                                        <li class="out">
                                                    </c:if>
                                                    <div class="message">
                                                        <span class="arrow"></span>
                                                        <a class="name">${comment.userName}</a>
                                                        <span class="datetime">${comment.discussDate}</span>
                                                        <span class="body">${comment.discuss}</span>
                                                    </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
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
<script src="<c:url value="/js/common/zTree-v3.5.14/js/jquery.ztree.all-3.5.min.js"/>"
        type="text/javascript"></script>
<script type="text/javascript">
    var settingMenu = {
        view: {
            expandSpeed: "fast"
        },
        check: {
            enable: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId"
            }
        }
    };

    var zNodes = [
        <c:forEach var="scoNode" items="${scoList}">
        {id: "${scoNode.treeId}",
            pId: "${scoNode.treeParentId}",
            name: "${scoNode.title}",
            src: "${scoNode.url}",
            scoId: "${scoNode.scoId}"},
        </c:forEach>
    ];

    $(function () {
        Metronic.init();
        Layout.init();
        $.fn.zTree.init($("#chapterList"), settingMenu, zNodes).expandAll(true);
    });

    function registerScorm(id) {
        $.ajax({
            url: basePath + "user/scorm/registerScorm?scormId=" + id,
            dataType: "json",
            type: "GET",
            success: function () {
                window.location.href = basePath + "tourist/scormInfo?scormId=" + id;
            },
            error: doError
        })
    }

    function collectScorm(id) {
        $.ajax({
            url: basePath + "user/scorm/collectScorm?scormId=" + id,
            dataType: "json",
            type: "GET",
            success: function () {
                window.location.href = basePath + "tourist/scormInfo?scormId=" + id;
            },
            error: doError
        })
    }

    function study(scormId) {
        parent.window.open(basePath + "user/scorm/studyScorm?scormId=" + scormId);
    }

    function changeDiscuss() {
        if ($("#discuss").val().trim() == "") {
            return;
        }
        $.ajax({
            url: basePath + "user/dealScorm/discussScorm",
            dataType: "json",
            data: {
                scormId: "${scormInfo.scormId}",
                discuss: $("#discuss").val()
            },
            type: "post",
            success: function () {
                window.location.reload();
            },
            error: doError
        })
    }

    function studyInfo(scormId) {
        parent.$(".modal-title").html("学习情况");
        window.location.href = basePath + "user/dealScorm/userStudyInfo?scormId=" + scormId;
    }
</script>