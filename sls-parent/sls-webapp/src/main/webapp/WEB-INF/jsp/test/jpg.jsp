<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <%@include file="../includes/common.jsp" %>
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/js/common/zTree-v3.5.14/css/zTreeStyle/zTreeStyle.css"/>"/>
    <script src="<c:url value="/js/common/zTree-v3.5.14/js/jquery.ztree.all-3.5.min.js"/>"
            type="text/javascript"></script>
</head>
<body>
<img src="" id="a" width="300" height="300"/>
<ul id="menuTree" class="ztree">aa</ul>
</body>
</html>
<script>
    $("#a").attr("src", basePath + "${jpg}");

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
        }
    };


    var zNodes = [
        <c:forEach var="scormNode" items="${scormNodes}">
        {id: "${scormNode.xmalId}",
            pId: "${scormNode.parentId}",
            name: "${scormNode.type}"},
        </c:forEach>
    ];

    $(function () {
        $.fn.zTree.init($("#menuTree"), settingMenu, zNodes);
        var treeObj = $.fn.zTree.getZTreeObj("menuTree");
        treeObj.expandAll(true);
    });
</script>