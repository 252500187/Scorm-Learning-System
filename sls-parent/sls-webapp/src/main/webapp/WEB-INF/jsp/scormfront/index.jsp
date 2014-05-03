<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>我是主页</title>
    <%@include file="../includes/common.jsp" %>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
</head>

<body>
<%@include file="index/navigationMenu.jsp" %>

<%@include file="index/content.jsp" %>

<%@include file="index/footer.jsp" %>
</body>
</html>
<script>
    jQuery(document).ready(function () {
        App.init(); // initlayout and core plugins
    });
</script>