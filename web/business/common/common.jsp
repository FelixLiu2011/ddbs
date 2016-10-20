<%--
这个作为所有的页面的indclude页面，已经引入所有的基础JS以及css文件
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<link href="<%=path%>/common/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<link href="<%=path%>/common/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet"/>
<link href="<%=path%>/common/bxslider/css/jquery.bxslider.css" rel="stylesheet"/>
<link href="<%=path%>/business/common/css/common.css" rel="stylesheet"/>
<script src="<%=path%>/common/jquery/jquery.js"></script>
<script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
    var path = "<%=path%>";
</script>

