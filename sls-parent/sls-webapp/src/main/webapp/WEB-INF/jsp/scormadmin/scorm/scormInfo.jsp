<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../includes/adminCommon.jsp" %>
    <title>>课件统计信息</title>
</head>
<body>
<div id="mainContent" class="easyui-panel" data-options="fit:true" style="padding: 10px">
    <form class="form-inline">
        课件名称<input id="scormName" name="scormName" type="text" class="input-medium"/>
        <span>
            状态<input type="text" name="ShowScormState" id="ShowScormState" value="" class="input-medium"
                     flag="scormStates" autocomplete="off"/>
            <input type="hidden" name="scormState" id="scormState" value="" autoHidden="autoHidden">
        </span>
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
        listOption.url = basePath + "admin/statistics/listAllScormInfo";
        listOption.data = "scormName=" + $("#scormName").val().trim();
        listOption.pageNumber = 1;
        loadData(listOption);
    }

    function initDataGrid() {
        $('#dataTable').datagrid({
            title: "课件信息统计列表",
            pagination: true,
            fitColumns: true,
            columns: [
                [
                    {field: 'scormName', title: '课件名称', sortable: true, align: 'center', width: 300},
                    {field: 'uploadDate', title: '上传时间', sortable: true, align: 'center', width: 200},
                    {field: 'registerSum', title: '注册人数', align: 'center', width: 200},
                    {field: 'totalTime', title: '观看总时间', align: 'center', width: 200},
                    {field: 'score', title: '课件评分', align: 'center', width: 200},
                    {field: 'inUse', title: '状态', align: 'center', width: 100},
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
            case "scormName":
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
            temp[i].operate = "<a onclick='detailInfo(\"" + temp[i].scormName + "\")'>详情</a>"
        }
        return temp;
    }

    function detailInfo() {
    }

    $(function () {
        initDataGrid();
        query();
    })
</script>