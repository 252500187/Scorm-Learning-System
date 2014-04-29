<%--@elvariable id="myLoginId" type="java.lang.String"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../includes/common.jsp" %>
    <title>><spring:message code="user"/></title>
</head>
<body>
<div id="mainContent" class="easyui-panel" data-options="fit:true" style="padding: 10px">
    <form class="form-inline">
        <spring:message code="accountId"/><input type="text" class="input-medium" name="loginName" id="loginName"
                                                 value=""/>
        <spring:message code="name"/><input type="text" class="input-medium" name="userName" id="userName" value=""/>
        <span>
            <spring:message code="department"/><input type="text" name="showDepartment" id="showDepartment" value=""
                                                      class="input-medium"
                                                      flag="department" autocomplete="off"/>
            <input type="hidden" name="departmentId" id="departmentId" value="" autoHidden="autoHidden">
        </span>
        <span>
            <spring:message code="role"/><input type="text" name="roleName" id="roleName" value="" class="input-medium"
                                                flag="allRoles" autocomplete="off"/>
            <input type="hidden" name="roleId" id="roleId" value="" autoHidden="autoHidden">
        </span>
        <a class="btn btn-primary" onclick="query()"><spring:message code="query"/></a>
        <a class="btn btn-primary" onclick="addUser()"><spring:message code="add"/></a>
        <a class="btn btn-primary" onclick="deleteUser()"><spring:message code="delete"/></a>
    </form>
    <table id="dataTable"></table>
    <div id="dataEdit" closed="true" modal="true" style="overflow: hidden">
        <iframe style="width: 100%;height: 100%"
                id="contentFrame"
                name="contentFrame"
                marginheight="0"
                marginwidth="0"
                frameborder="0" src=""
                allowTransparency="true">
        </iframe>
    </div>
</div>
</body>
</html>

<script type="text/javascript">
    function query() {
        listOption.url = basePath + "admin/front/listAllUser";
        listOption.data = "loginName=" + $("#loginName").val().trim() + "&userName=" + $("#userName").val().trim()
                + "&showDepartmentId=" + $("#departmentId").val() + "&showRoleId=" + $("#roleId").val();
        listOption.pageNumber = 1;
        loadData(listOption);
    }

    function addUser() {
        $("#contentFrame")[0].contentWindow.document.write("");
        $("#contentFrame").attr("src", basePath + "admin/front/addUserDo");
        $('#dataEdit').dialog({
            title: '<spring:message code="add"/>',
            height: 400,
            width: 600
        })
        $('#dataEdit').dialog('open');
    }


    function deleteUser() {
        var ids = "";
        var value;
        var flag = 0;
        var allBox = $("[name='deleteUserCheckBox']");
        for (var i = 0; i < allBox.length; i++) {
            value = allBox[i].getAttribute("value");
            if ($("#" + value).attr("checked") == "checked") {
                if ("${myLoginId}" == value) {
                    $.messager.alert("<spring:message code="prompt"/>", "<spring:message code="delSelf"/>");
                    return;
                }
                flag = 1;
                ids += value + ",";
            }
        }
        if (flag == 0) {
            $.messager.alert("<spring:message code="prompt"/>", "<spring:message code="selectDeleteUser"/>");
            return;
        }
        $.messager.confirm("<spring:message code="prompt"/>", "<spring:message code="ensureDelete"/><spring:message code="questionMark"/>", function (r) {
            if (r) {
                $.ajax({
                    url: basePath + "admin/front/delUser?ids=" + ids,
                    dataType: "json",
                    type: "DELETE",
                    success: function () {
                        $.messager.alert("<spring:message code="succeed"/>", "<spring:message code="deleteSucceed"/><spring:message code="exclamationMark"/>", "", function () {
                            query();
                        })
                    },
                    error: doError
                })
            }
        })
    }

    function selectAll() {
        if ($("#checkAll").attr("checked") == "checked") {
            $("[name='deleteUserCheckBox']").attr("checked", true);
        } else {
            $("[name='deleteUserCheckBox']").attr("checked", false);
        }
    }

    function initDataGrid() {
        $('#dataTable').datagrid({
            title: "<spring:message code="user"/><spring:message code="list"/>",
            pagination: true,
            fitColumns: true,
            columns: [
                [
                    {field: 'id', title: "&nbsp<input id='checkAll' type='checkbox' onclick='selectAll()'/>", align: 'center', width: 100},
                    {field: 'loginName', title: '<spring:message code="accountId"/>', sortable: true, align: 'center', width: 300},
                    {field: 'userName', title: '<spring:message code="name"/>', sortable: true, align: 'center', width: 100},
                    {field: 'showDepartmentId', title: '<spring:message code="department"/>', align: 'center', width: 300},
                    {field: 'showRoleId', title: '<spring:message code="role"/>', align: 'center', width: 200},
                    {field: 'edit', title: '<spring:message code="operate"/>', align: 'center', width: 200}
                ]
            ],
            sortName: "",
            sortOrder: "",
            onSortColumn: onSortColumn
        });
    }

    function onSortColumn(sortColumn, sortDirection) {
        switch (sortColumn) {
            case "loginName":
                sortColumn = "login_name";
                break;
            case "userName":
                sortColumn = "user_name";
                break;
        }
        onSortColumnDefault(sortColumn, sortDirection);
    }

    function format(data) {
        data.resultList = queryFormat(data.resultList);
        return data;
    }

    function queryFormat(temp) {
        var rowDataList = [];
        for (var i in temp) {
            idBtn = "&nbsp;<input type='checkbox' name='deleteUserCheckBox' id='" + temp[i].id + "' value='" + temp[i].id + "'\">&nbsp;";
            editBtn = "&nbsp;<a onclick='front.edit(\"" + temp[i].id + "\")'><spring:message code="edit"/></a>&nbsp;";
            temp[i].id = idBtn;
            temp[i].edit = editBtn;
            rowDataList.push(temp[i]);
        }
        return rowDataList;
    }

    var user = {
        edit: function (id) {
            $("#contentFrame")[0].contentWindow.document.write("");
            $("#contentFrame").attr("src", basePath + "admin/front/editUserDo?id=" + id);
            $('#dataEdit').dialog({
                title: '<spring:message code="edit"/>',
                height: 400,
                width: 600
            })
            $('#dataEdit').dialog('open');
        }
    };

    $(function () {
        initDataGrid();
        query();
    })
</script>