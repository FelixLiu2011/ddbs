<!DOCTYPE html><html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<%
    String path=request.getContextPath();
%>
    <head>
        <title>Blog</title>
        <meta charset="UTF-8">
        <link href="<%=path%>/common/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="<%=path%>/common/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet"/>
        <link href="<%=path%>/common/bxslider/css/jquery.bxslider.css" rel="stylesheet"/>
        <link href="<%=path%>/business/common/css/common.css" rel="stylesheet"/>
        <script src="<%=path%>/common/jquery/jquery.js"></script>
        <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=path%>/common/bootstrapvalidator/js/bootstrapValidator.js" type="text/javascript"></script>
        <link  rel="stylesheet" href="<%=path%>/common/custom-loader/css/sllib.css"/>
        <script type="text/javascript" src="<%=path%>/common/custom-loader/js/loader.js"></script>
        <script type="text/javascript" src="<%=path%>/common/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
        <script type="text/javascript" src="<%=path%>/common/bootstrap-datetimepicker/js/datePickerLocales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
        <%--分页--%>
        <script type="text/javascript" src="<%=path%>/common/bootstrap-paginator/js/bootstrap-paginator.js"></script>
        <script type="text/javascript">
            var path = "<%=path%>";
        </script>
        <style type="text/css">
            body,html{
                overflow: hidden !important;
                height:100%;
                width:100%;
            }
        </style>
        <link href="<%=path%>/common/bootstrapvalidator/css/bootstrapValidator.min.css" rel="stylesheet"/>
        <script src="<%=path%>/common/bootstrapvalidator/js/bootstrapValidator.min.js" type="text/javascript"></script>
        <script src="<%=path%>/common/bootstrapvalidator/js/language/${local}.js" type="text/javascript"></script>
        <%--datatime picker--%>
        <link href="<%=path%>/common/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <script type="text/javascript" src="<%=path%>/common/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
        <link href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css" rel="stylesheet">
        <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>
        <script type="text/javascript" src="<%=path%>/business/myspace/language/${local}.js"></script>
        <script type="text/javascript" src="<%=path%>/business/blog/language/${local}.js"></script>
        <%--引入业务JS --%>
        <script type="text/javascript" src="<%=path%>/business/blog/blog.js"></script>
    </head>
<body>
    <%--日志 start--%>
    <div class="tab-pane " id="panel-tabs2">
    <div class="panel">
        <div class="panel-heading">
            <div class="tabbable" id="tabs-295323">
                <ul class="nav nav-tabs" style="margin-left: -15px;">
                    <li class="active" id="myLogTab">
                        <a href="#panel-324017" data-toggle="tab"><spring:message code="myBlog" text="我的日志"/></a>
                    </li>
                    <li id="friendsLogTab">
                        <a href="#panel-8940" data-toggle="tab"><spring:message code="friendBlog" text="好友日志"/></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="tab-content">
            <%--我的日志 start--%>
            <div class="tab-pane active" id="panel-324017" style="height: 100%;">
                <%--创建日志 --%>
                <div class="row" style="margin-top: 5px;margin-bottom: 3px;">
                    <div>
                        <button style="margin-right: 15px;" type="button" id="createMyLog"  class="btn btn-info pull-right" data-toggle="modal" data-backdrop="" autocomplete="off" data-target="#createMyLogDialog">
                            <spring:message code="createLog" text="新建日志"/>
                        </button>
                    </div>
                </div>

                <div id="myLogContentDiv">
                </div>
                <%--我的日志分页--%>
                <ul id="myLogPagnationDiv"></ul>
            </div>
            <%--朋友日志  start--%>
            <div class="tab-pane" id="panel-8940">
                <div id="myFriendsLogContentDiv">
                </div>
                <%--我的日志分页--%>
                <ul id="myFriendsLogPagnationDiv"></ul>
            </div>
        </div>
    </div>
</div>
    <%--创建日志弹出框 --%>
    <div class="modal fade" id="createMyLogDialog" tabindex="-1" role="dialog" aria-labelledby="myLogDialogLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myLogDialogLabel"><spring:message code="newLog" text="新建日志"/></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="blogForm">
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                <label for="logTitle" class="col-sm-2 control-label "><span class="inline-block width110">
                                    <spring:message code="logTitle" text="日志标题"/>
                                </span></label>
                                <span class="inline-block width280" style="margin-left: 5px;">
                                    <input  class="form-control" id="logTitle" name="logTitle" placeholder="<spring:message code="logTitle" text="日志标题"/>">
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10 float-left">
                                <label for="logType" class="col-sm-2 control-label"><span class="inline-block width110">
                                <spring:message code="logType" text="日志分类"/>
                            </span></label>
                            <span class="inline-block width280" style="margin-left: 5px;">
                                <select id="logType" class="form-control">
                                </select>
                            </span>
                            </div>
                            <div style="height: 34px;line-height: 34px;" class="pull-left">
                                <a href="javascript:void(0)" id="addTypeHref" class="center"><spring:message code="addLogType" text="添加分类"/></a>
                            </div>
                            <div class="width250 float-left displayNone" id="addTypeDiv">
                                <input class="col-md-2 form-control width110 float-left" id="addTypeInput" placeholder="<spring:message code="typeName" text="分类名称"/>">
                                <button type="button" class="btn btn-primary float-left margin-left-5px" id="addTypeSaveBtn">
                                    <spring:message code="save" text="保存"/>
                                </button>
                                <button type="button" class="btn btn-default float-left margin-left-5px" id="addTypeCloseBtn">
                                    <spring:message code="cancel" text="取消"/>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                <label for="logTags" class="col-sm-2 control-label "><span class="inline-block width110">
                                    <spring:message code="logTags" text="日志标签"/>
                                </span></label>
                                <span class="inline-block width280" style="margin-left: 5px;">
                                    <input  class="form-control" id="logTags" placeholder="<spring:message code="logTags" text="日志标签"/>">
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                <label for="blogPrivilege" class="col-sm-2 control-label"><span class="inline-block width110">
                                     <spring:message code="logPrivilege" text="权 限"/>
                                 </span></label>
                                 <span class="inline-block width280" style="margin-left: 5px;">
                                 <span class="inline-block text-span"><input type="radio" id="blogPrivilege" checked="checked" name="blogPrivilege" value="0" style="margin-right: 5px;margin-top: 3px;"></span><span class="inline-block text-span"><spring:message code="privilegeAll" text="全部人可见"/></span>
                                 <span class="inline-block text-span margin-left-10px"><input type="radio" id="blogPrivilege2" name="blogPrivilege" value="1" style="margin-right: 5px;margin-top: 3px;"></span><span class="inline-block text-span"><spring:message code="privilegeMe" text="仅自己可见"/></span>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                <label for="logContent" class="col-sm-2 control-label float-left"><span class="inline-block width110">
                                    <spring:message code="logContent" text="日志内容"/>
                                </span></label>
                                <div class="float-left" style="margin-left: 5px;">
                                    <textarea rows="5" id="logContent" name="logContent" class="width280"></textarea>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeCreateBlogModelBtn" class="btn btn-default" data-dismiss="modal"><spring:message code="close" text="关闭"/></button>
                    <button type="button" id="saveMyBlogBtn" name="saveMyBlogBtn" class="btn btn-primary"><spring:message code="save" text="保存"/></button>
                </div>
            </div>
        </div>
    </div>

    <%--日志评论--%>
    <div class="modal fade" id="commentFriendBlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><spring:message code="commentTitle" text="评论"/></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal margin-left-20px " id="commentForm">
                        <div class="form-group">
                            <label for="logContent" class="control-label"><spring:message code="commentContent" text="评论内容"/></label>
                            <textarea rows="5" name="commentContent" id="commentContent" class="form-control" style="width: 90%;"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeCommentBtn" class="btn btn-default" data-dismiss="modal"><spring:message code="close" text="关闭"/></button>
                    <button type="button" id="saveCommentBtn" name="saveMyBlogBtn" data-loading-text=<spring:message code="saving" text="保存中..."/>  class="btn btn-primary"><spring:message code="save" text="保存"/></button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
