<%--@elvariable id="myLoginId" type="java.lang.String"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | WELCOME to SLS</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <%@include file="../../includes/adminCommon.jsp" %>
    <title>用户表</title>
</head>
<body>
<div id="mainContent" class="easyui-panel" data-options="fit:true" style="padding: 10px">
    <form class="form-inline">
        帐号<input type="text" class="input-medium" name="loginName" id="loginName" value=""/>
        用户名<input type="text" class="input-medium" name="userName" id="userName" value=""/>
        <span>
            角色<input type="text" name="roleName" id="roleName" value="" class="input-medium"
                     flag="allRoles" autocomplete="off"/>
            <input type="hidden" name="roleId" id="roleId" value="" autoHidden="autoHidden">
        </span>
        <span>
            状态<input type="text" name="stateName" id="stateName" value="" class="input-medium"
                     flag="allRoles" autocomplete="off"/>
            <input type="hidden" name="stateId" id="stateId" value="" autoHidden="autoHidden">
        </span>
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
        listOption.url = basePath + "admin/admin/listAllUser";
        listOption.data = "loginName=" + $("#loginName").val().trim() + "&userName=" + $("#userName").val().trim()
                + "&showRoleId=" + $("#roleId").val();
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
                    {field: 'loginName', title: '帐号', sortable: true, align: 'center', width: 300},
                    {field: 'userName', title: '用户名', sortable: true, align: 'center', width: 100},
                    {field: 'showRoleId', title: '角色', align: 'center', width: 200},
                    {field: 'state', title: '状态', align: 'center', width: 200},
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