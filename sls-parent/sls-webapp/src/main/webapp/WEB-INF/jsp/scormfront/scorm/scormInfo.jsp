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
</head>

<body class="page-header-fixed" style="background-color: transparent">
<%--<%@include file="../index/navigationMenu.jsp" %>--%>
<div class="page-container">
    <div class="page-content-wrapper">
        <div class="page-content" style="min-height:783px">
            <div class="row">
                <div class="col-md-12 blog-page">
                    <div class="row col-md-10">
                        <div>
                            <div>
                                <div style="border: 1px dotted #DDDDDD;float: left;width: 30%;padding: 10px">
                                    <img src="img/bookmarks/book4.jpg" alt="" style="width: 150px;height: 230px;display:block; margin:0 auto;">
                                </div>
                                <div style="float: left;width: 70%;padding-left: 20px">
                                    <ul class="list-inline">
                                        <li><h3>课件名</h3></li>
                                        <li style="margin-left: 15%"><a class="btn blue">注册</a></li>
                                    </ul>
                                    <ul class="list-inline">
                                        <li>
                                            <i class="fa fa-calendar"></i>
                                            <a href="#"> 2013-10-11 14:15:20 </a>
                                        </li>
                                    </ul><br/>
                                    <ul class="list-inline">
                                        <li>
                                            <a href="#"> 简介 </a>
                                        </li>
                                    </ul>
                                    <ul class="list-inline">
                                        <li>
                                            <a href="#"> 简介简介简介简介简介简介简介简介简介简介简介简
                                                介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介 </a>
                                        </li>
                                    </ul><br/>
                                    <ul class="list-inline blog-tags">
                                        <li>
                                            <i class="fa fa-comments"></i>
                                            <a href="#"> 评论(3) </a>
                                        </li>
                                        <li>
                                            <i class="fa fa-tags"></i>
                                            <a href="#"> 计算机科学 </a>
                                        </li>
                                        <li>
                                            <i class="fa fa-pencil"></i>
                                            <a href="#"> 去评分吧 </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!--end col-md-9-->
                    </div>
<br>
                    <div class="row col-md-10">
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
                            </ul>
                            <div class="tab-content" style="min-height: 400px">
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
                                            <div class="input-group">
                                                <input id="markScore" class="form-control" type="text"
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
                                <!--tab-pane-->
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


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