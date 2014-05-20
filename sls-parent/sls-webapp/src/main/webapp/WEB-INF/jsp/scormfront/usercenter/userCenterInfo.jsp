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
    <div class="page-content">
        <div class="row">
            <div class="col-md-8"><h3 class="page-title">
                个人中心
            </h3>
            </div>
            <div class="col-md-4">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search..." id="findInfo">
                        <span class="input-group-btn">
                            <a class="btn default blue-stripe" onclick="findScorm()">查询</a></span>
                </div>
            </div>
            <div class="col-md-12">

                <ul class="page-breadcrumb breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a onclick="parent.window.location.href=''">Home</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li>
                        <a>UserCenter</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li>
                        <a>用户名</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12" style="padding-left: 60px">
                <div class="row">
                    <div class="col-md-9 article-block">
                        <div class="row">
                            <div class="col-md-12">
                                <h3>前往${user.levelName}之路:${finalScore}</h3>

                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                         aria-valuemin="0"
                                         aria-valuemax="100"
                                         style="width:${((user.score-nowLevelScore)/(nextLevelScore-user.score))*100}%">
                                    </div>
                                </div>
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                <h3>学习分布</h3>

                                <div id="pie_chart" class="chart">
                                </div>
                            </div>
                            <div class="col-md-7">
                                <h3>&nbsp;</h3>
                                <img src="img/userCenterImg/1.jpg" class="img-responsive"
                                     alt="Good Good Study Day Day Up"
                                     style="max-width: 470px;">
                            </div>
                        </div>
                        <div class="row">
                            <hr>
                            <blockquote class="hero">
                                <p>
                                    学知不足，业精于勤。
                                </p>
                                <small>（唐）韩愈</small>
                            </blockquote>
                        </div>
                    </div>
                    <div class="space20">
                    </div>
                    <div class="col-md-3 blog-sidebar">
                        <c:if test="${recommendScorm[0]!=null}">
                            <h3>推荐给你</h3>
                        </c:if>
                        <div class="top-news">
                            <c:if test="${recommendScorm[0]!=null}">
                                <a onclick="showScormInfo('${recommendScorm[0].scormId}')" class="btn red">
                                        <span><img src="${recommendScorm[0].showRecommendLevel}"
                                                   style="width: 25px;height: 25px"/>&nbsp;
                                                ${recommendScorm[0].scormName}</span>
                                    <em>评分：${recommendScorm[0].score}</em>
                                    <em><i class="fa fa-tags"></i>${recommendScorm[0].labelName}</em>
                                    <i class="fa fa-briefcase top-news-icon"></i>
                                </a>
                            </c:if>
                            <c:if test="${recommendScorm[1]!=null}">
                                <a onclick="showScormInfo('${recommendScorm[1].scormId}')" class="btn green">
                                        <span><img src="${recommendScorm[1].showRecommendLevel}"
                                                   style="width: 25px;height: 25px"/>&nbsp;
                                                ${recommendScorm[1].scormName}</span>
                                    <em>评分：${recommendScorm[1].score}</em>
                                    <em><i class="fa fa-tags"></i>${recommendScorm[1].labelName}</em>
                                    <i class="fa fa-music top-news-icon"></i>
                                </a>
                            </c:if>
                            <c:if test="${recommendScorm[2]!=null}">
                                <a onclick="showScormInfo('${recommendScorm[2].scormId}')" class="btn blue">
                                        <span><img src="${recommendScorm[2].showRecommendLevel}"
                                                   style="width: 25px;height: 25px"/>&nbsp;
                                                ${recommendScorm[2].scormName}</span>
                                    <em>评分：${recommendScorm[2].score}</em>
                                    <em><i class="fa fa-tags"></i>${recommendScorm[2].labelName}</em>
                                    <i class="fa fa-globe top-news-icon"></i>
                                </a>
                            </c:if>
                            <c:if test="${recommendScorm[3]!=null}">
                                <a onclick="showScormInfo('${recommendScorm[3].scormId}')" class="btn yellow">
                                        <span><img src="${recommendScorm[3].showRecommendLevel}"
                                                   style="width: 25px;height: 25px"/>&nbsp;
                                                ${recommendScorm[3].scormName}</span>
                                    <em>评分：${recommendScorm[3].score}</em>
                                    <em><i class="fa fa-tags"></i>${recommendScorm[3].labelName}</em>
                                    <i class="fa fa-book top-news-icon"></i>
                                </a>
                            </c:if>
                            <c:if test="${recommendScorm[4]!=null}">
                                <a onclick="showScormInfo('${recommendScorm[4].scormId}')" class="btn purple">
                                        <span><img src="${recommendScorm[4].showRecommendLevel}"
                                                   style="width: 25px;height: 25px"/>&nbsp;
                                                ${recommendScorm[4].scormName}</span>
                                    <em>评分：${recommendScorm[4].score}</em>
                                    <em><i class="fa fa-tags"></i>${recommendScorm[4].labelName}</em>
                                    <i class="fa fa-bolt top-news-icon"></i>
                                </a>
                            </c:if>
                        </div>
                        <div class="space20">
                        </div>
                        <c:if test="${registerScorm!=null}">
                            <h3>最近学习</h3>
                        </c:if>
                        <div class="blog-twitter">
                            <c:forEach var="scorm" items="${registerScorm}">
                                <div class="blog-twitter-block">
                                    <i class="fa fa-book blog-twiiter-icon"></i>
                                    <a onclick="showScormInfo('${scorm.scormId}')">${scorm.scormName}</a>
                                    <a onclick="study('${scorm.scormId}')">
                                        <em>继续</em>
                                    </a>
                                    <c:if test="${scorm.lastVisitTime!=''}">
                                        <p>上次学习时间:${scorm.lastVisitTime}</p>
                                    </c:if>
                                    <c:if test="${scorm.lastVisitTime==''}">
                                        <p>还未学习！</p>
                                    </c:if>
                                </div>
                            </c:forEach>
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

    function findScorm() {
        if ($("#findInfo").val() != "") {
            parent.window.open(basePath + "tourist/findScorm?findInfo=" + $("#findInfo").val());
        }
    }

    function showScormInfo(scormId) {
        parent.$("#alertInfo").modal('show');
        parent.$(".modal-title").html("课件信息");
        parent.$("#info").attr("src", "tourist/scormInfo?scormId=" + scormId);
    }

    function study(scormId) {
        window.open(basePath + "user/scorm/studyScorm?scormId=" + scormId);
    }

</script>