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
    <%@include file="../includes/common.jsp" %>
</head>
<body class="page-header-fixed">
<%@include file="index/navigationMenu.jsp" %>
<div class="page-container">
    <div class="page-content">
        <div class="row">
            <div class="col-md-1">
            </div>
            <div class="col-md-8">
                <img src="img/index/2.jpg" style="max-height:600px ">
            </div>
            <div class="col-md-3"><br/>

                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search..." id="findInfo">
                    <span class="input-group-btn"><a class="btn default blue-stripe" onclick="findScorm()">查询</a></span>
                </div>
            </div>
        </div>
        <HR>
        <div class="row">
            <div class="col-md-12">
                <ul class="mix-filter">
                    <li class="filter" data-filter="category_1">
                        <i class="fa fa-bookmark-o"></i>推荐等级
                    </li>
                    <li class="filter" data-filter="category_2">
                        <i class="fa fa-users"></i>注册人数
                    </li>
                    <li class="filter" data-filter="category_3">
                        <i class="fa fa-clock-o"></i>学习时间
                    </li>
                    <li class="filter" data-filter="category_4">
                        <i class="fa fa-star"></i>课件评分
                    </li>
                    <a id="recommend" class="filter" data-filter="category_1" hidden="true"></a>
                </ul>
            </div>
            <div class="row mix-grid">
                <%
                    String[] color = {"blue", "yellow", "red", "purple"};
                    int i = 0;
                %>
                <c:forEach var="scorm" items="${scormLevel}">
                    <div class="col-md-3 mix mix_all category_1"
                         style=" display: block; opacity: 1;">
                        <div class="thumbnail">
                            <img src="${scorm.imgPath}" alt="" style="width: 300px;height: 200px;">

                            <div class="caption">
                                <h3>${scorm.scormName}</h3>

                                <p style="height: 50px;overflow: hidden"> ${scorm.description}</p>

                                <p><a onclick="showScormInfo('${scorm.scormId}')" class="btn <%=color[i++]%>">查看</a></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="row"></div>
                <% i = 0; %>
                <c:forEach var="scorm" items="${scormSum}">
                    <div class="col-md-3 mix mix_all category_2"
                         style=" display: block; opacity: 1;">
                        <div class="thumbnail">
                            <img src="${scorm.imgPath}" alt="" style="width: 300px;height: 200px;">

                            <div class="caption">
                                <h3>${scorm.scormName}</h3>

                                <p style="height: 50px;overflow: hidden"> ${scorm.description}</p>

                                <p><a onclick="showScormInfo('${scorm.scormId}')" class="btn <%=color[i++]%>">查看</a></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="row"></div>
                <% i = 0; %>
                <c:forEach var="scorm" items="${scormTime}">
                    <div class="col-md-3 mix mix_all category_3"
                         style=" display: block; opacity: 1;">
                        <div class="thumbnail">
                            <img src="${scorm.imgPath}" alt="" style="width: 300px;height: 200px;">

                            <div class="caption">
                                <h3>${scorm.scormName}</h3>

                                <p style="height: 50px;overflow: hidden"> ${scorm.description}</p>

                                <p><a onclick="showScormInfo('${scorm.scormId}')" class="btn <%=color[i++]%>">查看</a></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <div class="row"></div>
                <% i = 0; %>
                <c:forEach var="scorm" items="${scormScore}">
                    <div class="col-md-3 mix mix_all category_4"
                         style=" display: block; opacity: 1;">
                        <div class="thumbnail">
                            <img src="${scorm.imgPath}" alt="" style="width: 300px;height: 200px;">

                            <div class="caption">
                                <h3>${scorm.scormName}</h3>

                                <p style="height: 50px;overflow: hidden"> ${scorm.description}</p>

                                <p><a onclick="showScormInfo('${scorm.scormId}')" class="btn <%=color[i++]%>">查看</a></p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<%@include file="index/footer.jsp" %>
<div id="alertPrompt" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p id="alertPromptMessage">
                </p>
            </div>
            <div class="modal-footer">
                <button id="promptButton" class="btn blue" data-dismiss="modal">确认</button>
            </div>
        </div>
    </div>
</div>
<div id="alertIframe" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"></h4>
            </div>
            <div>
                <iframe id="iframeInfo" style="width:100%; height:500px;border:1px;" frameborder=no allowfullscreen>
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
        $("#alertIframe").modal('show');
        $(".modal-title").html("课件信息");
        $("#iframeInfo").attr("src", "tourist/scormInfo?scormId=" + scormId);
    }

    function findScorm() {
        if ($("#findInfo").val() != "") {
            window.location.href = basePath + "tourist/findScorm?findInfo=" + $("#findInfo").val();
        }
    }

    $(function () {
        Metronic.init();
        Layout.init();
        Portfolio.init();
        $("#recommend").click();
    });
</script>

