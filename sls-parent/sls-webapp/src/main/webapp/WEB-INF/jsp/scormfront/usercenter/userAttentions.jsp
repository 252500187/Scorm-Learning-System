<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | AttentionUsers</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/common.jsp" %>
    <script src="<c:url value="/metronic/assets/global/plugins/pace/pace.min.js"/>" type="text/javascript"></script>
    <link href="<c:url value="/metronic/assets/global/plugins/pace/themes/pace-theme-minimal.css"/>" rel="stylesheet"
          type="text/css"/>
</head>
<body class="page-header-fixed" style="background-color: transparent">
<div class="page-content" style="min-height:780px">
    <div class="tabbable tabbable-custom boxless">
        <div class="tab-content">
            <div class="tab-pane active" id="tab_1">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="page-breadcrumb breadcrumb">
                            <li>
                                <i class="fa fa-home"></i>
                                <a onclick="parent.window.location.href=''">首页</a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a>个人中心</a>
                                <i class="fa fa-angle-right"></i>
                            </li>
                            <li>
                                <a>关注列表</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="margin-top">
                    <div class="row mix-grid">
                        <c:if test="${fn:length(sessionScope.attentionUsers)<1}">
                            还未关注用户
                        </c:if>
                        <c:forEach var="attentionUser" items="${sessionScope.attentionUsers}">
                            <div class="col-md-2 col-sm-2 mix mix_all" style=" display: block;">
                                <a onclick="top.userInfo('${attentionUser.userAttentionId}')">
                                    <img src="${attentionUser.imgUrl}" class="img-responsive"
                                         alt="${attentionUser.userName}" style="height: 100px;width: 100px;">
                                        ${attentionUser.userName}
                                    <c:if test="${attentionUser.newMessage>0}">
                                        <span class="badge">${attentionUser.newMessage}</span>
                                    </c:if>
                                </a>
                            </div>
                        </c:forEach>
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
        Portfolio.init();
    })
</script>