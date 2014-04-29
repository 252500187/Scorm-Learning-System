<%--
  Created by IntelliJ IDEA.
  User: genghis4
  Date: 14-4-27
  Time: 下午7:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我是主页</title>
</head>
<body>
......................主业主业
<% if (session.getAttribute("userId") != null && !session.getAttribute("userId").equals("")) {%>
你的userId为：<%=session.getAttribute("userId")%>。
<input type="button" onclick="location.href='logout'" value="退出"/>
<%}%>
<input type="button" onclick="window.location.href='login'" value="登录页"/>
<input type="button" onclick="window.location.href='user/upScormDo'" value="上传课件"/>
</body>
</html>
<script>

</script>