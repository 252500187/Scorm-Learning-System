<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | UpScorm</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/common.jsp" %>
    <style type="text/css">
        .visible-a {
            visibility: visible;
        }

        .hidden-a {
            visibility: hidden;
        }
    </style>
</head>
<body class="page-header-fixed ">
<div class="row">
    <div class="col-md-12">
        <div class="portlet box">
            <div class="portlet-body form">
                <form class="form-horizontal" id="fileGetUp" method="post"
                      enctype="multipart/form-data">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-2">课件名称</label>

                            <div class="col-md-3">
                                <input class="form-control form-control-inline input-medium date-picker"
                                       id="scormName" name="scormName" type="text" value=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">选择图片</label>

                            <div class="col-md-9">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <%--<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">--%>
                                    <%--<img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt=""/>--%>
                                    <%--</div>--%>
                                    <div class="fileinput-preview fileinput-exists thumbnail"
                                         style="max-width: 200px; max-height: 150px;border: 0px">
                                    </div>
                                    <div>
                                        <span class="btn-file">
                                            <%--<span class="fileinput-new">选择</span>--%>
                                            <%--<span class="fileinput-exists">换一个 </span>--%>
                                            <input type="file" name="upImg" id="upImg"/>
                                        </span>
                                    </div>
                                </div>
                                <%--<div class="clearfix margin-top-10">--%>
                                <%--<span class="label label-danger">提示! </span>--%>
                                <%--<span>图片预览只支持 IE10+, FF3.6+, Safari6.0+, Chrome6.0+, Opera11.1+.</span>--%>
                                <%--</div>--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">选择SCORM课件<br/>（仅支持1.2版本）</label>

                            <div class="col-md-9">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="input-group input-large">
                                        <%--<div class="form-control uneditable-input span3" data-trigger="fileinput">--%>
                                        <%--<i class="fa fa-file fileinput-exists"></i>&nbsp;--%>
                                        <%--<span class="fileinput-filename"></span>--%>
                                        <%--</div>--%>
                                        <span class="btn-file">
                                            <%--<span class="fileinput-new">--%>
                                                 <%--选择--%>
                                            <%--</span>--%>
                                            <%--<span class="fileinput-exists">--%>
                                                 <%--换一个--%>
                                            <%--</span>--%>
                                            <input type="file" name="upScorm" id="upScorm"/>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">课件简介</label>

                            <div class="col-md-3">
                                <textarea class="form-control"
                                          name="description" value=""/></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="select2-container select2-container-multi form-control select2_sample3">
                                <label class="control-label col-md-2">标签</label>

                                <div class="col-md-9">
                                    <div>
                                        <ul class="select2-choices" style="border-width: 0;" id="myLabelList"></ul>
                                    </div>
                                    <div>
                                        <ul class='select2-choices' style="border-width: 0;" id="labelList">
                                            <c:forEach var="label" items="${labelList}" varStatus="status">
                                                <li class='select2-search-choice allLabels'
                                                    style="border-width: 0;">
                                                    <div class="label label-info" style="cursor: pointer"
                                                         id="${label.labelId}">${label.labelName}</div>
                                                    <a class='select2-search-choice-close hidden-a'
                                                       tabindex='-1'></a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn purple" type="submit"><i
                                            class="fa fa-check"></i>
                                        上传
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
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
        if ("${result}" != "") {
            parent.$("#alertPromptMessage").html("${result}");
            parent.$("#alertPrompt").modal("show");
        }
        jQuery.validator.addMethod("isImg", function (value, element, param) {
            if (param) {
                var imgType = value.substr(value.length - 3, 3);
                if ((imgType != "jpg") && (imgType != "png") && (imgType != "gif")) {
                    return false;
                }
                return true;
            }
        }, "请选择图片文件");

        jQuery.validator.addMethod("isZip", function (value, element, param) {
            if (param) {
                if (value.substr(value.length - 3, 3) != "zip") {
                    return false;
                }
                return true;
            }
        }, "请选择Zip文件");
    });

    $('#fileGetUp').validate({
                errorElement: 'span',
                errorClass: 'help-block',
                focusInvalid: false,
                rules: {
                    scormName: {
                        required: true
                    },
                    upImg: {
                        required: true,
                        isImg: true
                    },
                    upScorm: {
                        required: true,
                        isZip: true
                    },
                    description: {
                        required: true
                    }
                },

                messages: {
                    scormName: {
                        required: "请输入课件名称"
                    },
                    upImg: {
                        required: "请选择图片"
                    },
                    upScorm: {
                        required: "请选择课件"
                    },
                    description: {
                        required: "请输入课件简介"
                    }
                },
                highlight: function (element) {
                    $(element).closest('.form-group').addClass('has-error');
                },
                success: function (label) {
                    label.closest('.form-group').removeClass('has-error');
                    label.remove();
                },
                errorPlacement: function (error, element) {
                    if (element.attr("name") == "upImg" || element.attr("name") == "upScorm") {
                        error.insertAfter(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                },
                submitHandler: function () {
                    var scormLabelList = "";
                    $("#myLabelList").find("div").each(function () {
                        scormLabelList += $(this).attr("id") + ",";
                    });
                    $("#fileGetUp").attr("action",
                            basePath + "user/center/upScorm?scormName=" + $("#scormName").val() + "&scormLabelList=" + scormLabelList).submit();
                }
            }
    );

    $(".allLabels").live("click", function () {
        $("#myLabelList").append($(this));
        $(this).attr("class", "select2-search-choice myLabel");
        $(this).find("a").attr('class', 'select2-search-choice-close visible-a');
        $(this).find("div").attr('class', "label label-success");
        $(this).unbind("click");
    });

    $(".visible-a").live("click", function () {
        $("#labelList").append($(this).parent("li"));
        $(this).parent("li").attr("class", "select2-search-choice allLabels");
        $(this).parent("li").find("a").attr("class", "select2-search-choice-close hidden-a");
        $(this).parent("li").find("div").attr('class', "label label-info");
        $(this).unbind("click");
    })
</script>