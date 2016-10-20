<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<!--[if IE 8]> <html class="ie8"> <![endif]-->
<!--[if IE 9]> <html class="ie9 gt-ie8"> <![endif]-->
<!--[if gt IE 9]><!-->
<html class="gt-ie8 gt-ie9 not-ie"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Admin</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <link rel="stylesheet" href="<%=path%>/common/font-awesome-4.6.3/css/font-awesome.min.css"/>
    <link href="<%=path%>/common/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/pixel-admin/css/pixel-admin.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/pixel-admin/css/widgets.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/pixel-admin/css/rtl.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/pixel-admin/css/themes.min.css" rel="stylesheet" type="text/css">
    <!--[if !IE]> -->
    <script type="text/javascript">
        window.jQuery || document.write('<script src="<%=path%>/common/jquery/jquery.min.js">' + "<" + "/script>");
    </script>
    <!-- <![endif]-->
    <!--[if lte IE 9]>
    <script type="text/javascript"> window.jQuery || document.write('<script src="<%=path%>/common/jquery/jquery1.8.3.min.js">' + "<" + "/script>"); </script>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="<%=path%>/common/pixel-admin/js/ie.min.js" type="text/javascript"></script>
    <![endif]-->
    <%--pjax--%>
    <script src="<%=path%>/common/pjax/jquery.pjax.js" type="text/javascript"></script>
   <%-- vue--%>
    <script src="<%=path%>/common/vue/vue.js" type="text/javascript"></script>
    <%--loading--%>
    <link  rel="stylesheet" href="<%=path%>/common/custom-loader/css/sllib.css"/>
    <script type="text/javascript" src="<%=path%>/common/custom-loader/js/loader.js"></script>
    <script type="text/javascript" src="<%=path%>/common/bootstrap-paginator/js/bootstrap-paginator.js"></script>
    <%--vue-resource--%>
   <%-- <script src="<%=path%>/common/vue/resource/vue-resource.min.js" type="text/javascript"></script>--%>
    <link rel="stylesheet" href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css">
    <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>
    <script type="text/javascript">
        var path='<%=path%>';
    </script>

    <style type="text/css">
        .custom{
            vertical-align: top;
            display: inline-block;
            width: 20px;
            height: 20px;
            margin-left: 2px !important;
            margin-top: -2px !important;
        }
        .fa-vip{
            background-image: url("<%=path%>/common/images/VIP-20.png");
        }
        .fa-vip-w{
            background-image: url("<%=path%>/common/images/VIP-20-w.png");
        }
        .fa-vip-b{
            background-image: url("<%=path%>/common/images/VIP-20-b.png");
        }
    </style>
</head>
<body class="theme-default main-menu-animated">
<%--这部分的JS后续合并进相应的JQuery中--%>
<script>var init = [];</script>
<script src="<%=path%>/common/pixel-admin/demo/demo.js"></script>
<div id="main-wrapper">
    <%--顶部导航条--%>
    <div id="main-navbar" class="navbar navbar-inverse" role="navigation">
        <button type="button" id="main-menu-toggle"><i class="navbar-icon fa fa-bars icon"></i><span
                class="hide-menu-text">HIDE MENU</span></button>
        <div class="navbar-inner">
            <div class="navbar-header">
                <a href="<%=path%>/admin/gotoIndex" class="navbar-brand">
                    <div><img alt="Index"
                              src="<%=path%>/common/pixel-admin/images/pixel-admin/main-navbar-logo.png"></div>
                </a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#main-navbar-collapse"><i class="navbar-icon fa fa-bars"></i></button>
            </div>
            <div id="main-navbar-collapse" class="collapse navbar-collapse main-navbar-collapse">
                <div>
                    <%--头部导航--%>
                    <%--<ul class="nav navbar-nav">
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">First item</a></li>
                                <li><a href="#">Second item</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Third item</a></li>
                            </ul>
                        </li>
                    </ul>--%>
                    <div class="right clearfix">
                        <ul class="nav navbar-nav pull-right right-navbar-nav">
                            <%--通知内容--%>
                            <%--<li class="nav-icon-btn nav-icon-btn-danger dropdown">
                                <a href="#notifications" class="dropdown-toggle" data-toggle="dropdown">
                                    <span class="label">5</span>
                                    <i class="nav-icon fa fa-bullhorn"></i>
                                    <span class="small-screen-text">Notifications</span>
                                </a>

                                <script>
                                    init.push(function () {
                                        $('#main-navbar-notifications').slimScroll({ height: 250 });
                                    });
                                </script>

                                <div class="dropdown-menu widget-notifications no-padding" style="width: 300px">
                                    <div class="notifications-list" id="main-navbar-notifications">

                                        <div class="notification">
                                            <div class="notification-title text-danger">SYSTEM</div>
                                            <div class="notification-description"><strong>Error 500</strong>: Syntax error in index.php at line <strong>461</strong>.</div>
                                            <div class="notification-ago">12h ago</div>
                                            <div class="notification-icon fa fa-hdd-o bg-danger"></div>
                                        </div> <!-- / .notification -->

                                        <div class="notification">
                                            <div class="notification-title text-info">STORE</div>
                                            <div class="notification-description">You have <strong>9</strong> new orders.</div>
                                            <div class="notification-ago">12h ago</div>
                                            <div class="notification-icon fa fa-truck bg-info"></div>
                                        </div> <!-- / .notification -->

                                        <div class="notification">
                                            <div class="notification-title text-default">CRON DAEMON</div>
                                            <div class="notification-description">Job <strong>"Clean DB"</strong> has been completed.</div>
                                            <div class="notification-ago">12h ago</div>
                                            <div class="notification-icon fa fa-clock-o bg-default"></div>
                                        </div> <!-- / .notification -->

                                        <div class="notification">
                                            <div class="notification-title text-success">SYSTEM</div>
                                            <div class="notification-description">Server <strong>up</strong>.</div>
                                            <div class="notification-ago">12h ago</div>
                                            <div class="notification-icon fa fa-hdd-o bg-success"></div>
                                        </div> <!-- / .notification -->

                                        <div class="notification">
                                            <div class="notification-title text-warning">SYSTEM</div>
                                            <div class="notification-description"><strong>Warning</strong>: Processor load <strong>92%</strong>.</div>
                                            <div class="notification-ago">12h ago</div>
                                            <div class="notification-icon fa fa-hdd-o bg-warning"></div>
                                        </div> <!-- / .notification -->

                                    </div> <!-- / .notifications-list -->
                                    <a href="#" class="notifications-link">MORE NOTIFICATIONS</a>
                                </div> <!-- / .dropdown-menu -->
                            </li>
                            <li class="nav-icon-btn nav-icon-btn-success dropdown">
                                <a href="#messages" class="dropdown-toggle" data-toggle="dropdown">
                                    <span class="label">10</span>
                                    <i class="nav-icon fa fa-envelope"></i>
                                    <span class="small-screen-text">Income messages</span>
                                </a>

                                <!-- MESSAGES -->

                                <!-- Javascript -->
                                <script>
                                    init.push(function () {
                                        $('#main-navbar-messages').slimScroll({ height: 250 });
                                    });
                                </script>
                                <!-- / Javascript -->

                                <div class="dropdown-menu widget-messages-alt no-padding" style="width: 300px;">
                                    <div class="messages-list" id="main-navbar-messages">

                                        <div class="message">
                                            <img src="<%=path%>/common/pixel-admin/demo/avatars/2.jpg" alt="" class="message-avatar">
                                            <a href="#" class="message-subject">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</a>
                                            <div class="message-description">
                                                from <a href="#">Robert Jang</a>
                                                &nbsp;&nbsp;·&nbsp;&nbsp;
                                                2h ago
                                            </div>
                                        </div> <!-- / .message -->
                                    </div> <!-- / .messages-list -->
                                    <a href="#" class="messages-link">MORE MESSAGES</a>
                                </div> <!-- / .dropdown-menu -->
                            </li>--%>
                            <li>
                                <form class="navbar-form pull-left">
                                    <input type="text" class="form-control" placeholder="Search">
                                </form>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle user-menu" data-toggle="dropdown">
                                   <%-- <img src="<%=path%>${adminUserInfo.headPhotoUrl}" alt="">--%>
                                    <img src="<%=path%>/common/images/admin-default.png" alt="">
                                    <span>${adminUserInfo.userName}</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#"><span class="label label-warning pull-right">New</span>Profile</a>
                                    </li>
                                    <li><a href="#"><span class="badge badge-primary pull-right">New</span>Account</a>
                                    </li>
                                    <li><a href="#"><i class="dropdown-icon fa fa-cog"></i>&nbsp;&nbsp;Settings</a></li>
                                    <li class="divider"></li>
                                    <li><a href="javascript:void(0);" @click="logOut();"><i class="dropdown-icon fa fa-power-off"></i>&nbsp;&nbsp;Log
                                        Out</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--左侧导航条--%>
    <div id="main-menu" role="navigation">
        <%--左侧用户信息--%>
        <div id="main-menu-inner">
            <div class="menu-content top" id="menu-content-demo">
                <div>
                    <div class="text-bg"><span class="text-slim">Welcome,</span> <span class="text-semibold">${adminUserInfo.userName}</span>
                    </div>
                    <%--<img src="<%=path%>${adminUserInfo.headPhotoUrl}" alt="" class="">--%>
                    <img src="<%=path%>/common/images/admin-default.png" alt="" class="">
                    <div class="btn-group">
                        <a href="#" class="btn btn-xs btn-primary btn-outline dark"><i class="fa fa-envelope"></i></a>
                        <a href="#" class="btn btn-xs btn-primary btn-outline dark"><i class="fa fa-user"></i></a>
                        <a href="#" class="btn btn-xs btn-primary btn-outline dark"><i class="fa fa-cog"></i></a>
                        <a href="#" class="btn btn-xs btn-danger btn-outline dark"><i class="fa fa-power-off"></i></a>
                    </div>
                    <a href="#" class="close">&times;</a>
                </div>
            </div>
            <%--左侧li信息列表--%>
            <ul class="navigation">
                <li>
                    <a href="<%=path%>/admin/gotoUserInfos" id="userInfos">
                        <i class="menu-icon fa fa-user"></i>
                        <span class="mm-text">用户信息</span>
                    </a>
                </li>
                <li>
                    <a href="<%=path%>/admin/gotoRecordsInfos">
                        <i class="menu-icon fa fa-th"></i><span class="mm-text">充值信息</span>
                    </a>
                </li>
                <li>
                    <a href="<%=path%>/admin/gotoGiftInfos">
                        <i class="menu-icon fa fa-list"></i><span class="mm-text">礼物信息</span>
                    </a>
                </li>
               <%-- <li>
                    <a href="<%=path%>/admin/gotoVipInfos">
                        <i class="menu-icon fa fa-vip custom"></i>
                        <span class="mm-text" style="margin-left: -5px !important;">会员信息</span>
                    </a>
                </li>--%>
            </ul>
            <%--	<div class="menu-content">
                    <a href="pages-invoice.html" class="btn btn-primary btn-block btn-outline dark">Create Invoice</a>
                </div>--%>
        </div>
    </div>
    <%--内容区--%>
    <div id="content-wrapper" style="width: 100%;">
    </div>
</div>
<div id="main-menu-bg"></div>
</div>
<!-- Pixel Admin's javascripts -->
<script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path%>/common/pixel-admin/js/pixel-admin.min.js"></script>
<script type="text/javascript">
    init.push(function () {
        // Javascript code here
    });
    window.PixelAdmin.start(init);
</script>
<%--引入业务JS--%>
<script type="text/javascript" src="<%=path%>/business/admin/index/index.js"></script>
</body>
</html>