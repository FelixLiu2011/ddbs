<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Blog Detail</title>
    <meta charset="UTF-8">
    <link href="<%=path%>/common/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="<%=path%>/common/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="<%=path%>/common/bxslider/css/jquery.bxslider.css" rel="stylesheet"/>
    <link href="<%=path%>/business/common/css/common.css" rel="stylesheet"/>
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=path%>/common/custom-loader/css/sllib.css"/>
    <script type="text/javascript" src="<%=path%>/common/custom-loader/js/loader.js"></script>
    <%--分页--%>
    <script type="text/javascript" src="<%=path%>/common/bootstrap-paginator/js/bootstrap-paginator.js"></script>
    <script type="text/javascript" src="<%=path%>/business/blogcomment/language/${local}.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
    </script>
    <%--引入业务JS--%>
    <script type="text/javascript" src="<%=path%>/business/blogcomment/blogCommentDetail.js"></script>
</head>
<body>
<%--日志详情--%>
<p class="bg-info" style="height: 30px; line-height: 30px;padding-right: 0!important;padding-left: 0!important; margin-top: 10px;">
    <spring:message code="blogDetail" text="日志详情"></spring:message>
</p>
<div class="container-fluid">
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">${blog.blogTitle}</div>
            <div class="panel-body">
                ${blog.blogContent}
                    <div style="font-size:12px;color:#aaa;margin-top:15px;padding-left:10px;">
                        <spring:message code="tag" text="标签"></spring:message> ：${blog.blogTags}&nbsp;&nbsp;&nbsp;
                        <spring:message code="comment" text="评论"></spring:message> (<span id="friendCommentCount_${blogId}">0</span>)|
                        <spring:message code="read" text="阅读"></spring:message> (0)
                    </div>
            </div>
        </div>
    </div>
</div>
<%--评论区--%>
<p class="bg-info" style="height: 30px; line-height: 30px;padding-right: 0!important;padding-left: 0!important;">
    <spring:message code="commentList" text="评论列表"></spring:message>
</p>
<div class="container-fluid">
    <%--放置评论内容的div--%>
    <div id="commentContentDiv">
    </div>
    <%--我的日志分页--%>
    <ul id="commentPagnationDiv" style="margin-left: -15px;"></ul>
</div>
<input type="hidden" id="blogId" value="${blogId}">
</body>
</html>
