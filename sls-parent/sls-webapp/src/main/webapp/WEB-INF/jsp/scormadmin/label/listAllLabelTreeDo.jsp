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
</head>
<body class="page-header-fixed ">
<!-- BEGIN CONTAINER -->
<div class="page-container">
<!-- BEGIN CONTENT -->
<div class="page-content-wrapper">
<div class="page-content" style="margin-left: 0">
<!-- BEGIN PAGE CONTENT-->
<div class="row">
<div class="col-md-12">
<!-- BEGIN EXAMPLE TABLE PORTLET-->
<div class="portlet box grey-cascade">
<div class="portlet-title">
    <div class="caption">
        <i class="fa fa-globe"></i>Managed Table
    </div>
    <div class="tools">
        <a href="#portlet-config" data-toggle="modal" class="config">
        </a>
        <a href="javascript:;" class="reload">
        </a>
        <a href="javascript:;" class="remove">
        </a>
    </div>
</div>
<div class="portlet-body">
<div class="table-toolbar">
    <div class="btn-group">
        <button id="sample_editable_1_new" class="btn green">
            Add New <i class="fa fa-plus"></i>
        </button>
    </div>
    <div class="btn-group pull-right">
        <button class="btn dropdown-toggle" data-toggle="dropdown">Tools <i class="fa fa-angle-down"></i>
        </button>
        <ul class="dropdown-menu pull-right">
            <li>
                <a href="#">
                    Print </a>
            </li>
            <li>
                <a href="#">
                    Save as PDF </a>
            </li>
            <li>
                <a href="#">
                    Export to Excel </a>
            </li>
        </ul>
    </div>
</div>
<table class="table table-striped table-bordered table-hover" id="sample_1">
<thead>
<tr>
    <th class="table-checkbox">
        <input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes"/>
    </th>
    <th>
        Username
    </th>
    <th>
        Email
    </th>
    <th>
        Points
    </th>
    <th>
        Joined
    </th>
    <th>
        Status
    </th>
</tr>
</thead>
<tbody>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        shuxer
    </td>
    <td>
        <a href="mailto:shuxer@gmail.com">
            shuxer@gmail.com </a>
    </td>
    <td>
        120
    </td>
    <td class="center">
        12 Jan 2012
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        looper
    </td>
    <td>
        <a href="mailto:looper90@gmail.com">
            looper90@gmail.com </a>
    </td>
    <td>
        120
    </td>
    <td class="center">
        12.12.2011
    </td>
    <td>
									<span class="label label-sm label-warning">
									Suspended </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        userwow
    </td>
    <td>
        <a href="mailto:userwow@yahoo.com">
            userwow@yahoo.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        12.12.2012
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        user1wow
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            userwow@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        12.12.2012
    </td>
    <td>
									<span class="label label-sm label-default">
									Blocked </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        restest
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            test@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        12.12.2012
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        foopl
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        19.11.2010
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        weep
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        19.11.2010
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        coop
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        19.11.2010
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        pppol
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        19.11.2010
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        test
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        19.11.2010
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        userwow
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            userwow@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        12.12.2012
    </td>
    <td>
									<span class="label label-sm label-default">
									Blocked </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        test
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            test@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        12.12.2012
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        goop
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        12.11.2010
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        weep
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        15.11.2011
    </td>
    <td>
									<span class="label label-sm label-default">
									Blocked </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        toopl
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        16.11.2010
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        userwow
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            userwow@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        9.12.2012
    </td>
    <td>
									<span class="label label-sm label-default">
									Blocked </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        tes21t
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            test@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        14.12.2012
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        fop
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        13.11.2010
    </td>
    <td>
									<span class="label label-sm label-warning">
									Suspended </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        kop
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        17.11.2010
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        vopl
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        19.11.2010
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        userwow
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            userwow@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        12.12.2012
    </td>
    <td>
									<span class="label label-sm label-default">
									Blocked </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        wap
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            test@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        12.12.2012
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        test
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        19.12.2010
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        toop
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        17.12.2010
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        weep
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
        20
    </td>
    <td class="center">
        15.11.2011
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
</tbody>
</table>
</div>
</div>
<!-- END EXAMPLE TABLE PORTLET-->
</div>
</div>
<div class="row">
<div class="col-md-6 col-sm-12">
<!-- BEGIN EXAMPLE TABLE PORTLET-->
<div class="portlet box yellow">
<div class="portlet-title">
    <div class="caption">
        <i class="fa fa-user"></i>Table
    </div>
    <div class="actions">
        <a href="#" class="btn btn-default btn-sm">
            <i class="fa fa-pencil"></i> Add </a>

        <div class="btn-group">
            <a class="btn btn-default btn-sm" href="#" data-toggle="dropdown">
                <i class="fa fa-cogs"></i> Tools <i class="fa fa-angle-down"></i>
            </a>
            <ul class="dropdown-menu pull-right">
                <li>
                    <a href="#">
                        <i class="fa fa-pencil"></i> Edit </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-trash-o"></i> Delete </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-ban"></i> Ban </a>
                </li>
                <li class="divider">
                </li>
                <li>
                    <a href="#">
                        <i class="i"></i> Make admin </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="portlet-body">
<table class="table table-striped table-bordered table-hover" id="sample_2">
<thead>
<tr>
    <th style="width1:8px;">
        <input type="checkbox" class="group-checkable" data-set="#sample_2 .checkboxes"/>
    </th>
    <th>
        Username
    </th>
    <th>
        Email
    </th>
    <th>
        Status
    </th>
</tr>
</thead>
<tbody>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        shuxer
    </td>
    <td>
        <a href="mailto:shuxer@gmail.com">
            shuxer@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        looper
    </td>
    <td>
        <a href="mailto:looper90@gmail.com">
            looper90@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-warning">
									Suspended </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        userwow
    </td>
    <td>
        <a href="mailto:userwow@yahoo.com">
            userwow@yahoo.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        user1wow
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            userwow@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-default">
									Blocked </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        restest
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            test@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        foopl
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        weep
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        coop
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        pppol
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        test
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        userwow
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            userwow@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-default">
									Blocked </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        test
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            test@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
</tbody>
</table>
</div>
</div>
<!-- END EXAMPLE TABLE PORTLET-->
</div>
<div class="col-md-6 col-sm-12">
<!-- BEGIN EXAMPLE TABLE PORTLET-->
<div class="portlet box purple">
<div class="portlet-title">
    <div class="caption">
        <i class="fa fa-cogs"></i>Table
    </div>
    <div class="actions">
        <a href="#" class="btn btn-default btn-sm">
            <i class="fa fa-plus"></i> Add </a>
        <a href="#" class="btn btn-default btn-sm">
            <i class="fa fa-print"></i> Print </a>
    </div>
</div>
<div class="portlet-body">
<table class="table table-striped table-bordered table-hover" id="sample_3">
<thead>
<tr>
    <th class="table-checkbox">
        <input type="checkbox" class="group-checkable" data-set="#sample_3 .checkboxes"/>
    </th>
    <th>
        Username
    </th>
    <th>
        Email
    </th>
    <th>
        Status
    </th>
</tr>
</thead>
<tbody>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        shuxer
    </td>
    <td>
        <a href="mailto:shuxer@gmail.com">
            shuxer@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        looper
    </td>
    <td>
        <a href="mailto:looper90@gmail.com">
            looper90@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-warning">
									Suspended </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        userwow
    </td>
    <td>
        <a href="mailto:userwow@yahoo.com">
            userwow@yahoo.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        user1wow
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            userwow@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-default">
									Blocked </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        restest
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            test@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        foopl
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        weep
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        coop
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        pppol
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        test
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            good@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        userwow
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            userwow@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-default">
									Blocked </span>
    </td>
</tr>
<tr class="odd gradeX">
    <td>
        <input type="checkbox" class="checkboxes" value="1"/>
    </td>
    <td>
        test
    </td>
    <td>
        <a href="mailto:userwow@gmail.com">
            test@gmail.com </a>
    </td>
    <td>
									<span class="label label-sm label-success">
									Approved </span>
    </td>
</tr>
</tbody>
</table>
</div>
</div>
<!-- END EXAMPLE TABLE PORTLET-->
</div>
</div>
<!-- END PAGE CONTENT-->
</div>
</div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<script>
    jQuery(document).ready(function () {
        TableManaged.init();
    });
</script>
</body>
<!-- END BODY -->
</html>