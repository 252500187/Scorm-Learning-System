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
    <title>SCORM LEARNING OF SEEK</title>
    <%@include file="../includes/adminCommon.jsp" %>
</head>
<body>
<div class="container-fluid" style="padding: 0">
    <div class="row-fluid">
        <div class="row" style="margin-left: 0">
            <div class="span12">
                <%--<div style="padding: 0 20px; height:70px; background:url('img/defaultImg/userDefaultImg.jpg') repeat-x scroll 0px 0px;">--%>
                    <img src="img/logo/logo.gif"/>
                <%--</div>--%>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab" onclick="changeIframe('admin/user/indexDo')">首页</a></li>
                    <li><a data-toggle="tab" onclick="changeIframe('admin/user/listAllUserDo')">用户管理</a></li>
                    <li><a data-toggle="tab" onclick="changeIframe('admin/role/listAllRoleDo')">角色管理</a></li>
                    <li><a data-toggle="tab" onclick="changeIframe('admin/label/listAllLabelTreeDo')">标签管理</a></li>
                    <li><a data-toggle="tab" onclick="changeIframe('admin/dict/listAllDictDefineDo')">字典管理</a></li>
                    <li><a data-toggle="tab" onclick="changeIframe('admin/scorm/listNotAuditScormInfoDo')">未审核课件</a>
                    </li>
                    <li><a data-toggle="tab" onclick="changeIframe('admin/scorm/listAuditScormInfoDo')">已审核课件</a>
                    </li>
                    <li class="pull-right"><a data-toggle="tab" onclick="window.location.href='logout'">退出</a>
                </ul>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span12">
                <div id="mainDiv">
                    <iframe frameborder="no" id="iframe" style="width:100%;height:100%;overflow:auto;"></iframe>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="margin-left: 0">
        <div style="font-size:15px;width: 100%; height: 30px; text-align: center;">
            SCORM LEARNING OF SEEK
        </div>
    </div>
</div>
</div>
<div id="dataEdit" closed="true" modal="true" style="overflow: hidden" closable="true">
    <iframe style="width: 100%;height: 100%"
            id="contentFrame"
            name="contentFrame"
            marginheight="0"
            marginwidth="0"
            frameborder="0" src=""
            allowTransparency="true">
    </iframe>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        $('#mainDiv').height(document.documentElement.clientHeight - 150);
    });

    function changeIframe(src) {
        $("#iframe").attr("src", src);
    }
</script>
