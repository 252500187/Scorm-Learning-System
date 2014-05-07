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
                         style="width:190px; height:600px; border: 1px solid; float: left; overflow-x:auto; overflow-y:auto ">
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

                    <div class="chat-form">
                        传张图片？
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
													<input type="file" name="..." id="noteImg">
												</span>
												<span class="fileinput-filename">
												</span>
                                    <a href="#" class="close fileinput-exists" data-dismiss="fileinput"
                                       style="float: none">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="btn-cont">
									<span class="arrow">
									</span>
                            <a onclick="alert('youdai')" class="btn blue icn-only">
                                <i class="fa fa-check icon-white"></i>
                            </a>
                        </div>
                    </div>

                    <div class="chat-form">
                        <div class="input-cont">
                            <input class="form-control" type="text" placeholder="记点什么？"/>
                        </div>
                        <div class="btn-cont">
									<span class="arrow">
									</span>
                            <a onclick="alert('youdai')" class="btn blue icn-only">
                                <i class="fa fa-check icon-white"></i>
                            </a>
                        </div>
                    </div>

                    <div class="portlet-body">
                        <div class="note note-success">
                            <h4 class="block">时间</h4>

                            <p>
                                啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈
                            </p>
                        </div>
                        <div class="note note-info">
                            <h4 class="block">时间</h4>

                            <p>
                                啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈
                            </p>
                        </div>
                        <div class="note note-danger">
                            <h4 class="block">Danger! Some Header Goes Here</h4>

                            <p>
                                Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio
                                sem nec elit mattis consectetur purus sit amet.\ Cras mattis consectetur purus sit
                                amet fermentum.
                            </p>
                        </div>
                        <div class="note note-warning">
                            <h4 class="block">Warning! Some Header Goes Here</h4>

                            <p>
                                Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio
                                sem nec elit mattis consectetur purus sit amet. Cras mattis consectetur purus sit
                                amet fermentum.
                            </p>
                        </div>
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
                        <%--TODO 课件信息--%>
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
    var scoId = "";
    <c:forEach var="scoNode" items="${scoList}">
    <c:if test="${scoNode.lastVisit==isLast}">
    scoId = "${scoNode.scoId}";
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
            name: "${scoNode.title}(${scoNode.showStudyState})",
            src: "${scoNode.url}",
            scoId: "${scoNode.scoId}"},
        </c:forEach>
    ];

    function zTreeOnClick(event, treeId, treeNode) {
        if (treeNode.src.trim() == "") {
            return;
        }
        scoId = treeNode.id;
        $("#scormIframe").attr("src", treeNode.src);
        $.ajax({
            url: basePath + "user/scorm/changeScoState?scormId=${scorm.scormId}&scoId=" + scoId,
            dataType: "json",
            type: "get",
            success: function (sss) {

            },
            error: doError
        })
    }

    $(function () {
        App.init();
        var i = Math.floor(Math.random() * 10);
        $("#scormIframe").attr("src", basePath + "img/studyscormdefaultimg/" + i + ".jpg");
        $("#scormLogo").attr("src", basePath + "${scorm.imgPath}");
        $.fn.zTree.init($("#menuTree"), settingMenu, zNodes);
        $.fn.zTree.getZTreeObj("menuTree").expandAll(true);
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