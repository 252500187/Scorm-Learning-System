<%--@elvariable id="allScorm" type="java.util.List"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../../includes/common.jsp" %>
    <title>SLS | Register</title>
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

                            <ul class="mix-filter">
                                <li class="filter" data-filter="all">
                                    所有课件
                                </li>
                                <li class="filter" data-filter="category_1">
                                    进行中
                                </li>
                                <li class="filter" data-filter="category_2">
                                    已完成
                                </li>
                            </ul>
                            <div class="row mix-grid">
                                <c:forEach var="scormInfo" items="${allScorm}">
                                    <c:if test="${scormInfo.completeDate == ''}">
                                        <div class="col-md-3 col-sm-4 mix mix_all category_1" style=" display: block; opacity: 1;">
                                            <div class="mix-inner">
                                                <img id="${scormInfo.scormId}" class="img-responsive" alt="${scormInfo.scormId}">
                                                <div class="mix-details">
                                                    <h4 style="margin-bottom: 0px;padding-bottom: 3px">课件名称:&nbsp;${scormInfo.scormName}</h4>
                                                    <h4 style="margin-top:0px;padding-top:3px">状态:进行中</h4>
                                                    <a class="mix-link" onclick="viewMore()">
                                                        <i class="fa fa-search"></i>
                                                    </a>
                                                    <a class="mix-preview" onclick="viewMore()">
                                                        <i class="fa fa-file"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                    </c:if>
                                    <c:if test="${scormInfo.completeDate != ''}">
                                        <div class="col-md-3 col-sm-4 mix mix_all category_2" style=" display: block; opacity: 1;">
                                            <div class="mix-inner">
                                                <img id="${scormInfo.scormId}" class="img-responsive" alt="${scormInfo.scormId}">
                                                <div class="mix-details">
                                                    <h4 style="margin-bottom: 0px;padding-bottom: 3px">课件名称:&nbsp;${scormInfo.scormName}</h4>
                                                    <h4 style="margin-top:0px;padding-top:3px;margin-bottom: 0px;padding-bottom: 3px">状态:已完成</h4>
                                                    <h4 style="margin-top:0px;padding-top:3px">完成时间:&nbsp;${scormInfo.completeDate}</h4>
                                                   <a class="mix-link" onclick="viewMore()">
                                                        <i class="fa fa-search"></i>
                                                    </a></span>

                                                </div>
                                            </div>
                                        </div>
                                    </c:if>

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
    function study(){

    }

    function viewMore(){

    }
</script>