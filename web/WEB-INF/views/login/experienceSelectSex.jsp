<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    var path = "<%=path%>";
</script>

<!-- 用户设置的会话语言  -->

<!-- 当前登录用户，在站点内部可直接调用 -->

<!-- 导航选中状态 -->

<!-- 二级导航选中状态 -->

<!-- 头像尺寸 -->
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>gagahi_Multi language international dating_Across Languages，Say Hi to the world！</title>
    <link href="<%=path%>/common/images/favicon.ico" rel="shortcut icon">
    <meta content="gagahi,International dating,Multilingual sns,Multilingual dating sites,Multi language dating platform,Social translation,International dating platform,Multilingual social networking site,Multi language social networking platform,Translated social networking platform,Cross language social networking platform" name="keywords">
    <meta content="gagahi is a translation based international social platform,providing you with the international community, multi language international dating, translation and other social services at any time and at any time,allowing you to easily overcome language barriers and expand international social circle."
          name="description">
    <link href="<%=path%>/common/css/base.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/common.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/like.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/login.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/lang.css" rel="stylesheet" type="text/css">


    <script type="text/javascript">
        var http= window.location.protocol ;
        if(http=="https:"){
            window.location.href = "http://new.gagahi.com";
        }

    </script>
    <!--QQ登录-->
    <script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101322207" charset="utf-8"></script>

    <script src="<%=path%>/common/js/jquery.min.js" type="text/javascript"></script>
    <script  src="<%=path%>/common/js/laytpl.js"       type="text/javascript"></script>
    <script  src="<%=path%>/common/js/core.js"    type="text/javascript"></script>
    <script  src="<%=path%>/common/js/i18next-1.11.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var ctx = 'http://www.gagahi.com:80';
        var staticPath = "http://static.gagahi.com";
        var qiniuImgUrl = 'http://images.gagahi.com/';
        var myGagaId='';
        Zoneyet.Global.language = 'zh-cn';
        //ç§»å¨è®¾å¤å¤æ­æ¯æ
        if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
            Zoneyet.Global.device='mobile';
        }else{
            Zoneyet.Global.device='pc';
        }
        //è¯­è¨ééæä»¶å
        var lan2fileLan={
            "en-us":"en",
            "zh-cn":"zh_cn",
            "zh-tw":"zh_tw",
            "de-de":"de_de",
            "es-es":"es_es",
            "ja-jp":"ja_jp",
            "ko-kr":"ko_kr",
            "ru-ru":"ru_ru"
        };
        var language = Zoneyet.Global.language;
        //åå§åå½éå
        /* 	if(Zoneyet.Browser.isIE9||Zoneyet.Browser.isIE8){
         //æ¯æie9
         $.i18n.init({
         lng:lan2fileLan[language],//åç«¯å½éåæä»¶
         useCookie: false,
         fallbackLng: false,
         resStore:Zoneyet.Global.langresource,
         // resGetPath: staticPath+'/js/lang/__lng__.json'
         },function(err,t) {
         });
         }else{
         $.i18n.init({
         lng:lan2fileLan[language],//åç«¯å½éåæä»¶
         useCookie: false,
         fallbackLng: false,
         //resStore:Zoneyet.Global.langresource,
         resGetPath: staticPath+'/js/lang/__lng__.json'
         },function(err,t) {
         });
         } */
        $.i18n.init({
            lng:lan2fileLan[language]||"en",//åç«¯å½éåæä»¶
            useCookie: false,
            fallbackLng: false,
            getAsync: false,
            //resStore:Zoneyet.Global.langresource,
            resGetPath: staticPath+'/js/lang/__lng__.json'
        },function(err,t) {
            $(function(){
                myGagaId = $('.head').attr('gagaid') || '';
                $("body").i18n();
                if (typeof i18nSucess == 'function') {
                    i18nSucess();
                }
            });
        });

    </script>
    <script src="<%=path%>/common/js/global_plugin.js" type="text/javascript"></script>
    <script src="<%=path%>/common/layer/js/layer.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/selectdate.js" type="text/javascript"></script>

    <script type="text/javascript">
        /*选择语言*/
        $(".log-lan").hover(function(e) {
            $(this).find(".log-lan-select").stop(false, true).slideDown("fast");
        }, function(e) {
            $(this).find(".log-lan-select").stop(false, true).slideUp("fast");
        });
        $(".log-lan .log-lan-select>li").each(function(e) {
            var _selt = $(this);
            $(this).click(function(e) {
                $(_selt.parent(".log-lan-select").siblings("span")).text(_selt.children("a").text());
                _selt.parent(".log-lan-select").css("display","none");
            });
        });
        $(function(){
            var language=Zoneyet.Global.language;
            $('body').addClass(language.toLowerCase());
        });
    </script>
</head>

<body>
<!--新浪-->
<script>
    /**登录*/
    function loginfWeiBo(){
        // 弹出登入窗口
        WB2.login(function(){
            // 验证是否登入成功
            if(WB2.checkLogin()){
                // api 入口
                WB2.anyWhere(function(W){
                    // 调用 account/get_uid 接口，获取用户信息
                    /* W.parseCMD('/account/get_uid.json', function(oResult, bStatus){
                     if(bStatus){
                     alert(oResult.uid);
                     alert(WB2._config.access_token);
                     //window.location.href = "http://www.gagahi.com:80/Platform/memberPlatformLogin?membSource=weibo" + "&platToken=" + oResult.uid;
                     }
                     }, {}, {
                     method : 'get',
                     cache_time : 30
                     }); */

                    W.parseCMD('/users/show.json?access_token=' + WB2.oauthData.access_token + '&uid=' + WB2.oauthData.uid, function(oResult, bStatus){
                        if(null == WB2.oauthData.uid || $.trim(WB2.oauthData.uid).length <= 0){//获取第三方数据异常
                            layer.msg('Get third party data exception! Please try again!');
                            return;
                        }
                        window.location.href = "http://www.gagahi.com:80/Platform/memberPlatformLogin?membSource=weibo&platToken=" + WB2.oauthData.uid
                                +"&membNickname="+oResult.screen_name +"&membBigimg=" + oResult.profile_image_url +"&sex=" + oResult.gender;

                        /* if(bStatus){
                         if(null == WB2._config.uid || $.trim(WB2._config.uid).length <= 0){//获取第三方数据异常
                         layer.msg('Get third party data exception! Please try again!');
                         return;
                         }

                         window.location.href = "http://www.gagahi.com:80/Platform/memberPlatformLogin?membSource=weibo&platToken=" + WB2._config.uid
                         +"&membNickname="+oResult.screen_name +"&membBigimg=" + oResult.profile_image_url +"&sex=" + oResult.gender;
                         }else{
                         if(null == WB2.oauthData.uid || $.trim(WB2.oauthData.uid).length <= 0){//获取第三方数据异常
                         layer.msg('Get third party data exception! Please try again!');
                         return;
                         }
                         window.location.href = "http://www.gagahi.com:80/Platform/memberPlatformLogin?membSource=weibo&platToken=" + WB2.oauthData.uid
                         +"&membNickname="+oResult.screen_name +"&membBigimg=" + oResult.profile_image_url +"&sex=" + oResult.gender;
                         } */

                    }, {}, {
                        method : 'get',
                        cache_time : 30
                    });
                });
            }
        });
    }
</script>


<!--facebook-->
<script>
    window.fbAsyncInit = function() {
        FB.init ({
            appId      : '856847427701878',
            //cookie     : true,
            xfbml      : true,
            version    : 'v2.6'
        });

        /* FB.getLoginStatus(function(response) {
         statusChangeCallback(response);
         }); */
    };

    function loginfFaceBook(){
        FB.login(function(response) {
            statusChangeCallback(response) //登录回调函数
        },{scope: 'email'});
    }

    var statusChangeCallback = function (response){
        if (response.status === 'connected') {
            var accessToken = response.authResponse.accessToken; //取得 accessToken
            var userID = response.authResponse.userID;
            //alert(accessToken+"----"+response.authResponse.userID);
            var name = "";
            var gender = "";
            var pictureurl = "";
            FB.api('/me?fields=name,email,gender,picture', function(response) { // /me为API指定的调用方法，用于获取登陆用户相关信息
                //document.getElementById('status').innerHTML ='Thanks for logging in, ' + response.name + '!';
                name = response.name;
                gender = response.gender;
                pictureurl = response.picture.data.url;

                if(null == userID || $.trim(userID).length <= 0){//获取第三方数据异常
                    layer.msg('Get third party data exception! Please try again!');
                    return;
                }
                window.location.href = "http://www.gagahi.com:80/Platform/memberPlatformLogin?membSource=facebook&platToken=" + userID
                        +"&membNickname="+ name +"&membBigimg=" + escape(pictureurl) +"&sex=" + gender;
            });

        }else if (response.status === 'not_authorized') {
            document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';
        } else {
            document.getElementById('status').innerHTML = 'Please log ' + 'into Facebook.';
        }
    };

    /**注销*/
    function logoutFacebook(){
        FB.logout(function(response) {
            alert("success");
        });
    }
</script>
<div id="status"></div>


<!-- QQ -->
<script type="text/javascript">
    function QQLogin(){
        //以下为按钮点击事件的逻辑。注意这里要重新打开窗口
        //否则后面跳转到QQ登录，授权页面时会直接缩小当前浏览器的窗口，而不是打开新窗口

        try{
            QC.Login({
                //btnId：插入按钮的节点id，必选
                btnId:"dqq",//该版本不用此id
                size: "B_M"
            }, function(reqData, opts){//登录成功
                console.log(reqData, opts);
                //检查是否登录
                if(QC.Login.check()){//如果已登录
                    QC.Login.getMe(function(openId, accessToken){
                        //alert(["当前登录用户的", "openId为："+openId, "accessToken为："+accessToken].join("\n"));
                        if(null == openId || $.trim(openId).length <= 0){//获取第三方数据异常
                            layer.msg('Get third party data exception! Please try again!');
                            return;
                        }
                        openQQ ="true";
                        window.location.href = "http://www.gagahi.com:80/Platform/memberPlatformLogin?membSource=qq&platToken=" + openId
                                +"&membNickname="+ encodeURI(encodeURI(reqData.nickname)) +"&membBigimg=" + reqData.figureurl + "&sex=" + encodeURI(encodeURI(reqData.gender));

                    });
                    //这里可以调用自己的保存接口
                }
            }, function(opts){//注销成功
                alert('QQ登录 注销成功');
            });
        }catch(e){
            var A=window.open('https://graph.qq.com/oauth2.0/authorize?client_id=101322207&response_type=token&scope=all&redirect_uri=http%3A%2F%2Fqzonestyle.gtimg.cn%2Fqzone%2Fopenapi%2Fredirect-1.0.1.html', 'oauth2Login_10078' ,'height=525,width=585, toolbar=no, menubar=no, scrollbars=no, status=no, location=yes, resizable=yes');
            QC.Login({
                //btnId：插入按钮的节点id，必选
                btnId:"dqq",//该版本不用此id
                size: "B_M"
            }, function(reqData, opts){//登录成功
                console.log(reqData, opts);
                //检查是否登录
                if(QC.Login.check()){//如果已登录
                    QC.Login.getMe(function(openId, accessToken){
                        //alert(["当前登录用户的", "openId为："+openId, "accessToken为："+accessToken].join("\n"));
                        if(null == openId || $.trim(openId).length <= 0){//获取第三方数据异常
                            layer.msg('Get third party data exception! Please try again!');
                            return;
                        }
                        openQQ ="true";
                        window.location.href = "http://www.gagahi.com:80/Platform/memberPlatformLogin?membSource=qq&platToken=" + openId
                                +"&membNickname="+ encodeURI(encodeURI(reqData.nickname)) +"&membBigimg=" + reqData.figureurl + "&sex=" + encodeURI(encodeURI(reqData.gender));

                    });
                    //这里可以调用自己的保存接口
                }
            }, function(opts){//注销成功
                alert('QQ登录 注销成功');
            });
        }
    }

    //暂时未用
    function QQLoginOut(){
        QC.Login.signOut();
    }

    /*
     $(function() {
     $(".fhlb").click(function(){
     layer.open({
     skin: 'demo-tc',
     type: 1,
     title: false,
     area: ['521px','580px'],
     success: function(layero, index){
     $(".sayout").click(function(){
     $("#hiddenIM").find("[data-gagaID=-1]").click();
     layer.close(index)
     })
     },
     content: '<h4 class="back-old-title">' + $.t('ggnr.title') + '</h4><p>' + $.t('fhlb.nr1') + '</p><p>' + $.t('fhlb.nr2') + '</p><a href="http://old.gagahi.com/" class="back-old-btn">' + $.t('fhlb.nr') + '</a>',
     yes: function(index, layero) {
     //console.log(index+'||'+layero)

     layer.close(index)
     },
     cancel: function(index) {}
     });
     });
     });*/
</script>






<div class="index-head-box">
    <div class="log-header w995">
        <div class="log-logo fl"><a href="http://www.gagahi.com:80/"><img src="http://static.gagahi.com/images/login.png" alt="gagahi"/></a></div>
        <div class="log-lan fl f14"><span>简体中文</span><i></i>
            <ul class="log-lan-select" style="display:none;">

                <li><a href="http://www.gagahi.com:80/Global/changeLanguage?lang=en-us">English</a></li>

                <li><a href="http://www.gagahi.com:80/Global/changeLanguage?lang=ja-jp">日本語</a></li>

                <li><a href="http://www.gagahi.com:80/Global/changeLanguage?lang=ru-ru">русский</a></li>

                <li><a href="http://www.gagahi.com:80/Global/changeLanguage?lang=es-es">Español</a></li>

                <li><a href="http://www.gagahi.com:80/Global/changeLanguage?lang=zh-cn">简体中文</a></li>

                <li><a href="http://www.gagahi.com:80/Global/changeLanguage?lang=zh-tw">繁體中文</a></li>

                <li><a href="http://www.gagahi.com:80/Global/changeLanguage?lang=ko-kr">한국어</a></li>

                <li><a href="http://www.gagahi.com:80/Global/changeLanguage?lang=de-de">Deutsch</a></li>


            </ul>
        </div>
        <div class="log-gam fr f16" style="display:none">
            <a href="http://www.asdear.com/" class="fhlb" data-i18n="fhlb.nr" style="cursor: pointer;"></a> <!-- -->
            <a href="http://game.gagahi.com/" target="blank">GaGa Game>></a>
        </div>
    </div>
</div>



<div class="log-content">
    <div class="lan-sele">
        <h3 class="tc f18">Select gender</h3>
        <input type="hidden" id="uuid" value="${uuid}"/>
        <p class="tc c-ff8a00 mb45 mt10">After sex selection can not be changed</p>
        <input type="hidden" name = "sex" id = "sex" value="${sex}">
        <ul class="lan-bk mb45 sel-sex tc">
            <li id="1">Male
                <div class="selected" ></div>
            </li>
            <li class="lds" id="2">Female
                <div class="selected selected1" style="display:none;"></div>
            </li>
            <div class="clear"></div>
        </ul>
        <div style="text-align:center; margin:10px 0 15px;">
            <button class="btn btn1 f16" id="log-btn">Next</button>
        </div>
    </div>
</div>

<div class="log-foot">
    <div class="jz w995">
        <p>Follow GaGaHi<!-- 关注GagaHi onclick="loginfFaceBook()"--> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="https://www.facebook.com/profile.php?id=100005989967380" class="dfsbk" target="_blank"></a><a href="http://t.qq.com/GaGaMatch2013/mine" class="dqq" target="_blank"></a><a class="xinlang" href="http://weibo.com/p/1006062863004774/home?from=page_100606&mod=TAB#place" target="_blank" style="vertical-align:middle"></a></p>
        <p><a href="http://www.gagahi.com:80/Platform/abutUs" target="_blank">About us</a> |
            <a href="http://www.gagahi.com:80/Platform/friendssafe" target="_blank">Online safety</a> |
            <a href="http://www.gagahi.com:80/Platform/privacyclause" target="_blank">Terms</a> |
            <a href="http://www.gagahi.com:80/Platform/help" target="_blank">Help</a> |
            <a href="http://www.gagahi.com:80/Platform/contactus" target="_blank">Contact us</a><br/>
            <span class="copy-words">©<script type="text/javascript">document.write((new Date()).getFullYear());</script> 郑州中业科技股份有限公司 增值电信业务经营许可证：豫B2-20140021 豫ICP备11032422号 郑公备：41010002000042<br></span>
            工商网监：<a href="javascript:void(0);" class="monitor"></a>
        </p>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    /*没选择性别提示*/
    /*$('#log-bnt').on('click', function(){
     layer.open({
     type: 2,
     title: 'layer mobile页',
     shadeClose: true,
     shade: 0.8,
     area: ['380px', '90%'],
     content: 'http://layer.layui.com/mobile/' //iframe的url
     });
     });
     /*选择性别*/
    var pd=false
    $(".lan-bk li").click(function(e) {
        $(this).children("div").css("display","block");
        $(this).attr("data-chosed","1").siblings().removeAttr("data-chosed");
        $(this).siblings().children("div").css("display","none");
        $("#sex").val(this.id);
        pd=true
    })
    $('#log-btn').on('click', function(){
        var sex = 0;
        if(pd){
            $(".qxz").css("display","none");
            sex = 1;
        }else {
            $(".qxz").css("display","block");
            sex = 2;
        }
        if(sex > 0){
            sex = $("#sex").val();
            var uuid = $("#uuid").val();
            window.location.href = path + '/platform/setLanguage?sex='+sex+'&uuid='+uuid;
        }else{
            layer.msg('Select gender');
        }
    })
    /*选择语言*/
    $(".log-lan").hover(function (e) {
        $(this).find(".log-lan-select").stop(false, true).slideDown("fast");
    }, function (e) {
        $(this).find(".log-lan-select").stop(false, true).slideUp("fast");
    });
    $(".log-lan .log-lan-select>li").each(function (e) {
        var _selt = $(this);
        $(this).click(function (e) {
            $(_selt.parent(".log-lan-select").siblings("span")).text(_selt.children("a").text());
            _selt.parent(".log-lan-select").css("display", "none");
        });
    });
</script>

