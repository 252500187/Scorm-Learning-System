var API = new API_functions();

function API_functions() {
    this.LMSInitialize = LMSInitialize;
    this.LMSSetValue = LMSSetValue;
    this.LMSGetValue = LMSGetValue;
    this.LMSCommit = LMSCommit;
    this.LMSFinish = LMSFinish;
    this.LMSGetLastError = LMSGetLastError;
    this.LMSGetErrorString = LMSGetErrorString;
}

function LMSInitialize(value) {
    //alert("LMSInitialize:" + value);
    var reCode = "";
    enterLMSAjax("INIT", "DoType=INIT&courseID=<%=courseID%>");
    return true;
}

function LMSSetValue(name, value) {
    //alert("LMSFrame,LMSSetValue:" + name + ":" + value);
    //enterLMSAjax("SET",value);

    switch (name) {
        case "cmi.core.student_id":
            buttonform.studentID.value = value;
            break;
        case "cmi.core.student_name":
            buttonform.studentName.value = value;
            break;
        case "cmi.core.lesson_location":
            buttonform.scoLocation.value = value;
            break;
        case "cmi.core.credit":
            buttonform.Credit.value = value;
            break;
        case "cmi.core.lesson_status":
            if (buttonform.runStatus.value != "completed") {
                buttonform.runStatus.value = value;
            }
            break;
        case "cmi.core.entry":
            buttonform.Entry.value = value;
            break;
        case "cmi.core.score":
            buttonform.score.value = value;
            break;
        case "cmi.core.score.raw":
            buttonform.score.value = value;
            break;
        case "cmi.core.total_time":
            buttonform.totalTime.value = value;
            break;
        case "cmi.core.lesson_mode":
            buttonform.lessonMode.value = value;
            break;
        case "cmi.core.exit":
            buttonform.LessonExit.value = value;
            break;
        case "cmi.core.session_time":
            buttonform.sessionTime.value = value;
            break;
        case "cmi.suspend_data":
            buttonform.SuspendData.value = value;
            break;
        default:
            break;
    }
    LMSCommit(value);
    return "";

}

function LMSGetValue(name) {
    //alert("LMSGetValue:" + name);
    var reCode = "";
    //reCode = enterLMSAjax("GET","");

    switch (name) {
        case "cmi.core.student_id":
            return buttonform.studentID.value;
            break;
        case "cmi.core.student_name":
            return buttonform.studentName.value;
            break;
        case "cmi.core.lesson_location":
            return buttonform.scoLocation.value;
            break;
        case "cmi.core.credit":
            return buttonform.Credit.value;
            break;
        case "cmi.core.lesson_status":
            return buttonform.runStatus.value;
            break;
        case "cmi.core.entry":
            return buttonform.Entry.value;
            break;
        case "cmi.core.score":
            return buttonform.score.value;
            break;
        case "cmi.core.score.raw":
            return buttonform.score.value;
            break;
        case "cmi.core.total_time":
            return buttonform.totalTime.value;
            break;
        case "cmi.core.lesson_mode":
            return buttonform.lessonMode.value;
            break;
        case "cmi.core.exit":
            return buttonform.LessonExit.value;
            break;
        case "cmi.core.session_time":
            return buttonform.sessionTime.value;
            break;
        case "cmi.suspend_data":
            return buttonform.SuspendData.value;
            break;
        default:
            break;
    }
    return reCode;
}

function LMSCommit(value) {
    //alert("LMSCommit:" + value);
    var reCode = "";
    var param = "DoType=COMM&courseID=" + buttonform.courseID.value;
    param += "&lessonMode=" + buttonform.lessonMode.value;
    param += "&runStatus=" + buttonform.runStatus.value;
    param += "&starttime=" + buttonform.StartTime.value;
    param += "&scoLocation=" + buttonform.scoLocation.value;
    param += "&score=" + buttonform.score.value;
    param += "&LessonExit=" + buttonform.LessonExit.value;
    param += "&Entry=" + buttonform.Entry.value;
    param += "&sessionTime=" + buttonform.sessionTime.value;
    param += "&SuspendData=" + buttonform.SuspendData.value;
    //param += "&LastSCOID=" + buttonform.LastSCOID.value;

    enterLMSAjax("COMM", param);
    return reCode;
}

function LMSFinish(value) {
    //alert("LMSFinish:" + value);
    var reCode = "";
    reCode = LMSCommit(value);
    //changeSCOContent();
    return reCode;
}

//通过ajax获得服务器当前时间
function GetServerTime() {
    var start = "";
    start = enterLMSAjax("TIME", "");
    return start;
}

function LMSGetLastError() {
    var reCode = "0";
    //reCode = enterLMSAjax("LastError","");
    return reCode;
}

function LMSGetErrorString(value) {
    var reCode = "";
    //reCode = enterLMSAjax("ErrorString",value);
    return reCode;
}

function enterLMSAjax(p_dotype, p_value) {
    //var DataToSend = "TaskName="+p_name+"&TaskValue="+p_value+"&DoType="+p_dotype;
    var xmlhttp;
    var reCode;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            reCode = xmlhttp.responseText;
            if (reCode.indexOf("<INIT>") >= 0) {
                accessInfo(reCode);
            }
        }
    }
    //xmlhttp.open("POST","ajaxScoData.jsp?TaskName="+p_name+"&TaskValue="+p_value+"&DoType="+p_dotype,true);
    xmlhttp.open("POST", "ajaxScoData.jsp", true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send(p_value);
}

function doConfirm() {
    if (confirm("现在退出学习记录将不能保存.  确认退出吗?")) {
        window.parent.frames[4].document.location.href = "LMSMenu.jsp";
    } else {
    }
}

function closeWin() {
    //alert("You have closed the window.22222");
    //parent.opener.location.reload();
}