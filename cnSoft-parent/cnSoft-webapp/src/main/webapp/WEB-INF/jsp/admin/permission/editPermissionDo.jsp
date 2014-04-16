<%--@elvariable id="permission" type="com.genghis.ptas.security.entity.Permission"--%>
<%--
  Created by IntelliJ IDEA.
  User: qinw
  Date: 14-2-28
  Time: 下午1:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@include file="../../includes/common.jsp" %>
    <title><title><spring:message code="permission"/><spring:message code="edit"/></title></title>
</head>
<body>
<div id="mainContent">
    <form class="form-horizontal">
        <fieldset>
            <legend></legend>

            <div class="control-group">
                <label class="control-label" for="permissionToken"><spring:message code="permissionToken"/></label>

                <div class="controls">
                    <input type="text" name="permissionToken" id="permissionToken"
                           value="${permission.permissionToken}"/>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="description"><spring:message code="permission"/><spring:message code="description"/></label>

                <div class="controls">
                    <textarea class="textarea" id="description" name="description" value="${permission.description}">${permission.description}</textarea>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label"></label>

                <div class="controls">
                    <input type="button" id="saves" class="btn btn-primary" onclick="save()" value="<spring:message code='save'/>"/>
                    <input type="button" onclick="quit()" class="btn btn-primary" value="<spring:message code='cancel'/>"/>
                </div>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>
<script type="text/javascript">

    var rulePermission = {
        objInfo: {
            permissionToken: {
                checkEmpty: ["permissionToken", "<spring:message code='permissionToken'/>"],
                checkRegExp: ["permissionToken", "", JCRegExp.letterNum],
                ajax: [basePath + "admin/permission/checkRepeatPermissionToken", {oldPermissionToken: "${permission.permissionToken}"},
                    {permissionToken: "$('#permissionToken').val().trim()"},
                    backFunc, "text", "POST"]
            },
            description: {
                max: ["description", 30, "<spring:message code='permission'/><spring:message code='description'/>"]
            }
        }
    };

    function backFunc(data, returnObj) {
        returnObj.obj = $('#permissionToken');
        returnObj.errMsg = "<spring:message code='permissionToken'/><spring:message code='existed'/>！";
        if (data == "true") {
            returnObj.bool = true;
        }
        if (data == "false") {
            returnObj.bool = false;
        }

        return returnObj;
    }
    function save() {
        if (!JC.validate(rulePermission)) return;
        $("#saves").button('loading');
        $.ajax({
            url: basePath + "admin/permission/editPermission?oldPermissionToken=${permission.permissionToken}",
            data: {
                id: "${permission.id}",
                permissionToken: $("#permissionToken").val(),
                description: $("#description").val()
            },
            dataType: "json",
            type: "POST",
            success: function () {
                $.messager.alert("<spring:message code="prompt"/>", "<spring:message code="edit"/><spring:message code="succeed"/><spring:message code="exclamationMark"/>", "", function () {
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