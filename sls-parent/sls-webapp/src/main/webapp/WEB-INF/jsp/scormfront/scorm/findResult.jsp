<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | Welcome to SLS</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/common.jsp" %>
</head>
<body class="page-header-fixed">
<%@include file="../index/navigationMenu.jsp" %>
<div class="page-container">
    <div class="page-content">
        <div class="row">
            <div class="col-md-1">
            </div>
        </div>
    </div>
</div>
<%@include file="../index/footer.jsp" %>
<div id="alertModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"></h4>
            </div>
            <div>
                <iframe id="scormInfo" style="width:100%; height:500px;border:1px;" frameborder=no allowfullscreen>
                </iframe>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    function showScormInfo(scormId) {
        $("#alertModel").modal('show');
        $(".modal-title").html("课件信息");
        $("#scormInfo").attr("src", "tourist/scormInfo?scormId=" + scormId);
    }

    $(function () {
        Metronic.init();
        Layout.init();
    });
</script>