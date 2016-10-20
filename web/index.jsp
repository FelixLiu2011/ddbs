<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index</title>
</head>
<body>
<%
    /*跳转首页*/
    response.sendRedirect(request.getContextPath()+"/index/gotoIndex");
%>
</body>
</html>
