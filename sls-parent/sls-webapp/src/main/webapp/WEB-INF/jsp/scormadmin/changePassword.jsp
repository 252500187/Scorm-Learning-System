<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | SLS ChangePassword</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../includes/common.jsp" %>
</head>

<body class="login" style="background-color: #ffffff;overflow-x:hidden">
<div class="content" style="margin-top:6%">
    <form class="changePassword-form" method="post" id="changePassword">
        <h3 class="form-title">密码修改</h3>

        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">原密码</label>

            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" placeholder="输入原来密码"
                       id="oldPassword" name="oldPassword" value=""/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">新密码</label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" placeholder="输入新密码"
                       id="newPassword" name="newPassword" value=""/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">再次输入密码</label>

            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" placeholder="再次输入新密码"
                       id="copyNewPassword" name="copyNewPassword" value=""/>
            </div>
        </div>
        <div class="form-actions">
            <button type="submit" class="btn blue pull-right">
                修改密码 <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>

    <form class="changeSuccess" id="changeSuccess">
        <h3 class="form-title">密码修改</h3>

        <div class="alert alert-info ">
            <span>密码修改成功！</span>

        </div>
    </form>

</div>
</body>
</html>
<script>
    $(function () {
        Metronic.init();
        Layout.init();
        $(".changeSuccess").hide();
    });
    $('#changePassword').validate({
                errorElement: 'span',
                errorClass: 'help-block',
                focusInvalid: false,
                rules: {
                    oldPassword: {
                        required: true,
                        remote: {
                            url: basePath + "admin/user/checkOldPassword",
                            type: "post",
                            dataType: "json",
                            data: {
                                oldPassword: function () {
                                    return $("#oldPassword").val().md5();
                                }
                            }
                        }
                    },
                    newPassword: {
                        required: true,
                        minlength: 6,
                        remote: {
                            url: basePath + "admin/user/checkNewPassword",
                            type: "post",
                            dataType: "json",
                            data: {
                                newPassword: function () {
                                    return $("#newPassword").val().md5();
                                }
                            }
                        }

                    },
                    copyNewPassword: {
                        required: true,
                        equalTo: '#newPassword'
                    }
                },

                messages: {
                    oldPassword: {
                        required: "请输入旧密码",
                        remote: "密码输入不正确"
                    },
                    newPassword: {
                        required: "请输入新密码",
                        minlength: "密码长度过小(6位)",
                        remote:"新密码不能与旧密码相同"

                    },
                    copyNewPassword: {
                        required: "请再次输入新密码",
                        equalTo: "两次输入新密码不相同，请重新输入"
                    }
                },
                highlight: function (element) {
                    $(element).closest('.form-group').addClass('has-error');
                },
                success: function (label) {
                    label.closest('.form-group').removeClass('has-error');
                    label.remove();
                },
                errorPlacement: function (error, element) {
                    error.insertAfter(element);
                },
                submitHandler: function () {
                    $.ajax({
                        url: basePath + "admin/user/changePassword",
                        data: {
                            password: $("#newPassword").val().md5()
                        },
                        dataType: "json",
                        type: "POST",
                        success: function () {
                            $('.changePassword-form').hide();
                            $('.changeSuccess').show();
                        },
                        error: doError
                    })
                }
            }
    );
</script>