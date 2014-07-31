<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | SLS changePassword</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../includes/common.jsp" %>
</head>

<body class="login">
<div class="logo">
    <a onclick="window.location.href='/sls/'">
        <img src="img/logo/logo-big.png" alt="SLS"/>
    </a>
</div>
<div class="content">

    <form class="changePassword-form" method="post" id="changePassword">
        <h3 class="form-title">密码修改</h3>

        <div class="alert alert-info display-hide" id="registerSuccess">
            <button class="close" data-close="alert"></button>
            <span>修改密码成功！</span>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">原密码</label>

            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="输入原来密码"
                       id="oldPassword" name="oldPassword"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">新密码</label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" placeholder="输入新密码"
                       id="newPassword" name="newPassword"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">新密码</label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" placeholder="再次输入新密码"
                       id="newPasswordAgain" name="newPasswordAgain"/>
            </div>
        </div>
        <div class="form-actions">
            <button type="submit" class="btn blue pull-right">
                修改 <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>


</div>
</body>
</html>
<script>
    $(function () {
        Metronic.init();
        Layout.init();
        Login.init();
    });
</script>