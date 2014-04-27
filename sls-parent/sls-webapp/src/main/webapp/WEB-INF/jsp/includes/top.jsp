<%@ page import="com.sls.admin.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="navbar" style="margin-bottom: 0">
    <div style="padding: 0 20px; height:71px; background:url('img/logo/title2.png') repeat-x scroll 0px 0px;">
        <div class="container" style="width: auto;">
            <img src="img/logo/logo.png"/>
            <ul class="nav pull-right" style="margin-top: 40px;color: #FFF;">
                <li>
                    <a id="drop0" role="button" style="padding: 0;text-shadow: none;color: #FFF;"
                       onclick="location.href='logout'">退出</a>
                </li>
            </ul>
        </div>
    </div>
</div>