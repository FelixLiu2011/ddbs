<!DOCTYPE html><html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<%
    String path=request.getContextPath();
%>
<head>
    <title>my friend</title>
    <title>Myspace</title>
    <meta charset="UTF-8">
    <link href="<%=path%>/common/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="<%=path%>/common/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="<%=path%>/common/bxslider/css/jquery.bxslider.css" rel="stylesheet"/>
    <link href="<%=path%>/business/common/css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css">
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <link  rel="stylesheet" href="<%=path%>/common/custom-loader/css/sllib.css"/>
    <script type="text/javascript" src="<%=path%>/common/custom-loader/js/loader.js"></script>
    <%--分页的JS--%>
    <script type="text/javascript" src="<%=path%>/common/bootstrap-paginator/js/bootstrap-paginator.js"></script>
    <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
        var localStr="<%=request.getAttribute("local")%>";
    </script>
    <style type="text/css">
        div.row{
            margin-left: 0;
        }
        body,html{
            overflow: hidden !important;
        }
    </style>
    <%--引入自定义样式--%>
    <link href="<%=path%>/business/common/css/friendList.css"/>
    <%--表情插件--%>
    <link href="<%=path%>/common/jquery-emotion/jquery-sinaEmotion-2.1.0.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/common/jquery-emotion/jquery-sinaEmotion-2.1.0.js"></script>
    <%--引入自定义JS--%>
    <script type="text/javascript" src="<%=path%>/business/common/js/header.js"></script>
    <script type="text/javascript" src="<%=path%>/business/myfriend/language/${local}.js"></script>
    <script type="text/javascript" src="<%=path%>/business/myfriend/friend.js"></script>
</head>
<body>
<div class="row">
    <div class="tabbable" id="tabs-my-friend">
        <ul class="nav nav-tabs">
            <li class="active" id="myFriendTab">
                <a href="#panel-myFriend" data-toggle="tab"><spring:message code="friendsList" text="好友列表"/></a>
            </li>
            <li id="myFriendApplyTab">
                <a href="#panel-tabs1" data-toggle="tab"><spring:message code="friendsApplication" text="好友申请"/></a>
            </li>
<%--            <li>
                <a href="#panel-tabs2" data-toggle="tab">好友邀请</a>
            </li>--%>
            <li id="myFriendGroupTab">
                <a href="#panel-tabs3" data-toggle="tab"><spring:message code="groupManage" text="分组管理"/></a>
            </li>
        </ul>
        <div class="tab-content">
            <%--我的好友列表--%>
            <div class="tab-pane active" id="panel-myFriend">
                <form class="form-horizontal" role="form">
                    <div class="col-md-6 form-group pull-left" style="margin-top: 10px;">
                        <select id="friendGroupCondition" class="form-control width80 input-sm">
                            <option>China</option>
                            <option>U.S.A</option>
                            <option>TaiWan</option>
                            <option>HuoXing</option>
                            <option>Star</option>
                        </select>
                    </div>
                    <div class="col-md-6  pull-left" style="margin-top: 10px;">
                        <div class="input-group width250" >
                            <input type="text" id="searchName" class="form-control input-sm" placeholder=<spring:message code="search" text="搜索"/>>
                             <span class="input-group-btn">
                                 <button class="btn btn-default input-sm" id="searchFriend" type="button"><spring:message code="search" text="搜索"/></button>
                             </span>
                        </div>
                    </div>
                </form>
                <%--列表内容--%>
                <div class="row clear-both" id="myFriendContentDiv" style="margin-top:10px;">
                </div>
                <%--分页--%>
                <div class="row clearfix" style="clear: both;">
                    <div class="col-md-12">
                        <!--分页控件-->
                        <ul class="pagination" id="myFriendPaginationDIV">
                        </ul>
                    </div>
                </div>
                <%--创建邮件弹出框 --%>

                <div class="modal fade" id="createEmailDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <input type="hidden" id="friendId">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabeTitle"><spring:message code="createEmail" text="新建邮件"/></h4>
                            </div>
                            <div class="modal-body">
                                <div role="tabpanel" class="tab-pane active" id="CreateEmail">
                                    <%--<textarea rows="5" id="emailContent" style="margin: 0px; height: 300px; width: 700px;"></textarea>--%>
                                        <div id="emailContent" style="margin: 0px;border-radius: 4px;height: 200px; width: 700px;border:1px solid gray;"
                                             contenteditable="true">
                                        </div>
                                        <img id="face" src="<%=path%>/common/images/Happy-25-b.png" style="width: 25px;height: 25px;cursor: pointer; margin-top: 5px;"/>
                                    <div class="row margin-top-10px">

                                    </div>
                                </div>
                                <p id="vipTip" class="bg-danger" style="height: 30px;line-height: 30px;margin-top: 10px;display: none;">
                                    <spring:message code="upgradeTip" text="Tip:已达到今天的发送上限!想使用更多，赶紧"></spring:message>
                                   <a href="javascript:void(0);" id="toVip"> <spring:message code="upgradeVip" text="升级为会员"></spring:message></a><spring:message code="upgradeLast" text="吧!"></spring:message>
                                </p>
                            </div>
                            <div class="modal-footer">
                                <label class="control-label pull-left margin-left-20px" id="friendLabel">
                                    <span class="inline-block" style="height: 30px;line-height: 30px;"><spring:message code="friendName" text="好友名字"/></span>
                                </label>
                                <select id="friendList" class="form-control width120 pull-left margin-left-10px"></select>
                                <button type="button" class="btn btn-default" id="closeModel" data-dismiss="modal"><spring:message code="close" text="关闭"/></button>
                                <button type="button" class="btn btn-primary" id="sendEmailBtn"><spring:message code="save" text="保存"/></button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <%--好友申请--%>
            <div class="tab-pane " id="panel-tabs1" align="center">
                <div class="row" id="myFriendApplyContentDiv"  style="margin-top:10px;">
                </div>
                <%--分页--%>
                <div class="row pull-left">
                    <div class="col-md-12">
                        <!--分页控件-->
                        <ul class="pagination" id="myFriendPaginationApplyDIV">
                        </ul>
                    </div>
                </div>
            </div>

            <div class="tab-pane " id="panel-tabs2">
            </div>
            <div class="tab-pane " id="panel-tabs3">
                <div class="row">
                    <button class="btn btn-group-sm btn-info pull-right" data-toggle="modal" data-backdrop="" autocomplete="off" data-groupname="" data-groupid="" data-target="#createMyFriendGroupDialog" style="margin-right: 35px;margin-top: 5px;margin-bottom: 5px;" id="addGroup"><spring:message code="addGroup" text="添加分类"/></button>
                </div>

                <%--创建分组弹出框 --%>
                <div class="modal fade" id="createMyFriendGroupDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <input type="hidden" id="userFriendGroupId">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel"><spring:message code="groupManage" text="管理好友分组"/></h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-md-10">
                                            <label for="userFriendGroupName" class="col-sm-2 control-label "><span class="inline-block width110">
                                                 <spring:message code="groupName" text="分组名称"/>
                                            </span></label>
                                            <span class="inline-block width280" style="margin-left: 5px;">
                                                <input class="col-md-2 form-control width250" id="userFriendGroupName" placeholder=<spring:message code="groupName" text="分组名称"/>>
                                            </span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" id="closeAddGroupModel" data-dismiss="modal"><spring:message code="close" text="关闭"/></button>
                                <button type="button" class="btn btn-primary" id="saveMyFriendGroup"><spring:message code="save" text="保存"/></button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox" name="types_checkbox"> </th>
                            <th><spring:message code="groupName" text="分类名称"/></th>
                            <th><spring:message code="createdTime" text="创建时间"/></th>
                            <th><spring:message code="action" text="操作"/></th>
                        </tr>
                        </thead>
                        <tbody id="myFriendGroupContentDiv">
                        </tbody>
                    </table>
                </div>
                <%--分页--%>
                <div class="row pull-left">
                    <div class="col-md-12">
                        <!--分页控件-->
                        <ul class="pagination" id="myFriendGroupPaginationDIV">
                        </ul>
                    </div>
                </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
