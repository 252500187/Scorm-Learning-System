function LineEditTable(tableId, tableObjectName, numOfLine) {
    this.numOfLine = numOfLine;
    this.numOfData = numOfLine;
    this.tableId = tableId;
    this.tableObjectName = tableObjectName;
}
function lockClass(tableId, lineNum) {
    var item = $("#" + tableId + " tr:eq(" + lineNum + ")" + " :input");
    item.attr("disabled", true).css("border", "none");
    item.css("box-shadow", "none");
    item.css("cursor", "default");
    item.css("background-color", "white");
}
function unlockClass(tableId, lineNum) {
    var item = $("#" + tableId + " tr:eq(" + lineNum + ")" + " :input");
    item.attr("disabled", false).css("border", "1px solid #aaa");
}
function edit(table, i) {
    unlockClass(table.tableId, i);
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html("保存");
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").attr("onclick", "save("
        + table.tableObjectName + ", " + i + "," + table.tableObjectName + "Save)");
}
function save(table, i, saveFunc) {
    if (saveFunc($("#" + table.tableId + " tr:eq(" + i + ")").attr("id").substr(3)) == false) {
        return;
    }
    lockClass(table.tableId, i);
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html("编辑");
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").attr("onclick", "edit("
        + table.tableObjectName + ", " + i + ")");
}
function update(table) {
    var i;
    for (i = 1; i <= table.numOfLine; ++i) {
        if ($("#" + table.tableId + " tr:eq(" + i + ") td:first-child :input").length == 0)
            $("#" + table.tableId + " tr:eq(" + i + ") td:first-child").html(i.toString(10));
        if ($("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html() == "保存") {
            $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").attr("onclick", "save("
                + table.tableObjectName + ", " + i + "," + table.tableObjectName + "Save)");
        }
        else {
            $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child")
                .attr("onclick", "edit(" + table.tableObjectName + "," + i + ")");
        }
        $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:last-child")
            .attr("onclick", "deleteLine(" + table.tableObjectName + "," + i + ", " + table.tableObjectName + "Delete)");
    }
}
function addLine(table, lineHtml, settingFunc, saveFunc) {
    if (saveFunc != undefined) {
        for (var i = 1; i < table.numOfLine - 1; ++i) {
            if ($("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html() == "保存") {
                --table.numOfLine;
                --table.numOfData;
                $.messager.alert("提示", "您尚有未保存的项目!");
                return;
            }
        }
        if ($("#" + table.tableId + " tr:last-child td:last-child a:first-child").html() == "保存" &&
            saveFunc($("#" + table.tableId + " tr:last-child").attr("id").substr(3)) == false) {
            --table.numOfLine;
            --table.numOfData;
            return;
        }
        $("#" + table.tableId + " tr:last-child td:last-child").html('<a onclick="edit(' + table.tableObjectName + ','
            + (table.numOfLine - 1) + ')">编辑</a>&nbsp;&nbsp;<a onclick="deleteLine(' + table.tableObjectName
            + ',' + (table.numOfLine - 1) + ', ' + table.tableObjectName + 'Delete)">删除</a>');
        lockClass(table.tableId, table.numOfLine - 1);
    }
    $("#" + table.tableId).append(lineHtml);
    if (settingFunc != undefined) {
        settingFunc(table.numOfData);
    }
    $("#" + table.tableId + " tr:last-child td:last-child").html('<a onclick="save(' + table.tableObjectName
        + ', ' + table.numOfLine + ',' + table.tableObjectName + 'Save)">保存</a>&nbsp;&nbsp;'
        + '<a onclick="deleteLine(' + table.tableObjectName + ',' + table.numOfLine + ', '
        + table.tableObjectName + 'Delete)">删除</a>');
}
function deleteLine(table, i, deleteFunc) {
    $.messager.confirm("提示", "确认删除？", function (r) {
        if (r) {
            deleteFunc($("#" + table.tableId + " tr:eq(" + i + ")").attr("id").substr(3));
            $("#" + table.tableId + " tr:eq(" + i + ")").remove();
            --table.numOfLine;
            update(table);
        }
    });
}
function auditLog(table, i, auditLogFunc) {
    var lineId = $("#" + table.tableId + " tr:eq(" + i + ")").attr("id").substr(3);
    auditLogFunc($("#" + table.tableObjectName + "Id" + lineId).val().trim());
}
function head(table, headHtmlFunc) {
    $("#" + table.tableId).append(headHtmlFunc());
}
function initInfo(table, lineHtmlFunc, settingFunc, initDataFunc) {
    for (var i = 1; i <= table.numOfLine; ++i) {
        addLine(table, lineHtmlFunc(i, i));
        settingFunc(i);
        lockClass(table.tableId, i);
        $("#" + table.tableId + " tr:last-child td:last-child").html('<a onclick="edit(' + table.tableObjectName + ','
            + i + ')">' + '编辑</a>&nbsp;&nbsp;' + '<a onclick="deleteLine('
            + table.tableObjectName + ', ' + i + ', ' + table.tableObjectName + 'Delete)">删除</a>'
        );
    }
    if (table.numOfLine > 0)
        initDataFunc();
}

function initNotEditAuditInfo(table, lineHtmlFunc, initDataFunc) {
    for (var i = 1; i <= table.numOfLine; ++i) {
        addLine(table, lineHtmlFunc(i, i));
        lockClass(table.tableId, i);
        $("#" + table.tableId + " tr:last-child td:last-child").html('<a onclick="auditLog('
            + table.tableObjectName + ', ' + i + ', ' + table.tableObjectName + 'AuditLog)">审核记录</a>'
        );
    }
    if (table.numOfLine > 0)
        initDataFunc();
}

function initPersonnelAuditInfo(table, lineHtmlFunc, settingFunc, initDataFunc) {
    for (var i = 1; i <= table.numOfLine; ++i) {
        addPersonnelAuditLine(table, lineHtmlFunc(i, i));
        settingFunc(i);
        lockClass(table.tableId, i);
    }
    if (table.numOfLine > 0)
        initDataFunc();
}

function addPersonnelAuditLine(table, lineHtml, settingFunc, saveFunc) {
    if (saveFunc != undefined) {
        for (var i = 1; i < table.numOfLine - 1; ++i) {
            if ($("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html() == "保存") {
                --table.numOfLine;
                --table.numOfData;
                $.messager.alert("提示", "您尚有未保存的项目!");
                return;
            }
        }
        if ($("#" + table.tableId + " tr:last-child td:last-child a:first-child").html() == "保存" &&
            saveFunc($("#" + table.tableId + " tr:last-child").attr("id").substr(3)) == false) {
            --table.numOfLine;
            --table.numOfData;
            return;
        }
        lockClass(table.tableId, table.numOfLine - 1);
    }
    $("#" + table.tableId).append(lineHtml);
    if (settingFunc != undefined) {
        settingFunc(table.numOfData);
    }
}
