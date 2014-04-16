function PublicityTable(tableId, tableObjectName, numOfLine) {
    this.numOfLine = numOfLine;
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
function publicityAddLine(table, lineHtml) {

    $("#" + table.tableId).append(lineHtml);
}
function initPublicityInfo(table, lineHtmlFunc,initDataFunc) {
    for (var i = 1; i <= table.numOfLine; ++i) {
        publicityAddLine(table, lineHtmlFunc(i, i));
        lockClass(table.tableId, i);
    }
    if (table.numOfLine > 0)
        initDataFunc();
}