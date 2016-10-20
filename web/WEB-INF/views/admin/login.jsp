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
    <link href="<%=path%>/business/login/login.css" rel="stylesheet">
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
    </script>
    <script type="text/javascript" src="<%=path%>/common/json2/json2.js"></script>
    <script type="text/javascript" src="<%=path%>/common/md5/md5.min.js"></script>
    <script type="text/javascript" src="<%=path%>/business/admin/login/login.js"></script>
    <link type="text/css" href="<%=path%>/common/bootstrapvalidator/css/bootstrapValidator.min.css"/>
    <script src="<%=path%>/common/bootstrapvalidator/js/bootstrapValidator.min.js" type="text/javascript"></script>
    <script src="<%=path%>/common/bootstrapvalidator/js/language/${local}.js" type="text/javascript"></script>
    <%--弹出窗--%>
    <link href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>
    <style type="text/css">
        #errorP{
            font-size: 13px;
            color: red;
            height:25px;
            line-height: 25px;
            /*margin-left: 25%;*/
            MARGIN-RIGHT: auto;
            MARGIN-LEFT: auto;
        }
    </style>
</head>
<body>
<div class="header">
    <ul class="language" style="color: black">
        <li>
            <a href="/admin/gotoLoginPage?language=zh_CN" style="color: black">
                中文
            </a>
            <span style="margin-right: 5px;">|</span>
        </li>
        <li style="float:left;">
            <a href="/admin/gotoLoginPage?language=en_US" style="color: black">
                English
            </a>
        </li>
    </ul>
</div>

<div class="container" style="position:fixed;z-index: 9999;top:50%;width: 420px;margin-left: -210px;left:50%;" >
    <section class="loginBox row-fluid">
        <div id="errorP">
        </div>
        <form class="form-horizontal" style="margin-top: 10px;margin-left: 25px;" id="myForm" action="#">
            <DIV class="form-group width350">
                <input type="text" class="form-control center-block" name="username"
                       placeholder="<spring:message code="username" text="用户名"></spring:message> " id="userName" required/>
            </DIV>
            <DIV class="form-group width350">
                <input type="password" class="form-control center-block" name="password"
                    placeholder="<spring:message code="register.pwd" text="密码"></spring:message> " id="password" required/>
            </DIV>
            <DIV class="form-group width350">
                <input type="checkbox" style="vertical-align: middle;" id="remeberme" checked="checked"/>
                <span class="inline-block" style="vertical-align: middle;">
                    <spring:message code="autoLoginNextTime" text="下次自动登录"></spring:message> </span>
            </DIV>
            <div class="form-group width350" style="margin-bottom: 20px;">
                <button type="button" data-loading-text="登录中..." class="btn btn-primary form-control  center-block" id="loginBtn">
                    <spring:message code="login" text="登录"></spring:message>
                </button>
            </div>
        </form>
    </section>
</div>
</body>
</html>
