<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<base href="<%=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()%><c:url value="/"/>"/>
<script>
    $(function () {
        JC.inputInit();
    })
</script>

<link href="<c:url value="/ecommerce/assets/plugins/fancybox/source/jquery.fancybox.css"/>" rel="shortcut icon"/>
<link href="<c:url value="/ecommerce/assets/plugins/bxslider/jquery.bxslider.css"/>" rel="shortcut icon"/>
<link href="<c:url value="/ecommerce/assets/plugins/layerslider/css/layerslider.css"/>" rel="shortcut icon"/>

<script src="<c:url value="/ecommerce/assets/plugins/jquery-1.10.2.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/ecommerce/assets/plugins/jquery-migrate-1.2.1.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/ecommerce/assets/plugins/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/ecommerce/assets/plugins/back-to-top.js"/>" type="text/javascript"></script>
<script src="<c:url value="/ecommerce/assets/plugins/fancybox/source/jquery.fancybox.pack.js"/>" type="text/javascript"></script>
<script src="<c:url value="/ecommerce/assets/plugins/bxslider/jquery.bxslider.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/ecommerce/assets/plugins/zoom/jquery.zoom.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/ecommerce/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js"/>" type="text/javascript"></script>
<script src="<c:url value="/ecommerce/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js"/>" type="text/javascript"></script>
<script src="<c:url value="/ecommerce/assets/plugins/layerslider/jQuery/jquery-transit-modified.js"/>" type="text/javascript"></script>
<script src="<c:url value="/ecommerce/assets/plugins/layerslider/js/layerslider.transitions.js"/>" type="text/javascript"></script>
<script src="<c:url value="/ecommerce/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js"/>" type="text/javascript"></script>
<script src="<c:url value="/ecommerce/assets/scripts/app.js"/>" type="text/javascript"></script>