<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | MyUpload</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../../includes/common.jsp" %>
    <script src="<c:url value="/metronic/assets/global/plugins/pace/pace.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/metronic/assets/global/plugins/pace/themes/pace-theme-minimal.css"/>" rel="stylesheet" type="text/css"/>
</head>
<body class="page-header-fixed" style="background-color: transparent">
<div class="page-content" style="min-height:780px">
    <div class="row">
        <div class="col-md-12">
            <div class="tabbable tabbable-custom boxless">
                <div class="tab-content">
                    <div class="tab-pane active" id="tab_1">
                        <!-- BEGIN FILTER -->
                        <div class="margin-top-10">


                            <div class="row mix-grid">
                                <c:forEach var="scormInfo" items="${allScorm}">

                                    <div class="col-md-3 col-sm-4 mix mix_all"
                                         style=" display: block; opacity: 1;">
                                        <div class="mix-inner">
                                            <img id="${scormInfo.scormId}" class="img-responsive"
                                                 alt="${scormInfo.scormId}">

                                            <div class="mix-details">
                                                <h4>
                                                </h4>
                                                <h4 style="margin-top:0px;padding-top:10px;margin-bottom: 0px;padding-bottom: 0px">
                                                    课件名称:&nbsp;${scormInfo.scormName}
                                                </h4>
                                                <h4 style="margin-top:0px;padding-top:10px;margin-bottom: 0px;padding-bottom: 0px">
                                                    审核状态:&nbsp;${scormInfo.showInUse}
                                                </h4>
                                                <c:if test="${scormInfo.inUse==0}">
                                                    <h4 style="margin-top:0px;padding-top:10px;margin-bottom: 0px;padding-bottom: 0px">
                                                        目前课件不可使用
                                                    </h4>
                                                </c:if>
                                                <c:if test="${scormInfo.inUse!=0}">
                                                    <h4 style="margin-top:0px;padding-top:10px;margin-bottom: 0px;padding-bottom: 0px">
                                                        <a class="btn btn-sm blue"
                                                           onclick="scormInfo('${scormInfo.scormId}')">课件信息</a>
                                                    </h4>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>


                                </c:forEach>
                            </div>
                        </div>
                        <!-- END FILTER -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        <c:forEach var="scormInfo" items="${allScorm}">
        $("#" + "${scormInfo.scormId}").attr("src", basePath + "${scormInfo.imgPath}");
        </c:forEach>
        Portfolio.init();
    })

    function scormInfo(scormId) {
        parent.$(".modal-title").html("课件信息");
        parent.$('#alertIframe').modal('show');
        parent.$("#iframeInfo").attr("src", "tourist/scormInfo?scormId=" + scormId);
    }
</script>