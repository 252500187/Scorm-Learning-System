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
<body class="page-header-fixed" style="background-color: #ffffff">
<%@include file="index/navigationMenu.jsp" %>
<div class="page-container">
<div class="row" style="box-shadow: 1px 1px 10px black; height: 410px;
        background-image:url('<c:url value="/img/index/back3.jpg"/>');background-size: 100% 410px">
</div>
<div class="row" style="height: 280px;">
    <div class="col-md-12">
        <div class="text-center">
            <h1 class="page-title" style="margin-top: 100px;font-weight: normal">
                <span>Welcome to</span>
                <span style="color: orange;">Scorm Learnning Platform Of SEEK</span><br/>
                <small>轻松的学习，从现在开始</small>
            </h1>
        </div>
        <br/>

        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="搜索..." id="queryInfo">
                    <span class="input-group-btn">
                        <a id="query" class="btn default blue-stripe" onclick="findScorm()"><i class="fa fa-search"></i></a>
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="text-center">
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
    </div>
</div>

<div class="row mix-grid">
    <div class="col-md-1"></div>
    <%
        String[] color = {"blue", "yellow", "red", "purple", "grey"};
        int i = 0;
    %>
    <c:forEach var="scorm" items="${scormLevel}">
        <div class="col-md-2 mix mix_all category_1"
             style=" display: block; opacity: 1;">
            <div class="thumbnail">
                <img src="${scorm.imgPath}" alt="" style="width: 300px;height: 200px;">

                <div class="caption">
                    <h3>${scorm.scormName}</h3>

                    <p style="height: 50px;overflow: hidden"> ${scorm.description}</p>

                    <p>
                        <a onclick="showScormInfo('${scorm.scormId}')"
                           class="btn <%=color[i++]%>">查看</a>
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
    <% i = 0; %>
    <c:forEach var="scorm" items="${scormSum}">
        <div class="col-md-2 mix mix_all category_2"
             style=" display: block; opacity: 1;">
            <div class="thumbnail">
                <img src="${scorm.imgPath}" alt="" style="width: 300px;height: 200px;">

                <div class="caption">
                    <h3>${scorm.scormName}</h3>

                    <p style="height: 50px;overflow: hidden"> ${scorm.description}</p>

                    <p>
                        <a onclick="showScormInfo('${scorm.scormId}')"
                           class="btn <%=color[i++]%>">查看</a>
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
    <% i = 0; %>
    <c:forEach var="scorm" items="${scormTime}">
        <div class="col-md-2 mix mix_all category_3"
             style=" display: block; opacity: 1;">
            <div class="thumbnail">
                <img src="${scorm.imgPath}" alt="" style="width: 300px;height: 200px;">

                <div class="caption">
                    <h3>${scorm.scormName}</h3>

                    <p style="height: 50px;overflow: hidden"> ${scorm.description}</p>

                    <p>
                        <a onclick="showScormInfo('${scorm.scormId}')"
                           class="btn <%=color[i++]%>">查看</a>
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
    <% i = 0; %>
    <c:forEach var="scorm" items="${scormScore}">
        <div class="col-md-2 mix mix_all category_4"
             style=" display: block; opacity: 1;">
            <div class="thumbnail">
                <img src="${scorm.imgPath}" alt="" style="width: 300px;height: 200px;">

                <div class="caption">
                    <h3>${scorm.scormName}</h3>

                    <p style="height: 50px;overflow: hidden"> ${scorm.description}</p>

                    <p>
                        <a onclick="showScormInfo('${scorm.scormId}')"
                           class="btn <%=color[i++]%>">查看</a>
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
    <div class="col-md-1"></div>
</div>
<br/>
<div class="row">
    <div class="col-md-12">
        <div style="background-color: #8996A0; margin-top: 80px;color: #ffffff">
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <div class="text-center">
                        <div style="border-left: 2px solid #FFF;margin: 20px">
                            <h4>基于SCORM标准的资源学习平台</h4>
                            <h5>SEEK团队&nbsp;&nbsp;李俊波、秦雯、张天奇</h5>
                            地址:吉林省长春市&nbsp;延安大街2055号&nbsp;长春工业大学<br/>
                            联系电话：13180829709
                        </div>
                    </div>
                </div>
            </div>
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
<script src="<c:url value="/metronic/assets/global/plugins/bootstrap-sessiontimeout/jquery.sessionTimeout.js"/>"
        type="text/javascript"></script>
<script type="text/javascript">
    function showScormInfo(scormId) {
        $("#alertIframe").modal('show');
        $(".modal-title").html("课件信息");
        $("#iframeInfo").attr("src", "tourist/scormInfo?scormId=" + scormId);
    }

    function findByLabel(label) {
        window.open(basePath + "tourist/findScorm?queryInfo=" + label);
    }

    function findScorm() {
        if ($("#queryInfo").val() != "") {
            window.location.href = basePath + "tourist/findScorm?queryInfo=" + $("#queryInfo").val();
        }
    }

    $(function () {
        Metronic.init();
        Layout.init();
        Portfolio.init();
        $("#carousel-example-generic").carousel({
            interval: 1000
        })
        var width = document.documentElement.clientWidth;
        $("#indexCenterImg").css("width", width * 5 / 12 + "px");
        $("#recommend").click();
        $.sessionTimeout({
            title: '提示',
            message: '您已经学习很久了（20分钟），请注意保护眼睛。',
            keepAliveUrl: '',
            redirUrl: 'logout',
            logoutUrl: 'logout',
            warnAfter: 1200000,
            redirAfter: 1210000
        });
    });

    $("#queryInfo").bind("keydown", function (e) {
        if (e.which == 13) {
            findScorm();
        }
    });
</script>

