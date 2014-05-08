<%--@elvariable id="scormInfo" type="com.sls.scorm.entity.Scorm"--%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>我是课件详情页</title>
    <%@include file="../../includes/common.jsp" %>
    <link rel="stylesheet" type="text/css" href="assets/css/pages/profile.css"/>
</head>

<body class="page-header-fixed">

<%@include file="../index/navigationMenu.jsp" %>

<div class="page-container">
    <div class="page-content-wrapper">
        <div class="row profile">
            <div class="col-md-12">
                <div class="tabbable tabbable-custom tabbable-full-width">
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_1_1">
                            <div class="row">
                                <div class="col-md-2"></div>
                                <div class="col-md-2">
                                    <ul class="list-unstyled profile-nav">
                                        <li>
                                            <img id="scormImg" class="img-responsive"
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
                                                <div class="col-md-10">
                                                    <h1>${scormInfo.scormName}</h1>
                                                </div>
                                                <div class="col-md-2"><a class="btn blue">注册</a></div>
                                            </div>
                                            <ul class="list-inline">
                                                <%--<li>时长:</li>--%>
                                                <%--<li>${scormInfo.}</li>--%>
                                                <li>发布时间:</li>
                                                    <%--todo--%>
                                                <%--<li>${scormInfo.}</li>--%>
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
                                                <li>简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介
                                                </li>
                                            </ul>
                                            <ul class="list-inline">
                                                <li>
                                                点击量:${scormInfo.registerSum}
                                                </li>
                                                <li>
                                                    <i class="fa fa-heart"></i> 收藏
                                                </li>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col-md-9">
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
                                                <div class="portlet-body" id="chapterList">
                                                </div>
                                            </div>
                                            <!--tab-pane-->
                                            <div class="tab-pane" id="tab_1_22">
                                                <div class="tab-pane active" id="tab_1_1_1">
                                                    <div class="scroller" data-height="290px" data-always-visible="1"
                                                         data-rail-visible1="1" id="comments">
                                                        <!--评论列表-->
                                                        <ul class="feeds">
                                                            <li>
                                                                <div class="col1">
                                                                    <div class="cont">
                                                                        <div class="cont-col2">
                                                                            <div class="desc">
                                                                                一条评论
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col2" id="commentUser">
                                                                    <div class="date">
                                                                        某个用户
                                                                    </div>
                                                                </div>
                                                            </li>
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
        </div>
    </div>
</div>
</div>

<%@include file="../index/footer.jsp" %>
</body>
<!-- END BODY -->
</html>

<script type="text/javascript">
    var scoId = "";
        <c:forEach var="scoNode" items="${scoList}">
        <c:if test="${scoNode.lastVisit==isLast}">
        scoId = "${scoNode.scoId}";
        </c:if>
        </c:forEach>
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
                },
                key: {
                    name: "name"
                },
                keep: {
                    parent: true
                }
            },
            callback: {
                onClick: zTreeOnClick
            }
        };

        var zNodes = [
            <c:forEach var="scoNode" items="${scoList}">
            {id: "${scoNode.treeId}",
                pId: "${scoNode.treeParentId}",
                name: "(${scoNode.showStudyState})${scoNode.title}",
                src: "${scoNode.url}",
                scoId: "${scoNode.scoId}"},
            </c:forEach>
        ];

        function zTreeOnClick(event, treeId, treeNode) {
            if (treeNode.src.trim() == "") {
                return;
            }
            scoId = treeNode.scoId;
            $("#scormIframe").attr("src", treeNode.src);
            $.ajax({
                url: basePath + "user/scorm/changeScoState?scormId=${scorm.scormId}&scoId=" + scoId,
                dataType: "json",
                type: "get",
                success: function () {

                },
                error: doError
            })
        }

        $(function () {
            $("#scormImg").attr("src",basePath+"${scormInfo.imgPath}")
            App.init();
            $.fn.zTree.init($("#chapterList"), settingMenu, zNodes);
            $.fn.zTree.getZTreeObj("chapterList").expandAll(true);
        });
</script>