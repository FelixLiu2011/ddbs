<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<%=path%>/common/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="<%=path%>/business/common/css/common.css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=path%>/business/common/language/${local}.js"></script>
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <link  rel="stylesheet" href="<%=path%>/common/custom-loader/css/sllib.css"/>
    <script type="text/javascript" src="<%=path%>/common/custom-loader/js/loader.js"></script>
    <%--分页--%>
    <script type="text/javascript" src="<%=path%>/common/bootstrap-paginator/js/bootstrap-paginator.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
        var currentLoginUserId = "<%=request.getAttribute("currentLoginUserId")%>"
        var localStr="<%=request.getAttribute("local")%>";
    </script>
   <%-- <script type="text/javascript" src="<%=path%>/business/index/index.js"></script>--%>
    <script type="text/javascript" src="<%=path%>/business/email/language/${local}.js"></script>
    <script type="text/javascript" src="<%=path%>/business/email/email.js"></script>
    <link  rel="stylesheet" href="<%=path%>/common/custom-loader/css/sllib.css"/>
    <script type="text/javascript" src="<%=path%>/common/custom-loader/js/loader.js"></script>
    <link href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>
    <%--表情插件--%>
    <link href="<%=path%>/common/jquery-emotion/jquery-sinaEmotion-2.1.0.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/common/jquery-emotion/jquery-sinaEmotion-2.1.0.js"></script>
   <style type="text/css">
        html,body{
            overflow: hidden;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#SendEmailBox" id="sendMailTab" data-toggle="tab"><spring:message code="outBox" text="发件箱"/></a></li>
            <li ><a href="#ReceiveEmailBox" id="receiveMailTab" data-toggle="tab"><spring:message code="inBox" text="收件箱"/></a></li>
            <li ><a href="#CreateEmail" data-toggle="tab" id="createEmailTab"><spring:message code="createEmail" text="新建邮件"/></a></li>
        </ul>
    </div>

    <div class="row">
        <div class="tab-content margin-top-10px">
            <div role="tabpanel" class="tab-pane active" id="SendEmailBox">
                    <form id="sendEmailListDiv" class="form-horizontal" role="form">
                    </form>
                <div class="col-md-12">
                    <!--分页控件-->
                    <ul class="pagination" id="emailSendPaginationDIV">
                    </ul>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane" id="ReceiveEmailBox">
                <form id="receiveEmailListDiv" class="form-horizontal" role="form">
                </form>
                <div class="col-md-12">
                    <!--分页控件-->
                    <ul class="pagination" id="emailReceivePaginationDIV">
                    </ul>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane" id="CreateEmail">
                <div id="emailContentDiv">
                    <%--<textarea rows="5" id="emailContent" style="margin: 0px; height: 350px; width: 746px;"></textarea>--%>
                    <div id="emailContent" style="margin: 0px;border-radius: 4px;height: 250px; width: 746px;border:1px solid gray;"
                         contenteditable="true">
                    </div>
                    <img id="face" src="<%=path%>/common/images/Happy-25-b.png" style="width: 25px;height: 25px;cursor: pointer; margin-top: 5px;"/>
                    <div class="row margin-top-10px">
                        <label class="control-label pull-left margin-left-20px">
                            <span class="inline-block" style="height: 30px;line-height: 30px;"><spring:message code="friendName" text="好友名字"/></span>
                        </label>
                        <select id="friendList" class="form-control width120 pull-left margin-left-10px disabled">
                        </select>
                        <button class="btn btn-info pull-right margin-right-15px" type="button" id="sendEmailBtn"><spring:message code="save" text="保存"/></button>
                    </div>
                </div>
                <p id="vipTip" class="bg-danger" style="height: 30px;line-height: 30px;margin-top: 10px;display: none;">
                    <spring:message code="upgradeTip" text="Tip:已达到今天的发送上限!想使用更多，赶紧"></spring:message>
                    <a href="javascript:void(0);" id="toVip"> <spring:message code="upgradeVip" text="升级为会员"></spring:message></a><spring:message code="upgradeLast" text="吧!"></spring:message>
                </p>
            </div>

        </div>
    </div>

    <%--邮件详情的dialog--%>
    <div class="modal fade" id="emailDetailDiv" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="emailDetailLabel"><spring:message code="emailInfo" text="邮件详情"/></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="headPhotoForm">
<%--                        <div>
                            <textarea id="replyTxtArea" rows="5" cols="97"></textarea>
                        </div>--%>
                        <div id="replyTxtArea" style="margin: 0px;border-radius: 4px;height: 150px; width: 700px;border:1px solid gray;"
                             contenteditable="true">
                        </div>
                        <img id="face1" src="<%=path%>/common/images/Happy-25-b.png" style="width: 25px;height: 25px;cursor: pointer; margin-top: 5px;"/>
                        <div class="margin-top-10px clear-both" >
                           <button type="button" class="btn btn-info float-right" style="margin-bottom: 5px;" id="replyBtn"><spring:message code="reply" text="回复"/></button>
                        </div>
                    </form>
                    <%--分页显示--%>
                   <div id="contentDiv" class="clear-both">
                       <div class="panel panel-warning">
                           <div class="panel-body">
                               <p style="font-style: italic;font-size: 12px;">来自XXX:</p>
                               这里面是一些邮内容，回复自amdin
                           </div>
                       </div>
                   </div>
                    <%--分页Div--%>
                    <ul id="emailDetailPagnation"></ul>
                </div>
                <div class="modal-footer" style="display: none;">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="closeHeadPhotoBtn"><spring:message code="close" text="关闭"/></button>
                    <button type="button" class="btn btn-primary" data-loading-text=<spring:message code="saving" text="保存中..."/> id="saveHeadPhotoBtn"><spring:message code="sendEmail" text="发送"/></button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
