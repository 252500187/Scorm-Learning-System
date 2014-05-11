<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>404</title>
    <%@include file="common.jsp" %>
</head>
<body class="page-404-full-page">
<div class="row">
    <div class="col-md-12 page-404">
        <div class="number">
            404
        </div>
        <div class="details">
            <h3>竟然是404页！</h3>

            <p>
                要不要去<br/>
                <a onclick="window.location.href=basePath">
                    主页
                </a>
                学习？
            </p>
        </div>
    </div>
</div>
</body>
</html>
<script>
    jQuery(document).ready(function () {
        App.init();
    });
</script>