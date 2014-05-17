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
                        <img id="scormImg" class="img-polaroid" style="max-width: 150px;max-height: 200px" alt=""/>
                    </div>
                    <div style="float: left">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="portlet-body form">
                                    <div class="form-body">
                                        <h3 class="form-section">${scormInfo.scormName}
                                            <c:if test="${registerScorm && !complete}">
                                                <a class="btn green m-icon" onclick="return false">
                                                    去学习<i class="m-icon-swapright m-icon-white"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${registerScorm && complete}">
                                                <a class="btn default m-icon" onclick="return false"
                                                   style="color: #aaa">
                                                    已完成
                                                </a>
                                            </c:if>
                                            <c:if test="${!registerScorm}">
                                                <a class="btn blue" onclick="registerScorm(${scormInfo.scormId})">注册</a>
                                            </c:if>
                                        </h3>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group profile-info">
                                                    <ul class="list-inline">
                                                        <li>发布时间:</li>
                                                        <li>${scormInfo.uploadDate}</li>
                                                    </ul>
                                                    <ul class="list-inline">
                                                        <li>总评分:</li>
                                                        <li><i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </li>
                                                        <li>${scormInfo.score}分</li>
                                                    </ul>
                                                    <ul class="list-inline" style="max-width: 250px;">
                                                        <li>简介:</li>
                                                        <li>${scormInfo.description}</li>
                                                    </ul>
                                                    <ul class="list-inline">
                                                        <li>
                                                            注册量:${scormInfo.registerSum}
                                                        </li>
                                                        <li>
                                                            <i class="fa fa-heart"></i>
                                                            <c:if test="${true == collectScorm}">
                                                                <a style="color:#aaa" onclick="return false">收藏</a>
                                                            </c:if>
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
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
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
                                    <div class="input-group">
                                        <input id="markScore" name="markScore" class="form-control" type="text"
                                               placeholder="输入评论 ..." value="">
                                        <span class="input-group-addon btn blue">评论</span>
                                    </div>
                                    <br/>
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
                                <div class="tab-pane" id="tab_1_33">
                                    <ul class="media-list">
                                        <li class="media">
                                            <img class="pull-left media-object"
                                                 style="max-width: 64px;max-height: 64px"
                                                 src="${scormInfo.imgPath}" alt="管理员推荐">

                                            <div class="media-body">
                                                <div><p class="md-height">注册日期：</p>
                                                </div>
                                                <div class="media">
                                                    <div class="media-body">
                                                        <p class="md-height">您还没有注册</p></div>
                                                </div>
                                                <div class="media">
                                                    <h4 class="pull-left" style="display: block">评分:</h4>

                                                    <div class="media-body">
                                                        <ul class="list-inline">
                                                            <li><i class="fa fa-star"></i><i
                                                                    class="fa fa-star"></i><i
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
</body>
</html>
<script src="<c:url value="/js/common/zTree-v3.5.14/js/jquery.ztree.all-3.5.min.js"/>"
        type="text/javascript"></script>
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
        Metronic.init();
        Layout.init();
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