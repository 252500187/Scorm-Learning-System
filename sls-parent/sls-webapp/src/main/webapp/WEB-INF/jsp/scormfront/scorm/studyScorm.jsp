<%--@elvariable id="scorm" type="com.sls.scorm.entity.Scorm"--%>
<%--@elvariable id="noteList" type="java.util.List"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | WELCOME to SLS</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/common.jsp" %>
    <script src="<c:url value="/js/ScormAPI.js"/>" type="text/javascript"></script>
</head>

<body class="page-header-fixed page-sidebar-reversed">
<%@include file="../index/navigationMenu.jsp" %>

<div class="page-container">
<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">
        <ul class="page-sidebar-menu" data-auto-scroll="false" data-slide-speed="200">
            <li class="sidebar-toggler-wrapper">
                <div class="sidebar-toggler">
                </div>
            </li>
            <li class="start">
                <a>
                    <span class="title">
                        课件名称：${scorm.scormName}
                    </span><br/>
                    <table>
                        <tr>
                            <td>
                        <img id="scormLogo" alt="scorm" style="max-height: 100px;max-width: 200px"></td>
                        </tr>

                    </table>
                </a>
            </li>
            <li>
                <a onclick="">
                    <i class="fa fa-gift"></i>
                    <span class="title">
                        开启护眼
                    </span>
                </a>
            </li>
            <li>
                <a>
                    <i class="fa fa-sitemap"></i>
						<span class="title">
							课程安排
						</span>
						<span class="arrow">
						</span>
                </a>
                <ul class="sub-menu">
                    <iframe id="ztree" scrolling="no" style="width:100%; height:100%;border:0px;"
                            allowfullscreen>
                    </iframe>
                    <div class="chat-form">
                    </div>
                </ul>
            </li>
            <li>
                <a>
                    <i class="fa fa-file-text"></i>
						<span class="title">
							笔记本
						</span>
						<span class="arrow ">
						</span>
                </a>
                <ul class="sub-menu">
                    <iframe style="border: 0;display: none;" id="upImgIframe" name="upImgIframe"></iframe>
                    <div class="chat-form">
                        传张图片？
                        <form target="upImgIframe" id="upImgForm" enctype="multipart/form-data">
                            <div class="form-group">
                                <div class="col-md-9">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                       <span class="btn default btn-file">
                                           <span class="fileinput-new">
                                                选图
                                           </span>
                                           <span class="fileinput-exists">
                                                换一个
                                           </span>
                                           <input type="file" id="noteImg" name="noteImg">
                                       </span>
                                        <span class="row fileinput-filename"></span>
                                        <a href="#" class="close fileinput-exists" data-dismiss="fileinput"
                                           style="float: none">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-cont">
                                <span class="arrow">
                                </span>
                                <a onclick="upStudyImg()" class="btn blue icn-only">
                                    <i class="fa fa-check icon-white"></i>
                                </a>
                            </div>
                        </form>
                    </div>
                    <div class="chat-form">
                        <div class="input-cont">
                            <input class="form-control" type="text" placeholder="记点什么？" id="takeNotes"/>
                        </div>
                        <div class="btn-cont">
									<span class="arrow">
									</span>
                            <a onclick="takeNote()" class="btn blue icn-only">
                                <i class="fa fa-check icon-white"></i>
                            </a>
                        </div>
                    </div>
                    <div class="portlet-body" id="noteList">
                        <c:forEach var="note" items="${noteList}">
                            <div class="note note-success">
                                <h4 class="caption" style="color: #6b7582">${note.date}</h4>
                                <small style="color: #6b7582">${note.time}</small>
                                <br/>
                                <c:if test="${note.noteType == -1 }">
                                    <p>${note.note}</p>
                                </c:if>
                                <c:if test="${note.noteType == 1 }">
                                    <img style="max-height: 100px;max-width: 100px" src="${note.imgPath}"/>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </ul>
            </li>
        </ul>
    </div>
</div>
<div class="page-content-wrapper">
    <div class="page-content">
        <div class="row">
            <iframe id="scormIframe" style="width:98%; height:800px;border:0px"
                    allowfullscreen>
            </iframe>
        </div>
        <br/>

        <div class="row ">
            <div class="col-md-6">
                <div class="portlet box blue">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-calendar"></i>课件信息
                        </div>
                        <div class="tools">
                            <a href="" class="collapse">
                            </a>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="caption"><h4>${scorm.scormName}</h4></div>
                        <div class="slimScrollDiv"
                             style="position: relative; overflow: hidden; width: auto; height: 300px;">
                            <div class="scroller" data-rail-visible="0" data-always-visible="1"
                                 style="height: 300px; overflow: hidden; width: auto;">
                                <ul class="feeds">
                                    <li>
                                        <div class="row col-md-2">上传日期:</div>
                                        <div class="row col-md-10">${scorm.uploadDate}</div>
                                    </li>
                                    <li>
                                        <div class="row col-md-2">课件简介:</div>
                                        <div class="row col-md-10">${scorm.description}</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row ">
            <div class="col-md-12">
                <div class="portlet">
                    <div class="portlet-title line">
                        <div class="caption">
                            <i class="fa fa-comments"></i>评论
                        </div>
                        <div class="tools">
                            <a href="" class="collapse">
                            </a>
                        </div>
                    </div>
                    <div class="chat-form">
                        <div class="input-cont">
                            <input class="form-control" type="text" placeholder="说点什么？"/>
                        </div>
                        <div class="btn-cont">
									<span class="arrow">
									</span>
                            <a href="" class="btn blue icn-only">
                                <i class="fa fa-check icon-white"></i>
                            </a>
                        </div>
                    </div>
                    <br/>

                    <div class="portlet-body" id="chats">
                        <div class="scroller" style="height: 435px;" data-always-visible="1" data-rail-visible1="1">
                            <ul class="chats">
                                <li class="in">
                                    <img class="avatar img-responsive" alt="" src="assets/img/avatar1.jpg"/>

                                    <div class="message">
											<span class="arrow">
											</span>
                                        <a href="#" class="name">
                                            Bob Nilson
                                        </a>
											<span class="datetime">
												 at Jul 25, 2012 11:09
											</span>
											<span class="body">
												 Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
											</span>
                                    </div>
                                </li>
                                <li class="out">
                                    <img class="avatar img-responsive" alt="" src="assets/img/avatar2.jpg"/>

                                    <div class="message">
											<span class="arrow">
											</span>
                                        <a href="#" class="name">
                                            Lisa Wong
                                        </a>
											<span class="datetime">
												 at Jul 25, 2012 11:09
											</span>
											<span class="body">
												 Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
											</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%@include file="../index/footer.jsp" %>
</body>
</html>
<script>
    var noteStyles = ["note note-success", "note note-note-info", "note note-danger", "note note-warning"];
    var scormId = "${scorm.scormId}";
    var scoId = "";
    var nowScoId = "-1";

    $(function () {
        Metronic.init();
        Layout.init();
        $("#ztree").attr("src", basePath + "user/scorm/studyScormZtree?scormId=${scorm.scormId}");
        $("#scormLogo").attr("src", basePath + "${scorm.imgPath}");
        $("#scormIframe").attr("src", basePath + "img/studyscormdefaultimg/" + Math.floor(Math.random() * 10) + ".jpg");
    });

    function getNowDate() {
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        month = month < 10 ? ("0" + month) : month;
        var day = date.getDate();
        day = day < 10 ? ("0" + day) : day;
        date = year + "-" + month + "-" + day;
        return date;
    }

    function takeNote() {
        $.ajax({
            url: basePath + "user/scorm/takeNote",
            data: {
                note: $("#takeNotes").val().trim(),
                scormId: "${scorm.scormId}",
                scoId: nowScoId
            },
            dataType: "json",
            type: "POST",
            success: function () {
                $("#noteList").prepend("<div class='note note-success'>" +
                        " <h4 class='block'>" + getNowDate() + "</h4><p>" + $("#takeNotes").val().trim() + "</p></div>"
                )
                $("#takeNotes").attr("value", "");
            },
            error: doError
        })
    }

    function upStudyImg() {
        var imgType = $("#noteImg").val().substr($("#noteImg").val().length - 3, 3);
        if ((imgType != "jpg") && (imgType != "png") && (imgType != "gif")) {
            alert("必须是图片格式！");
            return;
        }
        $("#upImgForm").attr("method", "post").attr("action",
                basePath + "user/scorm/upStudyImg?scormId=" + scormId + "&scoId=" + scoId).submit();
        $("#noteList").prepend("<div class='note note-success'>" +
                " <h4 class='block'>" + getNowDate() + "</h4><p>图片" + $("#noteImg").val() + "上传成功！</p></div>"
        )
    }

    $('.page-sidebar ul').on('click', ' li > a', function (e) {
        var menuContainer = $('.page-sidebar ul');
        menuContainer.children('li.active').removeClass('active');
        menuContainer.children('arrow.open').removeClass('open');
        $(this).parents('li').each(function () {
            $(this).addClass('active');
            $(this).children('a > span.arrow').addClass('open');
        });
        $(this).parents('li').addClass('active');
        $('.selected').remove();
        $(this).parents('li').find("a").append('<span class="selected" ></span>');
    });
</script>