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
</head>
<body class="page-header-fixed page-full-width">
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="row ">
                <!-- BEGIN PORTLET-->
                <div class="portlet">
                    <div class="portlet-title line">
                        <div class="caption">
                            <i class="fa fa-comments"></i>课件评论列表
                        </div>
                    </div>
                    <div class="portlet-body" id="chats">
                        <div class="row">
                            <ul style="list-style-type:none">
                                <li style="display: block;float: left">评分:</li>
                                <li style="display: block;float: left;cursor:pointer" name="changeStar"><i
                                        class="fa fa-star-o"><a data-start="1"></a></i></li>
                                <li style="display: block;float: left;cursor:pointer" name="changeStar"><i
                                        class="fa fa-star-o"><a data-start="2"></a></i></li>
                                <li style="display: block;float: left;cursor:pointer" name="changeStar"><i
                                        class="fa fa-star-o"><a data-start="3"></a></i></li>
                                <li style="display: block;float: left;cursor:pointer" name="changeStar"><i
                                        class="fa fa-star-o"><a data-start="4"></a></i></li>
                                <li style="display: block;float: left;cursor:pointer" name="changeStar"><i
                                        class="fa fa-star-o"><a data-start="5"></a></i></li>
                            </ul>
                        </div>
                        <div class="chat-form">
                            <div class="row"></div>
                            <div class="input-cont">
                                <input class="form-control" type="text" placeholder="输入评论..."/>
                            </div>
                            <div class="btn-cont">
                                <span class="arrow"></span>
                                <a href="" class="btn blue icn-only">
                                    <i class="fa fa-check icon-white"></i>
                                </a>
                            </div>
                        </div>
                        <div class="scroller" style="height: 435px;" data-always-visible="1" data-rail-visible1="1">
                            <ul class="chats">
                                <li class="in">
                                    <img class="avatar img-responsive" alt="" src="/img/bookmarks/book1.jpg"/>

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
                                <li class="out">
                                    <img class="avatar img-responsive" alt=""
                                         src="../../assets/admin/layout/img/avatar2.jpg"/>

                                    <div class="message">
											<span class="arrow">
											</span>
                                        <a href="#" class="name">
                                            Lisa Wong </a>
											<span class="datetime">
											at Jul 25, 2012 11:09 </span>
											<span class="body">
											Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </span>
                                    </div>
                                </li>
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
</body>
<!-- END BODY -->
</html>
</body>
</html>
<script>
    $(function () {
        $("li[name='changeStar']").bind({
            mouseover: function () {
                $(this).prevAll().find("i").attr("class", ("fa fa-star"));
                $(this).find("i").attr("class", "fa fa-star");
            },
            mouseleave: function () {
                $(this).prevAll().find("i").attr("class", "fa fa-star-o");
                $(this).find("i").attr("class", "fa fa-star-o");
            },
            click: function () {
                $("li[name='changeStar']").unbind("mouseover").unbind("mouseleave");
                $(this).prevAll().find("i").attr("class", "fa fa-star");
                $(this).find("i").attr("class", "fa fa-star");
            }
        })
    })

</script>