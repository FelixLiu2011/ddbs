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
    <title>多语言国际交友_跨越语言,向世界say hi</title>
    <link href="<%=path%>/common/images/favicon.ico" rel="shortcut icon">
    <meta content="gagahi,国际交友,多语言社交,多语言交友网站,多语言交友平台,翻译社交,国际交友平台,多语言社交网站,多语言社交平台,翻译社交平台,跨语言社交平台" name="keywords">
    <meta content="gagahi是一个基于翻译的国际社交平台,为您提供国际社交,多语言国际交友,随时随地翻译等社交服务,让您跨越语言障碍轻松扩大国际社交圈."
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
                            layer.msg('获取第三方数据异常！请重试！');
                            return;
                        }
                        window.location.href = "http://www.gagahi.com:80/Platform/memberPlatformLogin?membSource=weibo&platToken=" + WB2.oauthData.uid
                                +"&membNickname="+oResult.screen_name +"&membBigimg=" + oResult.profile_image_url +"&sex=" + oResult.gender;

                        /* if(bStatus){
                         if(null == WB2._config.uid || $.trim(WB2._config.uid).length <= 0){//获取第三方数据异常
                         layer.msg('获取第三方数据异常！请重试！');
                         return;
                         }

                         window.location.href = "http://www.gagahi.com:80/Platform/memberPlatformLogin?membSource=weibo&platToken=" + WB2._config.uid
                         +"&membNickname="+oResult.screen_name +"&membBigimg=" + oResult.profile_image_url +"&sex=" + oResult.gender;
                         }else{
                         if(null == WB2.oauthData.uid || $.trim(WB2.oauthData.uid).length <= 0){//获取第三方数据异常
                         layer.msg('获取第三方数据异常！请重试！');
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
                    layer.msg('获取第三方数据异常！请重试！');
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
                            layer.msg('获取第三方数据异常！请重试！');
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
                            layer.msg('获取第三方数据异常！请重试！');
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
        <div class="log-logo fl"><a href="http://www.gagahi.com:80/"><img src="<%=path%>/common/images/login.png" alt="gagahi"/></a></div>
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
            <a href="http://game.gagahi.com/" target="blank">GaGa游戏>></a>
        </div>
    </div>
</div>



<script src="<%=path%>/common/js/jquery.cookie.js" type="text/javascript"></script>



<div class="log-content">
    <div class="log-login">
        <div class="w995 jz">
            <div class="wz-china fl">


                <img src="<%=path%>/common/images/login_title_china.png" width="476"
                     height="123" alt="gagahi">



            </div>
            <div class="dlk fr">
                <div class="log-login-top">
                    <span id="zc">注册</span>
                    <span id="dl" class="active">登录</span>
                </div>
                <div class="log-login-bottom">
                    <div>
                        <!--注册开始http://www.gagahi.com:80/Platform/platformReg  -->
                        <div id="zc1" style="display: none;">
                            <input id="source" type="hidden" name="source" value="">
                            <input id="inviter" type="hidden" name="inviter" value="">
                            <input id="inviteEmail" type="hidden" name="inviteEmail" value="">
                            <input id="ispromoter" type="hidden" name="ispromoter" value="">
                            <input id="sysid" type="hidden" name="sysid" value="">
                            <div class="form-control">
                                <div style="display: inline;">
                                    <span class="f12 ts kd1 " style="display: none;">请输入帐号</span>
                                    <span class="f12 ts cw" style="display: none;">邮箱格式不正确</span>
                                    <span class="f12 ts yy" style="display: none;">邮箱已被占用</span>
                                    <span class="f12 ts tip" style="display: none;" >请牢记你的邮箱，此邮箱是您进入该网站的唯一凭证</span>
                                </div>
                                <input id="zc-txt-name" autocomplete="off"
                                       class="inp zc-txt-name" type="text" name="name"
                                       placeholder='邮箱' value="123@qq.com">
                            </div>
                            <div class="form-control Password-en">
                                <div style="display: inline;">
                                    <span class="f12 ts nickkd2 " style="display: none;">昵称长度限制为3-20位字符</span>
                                </div>
                                <input id="zc-txt-nickname" autocomplete="off"
                                       class="inp" type="text" name="name"
                                       placeholder='昵称' value="wantu">
                            </div>
                            <div class="form-control Password-en">
                                <div style="display: inline;">
                                    <span class="f12 ts mkd1 " style="display: none;">请输入密码</span>
                                    <span class="f12 ts mxy" style="display: none;">密码为6～20位的数字或字母</span>
                                    <span class="f12 ts mdy" style="display: none;">密码为6～20位的数字或字母</span>
                                </div>
                                <input type="password" autocomplete="off" placeholder='密码'
                                       class="inp zc-txt-pwd" id="zc-txt-pwd" maxlength="22"
                                       data-type-diy-regex="^[\da-zA-Z]{6,20}$"
                                       data-type="required|diy-regex" name="pwd" err="required">
                            </div>
                            <div class="form-control">
                                <input type="hidden" id="birthday" name="birthday">
                                <div style="display: inline;">
                                    <span class="f12 ts srsr " style="display: none;">你输入的生日不完整</span>
                                </div>
                                <div class="form-field">
                                    <div class="reg_form_sel mr10">
                                        <p id="reg_year">年份</p>
                                        <ul class="option select-year" id="selYear" style="display: none;">
                                        </ul>
                                    </div>
                                    <div class="reg_form_sel mr10">
                                        <p id="reg_month">月</p>
                                        <ul class="option" id="selMonth" style="display: none;">
                                        </ul>
                                    </div>
                                    <div class="reg_form_sel">
                                        <p id="reg_day">日</p>
                                        <ul class="option" id="selDay" style="display: none;">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="form-control tbk">
                                <div style="display: inline;">
                                    <span class="f12 ts yzmk " style="display: none;">请输入验证码</span>
                                    <span class="f12 ts yzmbzq" style="display: none;">验证码不正确</span>
									<span id="btn-refresh-img-code"
                                          class="rounded-btn gray icon refresh" style=""></span>
                                </div>
                                <input id="txt-code" class=" w100 yzm" type="text"
                                       autocomplete="off" placeholder='验证码' maxlength="4"
                                       minlength="4" data-type="required|minlength" name="code"
                                       err="required"> <span class="yzt"><img title='点击更换' onclick="javascript:refresh(this);" src="http://www.gagahi.com:80/imageServlet"/></span><!-- <span class="sx"></span> -->
                            </div>
                            <p class="f13">
                                点击注册，即表示您阅读并同意我们的<a href="http://www.gagahi.com:80/Platform/privacyclause" class="ls"  target="_blank">《隐私条款》</a>
                            </p>
                            <div style="text-align: center; margin: 10px 0 15px;">
                                <button class="btn" id="zc-txt-pwd1" >下一步</button>
                            </div>
                        </div>
                        <!--登陆开始 -->
                        <div id="dl1" >
                            <div class="form-control">
                                <div style="display: inline;">
                                    <span class="f12 ts kd " style="display: none;">请输入账号！</span>
                                </div>
                                <input id="txt-name" autocomplete="off" class="inp txt-name"
                                       type="text" name="name" data-type="required|diy-regex"
                                       data-type-diy-regex="^(1\d{10})|(([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6})$"
                                       placeholder='邮箱/Gaga号'>
                            </div>
                            <div class="form-control">
                                <div style="display: inline;">
                                    <span class="f12 ts mkd " style="display: none;">请输入密码！</span>
                                </div>
                                <input type="password" autocomplete="off" placeholder='密码'
                                       class="inp txt-pwd" id="txt-pwd" maxlength="20"
                                       data-type-diy-regex="^[\da-zA-Z]{6,20}$"
                                       data-type="required|diy-regex" name="pwd" err="required">
                            </div>
                            <a style="float:right" href="http://www.gagahi.com:80/Platform/forgotPassword">忘记密码</a>
                            <br>
                            <div style="text-align: center; margin: 10px 0 15px;">
                                <button class="btn" id="log-bnt">登录<!-- 登录 --></button>
                            </div>
                        </div>
                    </div>
                    <div class="dsf">
                        <!---->  <a href="#" href="javascript:void(0)" class="fcbk" onclick="loginfFaceBook()"></a>
                        <a href="#" onclick="QQLogin()" class="qq"></a>
                        <a href="#" class="xinlang" href="javascript:void(0)" onclick="loginfWeiBo()"></a>
                        <a href="<%=path%>/platform/experience?source=&inviter=&inviteEmail=&sysid=" class="kk w90">先看看<!-- 先看看 --></a>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div style="background:#fff;overflow:hidden;">
        <div class="jz w995 gt">
            <div class="zxgy">专享无限沟通</div>
            <p class="zxgyp">国际化多语种、多元化的即时聊天、邮件通信等社交功能，让您随时畅享，沟通乐趣</p>
        </div>
    </div>
    <div class="oy">
        <div class="jz w995">
            <div class="oyl fl">
                <div class="zxgy">推荐偶遇，让社交更轻松</div>
                <p class="zxgyp">
                    去邂逅你喜欢的类型吧，发现更多优质会员<br> 这是一种打破僵局，跟朋友聊天的好方法
                </p>
            </div>
            <div class="oyr fr ">
                <div class="matches__frame first">
                    <img alt="" src="<%=path%>/common/images/portrait1.jpg">
                </div>
                <div class="matches__frame second">
                    <img alt="" src="<%=path%>/common/images/portrait2.jpg">
                </div>
                <div class="matches__frame third">
                    <img alt="" src="<%=path%>/common/images/portrait3.jpg">
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div style="background:#fff">
        <div class="jz w995 app">
            <div class="appl fl">
                <h2 class="yw ari">GaGaAPP</h2>
                <div class="zxgy">新体验，轻松邂逅你的Ta</div>
                <p class="ls f25" style="margin: 66px 0 0">用户遍布全球 180个多个国家和地区</p>
                <p class="zxgyp">
                    帮你扩充你的国际朋友圈，世界其实很小，<br> 朋友圈可以无限大，“朋友圈”需要越来越有国际范儿~
                </p>
                <div class="upld">
                    <a href="https://itunes.apple.com/cn/app/gaga-ga-ga-kua-yue-yu-yan/id1051978194?mt=8" target="blank"><img src="<%=path%>/common/images/apl.jpg"></a>
                    <a href="http://sources.gagahi.com/settings/app/GaGaV1.3.0.apk" target="blank"><img src="<%=path%>/common/images/andr.jpg"></a>
                </div>
            </div>
            <div class="appr fr">
                <img src="<%=path%>/common/images/sj.jpg">
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>

<div class="log-foot">
    <div class="jz w995">
        <p>关注GaGaHi<!-- 关注GagaHi onclick="loginfFaceBook()"--> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="https://www.facebook.com/profile.php?id=100005989967380" class="dfsbk" target="_blank"></a><a href="http://t.qq.com/GaGaMatch2013/mine" class="dqq" target="_blank"></a><a class="xinlang" href="http://weibo.com/p/1006062863004774/home?from=page_100606&mod=TAB#place" target="_blank" style="vertical-align:middle"></a></p>
        <p><a href="http://www.gagahi.com:80/Platform/abutUs" target="_blank">关于我们</a> |
            <a href="http://www.gagahi.com:80/Platform/friendssafe" target="_blank">安全交友</a> |
            <a href="http://www.gagahi.com:80/Platform/privacyclause" target="_blank">隐私条款</a> |
            <a href="http://www.gagahi.com:80/Platform/help" target="_blank">帮助中心</a> |
            <a href="http://www.gagahi.com:80/Platform/contactus" target="_blank">联系我们</a><br/>
            <span class="copy-words">©<script type="text/javascript">document.write((new Date()).getFullYear());</script> 郑州中业科技股份有限公司 增值电信业务经营许可证：豫B2-20140021 豫ICP备11032422号 郑公备：41010002000042<br></span>
            工商网监：<a href="javascript:void(0);" class="monitor"></a>
        </p>
    </div>
</div>
</body>
</html>

<script type="text/javascript">
    var emailflag = false;
    var pwdflag = false;
    var nicknameflag = false;
    var birthdayflag = false;
    var codeflag = false;
    var LOGGING=false;
    /*登录验证*/
    function dl() {
        var username = $("#txt-name").val().trim();
        if (username == '') {
            $('.kd').css('display', 'block').siblings().css('display', 'none');
            $(".txt-name").css("border-color", "#ff9c00");
        } else {
            $('.kd').css('display', 'none').siblings().css('display', 'none');
            $(".txt-name").css("border-color", "#fff");
        }
    }
    function mm() {
        var pwd = $("#txt-pwd").val().trim();
        if (pwd == '') {
            $('.mkd').css('display', 'block').siblings().css('display', 'none');
            $(".txt-pwd").css("border-color", "#ff9c00");
        } else {
            $('.mkd').css('display', 'none').siblings().css('display', 'none');
            $(".txt-pwd").css("border-color", "#fff");
        }
    };
    $(document).on("blur", "#txt-name", dl);
    $(document).on("blur", "#txt-pwd", mm);
    $("#txt-name").keydown(function(e) {
        if (e.keyCode == "13") {
            $("#log-bnt").click();
            e.preventDefault();
        }
    });
    $("#txt-pwd").keydown(function(e) {
        if (e.keyCode == "13") {
            $("#log-bnt").click();
            e.preventDefault();
        }
    });
    $(document).on("click", "#log-bnt", function() {
        if(LOGGING){
            return;
        }
        dl();
        mm();
        var username = $("#txt-name").val().trim();
        var pwd = $("#txt-pwd").val().trim();
        if(username != '' && pwd != ''){
            $("#log-bnt").text($.t("global.logining"));
            LOGGING=true;
            $.post("http://www.gagahi.com:80/Platform/login",{username:username,password:pwd},function(result){
                //$("span").html(result);
                if(result.success){
                    LOGGING=true;
                    window.location.href = 'http://www.gagahi.com:80' + result.attributes["redirectUrl"];
                }else{
                    LOGGING=false;
                    $("#log-bnt").text($.t("global.login"));
                    //$("body").partialLoader("close");
                    // 用户名或者密码错误提示用户  result.msg
                    layer.msg(result.msg);
                }
            });
            /* 	setTimeout(function(){
             $("body").height($(window).height()).partialLoader();
             },1000); */
        }
    });

    /*注册验证*/
    function yhm() {
        var zcusername = $("#zc-txt-name").val().trim();
        var zcmyreg = /^((((1[345678][0-9])|371)\d{8})|([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6})$/ig;
        if (zcusername == '') {
            $('.kd1').css('display', 'block').siblings().css('display', 'none');
            $(".zc-txt-name").css("border-color", "#ff9c00");
            emailflag = false;
        } else if (!zcmyreg.test(zcusername)) {
            $('.cw').css('display', 'block').siblings().css('display', 'none');
            $(".zc-txt-name").css("border-color", "#ff9c00");
            emailflag = false;
        }else {
            /*$.post("http://www.gagahi.com:80/Platform/checkEmail",{email:zcusername},function(result){
                //$("span").html(result);
                if(!result.success){
                    $('.yy').css('display', 'block').siblings().css('display', 'none');
                    $(".zc-txt-name").css("border-color", "#ff9c00");
                    emailflag = false;
                }else{
                    $('.tip').css('display', 'block').siblings().css('display', 'none');
                    $(".zc-txt-name").css("border-color", "#fff");
                    emailflag = true;
                }
            });*/
            emailflag = true;
        }


    }
    function yhp() {
        var zcpwd = $("#zc-txt-pwd").val().trim();
        if (zcpwd == '') {
            $('.mkd1').css('display', 'block').siblings()
                    .css('display', 'none');
            $("#zc-txt-pwd").css("border-color", "#ff9c00");
            pwdflag = false;
        } else if (zcpwd.length < 6) {
            $('.mxy').css('display', 'block').siblings().css('display', 'none');
            $(".zc-txt-pwd").css("border-color", "#ff9c00");
            pwdflag = false;
        } else if (zcpwd.length > 20) {
            $('.mdy').css('display', 'block').siblings().css('display', 'none');
            $(".zc-txt-pwd").css("border-color", "#ff9c00");
            pwdflag = false;
        } else {
            $('.mdy').css('display', 'none').siblings().css('display', 'none');
            $(".zc-txt-pwd").css("border-color", "#fff");
            pwdflag = true;
        }
    }
    function txtcodeCheck(callback){
        var txtCode = $("#txt-code").val().trim();
        if(txtCode==''){
            $('.yzmk').css('display', 'block').siblings().css('display', 'none');
            $(".yzm").css("border-color", "#ff9c00");
            codeflag = false;
        }else{
/*            $.post("http://www.gagahi.com:80/Platform/reg/codeCheck",{imageCode:txtCode},function(result){
                //$("span").html(result);
                if(!result.success){
                    $('.yzmbzq').css('display', 'block').siblings().css('display', 'none');
                    $(".yzm").css("border-color", "#ff9c00");
                    codeflag = false;
                }else{
                    $('.yzmbzq').css('display', 'none').siblings().css('display', 'none');
                    $(".yzm").css("border-color", "#fff");
                    codeflag = true;
                    if (callback) {
                        callback();
                    }
                }
            });*/
            codeflag = true;
            //验证码是否正确
        }
    }
    function nickname() {
        var zcnick = $("#zc-txt-nickname").val().trim();
        if (zcnick == '' || zcnick.length < 3 || zcnick.length > 20) {
            $('.nickkd2').css('display', 'block').siblings()
                    .css('display', 'none');
            $("#zc-txt-nickname").css("border-color", "#ff9c00");
            nicknameflag = false;
        } else {
            $('.nickkd2').css('display', 'none').siblings().css('display', 'none');
            $("#zc-txt-nickname").css("border-color", "#fff");
            nicknameflag = true;
        }
    }
    /* $("#reg_year").hover(function (e) {
     var _selt = $(this);
     $(this).click(function (e1) {
     alert("asd");
     });
     }); */
    $(document).on("blur", "#zc-txt-name", yhm);
    $(document).on("blur", "#zc-txt-pwd", yhp);
    $(document).on("blur", "#txt-code", function(){
        txtcodeCheck();
    });
    $(document).on("blur", "#zc-txt-nickname", nickname);
    //$(document).on("change", "#reg_year", bir);
    //$('#selYear').hover(function(){
    //	alert(1);
    //});
    $(document).on("click", "#zc-txt-pwd1", function() {
        yhm();
        yhp();
        txtcodeCheck();
        nickname();
        var email = $("#zc-txt-name").val();
        var source = $("#source").val();
        var pwd = $("#zc-txt-pwd").val();
        var inviter = $("#inviter").val();
        var sysid =$("#sysid").val();
        var ispromoter = $("#ispromoter").val();
        var inviteEmail =$("#inviteEmail").val();
        var nickName = $("#zc-txt-nickname").val();

        var selYear = $("#reg_year").text();
        var selMonth = $("#reg_month").text();
        var selDay = $("#reg_day").text();
        var txtCode = $("#txt-code").val().trim();
        var numcheck = /^[0-9]*$/ ;
        if(!numcheck.test(selYear)||!numcheck.test(selMonth)||!numcheck.test(selDay)){
            $('.srsr').css('display', 'block').siblings().css('display', 'none');
            return false;
        }else{
            $('.srsr').css('display', 'none').siblings().css('display', 'none');
            if(emailflag&&pwdflag&&nicknameflag){
                var birthday = selYear+"-"+selMonth+"-"+selDay;
                if (codeflag) {
                    var data = {
                        userEmail:email,
                        userPwd:pwd,
                        userBirth:birthday,
                        userName:nickName
                    }
                    $.post(path + "/platform/register",data,function(result){
                        if(result){
                            console.log(result);
                            window.location.href =path +  '/platform/setSex?uuid'+result.obj;
                        }
                    });
                } else {
                    txtcodeCheck(function() {
                        $.post("http://www.gagahi.com:80/Platform/checkblackip",function(reg){
                            if(reg.success){
                                var data = {name:email,pwd:pwd,birthday:birthday,source:source,inviter:inviter,sysid:sysid,ispromoter:ispromoter,inviteEmail:inviteEmail,nickname:nickName}
                                $.post("http://www.gagahi.com:80/Platform/platformReg",data,function(result){

                                    if(result){
                                        window.location.href = 'http://www.gagahi.com:80/Platform/setSex/'+result.obj;
                                        //$('html').html(result);
                                    }
                                });
                            }else{
                                layer.msg(reg.msg);
                            }
                        })
                    });
                }

            }
        }

    });

    /*滚动加载动画*/
    $(document).ready(function() {
        $(window).on("scroll",function(event) {
            $(".oyr").each(function() {
                if (($(window).scrollTop() > ($(this)
                                .offset().top + $('.oy')
                                .outerHeight()))
                        || (($(window).scrollTop() + $(
                                window).height()) < $(
                                this).offset().top)) {
                    $(this).removeClass("animate");
                } else {
                    $(this).addClass("animate");
                }
            });
        });
    });

    /*注册登录切换*/
    $(".log-login-top span").click(	function(e) {
        var bh = $(this).attr("id")
        $(this).addClass("active").siblings().removeClass(" active");
        $("#" + bh + "1").css("display", "block").siblings().css(
                "display", "none");
    });
    /*选择语言*/
    $(".log-lan").hover(function(e) {
        $(this).find(".log-lan-select").stop(false, true).slideDown("fast");
    }, function(e) {
        $(this).find(".log-lan-select").stop(false, true).slideUp("fast");
    });
    $(".log-lan .log-lan-select>li").each(function(e) {
        var _selt = $(this);
        $(this).click(
                function(e) {
                    $(_selt.parent(".log-lan-select").siblings("span"))
                            .text(_selt.children("a").text());
                    _selt.parent(".log-lan-select").css("display",
                            "none");
                });
    });
    /*选择生日*/
    $(".reg_form_sel").hover(function(e) {
        $($(this).children(".option")).stop(false, true).slideDown("fast");
    }, function(e) {
        $($(this).children(".option")).stop(false, true).slideUp("fast");
    });
    $(".reg_form_sel .option>li").each(function(e) {
        var _selt = $(this);
        $(this).click(function(e1) {
            $(_selt.parent(".option").siblings("p")).text(_selt.text());
            _selt.parent(".option").css("display", "none");
        });
    });
    $(document).ready(function() {
        var myDate = new Date();

        $("#dateSelector").DateSelector({
            ctlYearId : 'selYear',
            ctlMonthId : 'selMonth',
            ctlDayId : 'selDay',
            defYear : myDate.getFullYear(),
            defMonth : (myDate.getMonth() + 1),
            defDay : myDate.getDate(),
            minYear : myDate.getFullYear() - 100,
            maxYear : (myDate.getFullYear() - 18)
        });

        if('reg' == 'login'){
            $('#dl1').css("display", "block").siblings().css(
                    "display", "none");
        }

        //设置cookie
        //alert($.cookie("membGahano"));
        //alert(undefined!=$.cookie("membGahano"));
        if(null!=$.cookie("membGahano") && typeof($.cookie("membGahano"))!="undefined" ){
            $.post("http://www.gagahi.com:80/Platform/experience/loginExperienceMember",{membGahano:$.cookie("membGahano")},function(result){
                if(result.success){
                    window.location.href = 'http://www.gagahi.com:80' + result.attributes["redirectUrl"];
                }
            });
        }
    });
    function refresh(obj) {
        obj.src = "http://www.gagahi.com:80/imageServlet?"+Math.random();
    }
</script>

<!--新浪-->
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=2290837754&debug=true" type="text/javascript" charset="utf-8"></script>
<script src="https://connect.facebook.net/en_US/sdk.js" defer async="true"></script>

