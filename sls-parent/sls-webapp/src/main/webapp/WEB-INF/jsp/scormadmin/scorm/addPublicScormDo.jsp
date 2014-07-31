<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | AddPublicScorm</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/adminCommon.jsp" %>
</head>
<body>
<div id="mainContent">
    <form class="form-horizontal">
        <fieldset>
            <legend></legend>
            <div class="control-group">
                <label class="control-label" for="labelName">标签名</label>

                <div class="controls">
                    <input id="labelName" name="labelName" type="text"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label"></label>

                <div class="controls">
                    <input id="saves" name="saves" type="button" onclick="save()" class="btn btn-primary" value="确认"/>
                    <input type="button" onclick="quit()" class="btn btn-primary" value="取消"/>
                </div>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>
<script>
    var ruleLabel = {
        objInfo: {
            labelName: {
                checkEmpty: ["labelName", "标签名"],
                max: ["labelName", 15, "标签名"],
                ajax: [basePath + "admin/label/checkRepeatLabelName", {}, {labelName: "$('#labelName').val().trim()", oldLabelName: "''"},
                    backFunc, "text", "POST"]
            }
        }
    };

    function save() {
        if (!JC.validate(ruleLabel)) return;
        $("#saves").button('loading');
        $.ajax({
            url: basePath + "admin/label/addLabel",
            data: {
                labelName: $("#labelName").val().trim()
            },
            dataType: "json",
            type: "POST",
            success: function () {
                window.parent.$("#dataEdit").dialog('close');
                window.parent.query();
            },
            error: doError
        })
    }

    function quit() {
        parent.$("#dataEdit").dialog('close');
    }
</script>