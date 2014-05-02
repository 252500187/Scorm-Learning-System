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
        <h3 class="form-title">Login to SLS</h3>

        <div class="alert alert-danger display-hide">
            <button class="close" data-close="alert"></button>
			<span>
				 Enter any username and password.
			</span>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Username</label>

            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="Username"
                       id="userName" name="userName" value="admin"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Password</label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" placeholder="Password"
                       id="password" name="password" value="admin"/>
            </div>
        </div>
        <div class="form-actions">
            <label class="checkbox">
                <input type="checkbox" name="remember" value="1"/> Remember me </label>
            <button type="submit" class="btn blue pull-right" onclick="login()">
                Login <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
        <div class="login-options">
            <h4>Or Come to index</h4>
            <ul class="social-icons">
                <li>
                    <a class="facebook" data-original-title="facebook" onclick="window.location.href='/sls/'">
                    </a>
                </li>
            </ul>
        </div>
        <div class="forget-password">
            <h4>Forgot your password ?</h4>

            <p>
                no worries, click
                <a onclick="window.location.href='/sls/'" id="forget-password">
                    here
                    <%--todo 改密码--%>
                </a>
                to reset your password.
            </p>
        </div>
        <div class="create-account">
            <p>
                Don't have an account yet ?&nbsp;
                <a href="javascript:;" id="register-btn">
                    Create an account
                </a>
            </p>
        </div>
    </form>
    <!-- END LOGIN FORM -->
    <!-- BEGIN FORGOT PASSWORD FORM -->
    <form class="forget-form" action="index.html" method="post">
        <h3>Forget Password ?</h3>

        <p>
            Enter your e-mail address below to reset your password.
        </p>

        <div class="form-group">
            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email"
                       name="email"/>
            </div>
        </div>
        <div class="form-actions">
            <button type="button" id="back-btn" class="btn">
                <i class="m-icon-swapleft"></i> Back
            </button>
            <button type="submit" class="btn blue pull-right">
                Submit <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>
    <!-- END FORGOT PASSWORD FORM -->
    <!-- BEGIN REGISTRATION FORM -->
    <form class="register-form" action="index.html" method="post">
        <h3>Sign Up</h3>

        <p>
            Enter your personal details below:
        </p>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Full Name</label>

            <div class="input-icon">
                <i class="fa fa-font"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="Full Name" name="fullname"/>
            </div>
        </div>
        <div class="form-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">Email</label>

            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="Email" name="email"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Address</label>

            <div class="input-icon">
                <i class="fa fa-check"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="Address" name="address"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">City/Town</label>

            <div class="input-icon">
                <i class="fa fa-location-arrow"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="City/Town" name="city"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Country</label>
            <select name="country" id="select2_sample4" class="select2 form-control">
                <option value=""></option>
                <option value="AF">Afghanistan</option>
            </select>
        </div>
        <p>
            Enter your account details below:
        </p>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Username</label>

            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Username"
                       name="username"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Password</label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password"
                       placeholder="Password" name="password"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Re-type Your Password</label>

            <div class="controls">
                <div class="input-icon">
                    <i class="fa fa-check"></i>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off"
                           placeholder="Re-type Your Password" name="rpassword"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>
                <input type="checkbox" name="tnc"/> I agree to the
                <a href="#">
                    Terms of Service
                </a>
                and
                <a href="#">
                    Privacy Policy
                </a>
            </label>

            <div id="register_tnc_error">
            </div>
        </div>
        <div class="form-actions">
            <button id="register-back-btn" type="button" class="btn">
                <i class="m-icon-swapleft"></i> Back
            </button>
            <button type="submit" id="register-submit-btn" class="btn blue pull-right">
                Sign Up <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>

</div>

<div class="copyright">
    2014 &copy; Metronic - Admin Dashboard Template.
</div>

<script>
    jQuery(document).ready(function () {
        App.init();
        Login.init();
    });

    function login() {
        $("#login").submit();
    }

    $(function () {
        $("#password").unbind(".entertotab").bind("keydown.entertotab", function (e) {
            if (e.which == 13) {
                login()
            }
        });
    })
</script>
</body>
</html>