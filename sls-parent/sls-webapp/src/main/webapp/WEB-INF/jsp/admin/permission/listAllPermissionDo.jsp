<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../includes/common.jsp" %>
    <title><spring:message code="permission"/></title>
</head>
<body>
<div id="mainContent" class="easyui-panel" data-options="fit:true" style="padding: 10px">
    <form class="form-inline">
        <label for="permissionToken"><spring:message code="permissionToken"/></label>
        <input type="text" name="permissionToken" id="permissionToken" value="" class="input-medium"
               flag="permissionTokenValue"
               autocomplete="off"/>
        <input type="hidden" name="id" id="id" value=""
               autoHidden="autoHidden">
        <label for="description"><spring:message code="permission"/><spring:message code="description"/></label>
        <input type="text" class="input-medium" name="description" id="description" value=""/>
        <a class="btn btn-primary" onclick="query()"><spring:message code="query"/></a>
        <a class="btn btn-primary" onclick="addPermission()"><spring:message code="add"/></a>
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
    function query() {
        listOption.url = basePath + "admin/permission/listAllPermission";
        listOption.data = "permissionToken=" + $("#permissionToken").val() + "&description=" + $("#description").val();
        listOption.pageNumber = 1;
        loadData(listOption);
    }

    function initDataGrid() {
        $('#dataTable').datagrid({
            title: "<spring:message code="permission"/><spring:message code='list'/>",
            pagination: true,
            fitColumns: true,
            columns: [
                [
                    {field: 'permissionToken', title: '<spring:message code="permissionToken"/>', sortable: true, align: 'center', width: 200},
                    {field: 'description', title: '<spring:message code="permission"/><spring:message code="description"/>', align: 'center', width: 200},
                    {field: 'operate', title: '<spring:message code="operate"/>', align: 'center', width: 200}
                ]
            ],
            sortName: "",
            sortOrder: "asc",
            onSortColumn: onSortColumn
        });
    }

    function onSortColumn(sortColumn, sortDirection) {
        switch (sortColumn) {
            case "permissionToken":
                sortColumn = "permission_token";
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
            temp[i].operate = "<a onclick='editPermission(\"" + temp[i].id + "\")'><spring:message code='edit'/></a>&nbsp;&nbsp;"
                    + "<a onclick='delPermission(\"" + temp[i].id + "\")'><spring:message code='delete'/></a>&nbsp;&nbsp;";
        }
        return temp;
    }

    function addPermission() {
        $("#contentList")[0].contentWindow.document.write("");
        $("#contentList").attr("src", basePath + "admin/permission/addPermissionDo");
        $('#dataEdit').dialog({
            title: '<spring:message code="add"/>',
            height: 400,
            width: 600
        });
        $('#dataEdit').dialog('open');
    }

    function editPermission(id) {
        $("#contentList")[0].contentWindow.document.write("");
        $("#contentList").attr("src", basePath + "admin/permission/editPermissionDo?id=" + id);
        $('#dataEdit').dialog({
            title: '<spring:message code="edit"/>',
            height: 400,
            width: 600
        });
        $('#dataEdit').dialog('open');
    }

    function delPermission(delid) {
        $.messager.confirm("<spring:message code='prompt'/>", "<spring:message code='ensureDelete'/><spring:message code="questionMark"/>", function (r) {
            if (r) {
                $.ajax({
                    url: basePath + "admin/permission/delPermissionDo?id=" + delid,
                    dataType: "json",
                    type: "DELETE",
                    success: function () {
                        $.messager.alert("<spring:message code='succeed'/>", "<spring:message code='deleteSucceed'/><spring:message code="exclamationMark"/>", "", function () {
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