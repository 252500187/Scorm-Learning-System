<%--@elvariable id="permissionTokenValue" type="java.lang.String"--%>
<%--@elvariable id="role" type="com.genghis.sls.security.entity.Role"--%>
<%--@elvariable id="menuPermList" type="java.util.List"--%>
<%--
  Created by IntelliJ IDEA.
  User: genghis11
  Date: 14-3-4
  Time: 下午7:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@include file="../../includes/common.jsp" %>
    <title><spring:message code="role"/><spring:message code="edit"/></title>
</head>
<body>
<div>
    <form class="form-horizontal" action="">
        <fieldset>
            <legend></legend>
            <div class="control-group">
                <label class="control-label" for="roleName"><spring:message code="roleName"/></label>

                <div class="controls">
                    <input id="roleName" name="roleName" type="text" value="${role.roleName}">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="description" value=""><spring:message code="role"/><spring:message code="description"/></label>

                <div class="controls">
                    <textarea id="description" name="description" class="textarea"
                              value="${role.description}">${role.description}</textarea>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="permName"><spring:message code="select"/><spring:message
                        code="permission"/></label>

                <div class="controls">
                    <input id="permName" type="text" readonly value="${permissionTokenValue}"
                           onclick="showMenuPerm();"/>
                    &nbsp;<a id="permissionTokens" href="#" onclick="showMenuPerm(); return false;"><spring:message
                        code="select"/></a>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label"></label>

                <div class="controls">
                    <input type="button" id="saves" class="btn btn-primary" onclick="save()"
                           value="<spring:message code="save"/>"/>
                    <input type="button" onclick="quit()" class="btn btn-primary"
                           value="<spring:message code="cancel"/>"/>
                </div>
            </div>
        </fieldset>
    </form>
</div>
<div id="menuContent" class="divauto" style=" display:none; position: absolute;">
    <ul id="menuTree" class="ztree"></ul>
</div>
</body>
</html>
<script type="text/javascript">
    var zNodesMenu;
    var zTree;

    var rule = {
        objInfo: {
            roleName: {
                checkEmpty: ["roleName", "<spring:message code="roleName"/>"],
                checkRegExp: ["roleName", "", JCRegExp.chineseLetterNum],
                max: ["roleName", "10"],
                ajax: [basePath + "admin/role/checkRepeatRoleName", {primaryRoleName: "${role.roleName}"},
                    {roleName: "$('#roleName').val().trim()"},
                    backFunc, "text", "POST"]
            },
            description: {
                max: ["description", "30"]
            }

        }
    };
    var settingMenu = {
        view: {
            expandSpeed: "fast"
        },
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y": "p", "N": "s" }
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId"
            },
            key: {
                name: "name",
                checked: "checked"
            },
            keep: {
                parent: true
            }
        },
        callback: {
            beforeClick: beforeClick,
            onCheck: onCheckMenu
        }
    };

    var zNodes = [
        <c:forEach var="MenuPerm" items="${menuPermList}">
        {id: "${MenuPerm.id}", pId: "${MenuPerm.parentId}", name: "${MenuPerm.menuName}", checked: "${MenuPerm.checked}", permissionToken: "${MenuPerm.permissionToken}"},
        </c:forEach>
    ];

    function save() {
        if (!JC.validate(rule)) return;
        onCheckMenu();
        $("#saves").button('loading');

        $.ajax({
            url: basePath + "admin/role/editRole",
            data: {
                id: ${role.id},
                roleName: $("#roleName").val(),
                description: $("#description").val(),
                permissionTokens: $("#permissionTokens").val()
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

    function backFunc(data, returnObj) {
        returnObj.obj = $('#roleName');
        returnObj.errMsg = "<spring:message code="roleName"/><spring:message code="existed"/><spring:message code="exclamationMark"/>";
        if (data == "true") {
            returnObj.bool = true;
        }
        if (data == "false") {
            returnObj.bool = false;
        }

        return returnObj;
    }

    function beforeClick(treeNode) {
        var zTreeRole = $.fn.zTree.getZTreeObj("menuTree");
        zTreeRole.checkNode(treeNode, !treeNode.checked, null, true);
        return false;
    }

    function onCheckMenu() {
        var zTree = $.fn.zTree.getZTreeObj("menuTree"),
                nodes = zTree.getCheckedNodes(true),
                menuNames = "", permissionTokens = "";
        for (var i = 0, l = nodes.length; i < l; i++) {
            menuNames += nodes[i].name + ",";
        }
        for (i = 0, l = nodes.length; i < l; i++) {
            permissionTokens += nodes[i].permissionToken + ",";
        }
        if (menuNames.length > 0) menuNames = menuNames.substring(0, menuNames.length - 1);
        var userObj = $("#permName");
        userObj.attr("value", menuNames);
        if (permissionTokens.length > 0) permissionTokens = permissionTokens.substring(0, permissionTokens.length - 1);
        var userIdsObj = $("#permissionTokens");
        userIdsObj.attr("value", permissionTokens);
    }

    function showMenuPerm() {
        var obj = $("#permName");
        var objOffset = obj.offset();
        var width = obj.width() + 10;
        $("#menuContent").css({width: width + 'px', height: 900 + 'px', left: objOffset.left + "px", top: objOffset.top + obj.outerHeight() + "px"}).slideDown("fast");
        $("body").unbind("mousedown").bind("mousedown", onBodyDown);
    }

    function onBodyDown(event) {
        if (!(event.target.id == "menuBtn" || event.target.id == "permissionTokens" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
            hideMenu();
        }
    }

    function hideMenu() {
        $("#menuContent").fadeOut("fast");
        $("body").unbind("mousedown", onBodyDown);
    }

    $(document).ready(function () {
        for (var i = 0; i < zNodes.length; i++) {
            if (zNodes[i].id == "1") {
                zNodes[i].nocheck = true;
            }
        }
        $.fn.zTree.init($("#menuTree"), settingMenu, zNodes);
        var treeObj = $.fn.zTree.getZTreeObj("menuTree");
        treeObj.expandAll(true);
    });
</script>