<%--
  Created by IntelliJ IDEA.
  User: genghis9
  Date: 14-5-10
  Time: 下午3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%@include file="../../includes/common.jsp" %>
</head>
<body>

<div class="page-container">

    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="row ">
                <div class="col-md-12 col-sm-12">
                    <div class="chat-form">
                        传张图片？
                        <form target="upImgIframe" id="upImgForm" enctype="multipart/form-data">
                            <div class="form-group">
                                <div class="col-md-9">
                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                                       <span class="btn default btn-file">
                                                           <span class="fileinput-new">
                                                                选图
                                                           </span>
                                                           <span class="fileinput-exists">
                                                                换一个
                                                           </span>
                                                           <input type="file" id="noteImg" name="noteImg">
                                                       </span>
                                        <span class="row fileinput-filename"></span>
                                        <a href="#" class="close fileinput-exists" data-dismiss="fileinput"
                                           style="float: none">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-cont">
                								<span class="arrow">
                								</span>
                                <a onclick="upStudyImg()" class="btn blue icn-only">
                                    <i class="fa fa-check icon-white"></i>
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<script>
    $(function (){
        if("${close}"!=""){
            window.close();
        }
    })
    function upStudyImg() {
        var imgType = $("#noteImg").val().substr($("#noteImg").val().length - 3, 3);
        if ((imgType != "jpg") && (imgType != "png") && (imgType != "gif")) {
            alert("必须是图片格式！");
            return;
        }
        alert("${scormId}+=${scoId}");
        $("#upImgForm").attr("method", "post").attr("action",
                basePath + "user/scorm/upStudyImg?scormId=${scormId}&scoId=${scoId}").submit();
    }
</script>