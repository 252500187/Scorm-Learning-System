<%--
  Created by IntelliJ IDEA.
  User: bblll
  Date: 14-4-20
  Time: 上午11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%@include file="../includes/common.jsp" %>
</head>
<body>
    <img src="" id="a"/>
</body>
</html>
<script>
    $("#a").attr("src", basePath + "${jpg}");
</script>