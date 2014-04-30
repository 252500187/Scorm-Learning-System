<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>SCORM LEARNING OF SEEK</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@include file="../includes/common.jsp" %>
</head>
<body>
<div class="container-fluid" style="padding: 0">
    <div class="row-fluid">
        <div class="row" style="margin-left: 0">
            <div class="span12">
                <%@include file="top.jsp" %>
            </div>
        </div>
        <div class="row" style="margin-left: 0">
            <div class="span12">
                <%@include file="menu.jsp" %>
            </div>
        </div>
        <div class="row" style="margin-left: 0">
            <div id="mainDiv" style="height: 453px;">
                <div id="tabDiv"></div>
            </div>
        </div>
        <div class="row" style="margin-left: 0">
            <div style="font-size:14px;width: 100%; height: 30px; text-align: center;">
                CN_SOFT
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        browserSizeDeal();
        var sizeTimer;
        $(window).bind("resize", function () {
            sizeTimer != undefined && sizeTimer != null && clearTimeout(sizeTimer);
            sizeTimer = setTimeout("browserSizeDeal()", 100);
        });
    });

    function browserSizeDeal() {
        $('#mainDiv').height(document.documentElement.clientHeight - 143);
    }

    function initTab() {
        $('#tabDiv').tabs({
            fit: true,
            border: true
        });
    }

    function addTab(title,src) {
        initTab();
        var contents = '<iframe frameborder="no" id="ifrm" style="width:100%;height:100%;overflow:auto;" src="' + src + '"></iframe>';
        document.getElementById("tabDiv").innerHTML = contents;
    }
</script>
