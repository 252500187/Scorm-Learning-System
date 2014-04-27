var API = new API_functions();
//自定义1000到65535
var errorCode = "0";
var iniFlag = false;
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

function LMSInitialize(parameter) {
    //todo AJAX 通过scoId，获取所有信息到变量scoInfo
    scoInfo['cmi._version'] = "1.2";
    scoInfo['cmi.core._children'] = "cmi.core.student_id;cmi.core.student_name;cmi.core.lesson_location;cmi.core.credit;" +
        "cmi.core.lesson_status;cmi.core.entry;cmi.core.score;cmi.core.score.raw;cmi.core.total_time;" +
        "cmi.core.lesson_mode;cmi.core.exit;cmi.core.session_time;";
    scoInfo['cmi.suspend_data._children'] = "";
    scoInfo['cmi.core._count'] = "12";
    scoInfo['cmi.suspend_data._count'] = "0";

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
    iniFlag = true;
    return true;
}

function LMSSetValue(key, value) {
    key = key.toString();
    value = value.toString();
    if (iniFlag == false) {
        errorCode = "301";
        return false;
    }
    var test = key.substring(key.indexOf("._"), key.length);
    if ((test == "._version") || (test = "._children") || (test = "._count")) {
        errorCode = "403";
        return false;
    }
    scoInfo[key] = value;
    return true;

}

function LMSGetValue(key) {
    key = key.toString();
    if (iniFlag == false) {
        errorCode = "301";
        return "";
    }
    var test = key.substring(key.indexOf("._"), key.length);
    if ((scoInfo[key] == null) || (scoInfo[key] == "")) {
        if ((test == "._version")) {
            errorCode = "401";
            return "";
        }
        if ((test == "._children")) {
            errorCode = "202";
            return false;
        }
        if ((test == "._count")) {
            errorCode = "203";
            return "";
        }
    }
    if (scoInfo[key] == null) {
        errorCode = "401";
        return "";
    }
    return scoInfo[key];
}

function LMSCommit(parameter) {
    if (iniFlag == false) {
        errorCode = "301";
        return false;
    }
    //todo ajax传入数据库 通过scoId
    $.ajax({
        url: basePath + "/",
        data: {
            id: scoId,
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
            return true;
        },
        error: function () {
            errorCode = "1111";
            return false;
        }
    })
}

function LMSFinish(parameter) {
    if (iniFlag == false) {
        errorCode = "301";
        return false;
    }
    if (LMSCommit() == false) {
        errorCode = "1112";
        return false;
    }
    flag = false;
    return true;
}

function LMSGetLastError() {
    return errorCode;
}

function LMSGetErrorString(error) {
    error = error.toString().trim();
    errorCode = "0";
    switch (error) {
        case "":
            errorCode = "201";
            return "";
        case "0":
            return "Sorry:我检查了一下自己，还没有发现错误啊。";
        case "101":
            return "一般错误";
        case "201":
            return "参数无效";
        case "202":
            return "元素属性无子节点(children属性)";
        case "203":
            return "属性非集合类型，无count属性";
        case "301":
            return "LMS未初始化";
        case "401":
            return "未实现的数据元素模型";
        case "402":
            return "无效的setvalue操作，传递的element是关键字";
        case "403":
            return "元素属性只读";
        case "404":
            return "元素属性只写";
        case "405":
            return "错误的数据类型";
        case "1111":
            return "Sorry:信息没存进我的脑子里。亲！";
        case "1112":
            return "Sorry:结束的时候信息没存进我的脑子里。亲！";
        case "1115":
            return "这是我不知道的错误CODE。";
        default:
            errorCode = "1115";
            return "";
    }
}

function LMSGetDiagnostic(error) {
    error = error.toString().trim();
    errorCode = "0";
    switch (error) {
        case "":
            errorCode = "201";
            return "";
        case "0":
            return "没有问题，继续。";
        case "101":
            return "一般错误";
        case "201":
            return "参数无效";
        case "202":
            return "元素属性无子节点(children属性)";
        case "203":
            return "属性非集合类型，无count属性";
        case "301":
            return "LMS未初始化";
        case "401":
            return "未实现的数据元素模型";
        case "402":
            return "无效的setvalue操作，传递的element是关键字";
        case "403":
            return "元素属性只读";
        case "404":
            return "元素属性只写";
        case "405":
            return "错误的数据类型";
        case "1111":
            return "麻烦您再进行一次学习尝试，刚才我走神了，我这次努力记住。";
        case "1112":
            return "麻烦您再进行一次学习尝试，刚才我走神了，我这次努力记住。";
        case "1115":
            return "这是我不知道的错误CODE。";
        default:
            errorCode = "1115";
            return "";
    }
}