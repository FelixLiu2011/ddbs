<!DOCTYPE html><html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UploadPhoto</title>
    <link href="<%=path%>/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/common/font-awesome-4.6.3/css/font-awesome.min.css"/>
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <link href="<%=path%>/business/common/css/common.css" rel="stylesheet">
    <%--文件上传JS--%>
    <link rel="stylesheet" type="text/css" href="<%=path%>/common/bootstrap-fileupload/css/default.css">
    <link href="<%=path%>/common/bootstrap-fileupload/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="<%=path%>/common/bootstrap-fileupload/js/fileinput.js" type="text/javascript"></script>
    <script src="<%=path%>/common/bootstrap-fileupload/js/fileinput_locale_${local}.js" type="text/javascript"></script>
    <!--[if IE]>
        <script src="<%=path%>/common/bootstrap-fileupload/js/html5shiv.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var path = "<%=path%>";
    </script>
    <%--引入自定义JS--%>
    <script type="text/javascript" src="<%=path%>/business/photo/uploadPhoto.js"></script>
    <script type="text/javascript" src="<%=path%>/business/photo/language/${local}.js"></script>
    <link rel="stylesheet" href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css">
    <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>

    <style type="text/css">
        /*取消bootstrap row margin-left:-15px; margin-right:-15px;*/
        div.row {
            margin: 0;
        }
    </style>
</head>
<body>
<div class="htmleaf-container">
  <div class="row"><p class="bg-info text-info" style="height: 40px;line-height: 40px;margin-top: 5px;"><spring:message code="uploadPhoto" text="上传照片"/></p></div>
  <div class="container">
   <div class="row">
        <form class="form-horizontal" enctype="multipart/form-data">
              <div class="form-group">
                  <label class="col-xs-2 col-md-2" name="photoGroupLabel" for="photoGroup" style="padding-left:0!important;"><spring:message code="chooseAlbum" text="选择"/></label>
                  <select class="col-xs-4 col-md-6" id="photoGroup" name="photoGroup">
                     <%-- <option>默认分组</option>
                      <option>默认分组</option>
                      <option>默认分组</option>
                      <option>默认分组</option>
                      <option>默认分组</option>--%>
                  </select>
              </div>
            <div class="form-group">
                <label class="control-label" name="upload"><spring:message code="uploadPhoto" text="上传照片"/></label>
                <input type="file" class="file" multiple id="myfiles" name="myfiles"/>
            </div>
        </form>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $("#myfiles").fileinput({
            uploadUrl:path+"/fileUpload/fileUpload",
            maxFileCount:4,
            'showPreview': true,
            allowedFileTypes: ['image'],
            allowedFileExtensions:["png","jpeg","jpg","bmp","gif"],
            maxFileSize:3*1024,//上传限制3M
            uploadAsync:true,
            uploadExtraData:function () {
                return {
                    "photoGroupId":$("#photoGroup").val()
                }
            }
        });

        var allCount=0;
        $('#myfiles').on('fileselect', function(event, numFiles, label) {
            allCount=numFiles;
        });

        var currentCount=0;
        $('#myfiles').on('fileuploaded', function(event, file, previewId, index, reader) {
            currentCount++;
            if(currentCount==allCount){
                $.confirm({
                    title:"",
                    content:uploadMsg.saveSuccess,
                    autoClose: 'confirm|1000',
                    cancelButton:false
                });
                $("#myfiles").fileinput("clear");
                currentCount=0;
                //focus
                $("#myfiles").focus();
            }
        });
        $(".file-drop-zone").height("55%");
    });
</script>
</html>
