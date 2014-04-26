<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@include file="../includes/common.jsp" %>
    <script src="<c:url value="/js/ScormAPI.js"/>" type="text/javascript"></script>
</head>
<body>
<div>
    <img src="" id="logo" width="100" height="100"/>

    <div id="menuTree" class="ztree"
         style="width:200px; height:600px; border: 1px solid; float: left; overflow-x:auto "/>
</div>
<div>
    <iframe id="scorm" height="600" width="1000"></iframe>
</div>
</body>
</html>
<script>
    $(function () {
        $("#logo").attr("src", basePath + "${jpg}");
        $.fn.zTree.init($("#menuTree"), settingMenu, zNodes);
        $.fn.zTree.getZTreeObj("menuTree").expandAll(true);
    });

    var settingMenu = {
        view: {
            expandSpeed: "fast"
        },
        check: {
            enable: true,
            chkStyle: "checkbox",
            chkboxType: { "Y": "p", "N": "s" }
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
        <c:forEach var="scormNode" items="${scormNodes}">
        {id: "${scormNode.xmalId}",
            pId: "${scormNode.parentId}",
            name: "${scormNode.title} type:${scormNode.type}",
            type: "${scormNode.type}",
            src: "${scormNode.url}"},
        </c:forEach>
    ];

    var scoId;

    function zTreeOnClick(event, treeId, treeNode) {
        if (treeNode.src.trim() == "") {
            return;
        }
        $("#scorm").attr("src", treeNode.src);
        //todo 对应数据的id
        scoId = treeNode.id;
    }
</script>