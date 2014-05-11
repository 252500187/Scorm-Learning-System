<%--@elvariable id="scorm" type="com.sls.scorm.entity.Scorm"--%>
<%--@elvariable id="noteList" type="java.util.List"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" class="no-js" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>SLS | Study Scorm</title>
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@include file="../../includes/common.jsp" %>
    <script src="<c:url value="/js/ScormAPI.js"/>" type="text/javascript"></script>
</head>

<body class="page-header-fixed page-sidebar-reversed">
<%@include file="../index/navigationMenu.jsp" %>

<div class="page-container">
<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">
        <ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
            <li class="sidebar-toggler-wrapper">
                <div class="sidebar-toggler hidden-phone">
                </div>
            </li>
            <li>
                <a>
                    <img id="scormLogo" alt="scorm" style="height: 100px">
                    <span class="title">
                        ${scorm.scormName}
                    </span>
                </a>
            </li>
            <li>
                <a onclick="">
                    <i class="fa fa-gift"></i>
                    <span class="title">
                        Protect you eyes
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
                    <div id="menuTree" class="ztree"
                         style="width:100%; height:600px; border: 1px solid; float: left; overflow-x:auto; overflow-y:auto ">
                    </div>
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
                            <c:if test="${note.noteType == -1 }">
                                <div class="note note-success">
                                    <h4 class="block">${note.date}</h4>

                                    <p>
                                            ${note.note}
                                    </p>
                                </div>
                            </c:if>
                            <c:if test="${note.noteType == 1 }">
                                <div class="note note-success">
                                    <h4 class="block">${note.date}</h4>

                                    <img style="max-height: 100px;max-width: 100px" src="${note.imgPath}"/>
                                </div>

                            </c:if>
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
        <div class="row ">
            <div class="col-md-6 col-sm-6">
                <!-- BEGIN PORTLET-->
                <div class="portlet">
                    <div class="portlet-title line">
                        <div class="caption">
                            <i class="fa fa-comments"></i>评论
                        </div>
                        <div class="tools">
                            <a href="" class="collapse">
                            </a>
                            <a href="" class="reload">
                            </a>
                        </div>
                    </div>
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
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="portlet box blue">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-calendar"></i>课件信息
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
    var scoSrc = "";
    <c:forEach var="scoNode" items="${scoList}">
    <c:if test="${scoNode.lastVisit==isLast}">
    scoId = "${scoNode.scoId}";
    scoSrc = "${scoNode.url}";
    </c:if>
    </c:forEach>

    var settingMenu = {
        view: {
            expandSpeed: "fast"
        },
        check: {
            enable: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId"
            },
            key: {
                name: "name"
            },
            keep: {
                parent: true
            }
        },
        callback: {
            onClick: zTreeOnClick
        }
    };

    var zNodes = [
        <c:forEach var="scoNode" items="${scoList}">
        {id: "${scoNode.treeId}",
            pId: "${scoNode.treeParentId}",
            name: "(${scoNode.showStudyState})${scoNode.title}",
            src: "${scoNode.url}",
            scoId: "${scoNode.scoId}"},
        </c:forEach>
    ];

    function zTreeOnClick(event, treeId, treeNode) {
        if (treeNode.src.trim() == "") {
            return;
        }
        scoId = treeNode.scoId;
        nowScoId = scoId;
        $("#scormIframe").attr("src", treeNode.src);
        $("#upImgIframe").attr("src", basePath + "user/scorm/upStudyImgDo?scormId=" + scormId + "&scoId=" + nowScoId);
        $.ajax({
            url: basePath + "user/scorm/changeScoState?scormId=${scorm.scormId}&scoId=" + scoId,
            dataType: "json",
            type: "get",
            success: function () {

            },
            error: doError
        })
    }

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
                scoId: scoId
            },
            dataType: "json",
            type: "POST",
            success: function () {
                $("#noteList").prepend("<div class='note note-success'>" +
                        " <h4 class='block'>"+getNowDate()+"</h4><p>" + $("#takeNotes").val().trim() + "</p></div>"
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
        $(span.fileinput - filename).html("");
    }

    function getRandom() {
        var noteIndex = Math.floor(Math.random() * 5);
        return noteStyles[noteIndex];
    }

    $(function () {
        App.init();
        $("#scormLogo").attr("src", basePath + "${scorm.imgPath}");
        $.fn.zTree.init($("#menuTree"), settingMenu, zNodes);
        $.fn.zTree.getZTreeObj("menuTree").expandAll(true);
        var i = Math.floor(Math.random() * 10);
        $("#scormIframe").attr("src", basePath + "img/studyscormdefaultimg/" + i + ".jpg");
//        $("#upImgIframe").attr("src", basePath + "user/scorm/upStudyImgDo?scormId=" + scormId + "&scoId="+nowScoId);
        if (scoId != "") {
            if (confirm("是否继续上次学习进度")) {
                $("#scormIframe").attr("src", scoSrc);
            }
        }
    });

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