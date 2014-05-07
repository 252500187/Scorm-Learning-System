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
我 是 我的收藏 <a onclick="registerScorm('9')">点我注册ID为9的课件</a>
<a onclick="studyScorm('9')">点我学习ID为9的课件</a>
</body>
</html>
<script>
    function registerScorm(id) {
        $.ajax({
            url: basePath + "user/scorm/registerScorm?scormId=" + id,
            dataType: "json",
            type: "GET",
            success: function (message) {
                alert(message);
            },
            error: doError
        })
    }
    function studyScorm(id) {
        window.location.href = basePath + "user/scorm/studyScorm?scormId=" + id;
    }
</script>