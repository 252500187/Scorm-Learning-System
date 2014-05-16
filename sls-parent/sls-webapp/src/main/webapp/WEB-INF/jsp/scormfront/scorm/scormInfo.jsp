<%--@elvariable id="scormInfo" type="com.sls.scorm.entity.Scorm"--%>
<%--@elvariable id="scoList" type="java.util.List"--%>
<%--@elvariable id="allComments" type="java.util.List"--%>
<%--@elvariable id="registerScorm" type="java.lang.Boolean"--%>
<%--@elvariable id="collectScorm" type="java.lang.Boolean"--%>
<%--@elvariable id="complete" type="java.lang.Boolean"--%>
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
    <title>SLS | WELCOME to SLS</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/common.jsp" %>
    <link rel="stylesheet" type="text/css" href="metronic/assets/admin/pages/css/profile.css"/>
    <%--<script src="metronic/assets/global/plugins/holder.js" type="text/javascript"></script>--%>
    <style type="text/css">
        .img-polaroid {
            padding: 4px;
            background-color: #fff;
            border: 1px solid #ccc;
            border: 1px solid rgba(0, 0, 0, 0.2);
            -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .md-height {
            height: 64px;
            line-height: 64px;
        }
    </style>
</head>

<body class="page-header-fixed" style="background-color: transparent">
<%--<%@include file="../index/navigationMenu.jsp" %>--%>

<%--<div class="page-container">--%>
<%--<div class="page-content-wrapper">--%>
<%--<div class="row profile">--%>

<div class="col-md-12">
<div class="tabbable tabbable-custom tabbable-full-width">
<div class="tab-content">
<div class="tab-pane active" id="tab_1_1">
<div class="row col-md-12">
    <div class="col-md-2"></div>
    <div class="col-md-2" style="float: left;">
        <ul class="list-unstyled profile-nav">
            <li>
                <img id="scormImg" class="img-polaroid" style="max-width: 150px;max-height: 200px"
                     alt=""/>
                <%--<img src="img/bookmarks/book4.jpg" class="img-polaroid" style="max-width: 150px;max-height: 200px">--%>
            </li>
        </ul>
    </div>
    <div style="float: left">
        <div class="row">
            <div class="col-md-8 profile-info">
                <div class="row col-md-12">
                    <div class="col-md-8" style="float: left">
                        <h1 style="padding-top: 5px">${scormInfo.scormName}</h1>
                    </div>
                    <!--已注册未完成-->
                    <c:if test="${registerScorm && !complete}">
                        <div class="col-md-2" style="float: left">
                            <a class="btn green m-icon" onclick="return false">
                                去学习<i class="m-icon-swapright m-icon-white"></i>
                            </a></div>
                    </c:if>
                    <!--已注册已完成-->
                    <c:if test="${registerScorm && complete}">
                        <div class="col-md-2" style="float: left">
                            <a class="btn default m-icon" onclick="return false"
                               style="color: #aaa">
                                已完成
                            </a></div>
                    </c:if>
                    <!--未注册-->
                    <c:if test="${!registerScorm}">
                        <div class="col-md-2" style="float: left">
                            <a class="btn blue"
                               onclick="registerScorm(${scormInfo.scormId})">注册</a>
                        </div>
                    </c:if>
                </div>
                <div class="row col-md-12">
                    <ul class="list-inline">
                        <li>发布时间:</li>
                        <li>${scormInfo.uploadDate}</li>
                    </ul>
                    <ul class="list-inline">
                        <li>总评分:</li>
                        <li><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                class="fa fa-star"></i><i
                                class="fa fa-star"></i><i
                                class="fa fa-star"></i></li>
                        <li>${scormInfo.score}</li>
                        <li>
                            <a>
                                <small style="color: #aaa">你还未进行评分哦</small>
                            </a>
                        </li>
                    </ul>
                    <ul class="list-inline" style="max-width: 250px;">
                        <li>简介:</li>
                        <li>${scormInfo.description}
                        </li>
                    </ul>
                    <ul class="list-inline">
                        <li>
                            点击量:${scormInfo.registerSum}
                        </li>
                        <li>
                            <a onclick="toMarkScore()">评论(${fn:length(allComments)})</a>
                        </li>
                        <li>
                            <i class="fa fa-heart"></i>
                            <!--已收藏-->
                            <c:if test="${true == collectScorm}">
                                <a style="color:#aaa" onclick="return false">收藏</a>
                            </c:if>
                            <!--未收藏-->
                            <c:if test="${false == collectScorm}">
                                <a style="color:#666"
                                   onclick="collectScorm(${scormInfo.scormId})">收藏</a>
                            </c:if>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <div class="tabbable tabbable-custom tabbable-custom-profile">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#tab_1_11" data-toggle="tab">
                        章节列表
                    </a>
                </li>
                <li>
                    <a href="#tab_1_22" data-toggle="tab" id="commentsTab">
                        评论
                    </a>
                </li>
                <c:if test="${registerScorm}">
                    <li>
                        <a href="#tab_1_33" data-toggle="tab" id="scheduleTab">
                            进度
                        </a>
                    </li>
                </c:if>
            </ul>
            <div class="tab-content" style="min-height: 200px">
                <div class="tab-pane active" id="tab_1_11">
                    <div class="portlet-body">
                        <ul class="ztreeStyle" id="chapterList"></ul>
                    </div>
                </div>
                <div class="tab-pane" id="tab_1_22">
                    <div class="tab-pane active" id="tab_1_1_2">
                        <div class="scroller" data-height="290px" data-always-visible="1"
                             data-rail-visible1="1" id="comments">
                            <div class="input-group">
                                <input id="markScore" name="markScore" class="form-control" type="text"
                                       placeholder="输入评论 ..." value="">
                                <span class="input-group-addon btn blue">评论</span></div>
                            <br/>
                            <!--评论列表-->
                            <ul class="feeds">
                                <c:forEach var="comment" items="${allComments}">
                                    <li>
                                        <div class="col1">
                                            <div class="cont">
                                                <div class="cont-col2">
                                                    <div class="desc">
                                                            ${comment.discuss}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col2" style="margin-left: -150px">
                                            <div class="date">
                                                    ${comment.discussDate}
                                            </div>
                                        </div>
                                        <div class="col2">
                                            <div class="date" style="color: #000">
                                                    ${comment.loginName}
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>

                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="tab_1_33">
                    <div class="tab-pane active" id="tab_1_1_3">
                        <div class="scroller" data-height="290px" data-always-visible="1"
                             data-rail-visible1="1" id="schedule">

                            <div class="portlet-body">
                                <ul class="media-list">
                                    <li class="media">
                                        <img class="pull-left media-object"
                                             style="max-width: 64px;max-height: 64px"
                                             src="${scormInfo.imgPath}" alt="管理员推荐">

                                        <div class="media-body">
                                            <div><p class="md-height">注册日期：</p>
                                            </div>
                                            <div class="media">
                                                <a class="pull-left" href="#">
                                                    <img class="media-object" src="holder.js/64x64" alt="">
                                                </a>

                                                <div class="media-body">
                                                    <p class="md-height">您还没有注册</p></div>
                                            </div>
                                            <div class="media">
                                                <h4 class="pull-left" style="display: block">评分:</h4>

                                                <div class="media-body">
                                                    <ul class="list-inline">
                                                        <li><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i><i
                                                                class="fa fa-star"></i></li>
                                                        <li><span class="btn blue">评论</span></li>
                                                    </ul>
                                                </div>
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
</div>
</div>
</div>
</div>
</div>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<%@include file="../index/footer.jsp" %>--%>
</body>
<!-- END BODY -->
</html>

<script type="text/javascript">
    var settingMenu = {
        view: {
            showLine: false,
            showIcon: false,
            selectedMulti: false,
            dblClickExpand: false,
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
            },
            key: {
                name: "name"
            },
            keep: {
                parent: true
            }
        },
        callback: {
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
        $("#scormImg").attr("src", basePath + "${scormInfo.imgPath}");
        $.fn.zTree.init($("#chapterList"), settingMenu, zNodes);
        $.fn.zTree.getZTreeObj("chapterList").expandAll(true);
    });

    function registerScorm(id) {
        $.ajax({
            url: basePath + "user/scorm/registerScorm?scormId=" + id,
            dataType: "json",
            type: "GET",
            success: function (message) {
                alert(message);
                window.location.href = basePath + "tourist/scormInfo?scormId=" + ${scormInfo.scormId};
            },
            error: doError
        })
    }

    function collectScorm(id) {
        $.ajax({
            url: basePath + "user/scorm/collectScorm?scormId=" + id,
            dataType: "json",
            type: "GET",
            success: function (message) {
                alert(message);
                window.location.href = basePath + "tourist/scormInfo?scormId=" + ${scormInfo.scormId};
            },
            error: doError
        })
    }

    function toMarkScore() {
        $("#commentsTab").click();
        $("#markScore").focus();
    }
</script>