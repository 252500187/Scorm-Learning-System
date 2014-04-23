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
<img src="" id="a" width="300" height="300"/>
<iframe src="${scosrc}"  width="1000" height="600" ></iframe>
</body>
</html>
<script>
    $("#a").attr("src", basePath + "${jpg}");
</script>