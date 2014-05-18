<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>SLS | ScormTree</title>
    <%@include file="../../includes/common.jsp" %>
    <link rel="stylesheet" type="text/css"
          href="<c:url value="/js/common/zTree-v3.5.14/css/zTreeStyle/zTreeStyle.css"/>"/>
    <script src="<c:url value="/js/common/zTree-v3.5.14/js/jquery.ztree.all-3.5.min.js"/>"
            type="text/javascript"></script>
</head>
<body class="page-header-fixed">
<%@include file="../index/navigationMenu.jsp" %>
<div class="page-container">
    <div class="page-content">
        <div class="row">
            名称:${scorm.scormName}
            图片: ${scorm.imgPath}
            描述: ${scorm.description}

            <div id="scoTree" class="ztree"
                 style="width:100%; height:100%; border: 0px solid; float: left; overflow-x:auto; overflow-y:auto">
            </div>
        </div>
    </div>
</div>
<%@include file="../index/footer.jsp" %>
</body>
</html>
<script>
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
            }
        }
    };

    var zNodes = [
        <c:forEach var="scoNode" items="${scoList}">
        {id: "${scoNode.treeId}",
            pId: "${scoNode.treeParentId}",
            <c:if test="${scoNode.lastVisit==isLast}">
            name: "(${scoNode.showStudyState})${scoNode.title}(上次学到这了)",
            </c:if>
            <c:if test="${scoNode.lastVisit!=isLast}">
            name: "(${scoNode.showStudyState})${scoNode.title}",
            </c:if>
            src: "${scoNode.url}",
            scoId: "${scoNode.scoId}"},
        </c:forEach>
    ];

    $(function () {
        $.fn.zTree.init($("#scoTree"), settingMenu, zNodes);
    });
</script>