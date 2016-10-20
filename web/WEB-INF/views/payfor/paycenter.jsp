<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Pay Center</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<%=path%>/common/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="<%=path%>/business/common/css/common.css" rel="stylesheet"/>
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path%>/common/custom-loader/js/loader.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
        var loginUserId = "<%=request.getAttribute("loginUserId")%>"
    </script>
    <%--引入业务的JS--%>
    <script src="<%=path%>/business/paycenter/payCenter.js"></script>
    <style type="text/css">
        .divRow{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <ul class="nav nav-tabs">
            <li role="presentation" class="active"><a href="#payCenter" data-toggle="tab"><spring:message code="recharge" text="充值"/></a></li>
        </ul>
    </div>

    <div class="row">
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="payCenter">

                <p class="bg-info" style="height: 40px;">
                 <span style="height: 40px;line-height: 40px;" class="inline-block margin-left-5px">
                    <spring:message code="gold" text="金币"/>:${userInfo.userCoin}
                </span>
                </p>

                <%--选择充值对象--%>
                <div class="clear-both divRow">
                    <label class="width120"><spring:message code="rechargeTo" text="充值对象"/>:</label>
                    <input type="radio" id="toMe" name="toWho" value="${loginUserId}" checked="checked" style="">
                    <span class="inline-block"
                          style="height: 30px;line-height: 30px;"><spring:message code="myself" text="冲给自己"/></span>
                    <input type="radio" id="toFriend" name="toWho" value="" style="margin-left: 20px; ">
                    <span class="inline-block"
                          style="height: 30px;line-height: 30px;"><spring:message code="chargeToFriend" text="冲给好友"/></span>
                    <select id="friendList" class="margin-left-10px displayNone">
                    </select>
                </div>

                <%--充值金额--%>
                <div class="clear-both divRow">
                    <label class="width120"><spring:message code="amount" text="选择充值金额"/>:</label>
                    <input type="radio" name="payValueChoose" checked="checked" value="100" style="">
                    <span class="inline-block"
                          style="height: 30px;line-height: 30px;">100</span><img src="<%=path%>/common/images/dollerX30.png" class="doller"></img>
                    <input type="radio" name="payValueChoose" value="200" style="margin-left: 20px; ">
                    <span class="inline-block"
                          style="height: 30px;line-height: 30px;">200</span><img src="<%=path%>/common/images/dollerX30.png" class="doller"></img>
                    <input type="radio" name="payValueChoose" value="500" style="margin-left: 20px; ">
                    <span class="inline-block"
                          style="height: 30px;line-height: 30px;">500</span><img src="<%=path%>/common/images/dollerX30.png" class="doller"></img>
                    <input type="radio" name="payValueChoose" value="1000" style="margin-left: 20px; ">
                    <span class="inline-block"
                          style="height: 30px;line-height: 30px;">1000</span><img src="<%=path%>/common/images/dollerX30.png" class="doller"></img>
                </div>

                <div class="clear-both divRow">
                    <label class="width120"><spring:message code="otherAmount" text="其他金额"/>:</label>
                    <input type="text" id="mount"><span>(1<spring:message code="gold" text="金币"/> = 1<spring:message code="dollar" text="美元"/>)</span>
                </div>

                <div class="clear-both divRow">
                    <label class="width120"><spring:message code="payMethod" text="支付方式"/>:</label>
                    <span>
                        <input type="radio" name="payMethod" checked="checked" value="1"><img class="width200" src="/common/images/papy.jpg">
                        <input type="radio" name="payMethod" value="2"><img src="/common/images/payssion.png" style="width:120px;height:30px;">
                    </span>
                </div>

                <div class="clear-both divRow">
                    <div style="margin-top: 10px;display: none;width: 80%;" id="payssionMethod">
                        <span><input type="radio" class="payssionInput" name="payssionMethodRadio" value="molpay" checked=""><img class="payssion" src="/common/images/molpay.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="dineromail_ar"><img class="payssion" src="/common/images/dineromail.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="boleto_br"><img class="payssion" src="/common/images/boleto.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="bancodobrasil_br"><img class="payssion" src="/common/images/bancodobrasil.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="itau_br"><img class="payssion"src="/common/images/itau.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="bradesco_br"><img class="payssion"src="/common/images/bradesco.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="caixa_br"><img class="payssion"src="/common/images/caixa.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="mastercard_br"><img class="payssion"src="/common/images/mastercard.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="americanexpress_br"><img class="payssion"src="/common/images/americanexpress.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="dinersclub_br"><img class="payssion"src="/common/images/dinersclub.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="hipercard_br"><img class="payssion"src="/common/images/hipercard.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="webpay_cl"><img class="payssion"src="/common/images/bcp.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="bbva_pe"><img class="payssion"src="/common/images/bbva.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="interbank_pe"><img class="payssion"src="/common/images/interbank.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="pagofectivo_pe"><img class="payssion"src="/common/images/pagoefectivo.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="bancomer_mx"><img class="payssion"src="/common/images/bancomer.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="banamex_mx"><img class="payssion"src="/common/images/banamex.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="oxxo_mx"><img class="payssion"src="/common/images/oxxo.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="redpagos_uy"><img class="payssion"src="/common/images/redpagos.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="qiwi"><img class="payssion"src="/common/images/qiwi.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="sofort"><img class="payssion"src="/common/images/sofort.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="trustpay"><img class="payssion"src="/common/images/trustpay.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="polipayment"><img class="payssion"src="/common/images/poli.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="cashu"><img class="payssion"src="/common/images/cashu.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="onecard"><img class="payssion"src="/common/images/onecard.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="maybank2u_my"><img class="payssion"src="/common/images/maybank2u.png"></span>
                        <span ><input type="radio" class="payssionInput" name="payssionMethodRadio" value="enets_sg"><img class="payssion"src="/common/images/enets.png"></span>
                    </div>
                </div>

                <div class="row divRow">
                    <div style="margin-left: 40%;">
                        <button class="btn btn-info" type="button" id="payBtn"><spring:message code="submitCharge" text="立即充值"/></button>
                    </div>
                </div>
                <form id="payForm" action="/payfor/payRedirect" method="post" target="_blank">
                    <input type="hidden" id="payMethod1" name="payMethod1">
                    <input type="hidden" id="userId1" name="userId1">
                    <input type="hidden" id="mount1" name="mount1">
                    <input type="hidden" id="payssionMethod1" name="payssionMethod1">
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
