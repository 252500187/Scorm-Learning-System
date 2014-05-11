<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%@include file="../../includes/common.jsp" %>
</head>
<body>
<div class="page-container">
<div class="row">
    <div class="col-md-8">
        <h3>前往学粉之路总进度</h3>

        <div class="progress progress-striped active">
            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="40" aria-valuemin="0"
                 aria-valuemax="100" style="width: 80%">
                        <span class="sr-only">
                             40% Complete (success)
                        </span>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <div class="portlet box blue">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-reorder"></i>Graph6
                </div>
                <div class="tools">
                    <a href="#portlet-config" data-toggle="modal" class="config">
                    </a>
                    <a href="javascript:;" class="reload">
                    </a>
                </div>
            </div>
            <div class="portlet-body">
                <h4>求大神指导，饼图不出原因</h4>
                <div id="pie_chart" class="chart">
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
<div class="col-md-12">
<div class="tiles">
<div class="tile double-down bg-blue">
    <div class="tile-body">
        <i class="fa fa-bell-o"></i>
    </div>
    <div class="tile-object">
        <div class="name">
            Notifications
        </div>
        <div class="number">
            6
        </div>
    </div>
</div>
<div class="tile bg-green">
    <div class="tile-body">
        <i class="fa fa-calendar"></i>
    </div>
    <div class="tile-object">
        <div class="name">
            Meetings
        </div>
        <div class="number">
            12
        </div>
    </div>
</div>
<div class="tile double selected bg-blue">
    <div class="corner">
    </div>
    <div class="check">
    </div>
    <div class="tile-body">
        <h4>support@metronic.com</h4>

        <p>
            Re: Metronic v1.2 - Project Update!
        </p>

        <p>
            24 March 2013 12.30PM confirmed for the project plan update meeting...
        </p>
    </div>
    <div class="tile-object">
        <div class="name">
            <i class="fa fa-envelope"></i>
        </div>
        <div class="number">
            14
        </div>
    </div>
</div>
<div class="tile selected bg-red">
    <div class="corner">
    </div>
    <div class="tile-body">
        <i class="fa fa-user"></i>
    </div>
    <div class="tile-object">
        <div class="name">
            Members
        </div>
        <div class="number">
            452
        </div>
    </div>
</div>
<div class="tile double bg-purple">
    <div class="tile-body">
        <img src="assets/img/photo1.jpg" alt="">
        <h4>Announcements</h4>

        <p>
            Easily style icon color, size, shadow, and anything that's possible with CSS.
        </p>
    </div>
    <div class="tile-object">
        <div class="name">
            Bob Nilson
        </div>
        <div class="number">
            24 Jan 2013
        </div>
    </div>
</div>
<div class="tile bg-yellow">
    <div class="tile-body">
        <i class="fa fa-shopping-cart"></i>
    </div>
    <div class="tile-object">
        <div class="name">
            Orders
        </div>
        <div class="number">
            121
        </div>
    </div>
</div>
<div class="tile image selected">
    <div class="tile-body">
        <img src="assets/img/gallery/image2.jpg" alt="">
    </div>
    <div class="tile-object">
        <div class="name">
            Media
        </div>
    </div>
</div>
<div class="tile bg-green">
    <div class="tile-body">
        <i class="fa fa-comments-alt"></i>
    </div>
    <div class="tile-object">
        <div class="name">
            Feedback
        </div>
        <div class="number">
            12
        </div>
    </div>
</div>
<div class="tile double bg-dark">
    <div class="tile-body">
        <img src="assets/img/photo2.jpg" alt="" class="pull-right">

        <h3>@lisa_wong</h3>

        <p>
            I really love this theme. I look forward to check the next release!
        </p>
    </div>
    <div class="tile-object">
        <div class="name">
            <i class="fa fa-twitter"></i>
        </div>
        <div class="number">
            10:45PM, 23 Jan
        </div>
    </div>
</div>
<div class="tile bg-blue">
    <div class="tile-body">
        <i class="fa fa-coffee"></i>
    </div>
    <div class="tile-object">
        <div class="name">
            Meetups
        </div>
        <div class="number">
            12 Jan
        </div>
    </div>
</div>
<div class="tile bg-green">
    <div class="tile-body">
        <i class="fa fa-bar-chart-o"></i>
    </div>
    <div class="tile-object">
        <div class="name">
            Reports
        </div>
        <div class="number">
        </div>
    </div>
</div>
<div class="tile bg-purple">
    <div class="tile-body">
        <i class="fa fa-briefcase"></i>
    </div>
    <div class="tile-object">
        <div class="name">
            Documents
        </div>
        <div class="number">
            124
        </div>
    </div>
</div>
<div class="tile image double selected">
    <div class="tile-body">
        <img src="assets/img/gallery/image4.jpg" alt="">
    </div>
    <div class="tile-object">
        <div class="name">
            Gallery
        </div>
        <div class="number">
            124
        </div>
    </div>
</div>
<div class="tile bg-yellow selected">
    <div class="corner">
    </div>
    <div class="check">
    </div>
    <div class="tile-body">
        <i class="fa fa-cogs"></i>
    </div>
    <div class="tile-object">
        <div class="name">
            Settings
        </div>
    </div>
</div>
<div class="tile bg-purple">
    <div class="tile-body">
        <i class="fa fa-plane"></i>
    </div>
    <div class="tile-object">
        <div class="name">
            Projects
        </div>
        <div class="number">
            34
        </div>
    </div>
</div>
</div>
<!-- END PAGE CONTENT-->
</div>
</div>

</div>
</body>
</html>
<script>
    jQuery(document).ready(function () {
        // initiate layout and plugins
        App.init();
        Charts.init();
        Charts.initPieCharts();
    });
</script>