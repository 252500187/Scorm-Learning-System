function AuditTable(tableId, tableObjectName, numOfLine) {
    this.numOfLine = numOfLine;
    this.tableId = tableId;
    this.tableObjectName = tableObjectName;
}
function auditLock(tableId, lineIndex) {
    var numOfTd = $("#" + tableId + " tr:eq(" + lineIndex + ")" + " td").length;
    $("#" + tableId + " tr:eq(" + lineIndex + ")" + " :input").attr("disabled", true).css("border", "none").css("background-color", "white");
    $("#" + tableId + " tr:eq(" + lineIndex + ")" + " td:gt(" + (numOfTd - 7) + ") input").css("border", "1px solid #aaa").attr("disabled", false);
}


function postAuditLock(tableId, lineIndex) {
    var numOfTd = $("#" + tableId + " tr:eq(" + lineIndex + ")" + " td").length;
    $("#" + tableId + " tr:eq(" + lineIndex + ")" + " :input").attr("disabled", true).css("border", "none").css("background-color", "white");
    $("#" + tableId + " tr:eq(" + lineIndex + ")" + " td:eq(1) input").css("border", "1px solid #aaa").attr("disabled", false);
}

function auditLockChangLast(tableId, lineIndex) {
    var numOfTd = $("#" + tableId + " tr:eq(" + lineIndex + ")" + " td").length;
    $("#" + tableId + " tr:eq(" + lineIndex + ")" + " :input").attr("disabled", true).css("border", "none").css("background-color", "white");
    $("#" + tableId + " tr:eq(" + lineIndex + ")" + " td:gt(" + (numOfTd - 4) + ") input").css("border", "1px solid #aaa").attr("disabled", false);
}
function auditLockChangLastTwo(tableId, lineIndex) {
    var numOfTd = $("#" + tableId + " tr:eq(" + lineIndex + ")" + " td").length;
    $("#" + tableId + " tr:eq(" + lineIndex + ")" + " :input").attr("disabled", true).css("border", "none").css("background-color", "white");
    $("#" + tableId + " tr:eq(" + lineIndex + ")" + " td:gt(" + (numOfTd - 5) + ") input").css("border", "1px solid #aaa").attr("disabled", false);
}
function auditEdit(table, i) {
    auditLock(table.tableId, i);
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html("保存");
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").attr("onclick", "save("
        + table.tableObjectName + ", " + i + "," + table.tableObjectName + "Save)");
}

function auditEditChangLast(table, i) {
    auditLockChangLast(table.tableId, i);
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html("保存");
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").attr("onclick", "save("
        + table.tableObjectName + ", " + i + "," + table.tableObjectName + "Save)");
}
function auditEditChangLastTwo(table, i) {
    auditLockChangLastTwo(table.tableId, i);
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html("保存");
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").attr("onclick", "save("
        + table.tableObjectName + ", " + i + "," + table.tableObjectName + "Save)");
}
function auditSave(table, lineIndex, saveFunc) {
    saveFunc($("#" + table.tableId + " tr:eq(" + lineIndex + ")").attr("id").substr(3));
}
function auditLog(table, lineIndex, auditLogFunc) {
    var lineId = $("#" + table.tableId + " tr:eq(" + lineIndex + ")").attr("id").substr(3);
    auditLogFunc($("#" + table.tableObjectName + "Id" + lineId).val().trim());
}
function auditAddLine(table, lineHtml) {
    $("#" + table.tableId).append(lineHtml);
}
//function initAuditInfo(table, lineHtmlFunc, initDataFunc) {
//    for (var i = 1; i <= table.numOfLine; ++i) {
//        auditAddLine(table, lineHtmlFunc(i, i));
//        auditLock(table.tableId, i);
//        $("#" + table.tableId + " tr:last-child td:last-child").html('<a onclick="auditSave(' + table.tableObjectName + ','
//            + i + ', ' + table.tableObjectName + 'Save)">' + '保存</a>&nbsp;&nbsp;' + '<a onclick="auditLog('
//            + table.tableObjectName + ', ' + i + ', ' + table.tableObjectName + 'AuditLog)">审核记录</a>'
//        );
//    }
//    if (table.numOfLine > 0)
//        initDataFunc();
//}

function initAuditInfo(table, lineHtmlFunc, settingFunc, initDataFunc) {
    for (var i = 1; i <= table.numOfLine; ++i) {
        auditAddLine(table, lineHtmlFunc(i, i));
        settingFunc(i);
        lockClass(table.tableId, i);
        $("#" + table.tableId + " tr:last-child td:last-child").html('<a onclick="highAuditEdit(' + table.tableObjectName + ','
            + i + ')">' + '编辑</a>&nbsp;&nbsp;' + '<a onclick="auditLog('
            + table.tableObjectName + ', ' + i + ', ' + table.tableObjectName + 'AuditLog)">审核记录</a>'
        );
    }
    if (table.numOfLine > 0)
        initDataFunc();
}

function finalAuditEdit(table, i) {
    finalAuditLock(table.tableId, i);
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html("保存");
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").attr("onclick", "finalAuditSave("
        + table.tableObjectName + ", " + i + "," + table.tableObjectName + "Save)");
}
function finalAuditLock(tableId, lineIndex) {
    var numOfTd = $("#" + tableId + " tr:eq(" + lineIndex + ")" + " td").length;
    $("#" + tableId + " tr:eq(" + lineIndex + ")" + " :input").attr("disabled", true).css("border", "none").css("background-color", "white");
    $("#" + tableId + " tr:eq(" + lineIndex + ")" + " td:gt(" + (numOfTd - 4) + ") input").css("border", "1px solid #aaa").attr("disabled", false);
}
function finalAuditSave(table, i, saveFunc) {
    if (saveFunc($("#" + table.tableId + " tr:eq(" + i + ")").attr("id").substr(3)) == false) {
        return;
    }
    lockClass(table.tableId, i);
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html("编辑");
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").attr("onclick", "finalAuditEdit("
        + table.tableObjectName + ", " + i + ")");
}

function highAuditEdit(table, i) {
    auditLock(table.tableId, i);
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html("保存");
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").attr("onclick", "auditSave("
        + table.tableObjectName + ", " + i + "," + table.tableObjectName + "Save)");
}
function postGraduateEdit(table, i) {
    postAuditLock(table.tableId, i);
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html("保存");
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").attr("onclick", "postGraduateSave("
        + table.tableObjectName + ", " + i + "," + table.tableObjectName + "Save)");
}
function postGraduateSave(table, i, saveFunc) {
    if (saveFunc($("#" + table.tableId + " tr:eq(" + i + ")").attr("id").substr(3)) == false) {
        return;
    }
    lockClass(table.tableId, i);
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html("编辑");
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").attr("onclick", "postGraduateEdit("
        + table.tableObjectName + ", " + i + ")");
}

function auditSave(table, i, saveFunc) {
    if (saveFunc($("#" + table.tableId + " tr:eq(" + i + ")").attr("id").substr(3)) == false) {
        return;
    }
    lockClass(table.tableId, i);
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").html("编辑");
    $("#" + table.tableId + " tr:eq(" + i + ") td:last-child a:first-child").attr("onclick", "highAuditEdit("
        + table.tableObjectName + ", " + i + ")");
}

function initAuditInfoChangLastTwo(table, lineHtmlFunc,settingFunc, initDataFunc) {
    for (var i = 1; i <= table.numOfLine; ++i) {
        auditAddLine(table, lineHtmlFunc(i, i));
        settingFunc(i);
        lockClass(table.tableId, i);
        $("#" + table.tableId + " tr:last-child td:last-child").html('<a onclick="auditEditChangLastTwo(' + table.tableObjectName + ','
            + i + ', ' + table.tableObjectName + 'Save)">' + '编辑</a>&nbsp;&nbsp;' + '<a onclick="auditLog('
            + table.tableObjectName + ', ' + i + ', ' + table.tableObjectName + 'AuditLog)">审核记录</a>'
        );
    }
    if (table.numOfLine > 0)
        initDataFunc();
}
function initAuditInfoChangLast(table, lineHtmlFunc,settingFunc, initDataFunc) {
    for (var i = 1; i <= table.numOfLine; ++i) {
        auditAddLine(table, lineHtmlFunc(i, i));
        settingFunc(i);
        lockClass(table.tableId, i);
        $("#" + table.tableId + " tr:last-child td:last-child").html('<a onclick="auditEditChangLast(' + table.tableObjectName + ','
            + i + ', ' + table.tableObjectName + 'Save)">' + '编辑</a>&nbsp;&nbsp;' + '<a onclick="auditLog('
            + table.tableObjectName + ', ' + i + ', ' + table.tableObjectName + 'AuditLog)">审核记录</a>'
        );
    }
    if (table.numOfLine > 0)
        initDataFunc();
}
function initPersonnelAwardAuditInfo(table, lineHtmlFunc, settingFunc, initDataFunc) {
    for (var i = 1; i <= table.numOfLine; ++i) {
        auditAddLine(table, lineHtmlFunc(i, i));
        settingFunc(i);
        lockClass(table.tableId, i);
        $("#" + table.tableId + " tr:last-child td:last-child").html('<a onclick="highAuditEdit(' + table.tableObjectName + ','
            + i + ')">' + '编辑</a>&nbsp;&nbsp;' + '<a onclick="auditLog('
            + table.tableObjectName + ', ' + i + ', ' + table.tableObjectName + 'AuditLog)">审核记录</a>'
        );
    }
    if (table.numOfLine > 0)
        initDataFunc();
}
function initFinalAuditInfo(table, lineHtmlFunc, settingFunc, initDataFunc) {
    for (var i = 1; i <= table.numOfLine; ++i) {
        auditAddLine(table, lineHtmlFunc(i, i));
        settingFunc(i);
        lockClass(table.tableId, i);
        $("#" + table.tableId + " tr:last-child td:last-child").html('<a onclick="finalAuditEdit(' + table.tableObjectName + ','
            + i + ')">' + '编辑</a>&nbsp;&nbsp;' + '<a onclick="auditLog('
            + table.tableObjectName + ', ' + i + ', ' + table.tableObjectName + 'AuditLog)">审核记录</a>'
        );
    }
    if (table.numOfLine > 0)
        initDataFunc();
}
function initPostGraduateEditAuditInfo(table, lineHtmlFunc, settingFunc, initDataFunc) {
    for (var i = 1; i <= table.numOfLine; ++i) {
        auditAddLine(table, lineHtmlFunc(i, i));
        settingFunc(i);
        lockClass(table.tableId, i);
        $("#" + table.tableId + " tr:last-child td:last-child").html('<a onclick="postGraduateEdit(' + table.tableObjectName + ','
            + i + ')">' + '编辑</a>&nbsp;&nbsp;' + '<a onclick="auditLog('
            + table.tableObjectName + ', ' + i + ', ' + table.tableObjectName + 'AuditLog)">审核记录</a>'
        );
    }
    if (table.numOfLine > 0)
        initDataFunc();
}

function initNotEditPersonnelAwardAuditInfo(table, lineHtmlFunc, settingFunc, initDataFunc) {
    for (var i = 1; i <= table.numOfLine; ++i) {
        auditAddLine(table, lineHtmlFunc(i, i));
        settingFunc(i);
        lockClass(table.tableId, i);
        $("#" + table.tableId + " tr:last-child td:last-child").html('<a onclick="auditLog('
            + table.tableObjectName + ', ' + i + ', ' + table.tableObjectName + 'AuditLog)">审核记录</a>'
        );
    }
    if (table.numOfLine > 0)
        initDataFunc();
}