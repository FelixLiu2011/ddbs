<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Header</title>
    <%
      String path=request.getContextPath();
    %>
    <script type="text/javascript" >
        var path='<%=path%>';
    </script>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="<%=path%>/index/gotoIndex"><spring:message code="index"></spring:message> </a></li>
                <li><a href="<%=path%>/myspace/gotoIndex">我的空间</a></li>
                <li><a href="#contact">朋友圈</a></li>
                <li><a href="#contact">升级</a></li>
                <li><a href="about.html">充值</a></li>
                <li><a href="about.html">礼物</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                <li><a href="#"><i class="fa fa-reddit"></i></a></li>
            </ul>

        </div>
        <!--/.nav-collapse -->
    </div>
</nav>
</body>
<script type="text/javascript" src="<%=path%>/business/common/js/header.js"></script>
</html>
