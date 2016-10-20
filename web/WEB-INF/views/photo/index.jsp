<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
    String path=request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Photo Index</title>
    <link href="<%=path%>/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/common/font-awesome-4.6.3/css/font-awesome.min.css"/>
    <link href="<%=path%>/common/bxslider/css/jquery.bxslider.css" rel="stylesheet">
    <link href="<%=path%>/common/bxslider/css/style.css" rel="stylesheet">
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <link href="<%=path%>/business/common/css/common.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/business/common/language/${local}.js"></script>
    <link rel="stylesheet" href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css">
    <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>
    <%--分页的JS--%>
    <script type="text/javascript" src="<%=path%>/common/bootstrap-paginator/js/bootstrap-paginator.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
    </script>
    <script type="text/javascript" src="<%=path%>/business/photo/language/${local}.js"></script>
    <script type="text/javascript" src="<%=path%>/business/photo/photo.js"></script>
    <%--引入自定义样式--%>
    <link type="text/css" href="<%=path%>/business/photo/photo.css" rel="stylesheet"/>
    <style type="text/css">
        html,body{
            overflow: hidden!important;
        }
    </style>
</head>
<body>
<div>
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" id="photoGroupTab" href="#myPhoto"><spring:message code="myAlbum" text="我的相册"/></a></li>
        <li><a data-toggle="tab" href="#myFriendPhoto" id="friendPhotoGroupTab"><spring:message code="friendAlbum" text="好友相册"/></a></li>
    </ul>
    <div class="tab-content">
        <div id="myPhoto" class="tab-pane fade in active">
            <%--新建相册与上传照片--%>
            <div class="row margin-top-10px">
                <button type="button" class="btn btn-info pull-right" style="margin-right: 17px;" id="addPhotoBtn"><spring:message code="uploadPhoto" text="上传照片"/></button>
                <button type="button" class="btn btn-info pull-right margin-right-15px"
                        data-toggle="modal" data-backdrop="" data-target="#createMyPhotoGroupDialog" data-groupid=""
                        autocomplete="off" id="addPhotoGroup"><spring:message code="createAlbum" text="新建相册"/></button>
            </div>
            <div id="myPhotoGroupContentDiv">
            </div>
            <!--分页控件-->
            <ul class="pagination" id="myPhotoGroupPaginationDIV">
            </ul>
        </div>
        <div id="myFriendPhoto" class="tab-pane fade">
            <div id="friendPhotoGroupContentDiv">
            </div>
            <!--分页控件-->
            <ul class="pagination" id="friendPhotoGroupPaginationDIV">
            </ul>
        </div>
    </div>

    <%--创建相册分组弹出框 --%>
    <div class="modal fade" id="createMyPhotoGroupDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><spring:message code="createAlbum" text="新建相册"/></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                <label for="photoGroupName" class="col-sm-2 control-label "><span class="inline-block width110">
                                    <spring:message code="albumName" text="相册名称"/>
                                </span></label>
                                <span class="inline-block width280" style="margin-left: 5px;">
                                    <input  class="form-control" id="photoGroupName" placeholder=<spring:message code="albumName" text="相册名称"/>>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                <label for="photoGroupDescription" class="col-sm-2 control-label float-left"><span class="inline-block width110">
                                    <spring:message code="albumDescription" text="相册描述"/>
                                </span></label>
                                <div class="float-left" style="margin-left: 10px;">
                                    <textarea rows="5" id="photoGroupDescription" class="width280"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                <label for="photoGroupTags" class="col-sm-2 control-label "><span class="inline-block width110">
                                    <spring:message code="albumTag" text="相册标签"/>
                                </span></label>
                                <span class="inline-block width280" style="margin-left: 5px;">
                                    <input  class="form-control" id="photoGroupTags" placeholder=<spring:message code="albumTag" text="相册标签"/>>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                <label for="privilege" class="col-sm-2 control-label"><span class="inline-block width110">
                                     <spring:message code="logPrivilege" text="权 限"/>
                                 </span></label>
                                 <span class="inline-block width280" style="margin-left: 5px;">
                                 <span class="inline-block text-span">
                                     <input type="radio" id="privilege" name="privilege" style="margin-right: 5px;margin-top: 3px;" value="2" checked="checked">
                                 </span><span class="inline-block text-span"><spring:message code="privilegeAll" text="全部人可见"/></span>
                                 <span class="inline-block text-span margin-left-10px">
                                     <input type="radio" id="privilege2" name="privilege" style="margin-right: 5px;margin-top: 3px;" value="0">
                                 </span><span class="inline-block text-span"><spring:message code="privilegeMe" text="仅自己可见"/></span>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeCreatePhotoGroupModelBtn" class="btn btn-default" data-dismiss="modal"><spring:message code="close" text="关闭"/></button>
                    <button type="button" id="savePhotoGroupBtn" name="savePhotoGroupBtn" class="btn btn-primary"><spring:message code="save" text="保存"/></button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
