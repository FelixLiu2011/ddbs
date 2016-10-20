<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Pay Redirect</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<%=path%>/common/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="<%=path%>/business/common/css/common.css" rel="stylesheet"/>
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css">
    <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>
</head>
<body style="background: url('/common/images/templatemo_flower.jpg')">
<input type="hidden" id="msg" value="${msg.msg}">
</body>
<script>
    var path = "<%=path%>";
    var msg = $("#msg").val();
    $.confirm({
        container:window.top.document.body,
        title:"",
        content:msg,
        cancelButton:false,
        confirm:function(){
            window.location.href=path+"/index/gotoIndex";
        }
    });
</script>
</html>
