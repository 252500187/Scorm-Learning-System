<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | Collect</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../../includes/common.jsp" %>
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
                                                <h4 style="margin-bottom: 0px;padding-bottom: 3px"></h4>
                                                <h4 style="margin-bottom: 0px;padding-bottom: 3px">
                                                    收藏时间&nbsp;${scormInfo.collectDate}</h4>
                                                <a class="mix-link" onclick="scormInfo('${scormInfo.scormId}')">
                                                    <i class="fa fa-search"></i>&nbsp;<span class="title">课件详情</span>
                                                </a>
                                                <a class="mix-preview" onclick="cancelCollect('${scormInfo.scormId}')">
                                                    <i class="fa fa-file"></i>&nbsp;<span class="title">取消收藏</span>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="mix-inner">
                                            <h4 style="margin-bottom: 0px;padding-bottom: 3px">
                                                &nbsp;${scormInfo.scormName}</h4>
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
    function cancelCollect(scormId) {
        parent.$("#alertConfirmMessage").html("确认取消收藏?");
        parent.$("#promptButton1").click(function () {
            $.ajax({
                url: basePath + "user/center/cancelCollect?scormId=" + scormId,
                type: "POST",
                success: function () {
                    parent.changeIframe('user/center/collectScormDo');
                }
            })
        });
        parent.$("#alertConfirm").modal("show");
    }


    function scormInfo(scormId) {
        parent.$(".modal-title").html("课件信息");
        parent.$('#alertIframe').modal('show');
        parent.$("#iframeInfo").attr("src", "tourist/scormInfo?scormId=" + scormId);
    }
</script>