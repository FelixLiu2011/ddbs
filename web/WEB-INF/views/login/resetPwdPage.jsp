<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Reset Password</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<%=path%>/common/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="<%=path%>/business/common/css/common.css" rel="stylesheet"/>
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
    </script>
    <%--验证JS--%>
    <link type="text/css" href="<%=path%>/common/bootstrapvalidator/css/bootstrapValidator.min.css"/>
    <script src="<%=path%>/common/bootstrapvalidator/js/bootstrapValidator.min.js" type="text/javascript"></script>
    <script src="<%=path%>/common/bootstrapvalidator/js/language/${local}.js" type="text/javascript"></script>
    <%--引入业务JS--%>
    <script type="text/javascript" src="<%=path%>/business/login/resetpwd.js"></script>
    <script type="text/javascript" src="<%=path%>/business/login/language/${local}.js"></script>

    <%--弹出窗--%>
    <link href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>

    <script type="text/javascript" src="<%=path%>/common/md5/md5.min.js"></script>
    <style type="text/css">
        #container{
            position: absolute;
            left: 40%;
            top: 20%;
        }
    </style>
</head>
<body>
<div class="container-fluid" style="height: 100%;position: relative;">
    <div class="center-block" id="container">
        <form class="form-horizontal width350 center" id="myForm">
            <div class="form-group ">
                <label class="control-label"><spring:message code="register.pwd" text="密 码"></spring:message> </label>
                <input type="password" class="form-control"
                       placeholder="<spring:message code="register.pwd" text="密 码"></spring:message> " id="password" name="password">
            </div>
            <div class="form-group">
                <label class="control-label"><spring:message code="register.confirmPwd" text="确认密码"></spring:message> </label>
                <input type="password" class="form-control"
                       placeholder="<spring:message code="register.confirmPwd" text="确认密码"></spring:message>" id="repeatPwd" name="repeatPwd">
            </div>
            <div class="form-group ">
                <button type="button" class="btn btn-primary col-lg-12" id="resetBtn"><spring:message code="confirm" text="确 定"></spring:message> </button>
            </div>
            <input type="hidden" value="${encodedKey}" id="encodedKey">
        </form>
    </div>
</div>
</body>
</html>
