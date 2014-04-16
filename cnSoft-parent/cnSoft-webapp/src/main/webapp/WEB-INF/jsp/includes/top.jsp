<%@ page import="com.genghis.ptas.security.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%
    User user = (User)request.getAttribute("user");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="navbar" style="margin-bottom: 0">
    <div style="padding: 0 20px; height:71px;background:url('<%=basePath%>img/logo/title2.png' ) repeat-x scroll 0px 0px;">
        <div class="container" style="width: auto;">
            <img src="<%=basePath%>img/logo/logo.png"  />
            <ul class="nav pull-right" style="margin-top: 40px;color: #FFF;">
                <li>
                    <span>当前用户：<%=user.getUserName()%></span>
                </li>
                <li>
                    <a id="drop0" role="button" style="padding: 0;text-shadow: none;color: #FFF;" onclick="location.href='logout'">&nbsp退出</a>
                </li>
            </ul>
        </div>
    </div>
</div>