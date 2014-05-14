<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../includes/adminCommon.jsp" %>
    <title>SLS | 已审核课件列表</title>
</head>
<body>
<div id="mainContent" class="easyui-panel" data-options="fit:true" style="padding: 10px">
    <form class="form-inline">
        课件名称<input type="text" class="input-medium" name="scormName" id="scormName" value=""/>
        <a class="btn btn-primary" onclick="query()">查询</a>
    </form>
    <table id="dataTable"></table>
</div>
</body>
</html>

<script type="text/javascript">
    function query() {
        listOption.url = basePath + "admin/scorm/listAuditScormInfo";
        listOption.data = "scormName=" + $("#scormName").val().trim();
        listOption.pageNumber = 1;
        loadData(listOption);
    }

    function initDataGrid() {
        $('#dataTable').datagrid({
            pagination: true,
            fitColumns: true,
            columns: [
                [
                    {field: 'scormName', title: '课件名', sortable: true, align: 'center', width: 100},
                    {field: 'description', title: '课件描述', align: 'center', width: 200},
                    {field: 'uploadDate', title: '上传日期', align: 'center', width: 150},
                    {field: 'totalTime', title: '观看总时间', sortable: true, align: 'center', width: 100},
                    {field: 'registerSum', title: '注册人数', sortable: true, align: 'center', width: 100},
                    {field: '22', title: '平均得分', sortable: true, align: 'center', width: 100},
                    {field: 'operate', title: '操作', align: 'center', width: 100}
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
                sortColumn = "scorm_Name";
                break;
            case "totalTime":
                sortColumn = "total_time";
                break;
            case "registerSum":
                sortColumn = "register_sum";
                break;
            case "":
                sortColumn = "";
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
            temp[i].operate = "<a onclick='scormInfo(\"" + temp[i].scormId + "\")'>查看</a>";
        }
        return temp;
    }

    function scormInfo(scormId) {
        var contentFrame = parent.$("#contentFrame");
        var dataEdit = parent.$('#dataEdit');
        contentFrame[0].contentWindow.document.write("");
        contentFrame.attr("src", basePath + "admin/scorm/scormInfo?scormId=" + scormId);
        dataEdit.dialog({
            title: '课件信息',
            height: document.documentElement.clientHeight + 100,
            width: document.documentElement.clientWidth - 100
        });
        dataEdit.dialog('open');
    }

    $(function () {
        initDataGrid();
        query();
    })
</script>