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
    <link rel="stylesheet" type="text/css" href="/metronic/assets/admin/pages/css/profile.css"/>
</head>

<body class="page-header-fixed" style="background-color: transparent">
<div class="col-md-12">
    <div class="tabbable tabbable-custom tabbable-full-width">
        <div class="tab-content">
            <div class="tab-pane active" id="tab_1_1">
                <div class="row col-md-12">
                    <div class="col-md-2"></div>
                    <div class="col-md-2" style="float: left;">
                        <ul class="list-unstyled profile-nav">
                            <li>
                                <img id="scormImg" class="img-responsive" style="width: 200px;height: 150px"
                                     alt=""/>
                                <i href="#" class="profile-edit">

                                </i>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-8 profile-info">
                                <div class="row">
                                    <div class="col-md-6" style="float: left">
                                        <h1 style="margin-top: 0px;">${scormInfo.scormName}</h1>
                                    </div>
                                    <!--已注册未完成-->
                                    <c:if test="${registerScorm && !complete}">
                                        <div class="col-md-2" style="float: left">
                                            <a class="btn btn-lg green m-icon-big" onclick="return false">
                                                去学习<i class="m-icon-big-swapright m-icon-white"></i>
                                            </a></div>
                                    </c:if>
                                    <!--已注册已完成-->
                                    <c:if test="${registerScorm && complete}">
                                        <div class="col-md-2" style="float: left">
                                            <a class="btn default" onclick="return false" style="color: #aaa">
                                                已完成</i>
                                            </a></div>
                                    </c:if>
                                    <!--未注册-->
                                    <c:if test="${!registerScorm}">
                                        <div class="col-md-2" style="float: left">
                                            <a class="btn blue"
                                               onclick="registerScorm(${scormInfo.scormId})">注册</a>
                                        </div>
                                    </c:if>

                                    <div class="row col-md-12">
                                        <div class="row col-md-6" style="float: left">
                                            <ul class="list-inline">
                                                <li>发布时间:</li>
                                                <li>${scormInfo.uploadDate}</li>
                                            </ul>
                                            <ul class="list-inline">
                                                <li>评分:</li>
                                                <li><i class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                        class="fa fa-star"></i><i
                                                        class="fa fa-star"></i><i
                                                        class="fa fa-star"></i></li>
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
                                        <div class="row col-md-6" style="float: left;margin-left: 0">
                                            <ul class="list-inline">
                                                <li>发布时间:</li>
                                                <li>${scormInfo.uploadDate}</li>
                                            </ul>
                                        </div>
                                    </div>

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
                                    <a href="#tab_1_22" data-toggle="tab">
                                        评论
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_1_11">
                                    <div class="portlet-body">
                                        <ul class="ztreeStyle" id="chapterList"></ul>
                                    </div>
                                </div>
                                <!--tab-pane-->
                                <div class="tab-pane" id="tab_1_22">
                                    <div class="tab-pane active" id="tab_1_1_1">
                                        <div class="scroller" data-height="290px" data-always-visible="1"
                                             data-rail-visible1="1" id="comments">
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
                                <!--tab-pane-->
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
</script>