var Login = function () {

    var handleLogin = function () {
        $('.login-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                loginName: {
                    required: true
                },
                password: {
                    required: true
                },
                loginValidateCode: {
                    required: true,
                    remote: {
                        url: basePath + "tourist/checkValidateCodeYesOrNot",
                        type: "post",
                        dataType: "json",
                        data: {
                            validateCode: function () {
                                return $("#loginValidateCode").val();
                            }
                        }
                    }
                }
            },
            messages: {
                loginName: {
                    required: "请输入帐号"
                },
                password: {
                    required: "请输入密码"
                },
                loginValidateCode: {
                    required: "请输入验证码",
                    remote: "验证码错误"
                }
            },

            highlight: function (element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function (error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function (form) {
                form.submit();
            }
        });

        $("#loginValidateCode").bind("keydown", function (e) {
            if (e.which == 13) {
                if ($('.login-form').validate().form()) {
                    $('.login-form').submit();
                }
            }
        });
    }

    var handleForgetPassword = function () {
        $('.forget-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",
            rules: {
                email: {
                    required: true,
                    email: true
                }
            },
            messages: {
                email: {
                    required: "请输入邮箱",
                    email: "邮箱格式不正确"
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit

            },

            highlight: function (element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function (error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function (form) {
                form.submit();
            }
        });

        jQuery('#forget-password').click(function () {
            jQuery('.login-form').hide();
            jQuery('.forget-form').show();
        });

        jQuery('#back-btn').click(function () {
            jQuery('.login-form').show();
            jQuery('.forget-form').hide();
        });

    }

    var handleRegister = function () {
        $('#select2_sample4').change(function () {
            $('.register-form').validate().element($(this)); //revalidate the chosen dropdown value and show error or success message for the input
        });


        $('.register-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",
            rules: {
                registerLoginName: {
                    required: true,
                    minlength: 6,
                    maxlength: 20,
                    remote: {
                        url: basePath + "tourist/checkRepeatLoginName",
                        type: "post",
                        dataType: "json",
                        data: {
                            registerLoginName: function () {
                                return $("#registerLoginName").val();
                            }
                        }
                    }
                },
                registerPassword: {
                    required: true,
                    minlength: 6
                },
                copyRegisterPassword: {
                    equalTo: '#registerPassword'
                },
                email: {
                    required: true,
                    email: true
                },
                registerValidateCode: {
                    required: true,
                    remote: {
                        url: basePath + "tourist/checkValidateCodeYesOrNot",
                        type: "post",
                        dataType: "json",
                        data: {
                            validateCode: function () {
                                return $("#registerValidateCode").val();
                            }
                        }
                    }
                },
                tnc: {
                    required: true
                }
            },

            messages: {
                registerLoginName: {
                    required: "请输入帐号",
                    minlength: "帐号长度过小(6位)",
                    maxlength: "帐号长度过大",
                    remote: "该帐号已注册"
                },
                registerPassword: {
                    required: "请输入密码",
                    minlength: "密码长度过小(6位)"
                },
                copyRegisterPassword: {
                    equalTo: "两次输入密码不相同，请重新输入"
                },
                email: {
                    required: "请输入邮箱",
                    email: "邮箱格式不正确"
                },
                registerValidateCode: {
                    required: "请输入验证码",
                    remote: "验证码错误"
                },
                tnc: {
                    required: "确认加入么?"
                }
            },

            invalidHandler: function (event, validator) { //display error alert on form submit

            },

            highlight: function (element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function (label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function (error, element) {
                if (element.attr("name") == "tnc") { // insert checkbox errors after the container
                    error.insertAfter($('#register_tnc_error'));
                } else if (element.closest('.input-icon').size() === 1) {
                    error.insertAfter(element.closest('.input-icon'));
                } else {
                    error.insertAfter(element);
                }
            },

            submitHandler: function (form) {
                $('#registerSuccess', $('.login-form')).show();
                $.ajax({
                    url: basePath + "tourist/register",
                    data: {
                        loginName: $("#registerLoginName").val().trim(),
                        password: $("#registerPassword").val().md5(),
                        email: $("#email").val().trim()
                    },
                    dataType: "json",
                    type: "POST",
                    success: function () {
                        jQuery('.register-form').hide();
                        jQuery('.login-form').show();
                    },
                    error: doError
                })
            }
        });

        jQuery('#register-btn').click(function () {
            jQuery('.login-form').hide();
            jQuery('.register-form').show();
            $("#registerLoginName").val("");
            $("#registerPassword").val("");
            $("#email").val("");
        });

        jQuery('#register-back-btn').click(function () {
            jQuery('.login-form').show();
            jQuery('.register-form').hide();
        });
    }

    return {
        //main function to initiate the module
        init: function () {

            handleLogin();
            handleForgetPassword();
            handleRegister();

            $.backstretch([
                "metronic/assets/admin/pages/media/bg/1.jpg",
                "metronic/assets/admin/pages/media/bg/2.jpg",
                "metronic/assets/admin/pages/media/bg/3.jpg",
                "metronic/assets/admin/pages/media/bg/4.jpg"
            ], {
                fade: 1000,
                duration: 8000
            });
        }

    };

}();