var API = new API_functions();
var scoInfo = {};

function API_functions() {
    this.LMSInitialize = LMSInitialize;
    this.LMSSetValue = LMSSetValue;
    this.LMSGetValue = LMSGetValue;
    this.LMSCommit = LMSCommit;
    this.LMSFinish = LMSFinish;
    this.LMSGetLastError = LMSGetLastError;
    this.LMSGetErrorString = LMSGetErrorString;
    this.LMSGetDiagnostic = LMSGetDiagnostic;
}

function LMSInitialize() {
    //todo AJAX 通过scoId，获取所有信息到变量scoInfo
    scoInfo['cmi.core.student_id'] = "";
    scoInfo['cmi.core.student_name'] = "";
    scoInfo['cmi.core.lesson_location'] = "";
    scoInfo['cmi.core.credit'] = "";
    scoInfo['cmi.core.lesson_status'] = "";
    scoInfo['cmi.core.entry'] = "";
    scoInfo['cmi.core.score'] = "";
    scoInfo['cmi.core.score.raw'] = "";
    scoInfo['cmi.core.total_time'] = "";
    scoInfo['cmi.core.lesson_mode'] = "";
    scoInfo['cmi.core.exit'] = "";
    scoInfo['cmi.core.session_time'] = "";
    scoInfo['cmi.suspend_data'] = "";
    return true;
}

function LMSSetValue(key, value) {
    scoInfo[key] = value;
    return "";

}

function LMSGetValue(key) {
    return scoInfo[key] == null ? "" : scoInfo[key];
}

function LMSCommit() {
    //todo ajax传入数据库 通过scoId
    $.ajax({
        url: basePath + "admin/user/addUser",
        data: {
            coreStudentId: scoInfo['cmi.core.student_id'],
            coreStudentName: scoInfo['cmi.core.student_name'],
            coreLessonLocation: scoInfo['cmi.core.lesson_location'],
            coreCredit: scoInfo['cmi.core.credit'],
            coreLessonStatus: scoInfo['cmi.core.lesson_status'],
            coreEntry: scoInfo['cmi.core.entry'],
            coreScore: scoInfo['cmi.core.score'],
            coreScoreRaw: scoInfo['cmi.core.score.raw'],
            coreTotalTime: scoInfo['cmi.core.total_time'],
            coreLessonMode: scoInfo['cmi.core.lesson_mode'],
            coreExit: scoInfo['cmi.core.exit'],
            coreSessionTime: scoInfo['cmi.core.session_time'],
            suspendData: scoInfo['cmi.suspend_data']
        },
        dataType: "json",
        type: "POST",
        success: function () {
        },
        error: doError
    })
    return true;
}

function LMSFinish(value) {
    return "";
}

function LMSGetLastError() {
    return "";
}

function LMSGetErrorString(value) {
    return "";
}

function LMSGetDiagnostic() {
    return "";
}