<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>上传附件</title>
    <%@include file="../../includes/common.jsp" %>
</head>
<body>
<div>
    <form id="fileGetUp" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
            <legend></legend>
            <div class="control-group">
                <label class="control-label" for="upScorm"></label>

                <div class="controls">
                    课件：<input type="file" name="upScorm" id="upScorm"/>
                </div>
                <div class="controls">
                    图片：<input type="file" name="upImg" id="upImg"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label"></label>

                <div class="controls">
                    <input type="button" id="button" onclick="fileUpAttachment()" class="btn btn-primary" value="上传"/>
                </div>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>
<script>
    function fileUpAttachment() {
        $("#fileGetUp").attr("action",
                        basePath + "admin/user/upup?upScorm=" + $("#upScorm").val() + "&upImg=" + $("#upImg").val())
                .submit();
    }
</script>