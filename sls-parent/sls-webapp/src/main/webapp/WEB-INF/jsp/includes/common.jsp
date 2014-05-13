<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<script src="<c:url value="/assets/plugins/jquery-1.10.2.min.js"/>"></script>
<script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/common/ccjcJS/ccjcJS.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/scripts/core/app.js"/>" type="text/javascript"></script>
<base href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()%><c:url value="/"/>"/>
<script>
    $(function () {
        JC.inputInit();


        $(function () {
            $.sessionTimeout({
                title: '提示',
                message: '您已经学习很久了（60分钟），要不要出去溜达溜达？',
                keepAliveUrl: '',
                redirUrl: 'logout',
                logoutUrl: 'logout',
                warnAfter: 3600000,
                redirAfter: 3610000
            });
        });

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
    })
</script>

<%--这三个先后顺序不能变，会报错--%>

<script src="<c:url value="/assets/plugins/jquery-migrate-1.2.1.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>

<script src="<c:url value="/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery.blockui.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery.cokie.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/uniform/jquery.uniform.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/data-tables/jquery.dataTables.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/data-tables/DT_bootstrap.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"/>"
        type="text/javascript"></script>

<script src="<c:url value="/assets/plugins/jquery-validation/dist/jquery.validate.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/backstretch/jquery.backstretch.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/select2/select2.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/scripts/custom/ecommerce-orders-view.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/scripts/custom/login-soft.js"/>" type="text/javascript"></script>


<script src="<c:url value="/assets/plugins/respond.min.js"/>"></script>
<script src="<c:url value="/assets/plugins/excanvas.min.js"/>"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/jquery.vmap.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.resize.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.categories.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery.pulsate.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap-daterangepicker/moment.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/gritter/js/jquery.gritter.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/fullcalendar/fullcalendar/fullcalendar.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery.sparkline.min.js"/>" type="text/javascript"></script>

<script src="<c:url value="/assets/scripts/custom/index.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/scripts/custom/tasks.js"/>" type="text/javascript"></script>

<script src="<c:url value="/assets/plugins/dropzone/dropzone.js"/>"></script>
<script src="<c:url value="/assets/scripts/custom/form-dropzone.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/plugins/fuelux/js/spinner.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/assets/plugins/bootstrap-fileinput/bootstrap-fileinput.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/assets/plugins/jquery.input-ip-address-control-1.0.min.js"/>"></script>
<script src="<c:url value="/assets/plugins/jquery.pwstrength.bootstrap/src/pwstrength.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap-switch/js/bootstrap-switch.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery-tags-input/jquery.tagsinput.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/typeahead/handlebars.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/typeahead/typeahead.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/scripts/custom/components-form-tools.js"/>"></script>

<script src="<c:url value="/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.resize.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.categories.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/scripts/custom/ecommerce-index.js"/>"></script>

<script src="<c:url value="/assets/plugins/jquery-knob/js/jquery.knob.js"/>"></script>
<script src="<c:url value="/assets/scripts/custom/components-knob-dials.js"/>"></script>
<script src="<c:url value="/assets/scripts/custom/ui-general.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/plugins/jquery-bootpag/jquery.bootpag.min.js"/>"></script>

<script src="<c:url value="/assets/plugins/bootstrap-sessiontimeout/jquery.sessionTimeout.js"/>"
        type="text/javascript"></script>

<script src="<c:url value="/assets/scripts/custom/charts.js"/>"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.pie.min.js"/>"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.stack.min.js"/>"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.crosshair.min.js"/>"></script>


<link href="<c:url value="/assets/plugins/dropzone/css/dropzone.css"/>" rel="stylesheet"/>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet"
      type="text/css"/>
<link href="<c:url value="/assets/plugins/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/plugins/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/plugins/uniform/css/uniform.default.css"/>" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" type="text/css" href="<c:url value="/assets/plugins/select2/select2.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/plugins/select2/select2-metronic.css"/>"/>

<link href="<c:url value="/assets/css/style-metronic.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/css/style.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/css/style-responsive.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/css/plugins.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/css/themes/default.css"/>" rel="stylesheet" type="text/css" id="style_color"/>
<link href="<c:url value="/assets/css/pages/login-soft.css"/>" rel="stylesheet" type="text/css"/>

<link href="<c:url value="/assets/css/pages/tasks.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/css/print.css"/>" rel="stylesheet" type="text/css" media="print"/>

<link href="<c:url value="/assets/plugins/gritter/css/jquery.gritter.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>" rel="stylesheet"
      type="text/css"/>
<link href="<c:url value="/assets/plugins/fullcalendar/fullcalendar/fullcalendar.css"/>" rel="stylesheet"
      type="text/css"/>
<link href="<c:url value="/assets/plugins/jqvmap/jqvmap/jqvmap.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css"/>" rel="stylesheet"
      type="text/css"/>
<link href="<c:url value="/assets/css/custom.css"/>" rel="stylesheet" type="text/css"/>

<link href="<c:url value="/assets/plugins/bootstrap-datepicker/css/datepicker.css"/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/assets/plugins/jquery-file-upload/server/gae-go/static/favicon.ico"/>" rel="shortcut icon"/>

<link rel="stylesheet" type="text/css"
      href="<c:url value="/assets/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>"/>
<link rel="stylesheet" type="text/css"
      href="<c:url value="/assets/plugins/bootstrap-switch/css/bootstrap-switch.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/plugins/jquery-tags-input/jquery.tagsinput.css"/>"/>
<link rel="stylesheet" type="text/css"
      href="<c:url value="/assets/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/plugins/typeahead/typeahead.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/css/pages/promo.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/css/animate.css"/>">


<%--ztree冲突，放最后别动--%>
<link rel="stylesheet" type="text/css" href="<c:url value="/js/common/zTree-v3.5.14/css/zTreeStyle/zTreeStyle.css"/>"/>
<script src="<c:url value="/js/common/zTree-v3.5.14/js/jquery.ztree.all-3.5.min.js"/>" type="text/javascript"></script>
