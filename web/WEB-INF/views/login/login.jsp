<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<%=path%>/common/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="<%=path%>/business/common/css/common.css" rel="stylesheet"/>
    <link href="<%=path%>/business/login/login.css" rel="stylesheet">
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
    </script>
    <script type="text/javascript" src="<%=path%>/common/json2/json2.js"></script>
    <script type="text/javascript" src="<%=path%>/common/md5/md5.min.js"></script>
    <script type="text/javascript" src="<%=path%>/business/login/login.js"></script>
    <link type="text/css" href="<%=path%>/common/bootstrapvalidator/css/bootstrapValidator.min.css"/>
    <script src="<%=path%>/common/bootstrapvalidator/js/bootstrapValidator.min.js" type="text/javascript"></script>
    <script src="<%=path%>/common/bootstrapvalidator/js/language/${local}.js" type="text/javascript"></script>
    <%--弹出窗--%>
    <link href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>
    <style type="text/css">
        #errorP{
            font-size: 13px;
            color: red;
            height:25px;
            line-height: 25px;
            /*margin-left: 25%;*/
            MARGIN-RIGHT: auto;
            MARGIN-LEFT: auto;
        }
    </style>
    <script src="/business/login/js/sHover.min.js"></script>
    <script>
        window.onload=function(){
            var a=new sHover("sHoverItem","sIntro");
            a.set({
                slideSpeed:5,
                opacityChange:true,
                opacity:80
            });
        }
        function scrollToBottom(a){
            if(windowHeight()){
                clearInterval(a.scrollTimer);
                var scrollSpeed=100;
                a.scrollTimer=setInterval(function(){
                    document.documentElement.scrollTop+=scrollSpeed;
                    document.body.scrollTop+=scrollSpeed;
                    if((document.documentElement.scrollTop>=(document.documentElement.scrollHeight-windowHeight()))||(document.body.scrollTop>=(document.documentElement.scrollHeight-windowHeight()))){
                        clearInterval(a.scrollTimer);
                    }
                },13);
            }else{
                //a.setAttribute('href', 'http://www.baidu.com');
            }
        }
        function windowHeight(){
            if(document.documentElement){
                return document.documentElement.clientHeight;
            }else{
                return document.body.clientHeight;
            }
        }
    </script>
</head>
<body>
<div class="header">
    <a class="icon" onclick="baihe.bhtongji.tongji({'event':'0','spm':'4.10.56.257.1104'});" href="/login/gotoRegister"><spring:message code="register.regist" text="注册"/></a>
    <a class="logo" href=""></a>
    <h1><strong>Million</strong> members<span>|</span>Friends from all over the world<span>|</span>Just High</h1>
    <ul class="language" style="color: black">
        <li>
            <a href="/login/gotoLoginPage?language=zh_CN" style="color: black">
                中文
            </a>
            <span style="margin-right: 5px;">|</span>
        </li>
        <li style="float:left;">
            <a href="/login/gotoLoginPage?language=en_US" style="color: black">
                English
            </a>
        </li>
    </ul>
</div>

<div class="container" style="position:fixed;z-index: 9999;top:50%;width: 420px;margin-left: -210px;left:50%;" >
    <section class="loginBox row-fluid">
        <div id="errorP">
        </div>
        <form class="form-horizontal" style="margin-top: 10px;margin-left: 25px;" id="myForm" action="#">
            <DIV class="form-group width350">
                <input type="text" class="form-control center-block" name="username"
                       placeholder="<spring:message code="username" text="用户名"></spring:message> " id="userName" required/>
            </DIV>
            <DIV class="form-group width350">
                <input type="password" class="form-control center-block" name="password"
                    placeholder="<spring:message code="register.pwd" text="密码"></spring:message> " id="password" required/>
            </DIV>
            <DIV class="form-group width350">
                <input type="checkbox" style="vertical-align: middle;" id="remeberme" checked="checked"/>
                <span class="inline-block" style="vertical-align: middle;">
                    <spring:message code="autoLoginNextTime" text="下次自动登录"></spring:message> </span>
            </DIV>
            <div class="form-group width350" style="margin-bottom: 20px;">
                <button type="button" data-loading-text="登录中..." class="btn btn-primary form-control  center-block" id="loginBtn">
                    <spring:message code="login" text="登录"></spring:message>
                </button>
                <div class="row margin-top-10px">
                    <span ><a href="javascript:void(0);" id="forgetPwd" style="margin-left: 15px;"  data-toggle="modal" data-backdrop="" autocomplete="off" data-target="#resetPwdDialog">
                        <spring:message code="forgetPwd" text="忘记密码?"></spring:message>
                    </a></span>
                    <span class="col-md-offset-6 margin-top-10px">
                        <spring:message code="noAccount" text="没有帐号?"></spring:message>
                        <a href="javascript:void(0);" id="registerBtn">
                            <spring:message code="register.regist" text="注 册"></spring:message>
                        </a></span>
                </div>
            </div>
        </form>
    </section>

    <%--密码重置--%>
    <div class="modal fade" id="resetPwdDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 150px;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">
                        <spring:message code="resetPwd" text="密码重置"></spring:message>
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal margin-left-20px " id="resetFrom">
                        <div class="form-group">
                            <label  class="control-label"><spring:message code="username" text="用户名"></spring:message> </label>
                            <input type="text" id="userNameReset" name="userNameReset" class="form-control" style="width: 90%;" placeholder="<spring:message code="username" text="用户名"></spring:message>"/>
                        </div>
                        <div class="form-group">
                            <label  class="control-label">
                                <spring:message code="email" text="邮 箱"></spring:message>
                            </label>
                            <input type="text" id="emailReset" name="emailReset" class="form-control" style="width: 90%;"
                                   placeholder="<spring:message code="email" text="邮 箱"></spring:message>" disabled="disabled"/>
                        </div>
                        <div class="row displayNone" id="tipDiv">
                            <p class="bg-info" style="font-size:13px;font-family: 'Microsoft YaHei', sans-serif;height: 30px;line-height: 30px; width: 90%;">
                                <spring:message code="emailAlreadySend" text="重置密码链接已发送到邮箱，请注意查收!若没有收到邮件，请30s后重试!"></spring:message>
                            </p>
                        </div>
                        <div class="row">
                            <button type="button" class="btn btn-info col-md-5 col-lg-offset-3" id="resetPwdBtn" >
                                <spring:message code="resetPwd" text="重置密码"></spring:message>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="part3" class="part">
    <div class="container">
        <div id="item1" class="sHoverItem">
            <img id="img1" src="/business/login/images/1.jpg">
				<span id="intro1" class="sIntro">
					<h2>Flowers</h2>
					<p>Flowers are so inconsistent! But I was too young to know how to love her</p>
				</span>
        </div>
        <div id="item2" class="sHoverItem">
            <img src="/business/login/images/2.jpg">
				<span class="sIntro">
					<h2>You know</h2>
					<p>one loves the sunset, when one is so sad</p>
				</span>
        </div>
        <div class="sHoverItem">
            <img src="/business/login/images/3.jpg">
				<span class="sIntro">
					<h2>For</h2>
					<p>For she did not want him to see her crying. She was such a proud flower</p>
				</span>
        </div>
        <div class="sHoverItem">
            <img src="/business/login/images/4.jpg">
				<span class="sIntro">
					<h2>Volcanoes</h2>
					<p>It is of some use to my volcanoes, and it is of some use to my flower, that I own them. But you are of no </p>
				</span>
        </div>
        <div class="sHoverItem">
            <img src="/business/login/images/5.jpg">
				<span class="sIntro">
					<h2>I thought</h2>
					<p>I thought that I was rich, with a flower that was unique in all the world; and all I had was a common</p>
				</span>
        </div>
        <div class="sHoverItem">
            <img src="/business/login/images/6.jpg">
				<span class="sIntro">
					<h2>For she</h2>
					<p>For she did not want him to see her crying. She was such a proud flower</p>
				</span>
        </div>
        <div class="sHoverItem">
            <img src="/business/login/images/7.jpg">
				<span class="sIntro">
					<h2>Thorns</h2>
					<p>She has only four thorns to defend herself against the world. And I have left on my planet, all alone!</p>
				</span>
        </div>
        <div class="sHoverItem">
            <img src="/business/login/images/8.jpg">
				<span class="sIntro">
					<h2>A little boy</h2>
					<p>To me, you are still nothing more than a little boy who is just like a hundred thousand other little boys.</p>
				</span>
        </div>
        <div class="sHoverItem">
            <img src="/business/login/images/9.jpg">
				<span class="sIntro">
					<h2>And I</h2>
					<p>And I have no need of you. And you, on your part, have no need of me.</p>
				</span>
        </div>
        <div class="sHoverItem">
            <img src="/business/login/images/10.jpg">
				<span class="sIntro">
					<h2>Foxes</h2>
					<p>I am nothing more than a fox like a hundred thousand other foxes.</p>
				</span>
        </div>
        <div class="sHoverItem">
            <img src="/business/login/images/11.jpg">
				<span class="sIntro">
					<h2>Tame</h2>
					<p>But if you tame me, then we shall need each other.</p>
				</span>
        </div>
        <div class="sHoverItem">
            <img src="/business/login/images/12.jpg">
				<span class="sIntro">
					<h2>Unique</h2>
					<p>To me,you will be unique in all the world. To you, I shall be unique in all the world. </p>
				</span>
        </div>
    </div><!-- /container -->
</div><!-- /part3 -->
</body>
</html>
