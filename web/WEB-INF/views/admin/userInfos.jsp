<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
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
    <%--jquery--%>
    <script src="<%=path%>/common/jquery/jquery.min.js" type="text/javascript"></script>
    <%--bootstrap--%>
    <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <%--pjax--%>
    <script src="<%=path%>/common/pjax/jquery.pjax.js" type="text/javascript"></script>
    <%--vue--%>
    <script src="<%=path%>/common/vue/vue.js" type="text/javascript"></script>
    <%--vue-resource--%>
    <script src="<%=path%>/common/vue/resource/vue-resource.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=path%>/common/bootstrap-paginator/js/bootstrap-paginator.js"></script>
    <script type="text/javascript">
        var path='<%=path%>';
    </script>
</head>
<body>
<div id="userInfoDiv">
    <div class="page-header">
        <div class="row">
            <%--头部的字体--%>
            <h1 class="col-xs-12 col-sm-4 text-center text-left-sm"><i class="fa fa-dashboard page-header-icon"></i>
                &nbsp;&nbsp;用户统计信息
            </h1>
            <div class="col-xs-12 col-sm-8">
                <div class="row">
                    <hr class="visible-xs no-grid-gutter-h">
                    <!-- Margin -->
                    <div class="visible-xs clearfix form-group-margin"></div>
                    <!-- Search field -->
                    <form action="" class="pull-right col-xs-12 col-sm-6">
                        <div class="input-group no-margin">
                                <span class="input-group-addon"
                                      style="border:none;background: #fff;background: rgba(0,0,0,.05);"><i
                                        class="fa fa-search"></i></span>
                            <input type="text" id="userInfoSearchTxt" v-model="searchTxt" @keyup="loadDatas('1') | debounce 500"
                                   placeholder="Search..." class="form-control no-padding-hr"
                                   style="border:none;background: #fff;background: rgba(0,0,0,.05);">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%--user table--%>
    <div class="row">
        <div class="panel panel-dark panel-light-green">
            <div class="panel-heading">
                <span class="panel-title"><i class="panel-title-icon fa fa-smile-o"></i>用户信息</span>
                <div class="panel-heading-controls">
                    <ul class="pagination pagination-xs" id="pageUl">
                    </ul>
                    <span style="margin-left: 10px;">{{page.currentPage}}/{{page.totalPages}}页</span>
                </div>
            </div>
            <table class="table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>用户名</th>
                    <th>邮 箱</th>
                    <th>金 币</th>
                    <th>登录地址</th>

                    <th></th>
                </tr>
                </thead>
                <tbody class="valign-middle">
                <tr v-for="data in dataList">
                    <td>{{$index+1}}</td>
                    <td>
                        <img  :src="data.headPhotoUrl | photoUrl" alt=""
                             style="width:26px;height:26px;" class="rounded"/>
                        &nbsp;&nbsp;
                        <a href="#" title="">{{data.userName}}</a>
                    </td>
                    <td>{{data.userEmail}}</td>
                    <td>{{data.userCoin?data.userCoin:'0'}}</td>
                    <td>{{data.loginAddress?data.loginAddress:' '}}</td>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=path%>/business/admin/userInfo/userInfo.js"></script>
</body>
</html>
