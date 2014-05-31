<%--@elvariable id="finalScore" type="java.lang.Integer"--%>
<%--@elvariable id="user" type="com.sls.user.entity.User"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | AdminIndex</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../includes/common.jsp" %>
    <script src="<c:url value="/metronic/assets/global/plugins/pace/pace.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/metronic/assets/global/plugins/pace/themes/pace-theme-minimal.css"/>" rel="stylesheet"
          type="text/css"/>
</head>
<body>
<div class="page-container">
    <div class="page-content">
        <div class="row">
            <div class="col-md-4">
                <div class="portlet blue box">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-bar-chart-o"></i>课件分布图
                        </div>
                        <div class="tools">
                            <a href="javascript:;" class="collapse">
                            </a>
                            <a href="#portlet-config" data-toggle="modal" class="config">
                            </a>
                            <a href="javascript:;" class="reload">
                            </a>
                            <a href="javascript:;" class="remove">
                            </a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <h3 id="studyDistribute"></h3>

                        <div id="pie_chart_6" class="chart">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="portlet box purple">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-signal"></i>数量统计
                        </div>
                        <div class="tools">
                            <a href="javascript:;" class="collapse">
                            </a>
                            <a href="#portlet-config" data-toggle="modal" class="config">
                            </a>
                            <a href="javascript:;" class="reload">
                            </a>
                            <a href="javascript:;" class="remove">
                            </a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        1.注册用户与有效用户比例<br/>
                        2.上传课件与在用课件比例
                        <div id="chart_1_2" class="chart">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <h3>课件注册数目排行</h3>
                <hr/>
                <c:forEach var="scorm" items="${scormSum}">
                    <div class="alert alert-block alert-info fade in">
                        <button type="button" class="close" data-dismiss="alert"></button>
                        <h4 class="alert-heading">${scorm.scormName}</h4>

                        <p>
                            注册数目:${scorm.registerSum}<br/>
                            课件描述: ${scorm.description}
                        </p>

                        <p>
                            <a class="btn purple" onclick="scormInfo('${scorm.scormId}')">
                                详情 </a>
                        </p>
                    </div>
                </c:forEach>
            </div>
            <div class="col-md-3">
                <h3>课件学习时间排行</h3>
                <hr/>
                <c:forEach var="scorm" items="${scormTime}">
                    <div class="alert alert-block alert-info fade in">
                        <button type="button" class="close" data-dismiss="alert"></button>
                        <h4 class="alert-heading">${scorm.scormName}</h4>

                        <p>
                            学习时间:${scorm.totalTime}<br/>
                            课件描述: ${scorm.description}
                        </p>

                        <p>
                            <a class="btn purple" onclick="scormInfo('${scorm.scormId}')">
                                详情 </a>
                        </p>
                    </div>
                </c:forEach>
            </div>
            <div class="col-md-3">
                <h3>课件评分排行</h3>
                <hr/>
                <c:forEach var="scorm" items="${scormScore}">
                    <div class="alert alert-block alert-info fade in">
                        <button type="button" class="close" data-dismiss="alert"></button>
                        <h4 class="alert-heading">${scorm.scormName}</h4>

                        <p>
                            评分:${scorm.score}<br/>
                            课件描述: ${scorm.description}
                        </p>

                        <p>
                            <a class="btn purple" onclick="scormInfo('${scorm.scormId}')">
                                详情 </a>
                        </p>
                    </div>
                </c:forEach>
            </div>
            <div class="col-md-3">
                <h3>课件推荐等级排行</h3>
                <hr/>
                <c:forEach var="scorm" items="${scormLevel}">
                    <div class="alert alert-block alert-info fade in">
                        <button type="button" class="close" data-dismiss="alert"></button>
                        <h4 class="alert-heading">${scorm.scormName}</h4>

                        <p>
                            推荐等级:${scorm.recommendLevel}级<br/>
                            课件描述: ${scorm.description}
                        </p>

                        <p>
                            <a class="btn purple" onclick="scormInfo('${scorm.scormId}')">
                                详情 </a>
                        </p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    jQuery(document).ready(function () {
        Metronic.init();
        Layout.init();
//        Charts.init();
        var data = [];
        var i = 0;
        data[0] = {
            label: '艺术',
            data: 5
        };
        data[1] = {
            label: '数学',
            data: 2
        };
        data[2] = {
            label: '语文',
            data: 6
        };
        data[3] = {
            label: '外语',
            data: 4
        }
        Charts.initPieCharts(data);
        Charts.initCharts();
    });

    function scormInfo(scormId) {
        var contentFrame = parent.$("#contentFrame");
        var dataEdit = parent.$('#dataEdit');
        contentFrame[0].contentWindow.document.write("");
        contentFrame.attr("src", basePath + "admin/scorm/scormInfo?scormId=" + scormId);
        dataEdit.dialog({
            title: '课件信息',
            height: document.documentElement.clientHeight - 100,
            width: document.documentElement.clientWidth - 100
        });
        dataEdit.dialog('open');
    }
</script>