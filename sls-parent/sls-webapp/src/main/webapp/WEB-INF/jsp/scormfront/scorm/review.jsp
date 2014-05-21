<%--@elvariable id="scormId" type="java.lang.String"--%>
<%--@elvariable id="myEvaluateScore" type="java.lang.Integer"--%>
<%--@elvariable id="allReviews" type="java.util.List<com.sls.scorm.entity.ScormSummarize>"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | ReviewScorm</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/common.jsp" %>
    <link rel="stylesheet" type="text/css" href="<c:url value="/metronic/assets/admin/pages/css/tasks.css"/>"/>
    <style type="text/css">
        .fa-star-o {
            color: #D7D31F;
        }
        .fa-star {
            color: #D7D31F;
        }
    </style>
</head>
<body class="page-header-fixed page-full-width">
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="col-md-12">
                <div class="row">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet">
                        <div class="portlet-body" id="chats">
                            <div class="chat-form">
                                <div class="row"></div>
                                <div class="input-cont">
                                    <input id="discussInput" class="form-control" type="text" placeholder="输入评论..."/>
                                </div>
                                <div class="btn-cont">
                                    <span class="arrow"></span>
                                    <a onclick="discussScorm()" class="btn blue icn-only">
                                        <i class="fa fa-check icon-white"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="chat-form">
                                <div class="input-cont">
                                    <%--<div style="margin-left: 0">评分：</div>--%>
                                    <ul style="list-style-type:none;display: block;float: left">
                                        <li style="display: block;float: left">评分:</li>
                                        <li style="display: block;float: left;cursor:pointer" name="changeStar" id="changeStar1">
                                            <i onclick="onclickStar(1)" class="fa fa-star-o"></i></li>
                                        <li style="display: block;float: left;cursor:pointer" name="changeStar" id="changeStar2">
                                            <i onclick="onclickStar(2)" class="fa fa-star-o"></i></li>
                                        <li style="display: block;float: left;cursor:pointer" name="changeStar" id="changeStar3">
                                            <i onclick="onclickStar(3)" class="fa fa-star-o"></i></li>
                                        <li style="display: block;float: left;cursor:pointer" name="changeStar" id="changeStar4">
                                            <i onclick="onclickStar(4)" class="fa fa-star-o"></i></li>
                                        <li style="display: block;float: left;cursor:pointer" name="changeStar" id="changeStar5">
                                            <i onclick="onclickStar(5)" class="fa fa-star-o"></i></li>
                                        <input id="showScore" value="${myEvaluateScore}分" readonly="readonly"
                                               style="border: 0;background-color: #E9EFF3">
                                    </ul>
                                </div>
                            </div>
                            <div class="scroller" style="height: 435px;" data-always-visible="1" data-rail-visible1="1">
                                <ul class="chats" id="chatList">
                                    <c:forEach var="review" items="${allReviews}" varStatus="status">
                                        <c:if test="${status.index == fn:length(allReviews)-1}">
                                            <li class="in"></c:if>
                                        <c:if test="${status.index != fn:length(allReviews)-1}">
                                            <li class="out"></c:if>
                                        <img class="avatar img-responsive" alt="" src="${review.imgUrl}"/>

                                        <div class="message">
											<span class="arrow">
											</span>
                                            <a href="#" class="name">
                                                    ${review.userName} </a>
											<span class="datetime">
                                                    ${review.discussDate}</span>
                                            <span class="body">${review.discuss}</span>
                                        </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- END PORTLET-->
                </div>
            </div>
        </div>
        <!-- END CONTENT -->
    </div>
    <!-- END CONTAINER -->
</div>
</body>
<!-- END BODY -->
</html>
<script type="text/javascript">
    $(function () {
        if (0 !=${myEvaluateScore}) {
            $("#showScore").attr("value", ${myEvaluateScore} +"分");
            for(var i =1; i<=${myEvaluateScore}; i++) {
                $("#changeStar"+i).find("i").attr("class","fa fa-star");
            }
        }

        $("li[name='changeStar']").bind({
            mouseover: function () {
                $(this).unbind("click");
                $(this).prevAll().find("i").attr("class", ("fa fa-star"));
                $(this).nextAll().find("i").attr("class", ("fa fa-star-o"));
                $(this).find("i").attr("class", "fa fa-star");
            },
            mouseleave: function () {
                $(this).unbind("click");
                $(this).siblings().find("i").attr("class", "fa fa-star-o");
                $(this).find("i").attr("class", "fa fa-star-o");
            }
        })
    });

    function onclickStar(score) {
        var changeStar = $("li[name='changeStar']");
        changeStar.unbind("mouseover").unbind("mouseleave");
        $(this).prevAll().find("i").attr("class", "fa fa-star");
        $(this).find("i").attr("class", "fa fa-star");
        $("#showScore").attr("value", score + "分");

        $.ajax({
            url: basePath + "user/dealScorm/evaluateScorm?scormId=${scormId}",
            data: {score: score},
            dataType: "json",
            type: "POST",
            success: function () {
                alert("评分成功！");
                window.location.reload()
            },
            error: doError
        })
    }

    function discussScorm() {
        var discuss = $("#discussInput").val().trim();
        if (discuss == "") return;
        $.ajax({
            url: basePath + "user/dealScorm/discussScorm?scormId=${scormId}",
            data: { discuss: discuss },
            type: "POST",
            success: function () {
                $("#discussInput").attr("value", "");
                window.location.reload()
            },
            error: doError
        })
    }
</script>