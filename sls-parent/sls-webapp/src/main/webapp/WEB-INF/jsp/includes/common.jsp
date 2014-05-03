<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<link rel="stylesheet" type="text/css" href="<c:url value="/js/common/bootstrap-2.3.2/css/bootstrap.min.css"/>"/>
<link rel="stylesheet" type="text/css"
      href="<c:url value="/js/common/bootstrap-2.3.2/css/bootstrap-datetimepicker.min.css"/>"/>
<link rel="stylesheet" type="text/css"
      href="<c:url value="/js/common/jquery-easyui-1.3.4/themes/bootstrap/easyui.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/js/common/jquery-easyui-1.3.4/themes/icon.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/js/common/cover/cover.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/js/common/ccjcJS/validate.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/js/common/autocomplete/autocomplete.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/js/common/zTree-v3.5.14/css/zTreeStyle/zTreeStyle.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/js/common/alertMsg/alertMsg.css"/>"/>

<script src="<c:url value="/js/common/jquery/jquery-1.8.2.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/common/bootstrap-2.3.2/js/bootstrap.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/common/bootstrap-2.3.2/js/bootstrap-datetimepicker.min.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/js/common/autocomplete/autocomplete.min.js"/>" type=text/javascript></script>
<script src="<c:url value="/js/common/jquery-easyui-1.3.4/jquery.easyui.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/common/jquery-easyui-1.3.4/locale/easyui-lang-zh_CN.js"/>"
        type="text/javascript"></script>
<script src="<c:url value="/js/common/jquery.tools.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/common/common.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/common/ccjcJS/ccjcJS.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/common/cover/cover.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/common/zTree-v3.5.14/js/jquery.ztree.all-3.5.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/js/common/alertMsg/alertMsg.js"/>" type="text/javascript"></script>

<base href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()%><c:url value="/"/>"/>
<script>
    $(function () {
        JC.inputInit();
    })
</script>


<script src="<c:url value="/assets/plugins/jquery-migrate-1.2.1.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery.blockui.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery.cokie.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/uniform/jquery.uniform.min.js"/>" type="text/javascript"></script>

<script src="<c:url value="/assets/plugins/jquery-validation/dist/jquery.validate.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/backstretch/jquery.backstretch.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/select2/select2.min.js"/>" type="text/javascript"></script>

<script src="<c:url value="/assets/scripts/core/app.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/scripts/custom/login-soft.js"/>" type="text/javascript"></script>


<script src="<c:url value="/assets/plugins/respond.min.js"/>"></script>
<script src="<c:url value="/assets/plugins/excanvas.min.js"/>"></script>
<script src="<c:url value="/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"/>" type="text/javascript"></script>

<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/jquery.vmap.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.resize.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.categories.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery.pulsate.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap-daterangepicker/moment.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/gritter/js/jquery.gritter.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/fullcalendar/fullcalendar/fullcalendar.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery.sparkline.min.js"/>" type="text/javascript"></script>

<script src="<c:url value="/assets/scripts/custom/index.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/scripts/custom/tasks.js"/>" type="text/javascript"></script>

<script src="<c:url value="/assets/plugins/dropzone/dropzone.js"/>"></script>
<script src="<c:url value="/assets/scripts/custom/form-dropzone.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/plugins/fuelux/js/spinner.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/plugins/bootstrap-fileinput/bootstrap-fileinput.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/plugins/jquery.input-ip-address-control-1.0.min.js"/>"></script>
<script src="<c:url value="/assets/plugins/jquery.pwstrength.bootstrap/src/pwstrength.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap-switch/js/bootstrap-switch.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/jquery-tags-input/jquery.tagsinput.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/typeahead/handlebars.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/typeahead/typeahead.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/scripts/custom/components-form-tools.js"/>"></script>





<link href="<c:url value="/assets/plugins/dropzone/css/dropzone.css"/>" rel="stylesheet"/>
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
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
<%--个人中心所引入的样式--%>

<script src="<c:url value="/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.resize.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/plugins/flot/jquery.flot.categories.js"/>" type="text/javascript"></script>
<script src="<c:url value="/assets/scripts/custom/ecommerce-index.js"/>"></script>

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

<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/plugins/bootstrap-switch/css/bootstrap-switch.min.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/plugins/jquery-tags-input/jquery.tagsinput.css"/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/assets/plugins/typeahead/typeahead.css"/>">

