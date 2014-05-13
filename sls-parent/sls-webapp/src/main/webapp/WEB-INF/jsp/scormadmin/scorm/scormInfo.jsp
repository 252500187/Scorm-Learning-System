<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../../includes/adminCommon.jsp" %>
    <title>SLS | 课件信息</title>
</head>

<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span2">
            <div id="menuTree" class="ztree"
                 style="width:100%; height:100%; border: 0px solid; float: left; overflow-x:auto; overflow-y:auto ">
            </div>
        </div>
        <div class="span9">
            <iframe id="scormIframe" style="width:98%; height:800px;border:0px"
                    allowfullscreen>
            </iframe>
        </div>
        <div class="span1">
            <div class="row">
                信息
            </div>
            <div class="row">
                操作
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    var scormId = "${scorm.scormId}";
    var scoId = "";
    var nowScoId = "-1";
    var scoSrc = "";


    var settingMenu = {
        view: {
            expandSpeed: "fast"
        },
        check: {
            enable: false
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId"
            },
            key: {
                name: "name"
            },
            keep: {
                parent: true
            }
        },
        callback: {
            onClick: zTreeOnClick
        }
    };

    var zNodes = [
        <c:forEach var="scoNode" items="${scoList}">
        {id: "${scoNode.treeId}",
            pId: "${scoNode.treeParentId}",
            name: "(${scoNode.showStudyState})${scoNode.title}",
            src: "${scoNode.url}",
            scoId: "${scoNode.scoId}"},
        </c:forEach>
    ];

    function zTreeOnClick(event, treeId, treeNode) {
        if (treeNode.src.trim() == "") {
            return;
        }
        scoId = treeNode.scoId;
        nowScoId = scoId;
        $("#scormIframe").attr("src", treeNode.src);
        $("#upImgIframe").attr("src", basePath + "user/scorm/upStudyImgDo?scormId=" + scormId + "&scoId=" + nowScoId);
        $.ajax({
            url: basePath + "user/scorm/changeScoState?scormId=${scorm.scormId}&scoId=" + scoId,
            dataType: "json",
            type: "get",
            success: function () {

            },
            error: doError
        })
    }


    $(function () {
        $("#scormLogo").attr("src", basePath + "${scorm.imgPath}");
        $.fn.zTree.init($("#menuTree"), settingMenu, zNodes);
        $.fn.zTree.getZTreeObj("menuTree").expandAll(true);
        var i = Math.floor(Math.random() * 10);
        $("#scormIframe").attr("src", basePath + "img/studyscormdefaultimg/" + i + ".jpg");
        if (scoId != "") {
            if (confirm("是否继续上次学习进度")) {
                $("#scormIframe").attr("src", scoSrc);
            }
        }
    });

</script>