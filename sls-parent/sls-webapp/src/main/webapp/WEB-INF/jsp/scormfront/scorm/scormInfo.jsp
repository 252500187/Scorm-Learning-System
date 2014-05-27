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
<body class="page-boxed page-header-fixed">
<div class="page-container">
    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-2" style="float: left">
                        <img style="width: 150px" src="img/others/flag_top.png" alt=""/><br/>
                        <img id="scormImg" src="${scormInfo.imgPath}" class="img-polaroid"
                             style="max-width: 150px;max-height: 200px" alt=""/><br/>
                        <img style="width: 150px" src="img/others/flag_center.png" alt=""/>
                    </div>
                    <div class="col-md-10" style="float: left">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="portlet-body form">
                                    <div class="form-body">
                                        <h3 class="form-section">
                                            <c:if test="${scormInfo.showRecommendLevel!=''}">
                                                <img src="${scormInfo.showRecommendLevel}" width="25px" height="25px">
                                            </c:if>
                                            <c:if test="${complete}">
                                                (已完成)
                                            </c:if>
                                            ${scormInfo.scormName}
                                        </h3>
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
                                        <br/><br/>

                                        <div class="form-group profile-info">
                                            <ul class="list-inline" style="width: 250px;">
                                                <li>评分:</li>
                                                <li>${scormInfo.score}分</li>
                                                <div class="progress progress-striped active">
                                                    <div class="progress-bar progress-bar-info"
                                                         role="progressbar"
                                                         aria-valuemin="0"
                                                         aria-valuemax="5" style="width: ${(scormInfo.score/5)*100}%">
                                                    </div>
                                                </div>
                                            </ul>
                                            <ul class="list-inline" style="width: 250px;">
                                                <li>简介:</li>
                                                <li>${scormInfo.description}</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="tabbable tabbable-custom tabbable-custom-profile">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#tab_1" data-toggle="tab">
                                        章节
                                    </a>
                                </li>
                                <c:if test="${fn:length(groupScorms)>0}">
                                    <li>
                                        <a href="#tab_3" data-toggle="tab">
                                            本系列课程
                                        </a>
                                    </li>
                                </c:if>
                                <li>
                                    <a href="#tab_2" data-toggle="tab">
                                        评论
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content" style="min-height: 200px">
                                <div class="tab-pane active" id="tab_1">
                                    <ul class="ztree" id="chapterList"></ul>
                                </div>
                                <div class="tab-pane active" id="tab_3">
                                    <c:forEach var="groupScorm" items="${groupScorms}">
                                        <a onclick="window.location.href='tourist/scormInfo?scormId=${groupScorm.scormId}'">
                                                ${groupScorm.scormName}
                                        </a><br/>
                                    </c:forEach>
                                </div>
                                <div class="tab-pane" id="tab_2">
                                    <div class="scroller" style="min-height: 200px;" data-always-visible="1"
                                         data-rail-visible1="1">
                                        <c:if test="${!register}">

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
                                                <img class="avatar img-responsive" alt=""
                                                     src="${comment.imgUrl}"/>

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
                            </div>
                        </div>
                    </div>
                </div>
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
        $.fn.zTree.init($("#chapterList"), settingMenu, zNodes);
        $.fn.zTree.getZTreeObj("chapterList").expandAll(true);
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

    function toMarkScore() {
        $("#commentsTab").click();
        $("#markScore").focus();
    }
</script>