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
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <link href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
    </script>
    <script type="text/javascript" src="<%=path%>/business/index/language/${local}.js"></script>
    <script type="text/javascript" src="<%=path%>/business/index/index.js"></script>
    <script type="text/javascript" src="<%=path%>/business/vip/vip.js"></script>
    <style type="text/css">
       .panel-body input[type="radio"] {
            margin-left: 40%;
        }
        .innerDiv{
            height: 90px;
            width: 206px;
        }
        html,body{
            overflow: hidden;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <ul class="nav nav-tabs">
            <li role="presentation" class="active"><a href="#levelVip" data-toggle="tab"><spring:message code="upGrade" text="在线升级"/></a></li>
            <li role="presentation"><a href="#vipDocument" data-toggle="tab"><spring:message code="upGradeInstructions" text="升级说明"/></a></li>
        </ul>
    </div>

    <div class="row">
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="levelVip">

                <p class="bg-info" style="height: 40px;">
                 <span style="height: 40px;line-height: 40px;" class="inline-block margin-left-5px">
                    <spring:message code="gold" text="金币"/>:${userInfo.userCoin}
                </span></p>

                <%--面板--%>
                <div class="panel panel-warning" style="height: 250px;">
                    <div class="panel-heading"><spring:message code="seniorVip" text="高级会员"/></div>

                    <div class="clear-both">
                        <div class="panel-body width185 pull-left innerDiv">
                            <div class="panel panel-warning width185">
                                <div class="panel-body">
                                    <span class="span-height30-center">20</span>
                                    <img src="<%=path%>/common/images/dollerX30.png" class="doller">
                                    <span class="span-height30-center">(1 month)</span>
                                    <span class=center-block" style="display: block;">
                                    <input type="radio" name="vipType" checked="checked" value="1_20_1">
                                </span>
                                </div>
                            </div>
                        </div>

                        <div class="panel-body width185 pull-left margin-left-30px innerDiv">
                            <div class="panel panel-warning width185">
                                <div class="panel-body">
                                    <span class="span-height30-center">50</span>
                                    <img src="<%=path%>/common/images/dollerX30.png" class="doller">
                                    <span class="span-height30-center">(3 months)</span>
                                    <span class=center-block" style="display: block;">
                                    <input type="radio" name="vipType" value="1_50_3">
                                </span>
                                </div>
                            </div>
                        </div>

                        <div class="panel-body width185 pull-left margin-left-30px innerDiv">
                            <div class="panel panel-warning width185">
                                <div class="panel-body">
                                    <span class="span-height30-center">90</span>
                                    <img src="<%=path%>/common/images/dollerX30.png" class="doller">
                                    <span class="span-height30-center">(6 months)</span>
                                    <span class=center-block" style="display: block;">
                                    <input type="radio" name="vipType" value="1_90_6">
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clear-both">
                        <div class="panel-body width185 pull-left innerDiv">
                            <div class="panel panel-warning width185">
                                <div class="panel-body">
                                    <span class="span-height30-center">150</span>
                                    <img src="<%=path%>/common/images/dollerX30.png" class="doller">
                                    <span class="span-height30-center">(12 months)</span>
                                    <span class=center-block" style="display: block;">
                                         <input type="radio" name="vipType" value="1_150_12" >
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--VIP面板--%>
                <div class="panel panel-warning" style="height: 250px;">
                    <div class="panel-heading">VIP</div>

                    <div class="clear-both">
                        <div class="panel-body width185 pull-left innerDiv">
                            <div class="panel panel-warning width185">
                                <div class="panel-body">
                                    <span class="span-height30-center">99</span>
                                    <img src="<%=path%>/common/images/dollerX30.png" class="doller">
                                    <span class="span-height30-center">(1 month)</span>
                                <span class=center-block" style="display: block;">
                                    <input type="radio" name="vipType" value="2_99_1">
                                </span>
                                </div>
                            </div>
                        </div>

                        <div class="panel-body width185 pull-left margin-left-30px innerDiv">
                            <div class="panel panel-warning width185">
                                <div class="panel-body">
                                    <span class="span-height30-center">269</span>
                                    <img src="<%=path%>/common/images/dollerX30.png" class="doller">
                                    <span class="span-height30-center">(3 months)</span>
                                <span class=center-block" style="display: block;">
                                    <input type="radio" name="vipType" value="2_269_3">
                                </span>
                                </div>
                            </div>
                        </div>

                        <div class="panel-body width185 pull-left margin-left-30px innerDiv">
                            <div class="panel panel-warning width185">
                                <div class="panel-body">
                                    <span class="span-height30-center">489</span>
                                    <img src="<%=path%>/common/images/dollerX30.png" class="doller">
                                    <span class="span-height30-center">(6 months)</span>
                                <span class=center-block" style="display: block;">
                                    <input type="radio" name="vipType" value="2_489_6">
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clear-both">
                        <div class="panel-body width185 pull-left innerDiv">
                            <div class="panel panel-warning width185">
                                <div class="panel-body">
                                    <span class="span-height30-center">899</span>
                                    <img src="<%=path%>/common/images/dollerX30.png" class="doller">
                                    <span class="span-height30-center">(12 months)</span>
                                     <span class=center-block" style="display: block;">
                                         <input type="radio" name="vipType" value="2_899_12">
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--选择充值对象--%>
                <div class="clear-both">
                    <label class="width80"><spring:message code="rechargeTo" text="充值对象"/>:</label>
                    <input type="radio" checked="checked" name="toWho" id="toMe" value="${userInfo.userId}" style="vertical-align: middle;">
                    <span class="inline-block" style="vertical-align: middle;height: 30px;line-height: 30px;"><spring:message code="myself" text="冲给自己"/></span>
                    <input type="radio" name="toWho" id="toFriend" value="" style="margin-left: 20px; vertical-align: middle;">
                    <span class="inline-block" style="vertical-align: middle;height: 30px;line-height: 30px;"><spring:message code="chargeToFriend" text="冲给好友"/></span>
                    <select id="friendList" class="margin-left-10px displayNone">

                    </select>
                </div>
                <div class="row">
                    <div style="margin-left: 40%;">
                        <button class="btn btn-info" type="button" id="chargeVip"><spring:message code="chargeVip" text="立即升级"/></button>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane clear-both" id="vipDocument">
              升级说明
            </div>

        </div>
    </div>
</div>
</body>
</html>
