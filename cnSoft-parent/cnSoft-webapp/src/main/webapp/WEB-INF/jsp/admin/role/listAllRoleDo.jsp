<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../includes/common.jsp" %>
    <title>><spring:message code="role"/></title>
</head>
<body>
<div id="mainContent" class="easyui-panel" data-options="fit:true" style="padding: 10px">
    <form class="form-inline" action="">
        <label for="roleName"><spring:message code="roleName"/></label>
        <input type="text" name="roleName" id="roleName" value="" class="input-medium"/>

        <label for="description"><spring:message code="role"/><spring:message code="description"/></label>
        <input type="text" name="description" id="description" value="" class="input-medium"/>
        <a class="btn btn-primary" onclick="query()"><spring:message code="query"/></a>
        <a class="btn btn-primary" onclick="addRole()"><spring:message code="add"/></a>
    </form>
    <table id="dataTable"></table>
    <div id="dataEdit" closed="true" modal="true" style="overflow: hidden">
        <iframe style="width: 100%;height: 100%"
                id="contentList"
                name="contentList"
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
    var rule = {
        objInfo: {
            roleName: {
                checkRegExp: ["roleName", "", JCRegExp.chineseLetterNum],
                max: ["roleName", "10"]
            },
            description: {
                max: ["description", "30"]
            }
        }
    };

    function query() {
        if (!JC.validate(rule)) return;
        listOption.url = basePath + "admin/role/listAllRole";
        listOption.data = "roleName=" + $("#roleName").val() + "&description=" + $("#description").val();
        listOption.pageNumber = 1;
        loadData(listOption);
    }

    function initDataGrid() {
        $('#dataTable').datagrid({
            title: "<spring:message code="role"/><spring:message code="list"/>",
            pagination: true,
            fitColumns: true,
            columns: [
                [
                    {field: 'roleName', title: '<spring:message code="roleName"/>', sortable: true, align: 'center', width: 200},
                    {field: 'description', title: '<spring:message code="role"/><spring:message code="description"/>', sortable: true, align: 'center', width: 200},
                    {field: 'operate', title: '<spring:message code="operate"/>', align: 'center', width: 200}
                ]
            ],
            sortName: "",
            sortOrder: "",
            onSortColumn: onSortColumn
        });
    }

    function onSortColumn(sortColumn, sortDirection) {
        switch (sortColumn) {
            case "roleName":
                sortColumn = "role_name";
                break;
            case "description":
                sortColumn = "description";
                break;
        }
        onSortColumnDefault(sortColumn, sortDirection);
    }

    function format(data) {
        data.resultList = queryFormat(data.resultList);
        return data;
    }

    function queryFormat(temp) {
        for (var i in temp) {
            temp[i].operate = "<a onclick='editRole(\"" + temp[i].id + "\")'><spring:message code="edit"/></a>&nbsp;&nbsp;"
                    + "<a onclick='delRole(\"" + temp[i].id + "\")'><spring:message code="delete"/></a>&nbsp;&nbsp;";
        }
        return temp;
    }

    function editRole(id) {
        var contentList = $("#contentList");
        var dataEdit = $('#dataEdit');
        contentList[0].contentWindow.document.write("");
        contentList.attr("src", basePath + "admin/role/editRoleDo?id=" + id);
        dataEdit.dialog({
            title: '<spring:message code="edit"/>',
            height: 400,
            width: 600
        });
        dataEdit.dialog('open');
    }

    function addRole() {
        var contentList = $("#contentList");
        var dataEdit = $('#dataEdit');
        contentList[0].contentWindow.document.write("");
        contentList.attr("src", basePath + "admin/role/addRoleDo");
        dataEdit.dialog({
            title: '<spring:message code="add"/>',
            height: 400,
            width: 600
        });
        dataEdit.dialog('open');
    }

    function delRole(delid) {
        $.messager.confirm("<spring:message code="prompt"/>", "<spring:message code="ensureDelete"/><spring:message code="questionMark"/>", function (r) {
            if (r) {
                $.ajax({
                    url: basePath + "admin/role/delRoleDo?id=" + delid,
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

    $(function () {
        initDataGrid();
        query();
    })
</script>