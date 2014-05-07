<%--
  Created by IntelliJ IDEA.
  User: zhangtq
  Date: 14-5-3
  Time: 下午1:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%@include file="../../includes/common.jsp" %>
</head>
<body>
我 是 我的收藏 <a onclick="registerScorm()">点我注册课件？</a>
</body>
</html>
<script>
    function registerScorm() {
        $.ajax({
            url: basePath + "user/scorm/registerScorm?scormId=9",
            type: "GET",
            success: function () {
                alert("成功注册");
            },
            error: doError
        })
    }
</script>