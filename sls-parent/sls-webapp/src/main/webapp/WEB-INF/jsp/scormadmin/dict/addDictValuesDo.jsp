<%--@elvariable id="dictName" type="java.lang.String"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@include file="../../includes/adminCommon.jsp" %>
    <title><spring:message code="dictValues"/></title>
<body>
<div id="mainContent">
    <form class="form-horizontal">
        <fieldset>
            <!-- Form Name -->
            <legend></legend>
            <div class="control-group">
                <label class="control-label" for="dictCode"><spring:message code="dictCode"/></label>

                <div class="controls">
                    <input id="dictCode" name="dictCode" type="text">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="dictValue"><spring:message code="dictValue"/></label>

                <div class="controls">
                    <input id="dictValue" name="dictValue" type="text">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label"></label>

                <div class="controls">
                    <input type="button" class="btn btn-primary" id="saves" onclick="save()"
                           value="<spring:message code="save"/>"/>
                    <input type="button" class="btn btn-primary" onclick="quit()"
                           value="<spring:message code="cancel"/>"/>
                </div>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>
<script type="text/javascript">
    var rules = {
        objInfo: {
            dictCode: {
                checkEmpty: ["dictCode", "<spring:message code="dictCode"/>"],
                checkRegExp: ["dictCode", "", JCRegExp.letterNum],
                ajax: [basePath + "admin/dict/checkRepeatDictValuesCode", {dictName: "${dictName}"}, {dictCode: "$('#dictCode').val().trim()"},
                    backFunc, "text", "POST"]
            }
        }
    };

    function backFunc(data, returnObj) {
        returnObj.obj = $('#dictCode');
        returnObj.errMsg = "<spring:message code="dictCodeExist"/>！";
        if (data == "true") {
            returnObj.bool = true;
        }
        if (data == "false") {
            returnObj.bool = false;
        }
        return returnObj;
    }

    function save() {
        if (!JC.validate(rules)) return;
        $("#saves").button('loading');
        $.ajax({
            url: basePath + "admin/dict/addDictValues?dictName=${dictName}",
            data: {
                dictCode: $("#dictCode").val(),
                dictValue: $("#dictValue").val(),
                state: $("#dictState").val()
            },
            dataType: "json",
            type: "POST",
            success: function () {
                $.messager.alert("<spring:message code="prompt"/>", "<spring:message code="add"/><spring:message code="succeed"/>!", "", function () {
                    parent.$("#dataEdit").dialog('close');
                    parent.query();
                });
            },
            error: doError
        })
    }

    function quit() {
        parent.$("#dataEdit").dialog('close');
    }
</script>
