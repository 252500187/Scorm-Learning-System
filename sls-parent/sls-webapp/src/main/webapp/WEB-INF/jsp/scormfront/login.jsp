<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | SLS Login</title>
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

<div class="menu-toggler sidebar-toggler">
</div>

<div class="content">

    <form class="login-form" action="loginResult" method="post" id="login">
        <h3 class="form-title">Welcome to SLS</h3>

        <div class="alert alert-info display-hide" id="registerSuccess">
            <button class="close" data-close="alert"></button>
            <span>注册成功！</span>
        </div>

        <div class="alert alert-info display-hide" id="loginError">
            <button class="close" data-close="alert"></button>
            <span>密码错误！</span>
        </div>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">帐号</label>

            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="输入帐号"
                       id="loginName" name="loginName"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">密码</label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" placeholder="输入密码"
                       id="password" name="password"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">验证码</label>

            <div class="input-icon">
                <i class="fa fa-check"></i>
                <input class="form-control" type="text" placeholder="输入验证码" style="float: left;width: 120px"
                       id="loginValidateCode" name="loginValidateCode" type="text" maxlength="4"/>&nbsp;
                <img style="height: 33px" title="换一张" id="loginValidateCodeImg" src="tourist/validateCode">&nbsp;
                <a id="changeLoginValidateCode">换一张</a>
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
                    <a class="scorm" data-original-title="scorm" onclick="window.location.href='/sls/'">
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
                发送 <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>

    <form id="registerInfo" class="register-form">
        <h3>注册</h3>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">帐号</label>

            <div class="input-icon">
                <i class="fa fa-font"></i>
                <input id="registerLoginName" name="registerLoginName" class="form-control placeholder-no-fix"
                       type="text" placeholder="输入登陆帐号"/>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">密码</label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input id="registerPassword" name="registerPassword" class="form-control placeholder-no-fix"
                       type="password"
                       placeholder="输入登陆密码" name="password"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">确认密码</label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input id="copyRegisterPassword" name="copyRegisterPassword" class="form-control placeholder-no-fix"
                       type="password"
                       placeholder="再次输入登陆密码" name="password"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">邮箱</label>

            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <input id="email" class="form-control placeholder-no-fix" type="text" placeholder="输入Email（密码找回）"
                       name="email"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">验证码</label>

            <div class="input-icon">
                <i class="fa fa-check"></i>
                <input class="form-control" type="text" placeholder="输入验证码" style="float: left;width: 120px"
                       id="registerValidateCode" name="registerValidateCode" type="text" maxlength="4"/>&nbsp;
                <img style="height: 33px" title="换一张" id="registerValidateCodeImg" src="tourist/validateCode">&nbsp;
                <a id="changeRegisterValidateCode">换一张</a>
            </div>
        </div>
        <div class="form-group">
            <label>
                <input type="checkbox" name="tnc"/> 我同意加入SLS大家庭
            </label>

            <div id="register_tnc_error">
            </div>
        </div>
        <div class="form-actions">
            <button id="register-back-btn" type="button" class="btn">
                <i class="m-icon-swapleft"></i> 返回
            </button>
            <button id="register-submit-btn" class="btn blue pull-right" type="submit">
                <i class="m-icon-swapright m-icon-white"></i> 注册
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
        $("#loginValidateCodeImg,#changeLoginValidateCode").click(function () {
            $("#loginValidateCodeImg").attr("src", basePath + "tourist/validateCode?" + Math.random());
        });
        $("#changeRegisterValidateCode,#registerValidateCodeImg").click(function () {
            $("#registerValidateCodeImg").attr("src", basePath + "tourist/validateCode?" + Math.random());
        });
        <c:if test="${loginResult=='false'}">
        $("#loginError").show();
        </c:if>
    });
</script>