<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
        <%
    String path=request.getContextPath();
%>
    <head>
        <title>Blog</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Bootstrap core CSS -->
        <link href="<%=path%>/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%=path%>/common/font-awesome-4.6.3/css/font-awesome.min.css"/>
        <link href="<%=path%>/common/bxslider/css/jquery.bxslider.css" rel="stylesheet">
        <%-- <link href="<%=path%>/common/bxslider/css/style.css" rel="stylesheet">--%>
        <link rel="stylesheet" href="<%=path%>/business/common/css/common.css">
        <link rel="stylesheet" href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css">
        <link  rel="stylesheet" href="<%=path%>/common/custom-loader/css/sllib.css"/>
        <script src="<%=path%>/common/jquery/jquery.js"></script>
        <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>
        <script type="text/javascript" src="<%=path%>/common/custom-loader/js/loader.js"></script>
        <script type="text/javascript">
            var path = "<%=path%>";
        </script>
        <%--分页的JS--%>
        <script type="text/javascript" src="<%=path%>/common/bootstrap-paginator/js/bootstrap-paginator.js"></script>
        <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
        <style type="text/css">
            body,html{
                overflow: hidden !important;
            }
        </style>
        <link rel="stylesheet" href="<%=path%>/common/spinner/css/bootstrap-spinner.css">
        <script type="text/javascript" src="<%=path%>/common/spinner/js/jquery.spinner.min.js"></script>
        <script type="text/javascript" src="<%=path%>/business/gift/language/${local}.js"></script>
        <script src="<%=path%>/business/gift/gift.js"></script>
    </head>
<body>
<%--日志 start--%>
<div class="tab-pane " id="panel-tabs2">
    <div class="panel panel-warning">
        <div class="panel-heading">
            <div class="tabbable" id="tabs-295323">
                <ul class="nav nav-tabs" style="margin-left: -15px;">
                    <li class="active" id="giftTab">
                    <a href="#panel-gift" data-toggle="tab"><spring:message code="gift" text="礼物"/></a>
                    </li>
                    <li id="receiveGiftTab">
                        <a href="#panel-receive-gift" data-toggle="tab"><spring:message code="receivedGift" text="收到的礼物"/></a>
                    </li>
                    <li id="sendGiftTab">
                        <a href="#panel-send-gift" data-toggle="tab"><spring:message code="givenGift" text="送出的礼物"/></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="tab-content">
            <div class="tab-pane active" id="panel-gift" style="height: 100%;">
                <ul class="nav nav-tabs">
                    <li class="active" id="virtualGiftTab">
                        <a href="#panel-virtualGift" data-toggle="tab" aria-expanded="true"><spring:message code="virtualGifts" text="虚拟的礼物"/></a>
                    </li>
                    <li id="trueGiftTab">
                        <a href="#panel-trueGift" data-toggle="tab" aria-expanded="true"><spring:message code="realGifts" text="真实的礼物"/></a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-virtualGift">
                        <div class="panel panel-warning">
                            <div id="panel-element-virtual-gift" class="panel-collapse in">
                                <div class="panel-body">
                                    <div class="row" id="virtualGiftContentDiv">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <ul class="pagination" id="virtualGiftPaginationDiv"></ul>
                    </div>
                    <div class="tab-pane" id="panel-trueGift">
                        <div class="panel panel-warning">
                            <div id="panel-element-true-gift" class="panel-collapse in">
                                <div class="panel-body">
                                    <div class="row" id="trueGiftContentDiv">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <ul class="pagination" id="trueGiftPaginationDiv"></ul>
                    </div>
                </div>
                <%--送礼物给好友的弹出框 --%>
                <div class="modal fade" id="sendGiftDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel"><spring:message code="giftInfo" text="礼物详情"/></h4>
                            </div>
                            <div class="modal-body">
                                <div class="panel panel-warning">
                                    <div class="panel-collapse in">
                                        <div class="panel-body">
                                            <div class="row clearfix">
                                                <div class="width350 float-left">
                                                    <input id="giftId" type="hidden"/>
                                                    <div class="thumbnail">
                                                        <img id="imageUrl" src="" alt="350x350">
                                                        <div class="caption" style="text-align: center">
                                                            <h5 id="giftName" name="giftName"></h5>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="width300 float-left margin-left-10px">
                                                    <form class="form-horizontal" role="form">
                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label"><img src="/common/images/dollerX30.png" class="doller">10</label>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-2"><spring:message code="giftCount" text="数量"/></label>
                                                            <div class="input-group spinner col-sm-2 margin-left-10px" data-trigger="spinner" id="spinner">
                                                                <input type="text" class="form-control" id="giftCount" name="giftCount" value="1" data-max="1000" data-min="1" data-step="1">
                                                                <div class="input-group-addon">
                                                                    <a href="javascript:;" class="spin-up" data-spin="up"><i class="icon-sort-up"></i></a>
                                                                    <a href="javascript:;" class="spin-down" data-spin="down"><i class="icon-sort-down"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="myFriend" class="col-sm-2"><spring:message code="friend" text="好友"/>：</label>
                                                            <div class="col-sm-2">
                                                                <select id="myFriend" class="form-control"></select>
                                                            </div>
                                                        </div>
                                                        <%--<div class="form-group">
                                                            <div class="col-sm-offset-2 col-md-10">
                                                                <label for="wordContent" class="col-sm-2 control-label float-left">
                                                                    <span class="inline-block width110">好友赠言</span>
                                                                </label>
                                                                <div class="float-left" style="margin-left: 5px;">
                                                                    <textarea rows="5" id="wordContent" name="wordContent" class="width280"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>--%>
                                                        <div class="form-group">
                                                            <input type="button" class="btn btn-info pull-right margin-right-10px" id="sendGiftBtn" value=<spring:message code="send" text="赠送"/> name="sendGiftBtn">
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tab-pane" id="panel-receive-gift">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox" name="types_checkbox"> </th>
                            <th><spring:message code="giftName" text="礼物名"/></th>
                            <th><spring:message code="giftPic" text="图片"/></th>
                            <th><spring:message code="giftProperty" text="礼物类型"/></th>
                            <th><spring:message code="giftSender" text="赠送人"/></th>
                            <th><spring:message code="giftCount" text="数量"/></th>
                            <th><spring:message code="giftSendTime" text="赠送时间"/></th>
                        </tr>
                        </thead>
                        <tbody id="receiveGiftContentDiv">
                        </tbody>
                    </table>
                </div>
                <ul id="receiveGiftPaginationDiv"></ul>
            </div>

            <div class="tab-pane" id="panel-send-gift">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox" name="types_checkbox"> </th>
                            <th><spring:message code="giftName" text="礼物名"/></th>
                            <th><spring:message code="giftPic" text="图片"/></th>
                            <th><spring:message code="giftProperty" text="礼物类型"/></th>
                            <th><spring:message code="giftReceiver" text="赠送对象"/></th>
                            <th><spring:message code="giftCount" text="数量"/></th>
                            <th><spring:message code="giftSendTime" text="赠送时间"/></th>
                        </tr>
                        </thead>
                        <tbody id="sendGiftContentDiv">
                        </tbody>
                    </table>
                </div>
                <ul id="sendGiftPaginationDiv"></ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
