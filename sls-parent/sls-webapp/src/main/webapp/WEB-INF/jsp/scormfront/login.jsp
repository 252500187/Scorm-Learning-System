<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>登录</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@include file="../includes/common.jsp" %>
</head>
<body style="padding: 0;">
<div class="container">
    <section class="loginBox row-fluid">
        <h2>用户登录</h2>

        <form>
            <p>账号<input type="text" id="username" name="username" placeholder="用户名" value="admin"
                      style="height: 30px;line-height: 30px;margin-bottom: 5px;margin-right: 1px"/></p>

            <p>密码<input type="password" id="password" name="password" placeholder="密码" value="admin"
                      style="height: 30px;line-height: 30px;margin-bottom: 5px;"/></p>
            <section class="row-fluid">
                <section class="span1" style="margin-left: 35%;">
                    <input type="button" value=" 登录 " class="btn btn-primary" style="line-height: 30px;" onclick="login()"/>
                </section>
            </section>
        </form>
    </section>
    <!-- /loginBox -->
</div>
<!-- /container -->
</body>
</html>
<script type="text/javascript">
    //session过期跳转登录页面
    if (top != window) {
        top.location.href = "logout"
    }
    function login() {
//        formSub()
        $("form").attr("method","post").submit();
    }
</script>