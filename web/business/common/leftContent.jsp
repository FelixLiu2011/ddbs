<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/business/common/css/leftContent.css"/>
</head>
<body>
<%--left content--%>
<div class="col-md-2">
    <div>
        <img alt="140x140" src="/common/images/140x140.jpg" />
        <div><a>Mariki</a></div>
        <div class="yue"><img src="/common/images/golds_img.jpg">&nbsp;&nbsp;&nbsp;<span>金币：</span><span style="color:#FF471F">0</span></div>
    </div>

    <ul class="nav nav-stacked  nav-pills" id="leftContent">
        <li>
            <a href="#"><img src="/common/images/golds_img.jpg">充值中心</a>
        </li>
        <li>
            <a href="#"><img src="/common/images/n_left_shengji.jpg">升级会员</a>
        </li>
        <li>
            <a href="#"><img src="/common/images/mail.gif">邮箱(0)</a>
        </li>
        <li>
            <a href="#"><img src="/common/images/n_left_gift.jpg">礼物(0)</a>
        </li>
        <li>
            <a href="#"><img src="/common/images/friends.gif">我的朋友</a>
        </li>
        <li>
            <a href="#"><img src="/common/images/album.png">相册</a>
        </li>
        <li>
            <a href="#"><img src="/common/images/n_left_rizhi.jpg">日志</a>
        </li>
<%--        <li>
            <a href="#"><img src="/common/images/n_left_fenxiang.jpg">分享(目前没用)</a>
        </li>--%>
        <li>
            <a href="#"><img src="/common/images/n_left_mood.jpg">打招呼(3)</a>
        </li>
        <li>
            <a href="#"><img src="/common/images/n_left_game.jpg">游戏开发ing</a>
        </li>

    </ul>
</div>
</body>
<%--引入JS--%>
<script type="text/javascript" src="<%=request.getContextPath()%>/business/common/js/index.js"></script>
</html>
