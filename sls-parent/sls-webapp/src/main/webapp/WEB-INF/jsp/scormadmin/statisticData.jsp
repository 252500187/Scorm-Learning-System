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
            <div class="col-md-6">
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
                        <div id="chart_1_2" class="chart">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <h3>课件注册数目排行</h3>
                <hr/>
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
</script>