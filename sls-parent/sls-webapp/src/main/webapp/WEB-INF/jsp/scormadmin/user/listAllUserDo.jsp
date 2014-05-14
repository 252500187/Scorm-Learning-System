<%--@elvariable id="myLoginId" type="java.lang.String"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../includes/adminCommon.jsp" %>
    <title>用户管理</title>
</head>
<body>
<div id="mainContent" class="easyui-panel" data-options="fit:true" style="padding: 10px">
    <form class="form-inline">
        帐号<input type="text" class="input-medium" name="loginName" id="loginName" value=""/>
        用户名<input type="text" class="input-medium" name="userName" id="userName" value=""/>
        <a class="btn btn-primary" onclick="query()"><spring:message code="query"/></a>
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
        listOption.url = basePath + "admin/user/listAllUser";
        listOption.data = "userName=" + $("#userName").val().trim()+ "&loginName=" + $("#loginName").val().trim();
        listOption.pageNumber = 1;
        loadData(listOption);
    }


    function shieldUser(id, operate) {
        $.messager.confirm("提示", "确认" + operate + "屏蔽用户？", function (r) {
            if (r) {
                $.ajax({
                    url: basePath + "admin/admin/shieldUser?id=" + id,
                    dataType: "json",
                    type: "POST",
                    success: function () {
                        $.messager.alert("成功", operate + "屏蔽成功！", "", function () {
                            query();
                        })
                    },
                    error: doError
                })
            }
        })
    }

    function initDataGrid() {
        $('#dataTable').datagrid({
            title: "用户列表",
            pagination: true,
            fitColumns: true,
            columns: [
                [
                    {field: 'loginName', title: '账号', sortable: true, align: 'center', width: 200},
                    {field: 'userName', title: '用户名', sortable: true, align: 'center', width: 200},
                    {field: 'roleName', title: '角色', align: 'center', width: 100},
                    {field: 'registerDate', title: '注册日期', align: 'center', width: 200},
                    {field: 'upLoadScormNum', title: '上传课件数', align: 'center', width: 100},
                    {field: 'score', title: '得分', align: 'center', width: 200},
                    {field: 'email', title: 'email', align: 'center', width: 200},
                    {field: 'showInUse', title: '状态', align: 'center', width: 200},
                    {field: 'edit', title: '操作', align: 'center', width: 200}
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
        var operate = "";
        for (var i in temp) {
            operate = "";
            if (temp[i].state == "${shield}") {
                operate = "取消";
            }
            editBtn = "&nbsp;<a onclick=shieldUser(" + temp[i].id + ",'" + operate + "')>" + operate + "屏蔽</a>&nbsp;";
            temp[i].edit = editBtn;
            rowDataList.push(temp[i]);
        }
        return rowDataList;
    }

    $(function () {
        initDataGrid();
        query();
    })
</script>