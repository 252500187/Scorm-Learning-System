<%--@elvariable id="user" type="com.sls.scorm.entity.ScormSummarize"--%>
<%--
  Created by IntelliJ IDEA.
  User: zhangtq
  Date: 14-5-2
  Time: 下午2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人资料</title>
    <%@include file="../../includes/common.jsp" %>
</head>
<body>
    <div class="portlet-body form">
        <form class="form-body" id="userInfo">
            <div class="form-group">
                <label class="control-label col-md-2">
                    <h3></h3>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">昵称</label>
                <input id="nickName" class="form-control form-control-inline input-medium date-picker" type="text"
                       value="${user.userName}" >

            </div>

            <div class="form-group">
                <label class="control-label col-md-2">头像</label>

                <div class="col-md-9">
                    <div class="fileinput fileinput-new" data-provides="fileinput">
                        <div class="fileinput-new thumbnail"
                             style="width: 200px; height: 150px;">
                            <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
                                 alt=""/>
                        </div>
                        <div class="fileinput-preview fileinput-exists thumbnail"
                             style="max-width: 200px; max-height: 150px;">
                        </div>
                        <div>
													<span class="btn default btn-file">
														<span class="fileinput-new">
															 选择
														</span>
														<span class="fileinput-exists">
															 换一个
														</span>
														<input type="file" name="upImg" id="upImg"/>
													</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-md-2">性别</label>
                <div class="col-md-9">
                    <input type="radio" name="sex" id="sexMale" value="male">男&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="sex" id="sexFemale" value="female">女
                </div>
            </div>

            <div class="form-actions fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-offset-3 col-md-9">
                            <a onclick="changeUserInfo()" class="btn purple"><i
                                    class="fa fa-check"></i>
                                确定修改
                            </a>
                        </div>
                    </div>
                </div>
            </div>


        </form>

    </div>
</body>
</html>
<script>
    $(function(){
        $("#sexMale").attr("checked", true);
        if ("${staffBase.sex}" == "female") {
            $("#sexFemale").attr("checked", true);
        }

    });
    function changeUserInfo(){
        $.ajax({
            url: basePath + "user/center/changeUserInfo",
            data: {
                userId: ${user.userId},
                userName: $("#nickName").val().trim()
//              showSex: $("input[name=sex]:checked").val()
            },
            dataType: "json",
            type: "POST",
            success: function () {
                alert("修改资料成功");
            },
            error: doError
        })
    }
</script>