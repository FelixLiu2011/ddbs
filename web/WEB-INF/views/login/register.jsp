<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Register</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<%=path%>/common/bootstrap/css/bootstrap.css" rel="stylesheet"/>
    <link href="<%=path%>/business/common/css/common.css" rel="stylesheet"/>
    <link href="<%=path%>/business/login/register.css" rel="stylesheet">
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
    </script>
    <%--验证JS--%>
    <link type="text/css" href="<%=path%>/common/bootstrapvalidator/css/bootstrapValidator.min.css"/>
    <script src="<%=path%>/common/bootstrapvalidator/js/bootstrapValidator.min.js" type="text/javascript"></script>
    <script src="<%=path%>/common/bootstrapvalidator/js/language/${local}.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=path%>/common/json2/json2.js"></script>
    <script type="text/javascript" src="<%=path%>/common/md5/md5.min.js"></script>
    <script type="text/javascript" src="<%=path%>/business/login/register.js"></script>
    <script type="text/javascript" src="<%=path%>/business/login/language/${local}.js"></script>
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
    <a class="icon" onclick="baihe.bhtongji.tongji({'event':'0','spm':'4.10.56.257.1104'});" href="/login/gotoLoginPage"><spring:message code="login" text="登录"/></a>
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
<div class="container-fluid" style="position:fixed;z-index: 9999;top:50%;width: 420px;margin-left: -210px;left:50%;">
    <section class="loginBox row-fluid"id=" registerDiv">
        <div class="center-block" style="text-align:center;" id="errorP">
        </div>
        <form  style="margin-left: 20%;" id="myForm">
            <DIV class="form-group width300">
                <label class="control-label">
                    <spring:message code="register.userName" text="用户名"></spring:message>
                </label>
                <input type="text" class="form-control " name="username" placeholder="<spring:message code="register.userName" text="用户名"></spring:message>" id="userName"/>
            </DIV>
            <DIV class="form-group width300">
                <label class="control-label"><spring:message code="register.pwd" text="密 码"></spring:message> </label>
                <input type="password" class="form-control" name="password" placeholder="<spring:message code="register.pwd" text="密 码"></spring:message>" id="password"/>
            </DIV>
            <DIV class="form-group width300">
                <label class="control-label"><spring:message code="register.confirmPwd" text="确认密码"></spring:message> </label>
                <input type="password" class="form-control" name="repeatPwd" placeholder="<spring:message code="register.repeatPwd" text="重复密码"></spring:message> " id="repeatPwd"/>
            </DIV>
            <DIV class="form-group width300">
                <label class="control-label"><spring:message code="register.userSex" text="性别"></spring:message> </label>
                <select id="sex" class="form-control">
                    <option value="Male"><spring:message code="register.male" text="男"></spring:message> </option>
                    <option value="Female"><spring:message code="register.female" text="女"></spring:message> </option>
                </select>
            </DIV>
            <DIV class="form-group width300">
                <label class="control-label"><spring:message code="register.email" text="邮 箱"></spring:message> </label>
                <input type="text" class="form-control" name="email"
                       placeholder="<spring:message code="register.emailAddress" text="邮箱地址"></spring:message>" id="email"/>
            </DIV>
            <div  style="margin-bottom: 20px;">
                <input type="button" value=" <spring:message code="register.regist" text="注册"></spring:message> "
                       class="btn btn-primary form-control width300 margin-top-10px" id="registerBtn">
            </div>
        </form>
    </section>
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
