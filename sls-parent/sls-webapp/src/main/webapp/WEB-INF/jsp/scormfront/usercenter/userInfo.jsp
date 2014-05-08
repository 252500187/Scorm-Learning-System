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
        <form class="form-body">
            <div class="form-group">
                <label class="control-label col-md-2">
                    <h2></h2>
                </label>
            </div>
            <div class="form-group">
                <label class="control-label col-md-2">昵称</label>
                <input id="nickName" class="form-control form-control-inline input-medium date-picker" type="text" value="">
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

        </form>

    </div>
</body>
</html>