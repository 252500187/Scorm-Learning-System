<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" class="no-js" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>Metronic | Admin Dashboard Template</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@include file="../../includes/common.jsp" %>
    <script src="<c:url value="/js/ScormAPI.js"/>" type="text/javascript"></script>
</head>

<body class="page-header-fixed page-sidebar-reversed">
<div class="page-container">
    <div class="page-sidebar-wrapper">
        <div class="page-sidebar navbar-collapse collapse">
            <ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
                <li class="sidebar-toggler-wrapper">
                    <div class="sidebar-toggler hidden-phone">
                    </div>
                </li>
                <li>
                    <a href="javascript:;">
                        <i class="fa fa-sitemap"></i>
						<span class="title">
							课程安排
						</span>
						<span class="arrow ">
						</span>
                    </a>
                    <ul class="sub-menu">
                        <li id="menuTree" class="ztree"
                            style="width:200px; height:600px; border: 1px solid; float: left; overflow-x:auto "/>
                    </ul>
                </li>
                <li>
                    <a href="javascript:;">
                        <i class="fa fa-file-text"></i>
						<span class="title">
							笔记本
						</span>
						<span class="arrow ">
						</span>
                    </a>
                    <ul class="sub-menu">
                        <div class="chat-form">
                            <div class="input-cont">
                                <input class="form-control" type="text" placeholder="说点什么？"/>
                            </div>
                            <div class="btn-cont">
									<span class="arrow">
									</span>
                                <a onclick="" class="btn blue icn-only">
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
                <li>
                    <a onclick="">
                        <i class="fa fa-cogs"></i>
						<span class="title">
							离开
						</span>
						<span class="arrow ">
						</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="row ">
                <div class="col-md-6 col-sm-6">
                    <!-- BEGIN PORTLET-->
                    <div class="portlet">
                        <div class="portlet-title line">
                            <div class="caption">
                                <i class="fa fa-comments"></i>Chats
                            </div>
                            <div class="tools">
                                <a href="" class="collapse">
                                </a>
                                <a href="" class="reload">
                                </a>
                                <a href="" class="remove">
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
            </div>
        </div>
    </div>
</div>

</body>
</html>
<script>
    jQuery(document).ready(function () {
        App.init(); // initlayout and core plugins
        Index.init();
        Index.initJQVMAP(); // init index page's custom scripts
        Index.initCalendar(); // init index page's custom scripts
        Index.initCharts(); // init index page's custom scripts
        Index.initChat();
        Index.initMiniCharts();
        Index.initDashboardDaterange();
        Index.initIntro();
        Tasks.initDashboardWidget();
    });

    $(function () {
        $("#logo").attr("src", basePath + "${jpg}");
        $.fn.zTree.init($("#menuTree"), settingMenu, zNodes);
        $.fn.zTree.getZTreeObj("menuTree").expandAll(true);
    });

    var settingMenu = {
        view: {
            expandSpeed: "fast"
        },
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y": "p", "N": "s" }
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
        <c:forEach var="scormNode" items="${scormNodes}">
        {id: "${scormNode.xmalId}",
            pId: "${scormNode.parentId}",
            name: "${scormNode.title} type:${scormNode.type}",
            type: "${scormNode.type}",
            src: "${scormNode.url}"},
        </c:forEach>
    ];

    var scoId;

    function zTreeOnClick(event, treeId, treeNode) {
        if (treeNode.src.trim() == "") {
            return;
        }
        $("#scorm").attr("src", treeNode.src);
        //todo 对应数据的id
        scoId = treeNode.id;
    }
</script>