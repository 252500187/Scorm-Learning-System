<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | ${scorm.scormName}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/common.jsp" %>
</head>
<body class="page-header-fixed">
<div class="row">
    <div class="col-md-12">
        <div class="portlet-body">
            <div class="scroller" style="height: 320px" data-always-visible="1" data-rail-visible1="1">
                <ul class="chats">
                    <br/>
                    <li class="in">
                        <img class="avatar img-responsive" alt="" src="../../assets/admin/layout/img/avatar1.jpg"/>

                        <div class="message">
											<span class="arrow">
											</span>
                            <a href="#" class="name">
                                Bob Nilson </a>
											<span class="datetime">
											at Jul 25, 2012 11:09 </span>
											<span class="body">
											Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </span>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="chat-form">
                <div class="input-cont">
                    <input class="form-control" type="text" id="discuss" placeholder="说点什么..."/>
                </div>
                <div class="btn-cont">
									<span class="arrow">
									</span>
                    <a onclick="sendDiscuss()" class="btn blue icn-only">
                        <i class="fa fa-check icon-white"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    $(function () {
        Metronic.init();
        Layout.init();
//        setInterval("getDiscusses()", 1000);
    });

    function sendDiscuss() {
        var time = getTime();
        $.ajax({
            url: basePath + "user/scorm/sendDiscuss",
            type: "post",
            data: {
                publicId: "${publicScorm.publicId}",
                sendTime: time,
                discuss: $("#discuss").val().trim()
            },
            success: function (sendTime) {
                $("ul").append("<li class='out'><div class='message'><span class='arrow'></span>" +
                        "<a class='name'>我 </a><span class='datetime'>" + time +
                        "</span><span class='body'>" + $("#discuss").val() + "</span></div></li>");
                $('.slimScrollBar').css("top", document.documentElement.clientHeight - 260);
            },
            error: doError
        });
    }

    function getTime() {
        return "";
    }

    function getDiscusses() {

    }
</script>