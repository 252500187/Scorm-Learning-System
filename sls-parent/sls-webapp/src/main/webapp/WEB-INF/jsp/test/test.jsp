<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>上传附件</title>
    <%@include file="../includes/common.jsp" %>
</head>
<body>
<div>
    <form id="filegetup" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
            <legend></legend>
            <div class="control-group">
                <label class="control-label" for="upfile"></label>

                <div class="controls">
                    <input type="file" name="upfile" id="upfile"/>
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
        var upfile = document.getElementById("upfile").value;
        $("#filegetup").attr("action", basePath + "admin/user/upup?upfile=" + upfile);
        $("#filegetup").submit();
    }
</script>