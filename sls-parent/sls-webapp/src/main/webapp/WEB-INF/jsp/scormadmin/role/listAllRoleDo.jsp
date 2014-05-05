<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../includes/adminCommon.jsp" %>
    <title>><spring:message code="role"/></title>
</head>
<body>
<div id="mainContent" class="easyui-panel" data-options="fit:true" style="padding: 10px">
    <form class="form-inline" action="">
        角色名<input type="text" name="roleName" id="roleName" value="" class="input-medium"/>
        <a class="btn btn-primary" onclick="query()"><spring:message code="query"/></a>
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
        listOption.url = basePath + "admin/role/listAllRole";
        listOption.data = "roleName=" + $("#roleName").val();
        listOption.pageNumber = 1;
        loadData(listOption);
    }

    function initDataGrid() {
        $('#dataTable').datagrid({
            title: "角色列表",
            pagination: true,
            fitColumns: true,
            columns: [
                [
                    {field: 'roleName', title: '角色名', sortable: true, align: 'center', width: 200},
                    {field: 'operate', title: '操作', align: 'center', width: 200}
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
        }
        onSortColumnDefault(sortColumn, sortDirection);
    }

    function format(data) {
        data.resultList = queryFormat(data.resultList);
        return data;
    }

    function queryFormat(temp) {
        for (var i in temp) {
            temp[i].operate = "";
        }
        return temp;
    }

    $(function () {
        initDataGrid();
        query();
    })
</script>