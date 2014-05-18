<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | ScormTree</title>
    <%@include file="../../includes/common.jsp" %>
    <link rel="stylesheet" type="text/css" href="<c:url value="/metronic/assets/admin/pages/css/profile.css"/>"/>
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/js/common/zTree-v3.5.14/css/zTreeStyle/zTreeStyle.css"/>"/>
    <script src="<c:url value="/js/common/zTree-v3.5.14/js/jquery.ztree.all-3.5.min.js"/>"
            type="text/javascript"></script>
</head>
<body class="page-boxed page-header-fixed">
<div class="page-container">
    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-2" style="float: left">
                        <img id="scormImg" src="${scorm.imgPath}" class="img-polaroid"
                             style="max-width: 150px;max-height: 200px" alt=""/>
                    </div>
                    <div class="col-md-10" style="float: left">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="portlet-body form">
                                    <div class="form-body">
                                        <h3 class="form-section">
                                            <img src="${scorm.showRecommendLevel}" width="25px" height="25px">
                                            ${scorm.scormName}
                                        </h3>

                                        <div class="form-group profile-info">
                                            <ul class="list-inline" style="width: 250px;">
                                                <c:if test="${summarize.completeDate!=''}">
                                                    <li>完成时间:</li>
                                                    <li>${summarize.completeDate}</li><br/>
                                                </c:if>
                                                <c:if test="${summarize.grade!=''}">
                                                    <li>课件成绩:</li>
                                                    <li>${summarize.grade}</li><br/>
                                                </c:if>
                                                <c:if test="${summarize.totalTime!=''}">
                                                    <li>学习时间:</li>
                                                    <li>${summarize.totalTime}</li><br/>
                                                </c:if>
                                                <c:if test="${summarize.lastVisitTime!=''}">
                                                    <li>上次学习时间:</li>
                                                    <li>${summarize.lastVisitTime}</li><br/>
                                                </c:if>
                                                <br/>
                                                <c:if test="${summarize.score!=''}">
                                                    <li>评分:</li>
                                                    <li>${summarize.score}分</li><br/>
                                                </c:if>
                                                <c:if test="${summarize.discuss!=''}">
                                                    <li>评论:</li>
                                                    <li>${summarize.discussDate}&nbsp;${summarize.discuss}</li>
                                                </c:if>
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
                                        章节学习情况
                                    </a>
                                </li>
                            </ul>
                            <div class="tab-content" style="min-height: 300px">
                                <div class="tab-pane active" id="tab_1">
                                    <div id="scoTree" class="ztree"
                                         style="width:98%; height:100%; border: 0px solid; float: left; overflow-x:auto; overflow-y:auto">
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
<script>
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
            name: "(${scoNode.showStudyState})${scoNode.title} <c:if test="${scoNode.lastVisit==isLast}">(上次学到这了)</c:if>"
        },
        </c:forEach>
    ];

    $(function () {
        $.fn.zTree.init($("#scoTree"), settingMenu, zNodes).expandAll(true);
    });
</script>