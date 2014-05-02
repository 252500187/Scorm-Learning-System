<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en" class="ie8 no-js">
<html lang="en" class="ie9 no-js">
<html lang="en" class="no-js" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>SLS | Come on - Login</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@include file="../includes/common.jsp" %>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
</head>

<body class="login">
<div class="logo">
    <a onclick="window.location.href='/sls/'">
        <img src="assets/img/logo-big.png" alt=""/>
    </a>
</div>

<div class="content">

    <form class="login-form" action="loginResult" method="post" id="login">
        <h3 class="form-title">登陆到 SLS</h3>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">帐号</label>

            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="输入帐号"
                       id="loginName" name="loginName" value="admin"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">密码</label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" placeholder="输入密码"
                       id="password" name="password" value="admin"/>
            </div>
        </div>
        <div class="form-actions">
            <button type="submit" class="btn blue pull-right">
                登陆 <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
        <div class="login-options">
            <h4>去首页看看</h4>
            <ul class="social-icons">
                <li>
                    <a class="facebook" data-original-title="facebook" onclick="window.location.href='/sls/'">
                    </a>
                </li>
            </ul>
        </div>
        <div class="forget-password">
            <h4>忘记密码?</h4>

            <p>
                <a href="javascript:;" id="forget-password">
                    重置
                </a>
                密码
            </p>
        </div>
        <div class="create-account">
            <p>
                没有帐号?&nbsp;
                <a href="javascript:;" id="register-btn">
                    注册帐号
                </a>
            </p>
        </div>
    </form>
    <!-- END LOGIN FORM -->
    <!-- BEGIN FORGOT PASSWORD FORM -->
    <form class="forget-form">
        <h3>忘记密码 ?</h3>

        <p>
            输入您注册帐号时填写的邮箱，我们会向您发送一封重置密码的邮件哦！
        </p>

        <div class="form-group">
            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="Email"
                       name="email"/>
            </div>
        </div>
        <div class="form-actions">
            <button type="button" id="back-btn" class="btn">
                <i class="m-icon-swapleft"></i> 返回
            </button>
            <button class="btn blue pull-right">
                <%--todo 重置密码--%>
                发送 <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>
    <!-- END FORGOT PASSWORD FORM -->
    <!-- BEGIN REGISTRATION FORM -->
    <form class="register-form">
        <h3>注册</h3>

        <p>
            快来填注册信息吧:
        </p>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">登陆帐号</label>

            <div class="input-icon">
                <i class="fa fa-font"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="输入登陆帐号"
                       name="register_loginName"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">登陆密码</label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" id="register_password"
                       name="register_password"
                       placeholder="输入登陆密码" name="password"/>
            </div>
        </div>

        <div class="form-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">Email</label>

            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="输入Email（密码找回）" name="email"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">昵称</label>

            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="输入昵称"
                       name="name"/>
            </div>
        </div>
        <div class="form-group">
            <label>
                <input type="checkbox" name="tnc"/> 我同意加入
                <a href="#">
                    SLS大家庭
                </a>
            </label>

            <div id="register_tnc_error">
            </div>
        </div>
        <div class="form-actions">
            <button id="register-back-btn" type="button" class="btn">
                <i class="m-icon-swapleft"></i> 返回
            </button>
            <button id="register-submit-btn" class="btn blue pull-right">
                注册！ <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>
</div>
<%@include file="index/footer.jsp" %>
</body>
</html>
<script>
    jQuery(document).ready(function () {
        App.init();
        Login.init();
    });

    function registe() {
        alert("有待完成");
    }

    function findPassword() {
        alert("有待完成a ");
    }

</script>