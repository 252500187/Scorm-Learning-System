<%--@elvariable id="dictName" type="java.lang.String"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../includes/adminCommon.jsp" %>
    <title><spring:message code="dictValues"/></title>
<body>
<div id="mainContent" class="easyui-panel" data-options="fit:true" style="padding: 10px">
    <form class="form-inline">
        <spring:message code="dictValue"/><input type="text" name="dictValue" id="dictValue" value=""/>
        <a class="btn btn-primary" onclick="query()"><spring:message code="query"/></a>
        <a class="btn btn-primary" onclick="back()"><spring:message code="pageBack"/></a>
        <a class="btn btn-primary" onclick="addDictValues()"><spring:message code="add"/></a>
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
        listOption.url = basePath + "user/dict/listAllDictValues?dictName=${dictName}";
        listOption.data = "dictValue=" + $("#dictValue").val();
        listOption.pageNumber = 1;
        loadData(listOption);
    }

    function back() {
        location.href = basePath + "user/dict/listAllDictDefineDo";
    }

    function initDataGrid() {
        $('#dataTable').datagrid({
            title: "<spring:message code="dictValues"/>",
            pagination: true,
            fitColumns: true,
            columns: [
                [
                    {field: 'dictName', title: '<spring:message code="dictName"/>', sortable: true, align: 'center', width: 200},
                    {field: 'dictCode', title: '<spring:message code="dictCode"/>', sortable: true, align: 'center', width: 200},
                    {field: 'dictValue', title: '<spring:message code="dictValue"/>', align: 'center', width: 100},
                    {field: 'operate', title: '<spring:message code="operate"/>', align: 'center', width: 200 }
                ]
            ],
            sortName: "",
            sortOrder: "asc",
            onSortColumn: onSortColumn
        });
    }

    function onSortColumn(sortColumn, sortDirection) {
        switch (sortColumn) {
            case "dictCode":
                sortColumn = "dict_code";
                break;
            case "dictValue":
                sortColumn = "dict_value";
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
            temp[i].operate = "<a onclick='editDictValues(\"" + temp[i].dictCode + "\")'><spring:message code="edit"/></a>&nbsp;&nbsp;"
                    + "<a onclick='delDictValues(\"" + temp[i].dictCode + "\")'><spring:message code="delete"/></a>&nbsp;&nbsp;";
        }
        return temp;
    }

    function addDictValues() {
        var path = basePath + "user/dict/addDictValuesDo?dictName=${dictName}";
        $("#contentList").attr("src", path);
        $('#dataEdit').dialog({
            title: '<spring:message code="add"/>',
            height: 400,
            width: 600
        }).dialog('open');
    }

    function editDictValues(dictCode) {
        var path = basePath + "user/dict/editDictValuesDo?dictName=${dictName}&dictCode=" + dictCode;
        $("#contentList").attr("src", path);
        $('#dataEdit').dialog({
            title: '<spring:message code="edit"/>',
            height: 400,
            width: 600
        }).dialog('open');
    }

    function delDictValues(dictCode) {
        $.messager.confirm("<spring:message code="prompt"/>", "<spring:message code="ensureDelete"/>？", function (r) {
            if (r) {
                $.ajax({
                    url: basePath + "user/dict/delDictValues?dictName=${dictName}" + "&dictCode=" + dictCode,
                    dataType: "json",
                    type: "DELETE",
                    success: function () {
                        $.messager.alert("<spring:message code="succeed"/>", "<spring:message code="deleteSucceed"/>！", "", function () {
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