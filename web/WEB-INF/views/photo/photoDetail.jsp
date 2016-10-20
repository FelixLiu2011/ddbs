<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
    String groupId = (String) request.getAttribute("groupId");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Photo Detail</title>
    <link href="<%=path%>/common/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=path%>/common/font-awesome-4.6.3/css/font-awesome.min.css"/>
    <link href="<%=path%>/common/bxslider/css/jquery.bxslider.css" rel="stylesheet">
    <link href="<%=path%>/common/bxslider/css/style.css" rel="stylesheet">
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path%>/common/custom-loader/js/loader.js"></script>
    <link href="<%=path%>/business/common/css/common.css" rel="stylesheet">
    <%--图片轮播--%>
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script src="<%=path%>/common/layer/js/layer.js"></script>
    <%--分页的JS--%>
    <script type="text/javascript" src="<%=path%>/common/bootstrap-paginator/js/bootstrap-paginator.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
        var groupId = "<%=groupId%>";
    </script>
    <script type="text/javascript" src="<%=path%>/business/photo/language/${local}.js"></script>
    <script type="text/javascript" src="<%=path%>/business/photo/photoDetail.js"></script>
    <link rel="stylesheet" href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css">
    <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>
    <style type="text/css">
        /*.row img {
            margin-left: 25px;
            margin-top: 25px;
        }*/

        #txtDiv span {
            margin-top: 60px;
        }

        /*设置照片的大小 */
        #photoDiv img {
            height: 140px;
            width: 140px;
        }
        .parentDiv{
            margin-left: 25px;
            margin-top: 25px;
            height: 140px;
            width: 140px;
            float:left;
        }
        .txtDivSpan{
            margin-top: 60px;
        }
    </style>
</head>
<body>
<p class="bg-info" style="height: 30px;line-height: 30px;">
    <spring:message code="photoGroupDetail" text="照片详情"></spring:message>
</p>
<div class="container-fluid">
    <div class="row" id="photoDiv">
        <%--<div id="parent_0" class="parentDiv">
            <img src="<%=path%>/common/images/140x140.jpg" alt="140x140" class="img-rounded">
            <div style="width:140px;height: 140px;background:rgba(214, 200, 216, 0.8);text-align: center;position: absolute; left: -1000px;cursor: hand;"
                 id="txtDiv_0">
                <span class="inline-block txtDivSpan" style="cursor:hand;" id="txtDivSpan_0">设置为封面</span>
            </div>
        </div>--%>
    </div>
    <p id="vipTip" class="bg-danger" style="height: 30px;line-height: 30px;margin-top: 10px;display: none;"><spring:message code="upgradeTipInPhoto" text="Tip:想查看更多,赶紧"></spring:message>
        <a href="javascript:void(0);" id="toVip"><spring:message code="upgradeVip" text="升级会员"></spring:message> </a><spring:message code="upgradeLast" text="吧!"></spring:message></p>
    <%--分页插件--%>
    <ul class="pagination" id="photoPaginationDiv"></ul>
</div>

<%--设置封面的div--%>
<%--<div style="width:140px;height: 140px;background:rgba(214, 200, 216, 0.8);text-align: center;position: absolute; left: -1000px;cursor: hand;"
     id="txtDiv">
    <span class="inline-block" style="cursor:hand;" id="txtDivSpan">设置为封面</span>
</div>--%>
<input type="hidden" value="${groupId}" id="groupId"/>
<input type="hidden" value="${friendPhoto}" id="friendPhoto"/>
</body>
</html>
