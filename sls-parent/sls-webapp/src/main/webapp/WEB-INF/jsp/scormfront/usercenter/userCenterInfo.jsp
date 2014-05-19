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
    <title>SLS | CenterInfo</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/common.jsp" %>
</head>
<body style="background-color: #FFFFFF">
<div class="page-container">
<div class="page-content-wrapper">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <h3>前往${user.levelName}之路总进度${finalScore}</h3>

            <div class="progress progress-striped active">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                     aria-valuemin="0"
                     aria-valuemax="100" style="width:${((user.score-nowLevelScore)/(nextLevelScore-user.score))*100}%">
                        <span class="sr-only">
                             10% Complete (success)
                        </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="portlet box">
                    <div class="portlet-body">
                        <h3>学习情况分布</h3>

                        <div id="pie_chart" class="chart">
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
    jQuery(document).ready(function () {
        Metronic.init();
        Layout.init();
        Charts.init();
        var data = [];
        var i = 0;
        <c:forEach var="perItem" items="${userPeiCharts}">
        data[i++] = {
            label: '${perItem.labelName}',
            data:${perItem.number}
        }
        </c:forEach>
        Charts.initPieCharts(data);
    });

</script>