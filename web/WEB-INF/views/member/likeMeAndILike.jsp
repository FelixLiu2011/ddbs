<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<script type="text/javascript">
    var path = "<%=path%>";
</script>
<!-- 用户设置的会话语言  -->

<!-- 当前登录用户，在站点内部可直接调用 -->

<!-- 导航选中状态 -->

<!-- 二级导航选中状态 -->

<!-- 头像尺寸 -->

<!DOCTYPE html>
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>gagahi_Multi language international dating_Across Languages，Say Hi to the world！</title>
    <link href="<%=path%>/common/images/favicon.ico" rel="shortcut icon">
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="gagahi,International dating,Multilingual sns,Multilingual dating sites,Multi language dating platform,Social translation,International dating platform,Multilingual social networking site,Multi language social networking platform,Translated social networking platform,Cross language social networking platform" name="keywords">
    <meta content="gagahi is a translation based international social platform,providing you with the international community, multi language international dating, translation and other social services at any time and at any time,allowing you to easily overcome language barriers and expand international social circle." name="description">
    <link href="<%=path%>/common/js/ScrollBar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/base.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/common.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/webupload.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/jquery.range.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/jquery.range.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/lang.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/lrtk.css" rel="stylesheet" type="text/css">
    <!-- <link href="<%=path%>/common/css/skin/zhongqiu/style.css" rel="stylesheet" type="text/css"> -->
    <script src="<%=path%>/common/js/jquery.min.js" type="text/javascript"></script>
    <script  src="<%=path%>/common/js/laytpl.js"       type="text/javascript"></script>
    <script  src="<%=path%>/common/js/core.js"    type="text/javascript"></script>
    <script  src="<%=path%>/common/js/i18next-1.11.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var ctx = 'http://www.gagahi.com:80';
        var staticPath = "http://static.gagahi.com";
        var qiniuImgUrl = 'http://images.gagahi.com/';
        var myGagaId='';
        Zoneyet.Global.language = 'en-us';
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
    <script src="<%=path%>/common/js/webuploader.js" type="text/javascript"></script>
    <script src="<%=path%>/common/layerjs/layer.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/template.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/global_plugin.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/ScrollBar/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/koala.min.1.5.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/terminator2.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=path%>/common/IM/js/processingTime.js"></script>
    <script type="text/javascript" src="<%=path%>/common/js/gift.js"></script>
    <script type="text/javascript">
        $(function(){

            $.post("http://www.gagahi.com:80/Member/Notice/getNoticeCountMap",{ },function(data,textStatus){
                var obj = eval(data);
                //右侧小铃铛
                if(obj.attributes.rightNotice == 0){
                    $("#rightNotice").text("");
                }else{
                    $("#rightNotice").attr("class", obj.attributes.rightNotice > 99 ? 'gs newsNumDouble' : 'gs newsNumSingle');
                    $("#rightNotice").text(obj.attributes.rightNotice > 99 ? '99+' : obj.attributes.rightNotice);
                }
                //右侧好友申请
                if(0==obj.attributes.rightApplyCount){
                    $("#rightApplyCount").text("");
                }else if(obj.attributes.rightApplyCount > 99){
                    $("#rightApplyCount").addClass("gs newsNumDouble");
                    $("#rightApplyCount").text("99+");
                }else{
                    $("#rightApplyCount").addClass("gs newsNumSingle");
                    $("#rightApplyCount").text(obj.attributes.rightApplyCount);
                }
                if(0==obj.attributes.leftLikeMeNotice){
                    $("#leftLikeMeNotice").text("");
                }else if(obj.attributes.leftLikeMeNotice > 99){
                    $("#leftLikeMeNotice").addClass("newsNumDouble");
                    $("#leftLikeMeNotice").text("99+");
                }else{
                    $("#leftLikeMeNotice").addClass("newsNumSingle");
                    $("#leftLikeMeNotice").text(obj.attributes.leftLikeMeNotice);
                }
                if(0==obj.attributes.leftVisitorNotice){
                    $("#leftVisitorNotice").text("");
                }else if(obj.attributes.leftVisitorNotice > 99){
                    $("#leftVisitorNotice").addClass("newsNumDouble");
                    $("#leftVisitorNotice").text("99+");
                }else{
                    $("#leftVisitorNotice").addClass("newsNumSingle");
                    $("#leftVisitorNotice").text(obj.attributes.leftVisitorNotice);
                }
                //  	  if(0==obj.attributes.leftFriendNotice){
                // 		  $("#leftFriendNotice").text("");
                //   	  }else{
                //		  $("#leftFriendNotice").attr("class","gs1 inlineblock");
                //		  $("#leftFriendNotice").text(obj.attributes.leftFriendNotice);
                // 	  }
                if(0==obj.attributes.leftSixinNotice){
                    $("#leftSixinNotice").text("");
                }else if(obj.attributes.leftSixinNotice > 99){
                    $("#leftSixinNotice").addClass("newsNumDouble");
                    $("#leftSixinNotice").text("99+");
                }else{
                    $("#leftSixinNotice").addClass("newsNumSingle");
                    $("#leftSixinNotice").text(obj.attributes.leftSixinNotice);
                }

                $("#leftIlike").attr("class","inlineblock");
                $("#leftIlike").text("");

            });

            //选中状态样式
            selectionStyle();
        });
        //头部滚动
        (function($){
            $(window).load(function() {
                $(".xltip .nr").mCustomScrollbar();
                $(".frd .nr").mCustomScrollbar();

                /**阻止子元素触发事件*/
                $(".xlfrd,.xltip").on("mouseover",function(event){
                    event.stopPropagation();
                });
            });
        })(jQuery);
        //选中状态样式
        function  selectionStyle(){
            clearnSelectionStyle();
            if('encounterIndex'=='leftFriendIndex'){
                $("#encounterIndex").attr("class","on");
            }
            if('zoneIndex'=='leftFriendIndex'){
                $("#zoneIndex").attr("class","on");
            }
            if('gameIndex'=='leftFriendIndex'){
                $("#gameIndex").attr("class","on");
            }
            if('shopIndex'=='leftFriendIndex'){
                $("#shopIndex").attr("class","on");
            }

            //左侧导航
            if('leftSixinIndex'=='leftFriendIndex'){
                $("#leftSixinIndexImg").attr("class","on");
                $("#leftSixinIndexText").attr("class","on");
            }
            if('leftLikeMeIndex'=='leftFriendIndex'){
                $("#leftLikeMeIndexImg").attr("class","lkm on");
                $("#leftLikeMeIndexText").attr("class","on");
            }
            if('leftIlikeIndex'=='leftFriendIndex'){
                $("#leftIlikeIndexImg").attr("class","mlk on");
                $("#leftIlikeIndexText").attr("class","on");
            }
            if('leftFriendIndex'=='leftFriendIndex'){
                $("#leftFriendIndexImg").attr("class","each-lk on");
                $("#leftFriendIndexText").attr("class","on");
            }
            if('leftVisitorIndex'=='leftFriendIndex'){
                $("#leftVisitorIndexImg").attr("class","visitor on");
                $("#leftVisitorIndexText").attr("class","on");
            }
        }

        //清除选中样式
        function  clearnSelectionStyle(){
            $("#encounterIndex").attr("class","");
            $("#zoneIndex").attr("class","");
            $("#gameIndex").attr("class","");
            $("#shopIndex").attr("class","");

            //左侧导航
            $("#leftSixinIndexImg").attr("class","");
            $("#leftSixinIndexText").attr("class","");

            $("#leftLikeMeIndexImg").attr("class","lkm");
            $("#leftLikeMeIndexText").attr("class","");

            $("#leftIlikeIndexImg").attr("class","mlk");
            $("#leftIlikeIndexText").attr("class","");

            $("#leftFriendIndexImg").attr("class","each-lk");
            $("#leftFriendIndexText").attr("class","");

            $("#leftVisitorIndexImg").attr("class","visitor");
            $("#leftVisitorIndexText").attr("class","");


        }


        /***
         * 跳转至指定页面
         */
        function gotopage(obj){
            var url = $(obj).find(".gotourl").val();
            if (url.indexOf('www.gagahi.com') != -1) {
                var newHost = location.host;
                url = url.replace('//www.gagahi.com', ('//' + newHost));
            }
            var id = $(obj).find(".hide").val();
            window.location.href = url + "&nid="+id;
        }

        /**
         * 鼠标移动到通知异步加载
         */
        function onmoseovernotice(){
            var $nr = $(".ihome_top_notice_ul").closest(".nr");
            $nr.partialLoader();
            $.ajax({
                type : "post",
                url : "http://www.gagahi.com:80/Member/Notice/ajaxnotice",
                contentType : "application/x-www-form-urlencoded",
                success: function(data){
                    $nr.partialLoader('close');
                    if(data.success){
                        var str = "";
                        for(var i = 0; i < data.obj.length;i++){
                            str += "<li class='f13 curPor' onclick='gotopage(this)'><input type='hidden' value='"+ data.obj[i].notiId +"' class='hide'/>";
                            if (data.obj[i].notiContent.indexOf('<span class="tim') == -1) {
                                /*
                                 str += data.obj[i].notiContent + "<br><p><span class=\"tim f12\">"+ TimeDifference2($.fn.returnTime(data.obj[i].notiTime,'full','YYYY-MM-DD hh:mm'),'',$.fn.returnTime(new Date().getTime(),'full','YYYY-MM-DD hh:mm')) +"</span></p>" + "</li>";*/
                                str += data.obj[i].notiContent.replace('</p>', ('<span class="tim f12">' + TimeDifference2($.fn.returnTime(data.obj[i].notiTime,'full','YYYY-MM-DD hh:mm'),'',$.fn.returnTime(new Date().getTime(),'full','YYYY-MM-DD hh:mm')) + '</span></p>'));
                            } else {
                                str += data.obj[i].notiContent;
                            }
                        }

                        var count = $(".ihome_top_notice_ul").find("li").length;
                        if(data.obj.length != 0 && data.obj.length == count){
                            return;
                        }
                        if (data.obj.length == 0) {
                            str = '<li class="notipli">' + $.t('global.nomoremsg') + '</li>';
                        }
                        $(".ihome_top_notice_ul").empty();
                        $(".ihome_top_notice_ul").append(str);
                        if (data.obj.length) {
                            $nr.parent().removeClass('notips');
                        } else {
                            $nr.parent().addClass('notips');
                        }
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }

        /**好友申请*/
        function onmoseoverfriend(){
            $(".ihome_top_apply_friend_ul").closest(".nr").partialLoader();
            $.ajax({
                type : "post",
                url : "http://www.gagahi.com:80/Member/Friend/ajaxfriend",
                contentType : "application/x-www-form-urlencoded",
                //dataType: "text",//数据类型text xml json  script  jsonp
                success: function(data){
                    $(".ihome_top_apply_friend_ul").closest(".nr").partialLoader('close');
                    if(data.success){
                        var count = $(".ihome_top_apply_friend_ul").find(".agree_bt").length;
                        if(data.obj.list.length + data.obj.mList.length == count && count != 0){
                            return;
                        }

                        var str = "";
                        str +="<h3 id='h31'>Friend Requests</h3>";
                        if(null != data.obj.list && data.obj.list.length > 0){
                            for(var i = 0; i < data.obj.list.length;i++){//好友申请
                                str +="<li class='addfriend'><span class='tx'>"
                                        +"<a href='"+ctx+"/Member/otherHome/"+data.obj.list[i].frapGagaid+"'><img src='http://images.gagahi.com//"+ data.obj.list[i].member.membBigimg +"'></a>"
                                        +"</span><span class='nm' title='"+ data.obj.list[i].member.membNickname +"'><a href='"+ctx+"/Member/otherHome/"+data.obj.list[i].frapGagaid+"'>"+ data.obj.list[i].member.membNickname + "</a></span>"
                                        +"<p class='fr'><button onclick='friendApplyHandle(this,3,"+ data.obj.list[i].frapId +")' title='Accept'>"
                                        +"Accept</button>"
                                        +"<button onclick='friendApplyHandle(this,2,"+ data.obj.list[i].frapId +")' title='Ignore'>"
                                        +"Ignore</button></p></li>";
                            }
                        }else{
                            str += "<li style=\"color:#696969; text-align:center;\">No friend requests！</li>";
                        }

                        //可能认识的人
                        str += "<h3 id='h32'>" + $.t('global.addFirendWord1') + "</h3>";
                        if(null != data.obj.mList && data.obj.mList.length > 0){
                            for(var i = 0; i < data.obj.mList.length;i++){//好友申请
                                str +="<li><span class='tx'>"
                                        +"<a href='"+ctx+"/Member/otherHome/"+data.obj.mList[i].membGagaid+"'><img src='http://images.gagahi.com//"+ data.obj.mList[i].membBigimg +"'></a>"
                                        +"</span><span class='nm' title='"+ data.obj.mList[i].membNickname +"'><a href='"+ctx+"/Member/otherHome/"+data.obj.mList[i].membGagaid+"'>"+ data.obj.mList[i].membNickname + "</a></span>"
                                        +"<p class='fr'><button onclick='applyFriend(this,"+ data.obj.mList[i].membGagaid +")' class='agree_bt' title='Add friends'>"
                                        +"Add friends</button>"
                                        +"<button onclick='friendApplyHandle(this,2,"+ data.obj.mList[i].membGagaid +")' title='Ignore'>"
                                        +"Ignore</button></p></li>";
                            }
                            str += "<h3 id='h33' style='display:none;'></h3>";
                        }else{
                            str += "<li style=\"color:#696969; text-align:center;\">No person to recommend</li>";
                        }

                        $(".ihome_top_apply_friend_ul").empty();
                        $(".ihome_top_apply_friend_ul").append(str);
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }



        /**好友申请操作*/
        function friendApplyHandle(obj,state,applyid){
            $.ajax({
                type : "post",
                url : "http://www.gagahi.com:80/Member/Friend/friendApplyHandle",
                contentType : "application/x-www-form-urlencoded",
                data: {"result":state,"state":null,"applyid":applyid},
                success: function(data){
                    if(data.success){
                        //jquery 操作jsp删除该条数据
                        $(obj).parent().parent().remove();

                        var obj3 = $("#rightApplyCount");
                        var count3 = $(obj3).text();
                        if(null == count3 || $.trim(count3).length <= 0){
                            count3 = 0;
                        }
                        $(obj3).text(parseInt(count3)-1);
                        if(parseInt(count3)-1 <= 0){
                            if($(obj3).hasClass("gs")){
                                $(obj3).removeClass("gs");
                            }
                        }

                        //数据空时show 标签
                        $('#h31').nextUntil('#h32').addClass('liclazz');
                        var count1 = $(".ihome_top_apply_friend_ul").find('.liclazz').length;
                        if(count1 <= 0){
                            $('#h31').after("<li style=\"color:#696969; text-align:center;\">No friend requests！</li>");
                        }

                        $('#h32').nextUntil('#h33').addClass('liclazz2');
                        var count1 = $(".ihome_top_apply_friend_ul").find('.liclazz2').length;
                        if(count1 <= 0){
                            $('#h32').after("<li style=\"color:#696969; text-align:center;\">No person to recommend</li>");
                        }
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }

        /**好友申请操作*/
        function applyFriend(obj,friGagaid){
            $.ajax({
                type : "post",
                url : "http://www.gagahi.com:80/Member/Friend/applyFriend",
                contentType : "application/x-www-form-urlencoded",
                data: {"friGagaid":friGagaid,"source":"1"},
                success: function(data){
                    if(data.success){
                        //jquery 操作jsp删除该条数据
                        $(obj).parent().parent().remove();

                        //数据空时show 标签
                        $('#h31').nextUntil('#h32').addClass('liclazz');
                        var count1 = $(".ihome_top_apply_friend_ul").find('.liclazz').length;
                        if(count1 <= 0){
                            $('#h31').after("<li style=\"color:#696969; text-align:center;\">No friend requests！</li>");
                        }

                        $('#h32').nextUntil('#h33').addClass('liclazz2');
                        var count1 = $(".ihome_top_apply_friend_ul").find('.liclazz2').length;
                        if(count1 <= 0){
                            $('#h32').after("<li style=\"color:#696969; text-align:center;\">No person to recommend</li>");
                        }
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }


        /*全局退出 */
        function loginout(){
            //alert(''.length +"_______" +''.length);
            if(''.length<=0 ||''.length<=0){
                layer.open({
                    area: ['364px',''],
                    title: $.t('global.guestOutTitle'),
                    content: "<p class='tc'>  " + $.t('global.guestOutWords') + "       </p>",
                    btn: $.t('global.guestOutBtn'),
                    yes: function (index, layero) {
                        layer.close(index)
                        window.location.href = 'http://www.gagahi.com:80/Member/memberinformation?srcurl=xiaobai#showinfo';
                    },
                    cancel: function (index) {},
                });
            }else{
                //$.cookie("membGahano",null);
                delCookie("membGahano");
                //暂时屏蔽 debugger;
                var abc=getCookie("membGahano");
                window.location.href = ' http://www.gagahi.com:80/Global/loginout';
            }
        }
        function delCookie(name)
        {
            var exp = new Date();
            exp.setTime(exp.getTime() - 1);
            var cval=getCookie(name);
            if(cval!=null)
                document.cookie= name + "="+cval+";expires="+exp.toGMTString();
        }
        /*读取cookies*/
        function getCookie(name)
        {
            var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
            if(arr=document.cookie.match(reg))
                return unescape(arr[2]);
            else
                return null;
        }
        function closeSm(){

        }
    </script>
</head>

<body style="position:relative;" class='en-us'>
<div class="coverall">
    <div class=" w1100 jz searchTip">
        <div class="step1">
            <p>Cannot find the one you like?Try "search".</p>
        </div>
        <div class="step2">
            <p>If you like him/her,then vote for him/her.</p>
        </div>
        <div class="step3">
            <p>Please upload your avatar, everybody wants to see you.</p>
        </div>
    </div>
</div>
<!-- 新版说明-->
<div class="coverall1">
    <div class="xbtc">
        <div id="fsD1" class="focus">
            <div id="D1pic1" class="fPic">
                <div class="fcon" style="display: none;">
                    <a><img src="<%=path%>/common/images/en-us-xb01.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu1"></span>
                </div>

                <div class="fcon" style="display: none;">
                    <a><img src="<%=path%>/common/images/en-us-xb02.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu2"></span>
                </div>

                <div class="fcon" style="display: none;">
                    <a><img src="<%=path%>/common/images/en-us-xb03.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu3"></span>
                </div>

                <div class="fcon" style="display: none;">
                    <a><img src="<%=path%>/common/images/en-us-xb04.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu4"></span>
                </div>
            </div>
            <div class="fbg">
                <div class="D1fBt" id="D1fBt">
                    <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>1</i></a>
                    <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>2</i></a>
                    <a href="javascript:void(0)" hidefocus="true" target="_self" class="current"><i>3</i></a>
                    <a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i>4</i></a>
                </div>
            </div>
            <span class="prev"></span>
            <span class="next"></span>
        </div>
        <div class="close"></div>
    </div>
</div>
<div class="head"  gagaid="2935185">
    <div class="w1100 jz">
        <div class="fl">
            <a href="<%=path%>/index/iHome" class="logo"><img src="<%=path%>/common/images/logo.png" alt="gagahi"/></a>
            <a href="<%=path%>/index/iHome" id="encounterIndex"  >Encounter</a>
            <a href="<%=path%>/zone/myZone"  id="zoneIndex" >Feeds</a>
            <!--<a href="http://game.gagahi.com/" target="blank"  id="gameIndex" >Game</a>-->
            <a href="<%=path%>/mall/giftReal/shopHome" id="shopIndex" >Mall</a>
        </div>
        <div class="fr">
            <!--<a class="fhlb" data-i18n="fhlb.nr"></a> -->
            <a class="xbsm"  data-i18n="xbsm.nr"></a>
            <a class="vip" href="http://www.gagahi.com:80/pay/recharge" >Recharge</a>
            <a class="tip" onmouseover="onmoseovernotice()"><span></span>
                <div class="" id="rightNotice"></div>
                <div class="xl xltip">
                    <div class="jj"></div>
                    <div class="nr">
                        <ul class="yts mCustomScrollbar ihome_top_notice_ul" id="myCustomScrollbar">

                        </ul>
                    </div>
                </div>
            </a><a class="frd" onmouseover="onmoseoverfriend()"><span></span>
            <div class="" id="rightApplyCount"></div>
            <div class="xl xlfrd">
                <div class="jj"></div>
                <div class="nr">
                    <ul class="yhy yts1 mCustomScrollbar _mCS_1 mCS_no_scrollbar ihome_top_apply_friend_ul" >
                        <!-- <h3>加好友申请</h3> -->
                        <!-- <li><span class="tx"><img src="http://static.gagahi.com/images/gg1.jpg"></span><span class="nm">Nita2009</span>
                          <p class="fr">
                            <button>同意</button>
                            <button>忽略</button>
                          </p>
                        </li>-->
                    </ul>
                </div>
            </div>
        </a><div class="sz in"><span></span>
            <div class="xl xlsz">
                <div class="jj1"></div>
                <div class="nr1">
                    <ul>
                        <li><a href="http://www.gagahi.com:80/Member/memberinformation">About Me</a></li>
                        <li><a href="http://www.gagahi.com:80/Member/memberinformation#showinfo">Account Settings</a></li>
                        <li style=" border-bottom:none;"><a href="javascript:loginout()">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </div></div>
        <div class="clear"></div>
    </div>
    <!--   <div class="statement" >
      <div class="w1100 jz">
      <div class="statement-nr">
      <h4 class="statement-nr-title" data-i18n="ggnr.title"></h4>
      <p class="statement-nr-text"><span data-i18n="ggnr.nr1"></span><span class="c-ff8a00" data-i18n="ggnr.nr3"></span><span data-i18n="ggnr.nr2"></span></p>
      <div class="statement-close" onclick="closeUp()"></div>
      </div>
      </div>
      </div> -->

</div>
<script type="text/javascript">

    function closeUp(){
        //$(".statement").css("display","none");
        //$(".mid").css("margin-top","66px");
        //$(".mid").css("top","65px");
        //$(".searchTip div.step1").css("top","100px");
        //$(".searchTip div.step2").css("top","200px");
        //$(".searchTip div.step3").css("top","78px");
        //$.cookie('close_flag','1',{ path: '/' });
    }
    $(function(){
        //$(".statement").slideDown();
        //$(".mid").css("margin-top","171px");
        //$(".mid").css("top","65px");
        //$(".searchTip div.step1").css("top","205px");
        //$(".searchTip div.step2").css("top","505px");
        //$(".searchTip div.step3").css("top","183px");
        //关闭
        /*
         var close_flag=$.cookie('close_flag');
         if(close_flag==1){
         closeUp();
         }*/
        //closeUp();
        //<a class="btn btn6 sayout">'+$.t("tucao.tc")+'</a><br/><a class="btn btn7" href="https://old.gagahi.com" >'+$.t("tucao.back")+'</a>
        $.cookie('close_flag','1',{ path: '/' });
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
        /*新版说明*/
        $(".xbsm").click(function(){
            $(".coverall1").css("display","block");
        });
        $(".xbtc .close").click(function(){
            $(".coverall1").css("display","none");
        })
        Qfast.add('widgets', { path: "<%=path%>/common/js/terminator2.2.min.js", type: "js", requires: ['fx'] });
        Qfast(false, 'widgets', function () {
            K.tabs({
                id: 'fsD1',   //焦点图包裹id
                conId: "D1pic1",  //** 大图域包裹id
                tabId:"D1fBt",
                tabTn:"a",
                conCn: '.fcon', //** 大图域配置class
                auto: 0,   //自动播放 1或0
                effect: 'fade',   //效果配置
                eType: 'click', //** 鼠标事件
                pageBt:true,//是否有按钮切换页码
                bns: ['.prev', '.next'],//** 前后按钮配置class
                interval: 3000  //** 停顿时间
            })
        }) ;
        $(".xbtc").css("left",($(window).width()-$(".xbtc").width())/2+'px');
    })
</script>




<link type="text/css" href="<%=path%>/common/IM/css/im.css" rel="stylesheet" />
<link type="text/css" href="<%=path%>/common/IM/css/qqFace.css"
      rel="stylesheet" />
<link type="text/css" href="<%=path%>/common/IM/css/webuploader.css"
      rel="stylesheet" />
<script type="text/javascript">
    var staticCtx="http://static.gagahi.com/IM/";
    var globalStaticCtx="http://static.gagahi.com/";
    var ctx="http://www.gagahi.com:80";
    var qiniuImgURL="http://images.gagahi.com/";
    var imUrl="http://webim.gagahi.com/";
    var token="bf4689791055450cb822445d2d32fe93";
    var sendGender = "1";//1男2女
    var sendHeadImgUrl = "images/default/male.png";//小头像
    var myNickname = "Quintion";//自己昵称
    var myLanguage = "en-us";
    var myId = "2935185";//我的ID
    //1：普通会员，2：高级会员，3：VIP会员
    var myMemberGrade = "1";//会员等级

    if (!staticCtx) {
        staticCtx = "";//静态资源路径
    }
    if (!ctx) {
        ctx = "";//后台请求路径
    }
    if (!qiniuImgURL) {
        qiniuImgURL = "";//七牛图片路径
    }
</script>
<div id="IM">
    <div id="hiddenIM">
        <div id="hiddenLeftline"></div>
        <div class="hiddenTop">
            <span id="js-showBtn" class="showBtn showHideBtn"></span>
            <div id="js-newsArrive" class="newsArrive">
                News
            </div>
        </div>
        <div id="js-hiddenScrollBar" class="hiddenScrollContainer">
            <ul class="hiddenContactsCon">
                <li class="content singleNum" data-signid="people" data-gagaid="-1" data-remarkname="GaGa Customer Service" data-nickname="GaGa Customer Service" data-shield="0" data-online="2" data-language="zh">
                    <div class="headDiv">
                        <img class="headImg" src="<%=path%>/common/images/gagaService.png">
                        <img class="headLine" src="<%=path%>/common/IM/img/On-line.png" style="display:none">
                    </div>
                </li>
            </ul>

        </div>
    </div>
    <div id="showIM">
        <div class="showTop">
            <span id="js-hideBtn" class="hideBtn showHideBtn"></span>
        </div>
        <div class="searchDiv">
            <input type="text" class="searchInput" id="js-searchInput"
                   value="Search for contacts"><i
                id="js-searchBtn" class="searchBtn"></i> <i id="js-SearchCloseBtn"
                                                            class="searchCloseBtn"></i>

        </div>
        <div class="showTab">
			<span class="js-contacts contacts">Contacts
                <!-- 联系人 --></span> <span class="js-group group">Groups
            <!-- 群 --></span>
        </div>
        <div class="clear"></div>
        <div id="js-contactsScrollBar">
            <div class="contactsCon">
                <!--  最近联系人-----start--------->
                <div id="recentlyGroup">
                    <h6 class="showTitle FoldTitle openTitle">
                        <i class="foldingBtn js-foldingBtn"></i>
                        <p>
							<span>Recent chats
                                <!-- 最近聊天 --></span><span class="recentlyNum">12</span>
                        </p>
                    </h6>
                    <div class="clear"></div>
                    <ul class="recentlyContainer FoldContainer">
                        <li class="showContent" data-signid="people" data-gagaid="-1" data-remarkname="GaGa Customer Service" data-nickname="GaGa Customer Service" data-shield="0" data-online="2" data-language="zh">
                            <div class="showHead">
                                <img class="headImg" src="<%=path%>/common/images/gagaService.png">
                                <img class="headLine" src="<%=path%>/common/IM/img/On-line.png" style="display:none">
                            </div>
                            <span class="showRemarkName">GaGa Customer Service</span>
                            <span class="newsNum newsNumSingle" style="display:none">0</span></li>
                    </ul>
                </div>
                <!-- 在线联系人-->
                <div id="onLineGroup">
                    <h6 class="onLineTitle FoldTitle openTitle">
                        <i class="foldingBtn js-foldingBtn"></i>
                        <p>
                            <span>Online Users</span> <span class="onLineNum">0</span>
                        </p>
                    </h6>
                    <ul class="onLineContainer FoldContainer">
                    </ul>
                </div>
                <!--  我的好友-----start--------->
                <div id="friendGroup">
                    <h6 class="friendTitle FoldTitle openTitle">
                        <i class="foldingBtn js-foldingBtn"></i>
                        <p>
							<span>My friends
                                <!-- 我的好友 --></span><span class="friendNum">12</span><i
                                class="separator">/</i><span class="friendNumTotal">24</span>
                        </p>
                    </h6>
                    <ul class="friendContainer FoldContainer">
                        <li class="showContent" data-signid="people" data-gagaid="-1" data-remarkname="GaGa Customer Service" data-nickname="GaGa Customer Service" data-shield="0" data-online="2" data-language="zh">
                            <div class="showHead">
                                <img class="headImg" src="<%=path%>/common/images/gagaService.png">
                                <img class="headLine" src="<%=path%>/common/IM/img/On-line.png" style="display:none">
                            </div>
                            <span class="showRemarkName">GaGa Customer Service</span>
                            <span class="newsNum newsNumSingle" style="display:none">0</span>
                        </li>
                    </ul>

                </div>


            </div>
        </div>
        <!------ 群组-----start--------->
        <div id="groupGroup" class="js-groupGroup">
            <div id="js-createGroup" class="createGroup">
				<span>Create Group
                    <!-- 创建群聊 -->
            </div>
            <div id="js-groupScrollBar">
                <div class="groupCon">
                    <div class="groupContent">
                        <h6 class="groupTitle FoldTitle openTitle">
                            <i class="foldingBtn js-foldingBtn"></i>
                            <p>
								<span>Groups
                                    <!-- 群 --></span><span class="groupNum">6</span>
                            </p>
                        </h6>
                        <div class="clear"></div>
                        <ul class="groupContainer FoldContainer">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-----------搜索结果----------->
        <div id="js-searchResultsGroup" class="searchResultsGroup">
            <div id="searchrecentlyGroup">
                <h6 class="recentlyTitle FoldTitle openTitle">
                    <i class="foldingBtn js-foldingBtn"></i>
                    <p>
						<span>Recent chats
                            <!-- 最近聊天 --></span>
                    </p>
                </h6>
                <ul class="recentlyContainer FoldContainer"></ul>
            </div>
            <div id="searchFriendGroup">
                <h6 class="friendTitle FoldTitle openTitle">
                    <i class="foldingBtn js-foldingBtn"></i>
                    <p>
						<span>My friends
                            <!-- 我的好友 --></span>
                    </p>
                </h6>
                <ul class="friendContainer FoldContainer"></ul>
            </div>
            <div id="searchgroupGroup">
                <h6 class="groupTitle FoldTitle openTitle">
                    <i class="foldingBtn js-foldingBtn"></i>
                    <p>
						<span>Groups
                            <!-- 群 --></span>
                    </p>
                </h6>
                <ul class="groupContainer FoldContainer"></ul>
            </div>
            <div class="searchResultNothing">
                <i class="searchResultNothingImg"></i><span
                    class="searchResultNothingTXT">No results
                <!-- 无搜索结果 --></span>
            </div>
        </div>

    </div>
    <div id="IMgagaService">
        <img src="<%=path%>/common/IM/img/gagaService.png">
        <div class="gagaServiceTXT">GaGa Customer Service<!-- 嘎嘎客服 --></div>
        <span class="close-gagaservice"></span>
    </div>

</div>

<div id="chatBox">
    <div  id="chatBoxUpper" class="chatBoxUpper">
        <div class="upperLeft">
            All
            <!-- 全部  -->
            (<span id="peopleNum">0</span>)
        </div>
        <div class="upperRight">
            <i class="chatHeadimgIng"> <img class="chatHeadHeadIng"
                                            src="<%=path%>/common/IM/img/head.png" />
            </i>
            <div class=" modifyContent">
                <p class="chatRemarkNameIng"></p>
                <i class="modifyBtn js-modifyBtn"></i>
            </div>
            <div class=" modifyContainer">
                <input type="text" class="modifyRemarkName" value="" /> <i
                    class="modifyOK"></i>
            </div>

        </div>
        <div class="chatUpperBtn">

			<span class="createGroupBtn">Create group
                <!-- 建群 --></span> <span class="inviteFriends">Invite friends
            <!-- 邀请好友 --></span> <span class="functionBtn"> <i class="functionI"></i>
				<ul class="functionMore">
                    <li class="functionBack">Quit group
                        <!-- 退群 --></li>
                    <li class="functionRelationState">Delete friend
                        <!-- 删除好友 --></li>
                    <li class="functionReport">Report
                        <!-- 举报 --></li>
                    <li class="functionShieldState">Shield
                        <!-- 屏蔽 --></li>
                </ul>
			</span> <i id="js-closedChatBox" class="closedChatBox"></i>
        </div>
    </div>
    <div class="clear"></div>
    <div class="chatBoxLower">
        <ul class="lowerLeft">

        </ul>
        <div class="lowerRight">
            <div class="lowerRightBottom">
                <div class="normal">
                    <div class="upgradeTips">
                        <p class="upgradeTipsCon">
                            <span class="upgradeTipsTXT">System prompt<!-- 系统提示 -->：</span>
                            You have run out of the number of chat today, continue to chat？ Upgrade<!-- 你今日聊天条数已用完，继续聊天 点此升级 --></p>
                        <a href="http://www.gagahi.com:80/pay/upgradeMember"><span class="upgradeTipsBtn">Upgrade<!-- 点击升级 --></span></a>
                        <div class="upgradeTipsBG"></div>
                    </div>
                    <div class="sendContentCon">
						<textarea id="inputBox" class="inputBox">
							Press enter to send messages
                            <!-- 按回车键发送消息 -->
						</textarea>
                    </div>
                    <div class="FunBtncontainer">
                        <div class="fl">
                            <div class="languageOptions">
                                <div class="languageSpan js-receiveOptions">
                                    <div class="translateTXT">
										<span>translate
                                            <!-- 翻译 -->：
                                    </div>
                                    <div class="txt">
                                        <span class="language" langs-lang="en">English</span> <i
                                            class="Triangle"></i>
                                    </div>
                                </div>
                                <ul class="languageUl">
                                    <li class="langLi noTranslation" langs-lang="">
                                        No translation
                                    </li>
                                    <!-- 不翻译 -->

                                    <li class="langLi" langs-lang="en">English</li>

                                    <li class="langLi" langs-lang="jp">日本語</li>

                                    <li class="langLi" langs-lang="ru">русский</li>

                                    <li class="langLi" langs-lang="spa">Español</li>

                                    <li class="langLi" langs-lang="zh">简体中文</li>

                                    <li class="langLi" langs-lang="cht">繁體中文</li>

                                    <li class="langLi" langs-lang="kor">한국어</li>

                                    <li class="langLi" langs-lang="de">Deutsch</li>


                                </ul>
                            </div>
                        </div>
                        <div class="fr">
                            <!-- <input id="Im_data" type="hidden"> -->
                            <ul class="FunBtnUl">
                                <li class="qqFaceBtn" data-Explain="Select emoticons"></li>
                                <li class="imgBtn js_imgBtn" data-Explain="Send picture"></li>
                                <li class="giftBtn" data-explain="Send gift"></li>
                                <li class="redBtn" data-Explain="Send red packet"></li>
                                <!--<li class="giftBtn"></li>
                                  <li class="redBtn"></li>-->
                                <li class="HistoricalRecords" data-Explain="Show chat record"></li>
                                <li class="HistoricalRecordsClosed" data-Explain="Show chat record"></li>
                                <li class="sendBtn">Send
                                    <!-- 发送 --></li>
                            </ul>
                            <!-- <div id="upLoad_box" style="display:none"></div> -->
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="service hide">
                    <div class="sendContentCon">
						<textarea id="inputBox1" class="inputBox">
							Press enter to send messages
                            <!-- 按回车键发送消息 -->
						</textarea>
                    </div>
                    <div class="FunBtncontainer">
                        <div class="fl">
                            <div class="languageOptions">
                                <div class="languageSpan js-receiveOptions">
                                    <div class="translateTXT">
										<span>translate
                                            <!-- 翻译 -->：
                                    </div>
                                    <div class="txt">
                                        <span class="language" langs-lang="en">English</span> <i
                                            class="Triangle"></i>
                                    </div>
                                </div>
                                <ul class="languageUl">
                                    <li class="langLi noTranslation" langs-lang="">
                                        No translation
                                    </li>
                                    <!-- 不翻译 -->

                                    <li class="langLi" langs-lang="en">English</li>

                                    <li class="langLi" langs-lang="jp">日本語</li>

                                    <li class="langLi" langs-lang="ru">русский</li>

                                    <li class="langLi" langs-lang="spa">Español</li>

                                    <li class="langLi" langs-lang="zh">简体中文</li>

                                    <li class="langLi" langs-lang="cht">繁體中文</li>

                                    <li class="langLi" langs-lang="kor">한국어</li>

                                    <li class="langLi" langs-lang="de">Deutsch</li>


                                </ul>
                            </div>
                        </div>
                        <div class="fr">
                            <!-- <input id="Im_data" type="hidden"> -->
                            <ul class="FunBtnUl">
                                <li class="qqFaceBtn" data-Explain="Select emoticons"></li>
                                <li class="imgBtn js_imgBtn" data-Explain="Send picture"></li>
                                <!--<li class="giftBtn"></li>
                                  <li class="redBtn"></li>-->
                                <li class="HistoricalRecords" data-Explain="Show chat record"></li>
                                <li class="HistoricalRecordsClosed" data-Explain="Show chat record"></li>
                                <li class="sendBtn">Send
                                    <!-- 发送 --></li>
                            </ul>
                            <!-- <div id="upLoad_box" style="display:none"></div> -->
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="chatGroupMembers">
            <p class="chatGroupTitle">
                Group members
                <!-- 群成员 -->
                （<span class="chatGroupNum">0</span>/<span class="chatGroupTotalNum">0</span>）
            </p>
            <div id="GroupMembScrollBar">
                <ul class="GroupMembContainer"></ul>
            </div>
        </div>
        <div class="chatHistorical">
            <h6>
                Chat record
                <!-- 聊天记录 -->
                <i class="historicalClosed"></i>
            </h6>
            <div class="historicalContainer">
                <div class="textCenter marT5 IMnoChat" style="display:none">No chat record.<!-- 暂无聊天记录 --></div>
                <div class="historicalCon"></div>
            </div>
            <div class="historicalBottom">
                <i class="historicalDelete"></i>
                <ul class="historicalFun">
                    <li class="firstPage"></li>
                    <li class="previousPage"></li>
                    <li class="nextPage"></li>
                    <li class="lastPage"></li>
                </ul>
            </div>
        </div>
        <div></div>
        <div class="clear"></div>
    </div>
</div>
<div id="PopupCreateGroup">
    <h2 class="CreateGroupTitle" id="CreateGroupTitle">
		<span>Create Group
            <!-- 创建群聊 -->
    </h2>
    <div class="CreateGroupLeft">
        <div class="searchDiv">
            <input type="text" class="searchInput"
                   value="Search for contacts<!-- 搜索联系人 -->" />
            <i class="searchBtn"></i> <i class="searchCloseBtn"></i>
        </div>
        <div class="CreateGroupLeftScrollBar">
            <div class="CreateGroupLeftCon">
                <!--  最近联系人-----start--------->
                <div id="CreateGroupRecently">
                    <h6 class="CreateGroupRecentlyTitle FoldTitle openTitle">
                        <i class="CreateGroupFoldingBtn "></i>
                        <p>
							<span>Recent chats
                                <!-- 最近聊天 --></span><span class="recentlyNum">12</span>
                        </p>
                    </h6>
                    <div class="clear"></div>
                    <ul class="CreateGroupRecentlyContainer FoldContainer">
                    </ul>
                </div>
                <!--  我的好友-----start--------->
                <div id="CreateGroupFriend">
                    <h6 class="CreateGroupFriendTitle FoldTitle openTitle">
                        <i class="CreateGroupFoldingBtn "></i>
                        <p>
							<span>My friends
                                <!-- 我的好友 --></span><span class="friendNum">12</span><i
                                class="separator">/</i><span class="friendNumTotal">24</span>
                        </p>
                    </h6>
                    <ul class="CreateGroupFriendContainer FoldContainer">
                    </ul>
                </div>
            </div>
        </div>
        <!-----------搜索结果----------->
        <div id="CreateGroupSearchResults">
            <div id="CreateGroupRecentlySearch">
                <h6 class="recentlyTitle FoldTitle openTitle">
                    <i class="foldingBtn js-foldingBtn"></i>
                    <p>
						<span>Recent chats
                            <!-- 最近聊天 --></span>
                    </p>
                </h6>
                <ul class="recentlyContainer FoldContainer"></ul>
            </div>
            <div id="CreateGroupFriendSearch">
                <h6 class="friendTitle FoldTitle openTitle">
                    <i class="foldingBtn js-foldingBtn"></i>
                    <p>
						<span>My friends
                            <!-- 我的好友 --></span>
                    </p>
                </h6>
                <ul class="friendContainer FoldContainer"></ul>
            </div>
            <div class="searchResultNothing">
                <i class="searchResultNothingImg"></i> <span
                    class="searchResultNothingTXT">No results
                <!-- 无搜索结果 --></span>
            </div>
        </div>
    </div>
    <div class="CreateGroupCenter"></div>
    <div class="CreateGroupRight">
        <h6>
            Selected contacts
            <!-- 已选联系人 -->
            <span class="PeopleNum">0</span><span>/</span><span>50</span>
        </h6>
        <div class="CreateGroupRightScrollBar">
            <ul class="SelectedPeople"></ul>
        </div>
    </div>
    <div class="clear"></div>
    <div class="CreateGroupButtom">
		<span class="CreateGroupOK">Yes
            <!-- 确定 --></span> <span class="CreateGroupCncel">No
        <!-- 取消 --></span>
    </div>
</div>

<div id="cacheDiv"></div>

<!-- 商品列表 -->
<div class="giftCon" style="display: none;">
    <div class="gift-top">
        <div class="fl">
            <span class="mr15 f16 gift-chose pb5" id="gift">Virtual gifts</span>

        </div>
        <div class="fr"><a href="<%=path%>/mall/giftReal/shopHome" class="c-2d57a1 pb5">Go to the mall.</a></div>
        <div class="clear"></div>
    </div>
    <div class="giftcont" >
        <ul class="gift1 giftcont1" onscroll="findgiftlist(this)" >
            <div class="clear"></div>
        </ul>
        <ul class="trans1 giftcont1" style="display:none" onscroll="findTranspackage(this)">
        </ul>
    </div>
</div>

<!--im红包-->
<div id="RedEnvelopeTCCon" style="display:none">
    <div>
        <div class="RedEnvelopeTCLeft">
            <div class="marT25">Gold:<!-- 金币 --></div>
            <div class="marT100">Message:<!-- 留言 --></div>
        </div>
        <div class="RedEnvelopeTCRight">
            <p class="tips">Insufficient gold<!-- 金币不足 -->，Please recharge first.<!-- 请先充值 --></p>
            <input type="text" class="moneyTXT" value="Please enter 1-200 gold(s), integer only." onkeyup="this.value=this.value.replace(/\D/g,'')"
                   onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
            <div class="Remind">
                <i class="RemindIcon"></i>
                <div class="RemindContent">
                    <div class="triangle-left"></div>
                    <div class="triangle-bg"></div>
                    <span>Red packet rules<!-- 红包规则 --></span> 1、Each red packet contains 1-200 gold(s), integer only.<!-- 每个红包金额为1-200金币，仅限整数； -->
                    <br> 2、You can use the gold balance to send a red packet, if the gold is insufficient, please recharge first.<!-- 发红包可使用账户余额中的金币，如账户余额不足，请先充值再发送； -->
                    <br> 3、If the red packet is received, the gold can be in the recipient account, it can be used to consume on GaGaHi.<!-- 红包金币被领取后，直接进入领取人账户余额，可用于GaGaHi网站消费。 -->
                    <br> 4、Once the red packet is sent, it can't be returned, we will reserve for you until the recipient take it.<!-- 红包一旦发出将不予退回，一直保留到对方领取。 -->
                    <br>
                </div>
            </div>
            <div class="clear"></div>
            <div class="moneyDiv cleard">Available gold:<!-- 账户可用金币 -->： <i class="money"></i><span class="moneyNum"> 0.00 </span><br/><a class="toRecharge" href="http://www.gagahi.com:80/pay/recharge">Go to recharge!<!-- 去充值 --></a></div>
            <div class="textMSGDiv">
                <textarea class="textMSG">Your blessings</textarea>
                <div class="wordsNumDiv"><span class="wordsNum">0</span>/500</div>
            </div>
        </div>
        <div class="cleard"></div>
    </div>
</div>

<div class="sendRedEnvelopeOpen RedEnvelopeOpen im" style="display:none">
    <div class="RedEnvelopeOpenContainer">
        <div class="RedEnvelopeOpenTop">
            <i class="RedEnvelopeOpenCloseBtn"></i>
            <p class="titleName"><span class="name"></span>'s red packet</p>
            <img class="headImg" src="">
        </div>
        <div class="RedEnvelopeOpenMiddle">
            <div class="MoneyDiv">
                <span class="MoneyCount"></span><i class="MoneyImg"></i>
            </div>
            <p class="RedEnvelopeContent"></p>
            <div class="getRedEnvelopeBtn"></div>
            <p class="RedEnvelopeExplain"></p>
        </div>
        <div class="RedEnvelopeOpenBottom"></div>
    </div>
    <div class="RedEnvelopeOpenBig"></div>
</div>
<div id="RedExplain" style="display:none">
    <div class="RedExplain">
        <i class="RemindIcon"></i>
        <div class="RemindContent">
            <div class="triangle-left"></div>
            <div class="triangle-bg"></div>

            Hongbao are gifts of cash in red envelopes. They are given to children by older family members on Chinese New Year as lucky gifts for the year ahead. Actually, the amount of money in hongbao usually come in even numbers like 600 and 800, as even numbers are supposed to be lucky in Chinese culture. Today, many people even see hongbao as a sugarcoated way of socializing.
        </div>
    </div>
</div>





<script type="text/javascript" src="<%=path%>/common/IM/js/ImUploadIMG.js"></script>
<script type="text/javascript" src="<%=path%>/common/IM/js/jquery.qqFace.js"></script>
<script type="text/javascript" src="<%=path%>/common/IM/js/IMAjax.js"></script>
<script type="text/javascript" src="<%=path%>/common/IM/js/chatBox.js"></script>




<link href="<%=path%>/common/css/like.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/common/css/privateLetter.css" rel="stylesheet" type="text/css">
<script src="<%=path%>/common/js/slides-1.1.1-min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/common/js/popPrivateLetter.js"></script>

<div class="mid">
    <div class="w1100 jz">

        <!-- 资料完善度 -->



        <!-- 金币 -->



        <!-- 翻译包 -->







        <!-- 会员等级 -->







        <div class="lft fl">
            <div class="lfttop">
                <div class="yhtx fl">
                    <a href="http://www.gagahi.com:80/Member/myinformation"><img src="http://images.gagahi.com//images/default/male.png"></a>
                </div>
                <div class="yhxx fr">
                    <p class="ari">
                        <a class="ellipsis-name" href="http://www.gagahi.com:80/Member/myinformation"  title="Quintion">Quintion</a>

                    </p>
                    <p class="ari hui f12" style="margin: 8px 0">GaGaID:30039931</p>

                    <p class="jd"><span class="jdt"><span class="jdts f12">0%</span></span></p>
                </div>
                <div class="clear"></div>
            </div>

            <p class="wsw">








                <a href="http://www.gagahi.com:80/Member/memberinformation"><span class="ws"></span>Please upload your charming avatar.</a><br>



                <span class="hui f12">Perfect information, let friends know you faster</a></span>


            </p>
            <div class="lf-cz">
                <button class="leftMoneyTranslate leftMoney bdra15  pad1-2 overVisible" data-explain="0" data-suffix="Gold"><!-- 金币 -->
                    <span></span>
                    <div id="totalMoney">0</div>
                    <!-- <p class="totalMoney"><a class="Money"></a>Gold</p>-->
                </button>
                <button class="leftMoneyTranslate leftTranslate bdra15  pad1-2 overVisible" data-explain="0" data-suffix="Character"><!-- 翻译包 -->
                    <span class="fy"></span>
                    <div id="totalTranslate">0</div>

                </button>
            </div>
            <div class="lf-lb">
                <span id="leftSixinIndexImg" class="on"></span><a href="<%=path%>/platform/privateLetter" id="leftSixinIndexText" class="on">Direct Message</a>
                <div class="inlineblock newsNum" id="leftSixinNotice"></div>
            </div>
            <div class="lf-lb">
                <span class="lkm" id="leftLikeMeIndexImg"></span><a href="<%=path%>/member/like/likeMe" id="leftLikeMeIndexText">Liked me</a>
                <div class="inlineblock newsNum" id="leftLikeMeNotice"></div>
            </div>
            <div class="lf-lb">
                <span class="mlk" id="leftIlikeIndexImg"></span><a href="<%=path%>/member/like/iLike" id="leftIlikeIndexText">I liked</a>
                <div class="inlineblock newsNum" id="leftIlike"></div>
            </div>
            <div class="lf-lb lf-mutual">
                <span class="each-lk" id="leftFriendIndexImg"></span><a href="<%=path%>/member/like/likeMeAndILike" id="leftFriendIndexText">Liked mutual</a>
                <div class="inlineblock newsNum" id="leftFriendNotice"></div>
            </div>
            <div class="lf-lb" >
                <span class="visitor" id="leftVisitorIndexImg" ></span><a href="<%=path%>/member/visitor/myVisitor" id="leftVisitorIndexText">Visitor</a>
                <div class="inlineblock newsNum" id="leftVisitorNotice"></div>
            </div>
            <div class="mb20 ggw1">

            </div>
        </div>

        <script type="text/javascript">

            getTranslateWordNum();
            //获取翻译字符数
            function getTranslateWordNum(){
                /* $.post("http://www.gagahi.com:80/memberFinance/getTranslatePackTotalNum",{},
                 function(data,textStatus){
                 if(data.success){
                 $("#totalTranslate").text(data.obj);
                 $("#totalTranslate").next().find('.Translate').text(data.obj);
                 }
                 })
                 var translateno=parseInt('0')+parseInt('0')+parseInt('0');
                 $("#totalTranslate").text(translateno);
                 $("#totalTranslate").next().find('.Translate').text(translateno);	*/

                $.IM.getTranslationCharacterNum();
            }
            $("#totalMoney").parent().click(function(){
                window.open("http://www.gagahi.com:80/pay/recharge","_blank");
            });
            /* $("#totalTranslate").parent().click(function(){
             window.open("http://www.gagahi.com:80/pay/translationPack","_blank");
             }); */

            $.IM.txtTipsFun($(".lft .leftMoney"));
            $.IM.txtTipsFun($(".lft .leftTranslate"));



            //获取金币数
            $(function(){
                $.IM.getMoneyNum();

                //左栏广告
                $._post('http://www.gagahi.com:80/ad/area/getContent', {
                    areaCode: 1468465733893
                }, function(data) {
                    if (data.success && data.obj) {
                        $('.lft .ggw1').html(data.obj);
                    } else {
                        $('.lft .ggw1').html('<a href="javascript:void(0);" target="_blank"><img src="http://static.gagahi.com/images/ggw'+(Zoneyet.Global.language!='zh-cn'?'_en':'')+'.jpg"/></a>');
                    }
                }, function() {
                    console.log('广告接口出错');
                    $('.lft .ggw1').html('<a href="javascript:void(0);" target="_blank"><img src="http://static.gagahi.com/images/ggw'+(Zoneyet.Global.language!='zh-cn'?'_en':'')+'.jpg"/></a>');
                });
            });
        </script>






        <div class="fr">
            <div class="rht" style="padding:0; width:856px;">
                <div class="like-vip">
                    <div class="like-quantity tc" style="margin-bottom:100px; padding-top:150px;">
                        <img src="<%=path%>/common/images/likeme5.jpg">
                    </div>
                    <p class="f16 tc hui" style="margin-bottom:50px;">See people who like me, find those I like too</p>
                    <p class=" tc">
                        <button class="bdra30 h36 f16 bgc-2d57a1 c-fff mb10 mutuallike-btn" style="width:150px;" onclick="likeme()">Liked me</button>
                    </p>
                </div>
            </div>
        </div>



        <div class="clear"></div>
    </div>
</div>
<script id="temp_home_popPrivate" type="text/html">
    <div>
        <span class="popPLetterWrapLable">##Letter.towho##：</span>
        <span id="give_pv_to" class="popPLetterTo"></span><input type="hidden" id="give_pv_to_id">
    </div>
    <div class="">
        <span class="popPLetterWrapLable">##Letter.pricontent##：</span>
        <div id="chatConBottom" class="inlineblock  border-all bdra15 mt20 popPLetterWrap">
            <div class="TipsContent">You have run out of the number of chat today.<!-- 您今日私信条数已用完 -->！</div>
            <div class="character"><span class="characterNum">0</span>/500</div>
            <textarea id="sendContent" class="sendContent mt10" style="height: 150px;width:450px;">##im.enterKeySend##</textarea>
            <div class="btnContainer bdra15">
                <div class="langOptions">
                    <span class="txt">translate：</span>
                    <div class="langBtn">
                        <span class="language" langs-lang="">No translation</span>
                        <i class="Triangle"></i>
                    </div>
                    <ul class="languageUl">
                        <li class="langLi" langs-lang="">No translation</li>
                        <li class="langLi" langs-lang="en">English</li>

                        <li class="langLi" langs-lang="jp">日本語</li>

                        <li class="langLi" langs-lang="ru">русский</li>

                        <li class="langLi" langs-lang="spa">Español</li>

                        <li class="langLi" langs-lang="zh">简体中文</li>

                        <li class="langLi" langs-lang="cht">繁體中文</li>

                        <li class="langLi" langs-lang="kor">한국어</li>

                        <li class="langLi" langs-lang="de">Deutsch</li>

                    </ul>
                </div>
                <ul class="funBtnUl">
                    <li class="qqFaceBtn"></li>
                    <!--  <li class="imgBtn"></li>
                    <li class="giftBtn"></li>
                    <li class="redBtn"></li>-->
                    <li id="sendBtn" class="sendBtn">Send<!-- 发送 --></li>
                </ul>
            </div>
        </div>
    </div>
</script>
<script src="<%=path%>/common/js/jquery.page.js"></script>
<script>
    /*修改滚动轴*/
    $(window).load(function(){
        $(".dz").css("display","none");
    });
    /*下拉菜单*/
    $(".xld").each(function(index, element) {
        $(this).click(function (e) {
            $(this).next("ul").css("display","block");
            $(this).css("background-image","url(<%=path%>/common/images/xld1.png)");
            $(".xld-select>li").each(function (e) {
                var _selt = $(this);
                $(this).hover(function (){
                    $(this).addClass("default").siblings().removeClass("default");
                })
                $(this).click(function (e) {
                    $(_selt.parent(".xld-select").siblings("span")).text(_selt.children("a").text()).css("background-image","url(<%=path%>/common/images/xld.png)");
                    _selt.parent(".xld-select").css("display", "none");
                });
            });
        })
    });
    /*查看我喜欢我的人图片展示*/
    $(function(){
        $('#sildes').olvSlides(
                {
                    thumb:true,
                    thumbPage:true,
                    thumbDirection:"Y",
                    onetip: $.t('home.onlyOneLike'),
                    effect:'fade'
                }
        );
    })

    /*分页*/
    $(".tcdPageCode").createPage({
        pageCount:15,//总页数
        current:1,//当前页
        backFn:function(p){
            console.log(p);
        }
    });


    /**跳转充值会员*/
    $(".govip").click(function(e) {
        location.href = "http://www.gagahi.com:80/pay/upgradeMember";
    });

    /*加好友*/
    $(".friending").click(function(e) {
        var mid = $(".thumbWrap").find(".cur").find("img:first").attr("lmid");
        $.ajax({//虚拟礼物
            type : "post",
            url : "http://www.gagahi.com:80/Member/Friend/applyFriend",
            contentType : "application/x-www-form-urlencoded",
            data: {"friGagaid":mid,"source":1},
            success: function(data){
                if(data.success){
                    layer.msg(data.msg);//
                }else{
                    layer.msg(data.msg);//
                }
            }
        });
    });
    /*举报*/
    $(".report").click(function(e) {
        layer.open({
            area: ['482px','320px'],
            skin: 'demo-report',
            title: ['Report', 'font-size:18px;'],
            content:$('.reportCon').html(),
            btn: 'Yes',
            yes: function (index, layero) {
                //console.log(index+'||'+layero)
                layer.close(index)
            },
            cancel: function (index) {

            },
        });
    });

    /*取消喜欢*/
    $(document).on("click",".Cancel-like",function(){
//$(".Cancel-like").click(function(e) {
        layer.open({
            offset: '430px',
            area: ['220px',''],
            skin: 'Cancel-like-mutual',
            type: 1,
            title: false,
            content: '<p class="tc">Are you sure to cancel?</p>',
            btn: ['Yes', 'Cancel'],
            yes: function (index, layero) {
                layer.close(index);
                delilike();
            },
            cancel: function (index) {

            }
        });
        var lis = $(".thumbWrap").find(".thumbCont").find("li").length;
        if(lis == 1){
            layer.msg('Only one user you like at present.', {
                time: 2000 //2秒关闭（如果不配置，默认是3秒）
            }, function () {})
        }
    })

    /*私信所有人*/
    $(".private-all").click(function(e) {
        layer.open({
            area: '542px',
            skin: 'privateall',
            title:'Tip',
            content:$(".privateallCon").html(),
            btn: 'Send',
            yes: function (index, layero) {
                //console.log(index+'||'+layero)
                layer.close(index)
            },
            cancel: function (index) {

            },

        });
        $(".layui-layer-btn0").after("<br><a herf='' class='lj'><span class='c-2d57a1'>Upgrade membership</span>more cost-effective</a>");
    })

    gvid = "";//选中的礼物id
    type = "";//礼物or翻译包
    goodmoney = 0;//商品单价（用户计算成功后金币）
    /**选中礼物*/
    function selectedgift(obj,gid,types,money){
        //$(obj).siblings().children(".chosed").css("display","none");
        $(obj).closest(".giftcont").find(".giftcont1 li").children(".chosed").css("display","none");
        $(obj).children(".chosed").css("display","block");
        gvid = gid;
        type = types;
        goodmoney = money;
    }

    /*赠送礼物*/
    gpage = 0;//礼物分页
    tpage = 0;//翻译包分页

    $(document).on("click",".gift",function(){
//$(".gift").click(function(e) {
        //var gifthtml = '<div class="giftCon"><div class="gift-top"><div class="fl"><span class="mr15 f16 gift-chose pb5" id="gift">虚拟礼物</span><span class="f16 pb5" id="trans">翻译包</span></div><div class="fr"><a href="" class="c-2d57a1 pb5">去商城逛逛</a></div><div class="clear"></div></div><div class="giftcont"><ul class="giftcont1 mCustomScrollbar" id="gift1"><li><p><img src="../images/gift2.jpg" ></p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"></span></p><div class="chosed"></div></li><li><p><img src="../images/gift2.jpg" ></p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"></span></p><div class="chosed"></div></li><li><p><img src="../images/gift2.jpg" ></p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"></span></p><div class="chosed"></div></li><li><p><img src="../images/gift2.jpg" ></p><p  class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"></span></p><div class="chosed"></div></li><li><p><img src="../images/gift2.jpg" ></p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"</span></p><div class="chosed"></div></li><li><p><img src="../images/gift2.jpg" ></p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"</span></p><div class="chosed"></div></li><li><p><img src="../images/gift2.jpg" ></p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"</span></p><div class="chosed"></div></li><li><p><img src="../images/gift2.jpg" ></p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"</span></p><div class="chosed"></div></li><li><p><img src="../images/gift2.jpg" ></p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"</span></p><div class="chosed"></div></li><li><p><img src="../images/gift2.jpg" ></p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"</span></p><div class="chosed"></div></li><li><p><img src="../images/gift2.jpg" ></p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"</span></p><div class="chosed"></div></li><li><p><img src="../images/gift2.jpg" ></p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"></span></p> <div class="chosed"></div></li><div class="clear"></div></ul><ul class="giftcont1 mCustomScrollbar" id="trans1" style="display:none"><li><p><img src="../images/gift1.jpg" ></p><p>3000字符</p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"></span></p><div class="chosed"></div> </li><li><p><img src="../images/gift1.jpg" ></p><p>3000字符</p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span<span class="money"></span></p><div class="chosed"></div></li><li><p><img src="../images/gift1.jpg" ></p><p>3000字符</p><p class="mt5"><span class="c-ff8a00 f18 mr5">20</span><span class="money"></span></p><div class="chosed"></div></li><li><p><img src="../images/gift1.jpg" ></p><p>3000字符</p><p class="mt5"><span class="c-ff8a00 f18 mr5">2</span><span class="money"></span></p><div class="chosed"></div></li></ul></div></div>'
        gpage = 0;//礼物分页
        tpage = 0;//翻译包分页
        gvid = "";//选中的礼物id
        type = "";//礼物or翻译包
        $.ajax({//虚拟礼物
            type : "post",
            url : "http://www.gagahi.com:80/Member/giftlist",
            contentType : "application/x-www-form-urlencoded",
            data: {"page":++gpage},
            success: function(data){
                if(data.success){
                    var str = "";
                    for(var i = 0;i < data.obj.length;i++){
                        str += "<li onclick=\"selectedgift(this,"+data.obj[i].giviId+",1,"+ data.obj[i].giviGold +")\">"
                                +"<p><img src=\"http://images.gagahi.com/"+data.obj[i].giviDisplay+"?imageMogr2/thumbnail/100x100\" ></p>"
                                +"<p class=\"mt5\"><span class=\"c-ff8a00 f18 mr5\">"+data.obj[i].giviGold
                                +"</span><span class=\"money\"></span></p><div class=\"chosed\"></div></li>";
                    }
                    $(".giftcont").find(".gift1").html(str);
                }else{
                    layer.msg(data.msg);
                }
            }
        });
        $.ajax({//翻譯包
            type : "post",
            url : "http://www.gagahi.com:80/Member/transpackagelist",
            contentType : "application/x-www-form-urlencoded",
            data: {"page":++tpage},
            success: function(data){
                if(data.success){
                    var str = "";
                    for(var i = 0;i < data.obj.length;i++){
                        str += "<li onclick=\"selectedgift(this,"+data.obj[i].trpaId+",2," + data.obj[i].trpaGold + ")\">"
                                +"<p><img src=\"http://images.gagahi.com/"+data.obj[i].trpaImgurl+"?imageMogr2/thumbnail/100x78\" ></p>"
                                +"<p>"+data.obj[i].trpaCharcount+"Character</p>"
                                +"<p class=\"mt5\"><span class=\"c-ff8a00 f18 mr5\">"+data.obj[i].trpaGold
                                +"</span><span class=\"money\"></span></p><div class=\"chosed\"></div></li>";
                    }
                    $(".giftcont").find(".trans1").html(str);
                }else{
                    alert(data.msg);
                }
            }
        });


        layer.open({
            type: 1,
            area: '700px',
            skin: 'giftCon1',
            title:'Send gifts',
            content: $(".giftCon").html(),
            btn: 'Yes',
            yes: function (index, layero) {
                if(null == gvid || $.trim(gvid).length <= 0
                        ||null == type || $.trim(type).length <= 0){
                    layer.msg("Please choose a gift.");
                    return;
                }
                returnGive();
                layer.close(index)
            },
            cancel: function (index) {

            },
        });

        $(".giftCon1 .gift-top span").click(function(e) {
            $(this).addClass("gift-chose").siblings().removeClass("gift-chose");
            var $ulobj = $(this).parents(".layui-layer-content").find(".giftcont").find("ul");
            $ulobj.hide().eq($(this).index()).show();
        });
    })

    $(".xld").each(function(index, element) {
        $(this).click(function (e) {
            $(this).next("ul").css("display","block");
            $(this).css("background-image","url(<%=path%>/common/images/xld1.png)");
            $(".xld-select>li").each(function (e) {
                var _selt = $(this);
                $(this).hover(function (){
                    $(this).addClass("default").siblings().removeClass("default");
                })
                $(this).click(function (e) {
                    $(_selt.parent(".xld-select").siblings("span")).text(_selt.children("a").text()).css("background-image","url(<%=path%>/common/images/xld.png)");
                    _selt.parent(".xld-select").css("display", "none");
                });
            });
        })
    });

    /**跳转至喜欢我的人*/
    function likeme(){
        window.location.href="<%=path%>/member/like/likeMe";
    }

    /**取消喜欢*/
    function delilike(){
        var id = $(".thumbWrap").find(".cur").find("img:first").attr("lid");
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Member/Like/delilike",
            contentType : "application/x-www-form-urlencoded",
            data: {"id":id},
            success: function(data){
                if(data.success){
                    var obj = $(".thumbWrap").find(".cur");
                    var intro1 = $(".control").find(".intro1");

                    var nobj = $(obj).next();
                    var nintro1 = $(intro1).next();

                    if(null == nobj || nobj.length <= 0 ){
                        nobj = $(obj).prev();
                        nintro1 = $(intro1).prev();
                    }
                    if(null != nobj && nobj.length > 0 ){
                        nobj.attr("class","cur");
                        nintro1.css("display","block");
                        nintro1.addClass("intro1");
                    }
                    $(obj).remove();
                    $(intro1).remove();

                    //数量
                    var obj = $(".fr").find(".like-top").find(".frigs").find(".c-2d57a1");
                    $(obj).text(parseInt($(obj).text())-1);
                    //alert(data.msg);
                }else{
                    layer.msg(data.msg);
                }
            }
        });
    }

    //////////////////////////////////////////////礼物////////////////////////////////////////////
    /**获取礼物*/
    function findgiftlist(obj){
        if(obj.scrollHeight > obj.scrollTop +40 +420){
            return;
        }
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Member/giftlist",
            contentType : "application/x-www-form-urlencoded",
            data: {"page":++gpage},
            success: function(data){
                if(data.success){
                    var str = "";
                    for(var i = 0;i < data.obj.length;i++){
                        str += "<li onclick=\"selectedgift(this,"+data.obj[i].giviId+",1," + data.obj[i].giviGold + ")\">"
                                +"<p><img src=\"http://images.gagahi.com/"+data.obj[i].giviDisplay+"?imageMogr2/thumbnail/100x100\" ></p>"
                                +"<p class=\"mt5\"><span class=\"c-ff8a00 f18 mr5\">"+data.obj[i].giviGold
                                +"</span><span class=\"money\"></span></p><div class=\"chosed\"></div></li>";
                    }
                    $(obj).append(str);
                }else{
                    layer.msg(data.msg);
                }
            }
        });
    }

    /**获取翻译包*/
    function findTranspackage(obj){
        if(obj.scrollHeight > obj.scrollTop +20 + 420){
            return;
        }
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Member/transpackagelist",
            contentType : "application/x-www-form-urlencoded",
            data: {"page":++tpage},
            success: function(data){
                if(data.success){
                    var str = "";
                    for(var i = 0;i < data.obj.length;i++){
                        str += "<li onclick=\"selectedgift(this,"+data.obj[i].trpaId+",2," + data.obj[i].trpaGold + ")\">"
                                +"<p><img src=\"http://images.gagahi.com/"+data.obj[i].trpaImgurl+"?imageMogr2/thumbnail/100x78\" ></p>"
                                +"<p>"+data.obj[i].trpaCharcount+"Character</p>"
                                +"<p class=\"mt5\"><span class=\"c-ff8a00 f18 mr5\">"+data.obj[i].trpaGold
                                +"</span><span class=\"money\"></span></p><div class=\"chosed\"></div></li>";
                    }
                    $(obj).append(str);
                }else{
                    layer.msg(data.msg);
                }
            }
        });
    }

    /**回赠*/
    function returnGive(){
        var mid = $(".thumbWrap").find(".cur").find("img:first").attr("lmid");
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Member/givegift",
            contentType : "application/x-www-form-urlencoded",
            data: {"mid":mid,"gvid":gvid,"type":type},
            success: function(data){
                if(data.success){
                    /*
                     var divvalue = $("#totalMoney").text();
                     if(null == divvalue || $.trim(divvalue).length <= 0){
                     divvalue = 0;
                     }
                     $("#totalMoney").text(parseInt(divvalue) - parseInt(goodmoney))*/
                    layer.msg(data.msg);
                }else{
                    layer.msg(data.msg);
                }
            }
        });
    }

    /**聊天*/
    $(document).on('click','.conversation',function(){
        var isFriends="false";
        var mid = $(".thumbWrap").find(".cur").find("img:first").attr("lmid");
        var name = $(".thumbWrap").find(".cur").find("img:first").attr("alt");
        var obj = $("#js-contactsScrollBar").find("#friendGroup").find("ul > li");
        for(var i = 0;i < obj.length;i++){
            if($(obj[i]).attr("data-gagaid") == mid){
                $(obj[i]).trigger("click");
                isFriends="true";
            }
        }
        if(isFriends=="false"){
            var gettpl = Zoneyet.template($('#temp_home_popPrivate').html()).render({});
            layer.open({
                area: '600px',
                skin: 'giftCon1',
                title:$.t("Letter.sendPri"),
                content: gettpl,
                type: 1,
                zIndex:19890305,
                success: function(layero, ix){
                    //console.log('en-us');
                    if(sendGender =="1"){
                        switch('en-us'){
                            case "en-us":
                                $(".giftCon1 .language").attr("langs-lang", "en").text("English");
                                break;
                            case "zh-cn":
                                $(".giftCon1 .language").attr("langs-lang", "zh").text("简体中文");
                                break;
                            case "zh-tw":
                                $(".giftCon1 .language").attr("langs-lang", "cht").text("繁體中文");
                                break;
                            case "ko-kr":
                                $(".giftCon1 .language").attr("langs-lang", "kor").text("한국어");
                                break;
                            case "ru-ru":
                                $(".giftCon1 .language").attr("langs-lang", "ru").text("Pусский");
                                break;
                            case "de-de":
                                $(".giftCon1 .language").attr("langs-lang", "de").text("Deutsch");
                                break;
                            case "es-es":
                                $(".giftCon1 .language").attr("langs-lang", "spa").text("Español");
                                break;
                            case "ja-jp":
                                $(".giftCon1 .language").attr("langs-lang", "jp").text("日本語");
                                break;
                            default:
                                $(".giftCon1 .language").attr("langs-lang", "").text("不翻译");
                                break;
                        }
                    }
                    $("#give_pv_to").text(name);
                    $("#give_pv_to_id").val(mid);
                    //初始化弹出私信框
                    new popPrivate.pri();
                }
            });
        }

    });
</script>

<!--发送私信-->



<div class="privateallCon" style="display: none;">
    <div class="balance tc">
        the fees of this service：
        <span class="c-ff8a00 f25 mr5">0.0</span>
        <span class="money mt15"></span>
        <span class="hui ml10">（Your gold balance is 0.00 Gold）</span>
    </div>
    <div class="lxlb h36 bdra30" style="margin: 50px auto 45px;">
        <span class="xld inlineblock">What kind of opposite sex do you like?</span>
        <ul style="display: none; top: 39px;" class="xld-select">
            <li><a href="/">我一个人去，有一种情自己看电影的美好</a></li>
            <li class="default"><a href="/">男朋友漏电了，打一歇后语</a></li>
            <li><a href="/">每次追完一个距就像是要分手一样？</a></li>
            <li><a href="/">你是变得越来越好，还是只是越来越老？</a></li>
            <li><a href="/">你觉着自己是哪种类型的人？</a></li>
        </ul>
    </div>
</div>



<!-- 商品列表 -->
<div class="giftCon" style="display: none;">
    <div class="gift-top">
        <div class="fl">
            <span class="mr15 f16 gift-chose pb5" id="gift">Virtual gifts</span>

        </div>
        <div class="fr"><a href="" class="c-2d57a1 pb5">Go to the mall.</a></div>
        <div class="clear"></div>
    </div>
    <div class="giftcont" >
        <ul class="gift1 giftcont1" onscroll="findgiftlist(this)" >
            <div class="clear"></div>
        </ul>
        <ul class="trans1 giftcont1" style="display:none" onscroll="findTranspackage(this)">
        </ul>
    </div>
</div>






<!--登录弹出框开始-->
<link href="<%=path%>/common/css/login-layer.css" rel="stylesheet" type="text/css"/>

<div class="creditcon"></div>
<div class="logn-con">
    <div class="diy-layer-top">
        Log in<span class="diy-close2"></span>
    </div>
    <div class="logn-con-bottom">
        <div style="display: block;">
            <div class="form-control">
                <div style="display: inline;">
                    <span style="display: none;" class="f12 ts kd ">Please enter your account number<!-- 用户名不能为空 --></span>
                </div>
                <input type="text" placeholder='Email'
                       data-type-diy-regex="^(1\d{10})|(([0-9a-zA-Z]+[-._+&amp;])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6})$"
                       data-type="required|diy-regex" name="name"
                       class="inp txt-name bdra30" autocomplete="off" id="txt-name">
            </div>
            <div class="form-control">
                <div style="display: inline;">
                    <span style="display: none;" class="f12 ts mkd ">Please enter a password.<!-- 密码不能为空！ --></span>
                </div>
                <input type="password" err="required" name="pwd"
                       data-type="required|diy-regex"
                       data-type-diy-regex="^[\da-zA-Z]{6,20}$" maxlength="20"
                       id="txt-pwd" class="inp txt-pwd bdra30" placeholder='Password'
                       autocomplete="off">
            </div>
            <div style="text-align: center; margin: 10px 0 15px;">
                <button id="log-bnt" class="btn">Log in<!-- 登录 --></button>
            </div>
            <div class=" mt10">
                <a href="http://www.gagahi.com:80/Platform/inviteRegIndex?source=2&inviter=2935185&sysid=" class="fl c-2d57a1 f13">Register<!-- 注册 --></a>
                <a href="http://www.gagahi.com:80/Platform/forgotPassword" class="fr c-2d57a1 f13">Forget password<!-- 忘记密码？ --></a>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>
<!--登录弹出框html结束-->
<script>
    /*登录弹窗*/
    $(".logn-con").css("left",($(window).width() - $(".logn-con").width()) / 2 + 'px');
    $(window).resize(function(){
        $(".logn-con").css("left",($(window).width()-$(".logn-con").width())/2+'px');
    });
    $(".invi-logn").click(function(e) {
        $(".logn-con,.creditcon").css("display", "block");
    });
    $(".diy-close2").click(function(e) {
        $(".logn-con,.creditcon").css("display", "none");
    });
    /*登录验证*/
    function checkAccount() {
        var username = $("#txt-name").val().trim();
        if (username == '') {
            $('.kd').css('display', 'block').siblings().css('display', 'none');
            $(".txt-name").css("border-color", "#ff9c00");
        }

        else {
            $('.kd').css('display', 'none').siblings().css('display', 'none');
            $(".txt-name").css("border-color", "#ccc");
        }
    }
    function checkPassword() {
        var pwd = $("#txt-pwd").val().trim();
        if (pwd == '') {
            $('.mkd').css('display', 'block').siblings().css('display', 'none');
            $(".txt-pwd").css("border-color", "#ff9c00");

        } else {
            $('.mkd').css('display', 'none').siblings().css('display', 'none');
            $(".txt-pwd").css("border-color", "#ccc");
        }
    };
    $(document).on("blur", "#txt-name", checkAccount);
    $(document).on("blur", "#txt-pwd", checkPassword);
    $(document).on("click", "#log-bnt", function() {
        checkAccount();
        checkPassword();
        var username = $("#txt-name").val().trim();
        var pwd = $("#txt-pwd").val().trim();
        $.post("http://www.gagahi.com:80/Platform/login",{username:username,password:pwd},function(result){
            //$("span").html(result);
            if(result.success){
                window.location.href = 'http://www.gagahi.com:80' + result.attributes["redirectUrl"];
            }else{

                // 用户名或者密码错误提示用户  result.msg
                layer.msg($.t('global.loginError'));
            }
        });
    })
</script>
<div class="foot">
    <div class="w1100 jz tc pt15">
        <p>

            <a href="http://www.gagahi.com:80/Global/changeLanguage?lang=en-us">English</a>  |

            <a href="http://www.gagahi.com:80/Global/changeLanguage?lang=ja-jp">日本語</a>  |

            <a href="http://www.gagahi.com:80/Global/changeLanguage?lang=ru-ru">русский</a>  |

            <a href="http://www.gagahi.com:80/Global/changeLanguage?lang=es-es">Español</a>  |

            <a href="http://www.gagahi.com:80/Global/changeLanguage?lang=zh-cn">简体中文</a>  |

            <a href="http://www.gagahi.com:80/Global/changeLanguage?lang=zh-tw">繁體中文</a>  |

            <a href="http://www.gagahi.com:80/Global/changeLanguage?lang=ko-kr">한국어</a>  |

            <a href="http://www.gagahi.com:80/Global/changeLanguage?lang=de-de">Deutsch</a>


        </p>
        <p>
            <a href="http://www.gagahi.com:80/Platform/abutUs" target="_blank">About us</a> |
            <a href="http://www.gagahi.com:80/Platform/friendssafe" target="_blank">Online safety</a> |
            <a href="http://www.gagahi.com:80/Platform/privacyclause" target="_blank">Terms</a> |
            <a href="http://www.gagahi.com:80/Platform/help" target="_blank">Help</a> |
            <a href="http://www.gagahi.com:80/Platform/contactus" target="_blank">Contact us</a>
        </p>
        <div class="fhdb">
            <div class="scroll_t">
                <img src="<%=path%>/common/images/xs.png">
            </div>
            <!-- <div class="fk">
                <a href="#" class="f12">Feedback意见反馈</a>
            </div> -->
        </div>
    </div>
</div>
<script id="rbTipItem_tem" type="text/html">
    <div style="position: absolute;">
        <a href="{{d.link}}" style="color:#2d57a1;text-decoration: none;">
            <img src="{{d.image}}" style="width: 42px; border-radius: 21px;vertical-align: top;">
            <div class="" style="display: inline-block;width: 150px;overflow: hidden;height: 40px;">
                <div style="display: table;height: 40px;">
                    <div style="display: table-cell;vertical-align: middle;font-size: 12px;">
                        <span style="max-width: 70px;height: 16px;overflow: hidden;vertical-align: top;display: inline-block;">{{ d.name }}</span>
                        <span style="color:#000000;">{{ d.what }}</span>
                    </div>
                </div>
            </div>
        </a>
    </div>
</script>


</body>
<script src="<%=path%>/common/IM/js/IM.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/common/js/laytpl.js"  ></script>
<script type="text/javascript">
    $(function(){

        var token="bf4689791055450cb822445d2d32fe93";
        if(token==""){
            return;
        }


        /*------向后台发送当前联系人-------*/
        $.ajax({
            type: "post",
            url: "http://www.gagahi.com:80/pm/updateCurrWin",
            data: {
                rid: "closed",
                status: "1"
            },
            async: true,
            dataType: "json",
            success: function (reg) {},
            error: function () {}
        });



        /*返回顶部*/
        $('.scroll_t').click(function() {
            $('html,body').animate({
                scrollTop : '0px'
            }, 800);
        });
        /**
         *清空队列
         */
        $.ajax({
            type : "post",
            url : "http://webim.gagahi.com/message/cleanQueue",
            async : false,
            data:{
                t:token,
                offset:0,
                size:500
            },
            dataType:"json",
            success : function(data){
                if(data.code=="1"){//成功
                }else if(data.code=="6"){//Token 失效
                }else{
                }
            }
        });

        var url="http://webim.gagahi.com/message/getMessage";
        IM.connection({
            token:token,
            url:url,
            onRead:function(msg){
                if(msg.type==9){//系统消息
                    var message=msg.message;//系统消息体
                    if(message.type==1){
                        var souce = message.content['notiSouce'];
                        var content = message.content['notiContent']
                        var html = "<li class='f13'><span class='tx'><img src='<%=path%>/common/images/gg1.jpg'></span>";
                        html+="<p>2<span class='nm'>"+souce+"</span>"+content+"<br><span class='tim f12'>2:40</span></p></li>";
                        $("#myCustomScrollbar").append(html);

                    }else if(message.type==2){
                        /* 	console.log("tognzhi:"+JSON.stringify(message));
                         console.log("tognzhi:"+message);*/
                        //已读未读状态
                        if(message.content.type==1){
                            $.Letter.modifyMSGState(message.content.rid);
                        }else{
                            $.IM.modifyMSGState(message.content.rid);
                        }

                    }else if(message.type == 3){//用户在其他地方登陆
                        layer.msg(message.content,{
                            //icon: 1,
                            time: 500 //2秒关闭（如果不配置，默认是3秒）
                        },function(){
                            //alert("http://www.gagahi.com:80/");
                            window.location.href ="http://www.gagahi.com:80/Global/loginout?clearIMToken=2";
                        });

                    }else if(message.type == 4){
                        //发送后翻译译文推给对方
                        //console.log("发送后翻译译文推给对方:"+JSON.stringify(message));
                        //console.log("发送后翻译译文推给对方:"+message);
                        $.IM.SendAfterTranslationPush(message.content);


                    }else if(message.type == 100){
                        // 登录超时，提醒用户重新登录
                        //alert(message.content);
                        layer.msg(message.content,function(){
                            // 弹出登录窗体
                            $(".logn-con,.creditcon").css("display","block");
                        });
                    }else if(message.type==5){
                        //创建群通知
                        //console.log("创建群通知:"+JSON.stringify(message));
                        //console.log("创建群通知:"+message);
                        $.IM.createGroupNotice(message.content);

                    }else if(message.type==6){
                        //退群通知别人
                        //console.log("退群通知别人:"+JSON.stringify(message));
                        //console.log("退群通知别人:"+message);
                        $.IM.backGroupNotice(message.content);

                    }else if(message.type == 11){//通知 默认
                        var obj = $("#rightNotice");
                        var count = $(obj).text();
                        if(null == count || $.trim(count).length <= 0){
                            count = parseInt(message.content.count);
                            obj.addClass("gs newsNumSingle");
                        }else if(count =="99+"){
                            count ="99+";
                        }else{
                            count = parseInt(count)+parseInt(message.content.count);
                            if(count>99){
                                count ="99+";
                                obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                            }else{
                                obj.addClass("newsNumSingle");
                            }
                        }
                        $(obj).text(count);

                        //弹窗
                        RBTIPS(message.content);
                    }else if(message.type == 12){//通知 私信
                        var obj1 = $("#leftSixinNotice");
                        var count = $(obj1).text();
                        if(null == count || $.trim(count).length <= 0){
                            count = parseInt(message.content.count);
                            obj1.addClass("newsNumSingle");
                        }else if(count =="99+"){
                            count ="99+";
                        }else{
                            count = parseInt(count)+parseInt(message.content.count);
                            if(count>99){
                                count ="99+";
                                obj1.removeClass("newsNumSingle").addClass("newsNumDouble");
                            }else{
                                obj1.addClass("newsNumSingle");
                            }
                        }
                        $(obj1).text(count);

                        //在私信页面不提醒
                        if(window.location.pathname.indexOf("/privateLetter") < 0){
                            var obj = $("#rightNotice");
                            var count = $(obj).text();
                            if(null == count || $.trim(count).length <= 0){
                                count = parseInt(message.content.count);
                                obj.addClass("gs newsNumSingle");
                            }else if(count =="99+"){
                                count ="99+";
                            }else{
                                count = parseInt(count)+parseInt(message.content.count);
                                if(count>99){
                                    count ="99+";
                                    obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                                }else{
                                    obj.addClass("newsNumSingle");
                                }
                            }
                            $(obj).text(count);

                            //弹窗
                            RBTIPS(message.content);
                        }
                    }else if(message.type == 7){//通知 访客
                        var obj = $("#rightNotice");
                        var count = $(obj).text();
                        if(null == count || $.trim(count).length <= 0){
                            count = parseInt(message.content.count);
                            obj.addClass("gs newsNumSingle");
                        }else if(count =="99+"){
                            count ="99+";
                        }else{
                            count = parseInt(count)+parseInt(message.content.count);
                            if(count>99){
                                count ="99+";
                                obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                            }else{
                                obj.addClass("newsNumSingle");
                            }
                        }
                        $(obj).text(count);


                        var obj2 = $("#leftVisitorNotice");
                        var count2 = $(obj2).text();
                        if(null == count2 || $.trim(count2).length <= 0){
                            count2 = parseInt(message.content.count);
                            obj2.addClass("newsNumSingle");
                        }else if(count2 =="99+"){
                            count2 ="99+";
                        }else{
                            count2 = parseInt(count2)+parseInt(message.content.count);
                            if(count2>99){
                                count2 ="99+";
                                obj2.removeClass("newsNumSingle").addClass("newsNumDouble");
                            }else{
                                obj2.addClass("newsNumSingle");
                            }
                        }
                        $(obj2).text(count2);



                        /* var obj2 = $("#leftVisitorNotice");
                         var count2 = $(obj2).text();
                         if(null == count2 || $.trim(count2).length <= 0){
                         count2 = 0;
                         }
                         $(obj2).text(parseInt(count2)+parseInt(message.content.count));
                         if(!$(obj2).hasClass("gs1")){
                         $(obj2).addClass("gs1");
                         } */

                        //弹窗
                        RBTIPS(message.content);
                    }else if(message.type == 8){//通知 （赞）
                        var obj = $("#rightNotice");
                        var count = $(obj).text();
                        if(null == count || $.trim(count).length <= 0){
                            count = parseInt(message.content.count);
                            obj.addClass("gs newsNumSingle");
                        }else if(count =="99+"){
                            count ="99+";
                        }else{
                            count = parseInt(count)+parseInt(message.content.count);
                            if(count>99){
                                count ="99+";
                                obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                            }else{
                                obj.addClass("newsNumSingle");
                            }
                        }
                        $(obj).text(count);

                        var obj2 = $("#leftLikeMeNotice");
                        var count2 = $(obj2).text();
                        if(null == count2 || $.trim(count2).length <= 0){
                            count2 = parseInt(message.content.count);
                            obj2.addClass("newsNumSingle");
                        }else if(count2 =="99+"){
                            count2 ="99+";
                        }else{
                            count2 = parseInt(count2)+parseInt(message.content.count);
                            if(count2>99){
                                count2 ="99+";
                                obj2.removeClass("newsNumSingle").addClass("newsNumDouble");
                            }else{
                                obj2.addClass("newsNumSingle");
                            }
                        }
                        $(obj2).text(count2);

                        /* var obj = $("#rightNotice");
                         var count2 = $(obj).text();
                         if(null == count2 || $.trim(count2).length <= 0){
                         count2 = 0;
                         }
                         $(obj).text(parseInt(count2)+parseInt(message.content.count));



                         var obj2 = $("#leftLikeMeNotice");
                         var count2 = $(obj2).text();
                         if(null == count2 || $.trim(count2).length <= 0){
                         count2 = 0;
                         }
                         $(obj2).text(parseInt(count2)+parseInt(message.content.count));
                         if(!$(obj2).hasClass("gs1")){
                         $(obj2).addClass("gs1");
                         } */

                        //弹窗
                        RBTIPS(message.content);
                    }else if(message.type == 9){//加好友
                        if(null == message.content.notice||message.content.notice!="nonotice" ){
                            var obj = $("#rightNotice");
                            var count = $(obj).text();
                            if(null == count || $.trim(count).length <= 0){
                                count = parseInt(message.content.count);
                                obj.addClass("gs newsNumSingle");
                            }else if(count =="99+"){
                                count ="99+";
                            }else{
                                count = parseInt(count)+parseInt(message.content.count);
                                if(count>99){
                                    count ="99+";
                                    obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                                }else{
                                    obj.addClass("newsNumSingle");
                                }
                            }
                            $(obj).text(count);

                            /* var obj = $("#rightNotice");
                             var count2 = $(obj).text();
                             if(null == count2 || $.trim(count2).length <= 0){
                             count2 = 0;
                             }
                             $(obj).text(parseInt(count2)+parseInt(message.content.count)); */
                        }
                        //$(obj).text(parseInt(count2)+parseInt(message.content.count));

                        if(null != message.content.isshow && message.content.isshow != "notshow"){
                            var obj = $("#rightApplyCount");
                            var count = $(obj).text();
                            if(null == count || $.trim(count).length <= 0){
                                count = parseInt(message.content.count);
                                obj.addClass("newsNumSingle");
                            }else if(count =="99+"){
                                count ="99+";
                            }else{
                                count = parseInt(count)+parseInt(message.content.count);
                                if(count>99){
                                    count ="99+";
                                    obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                                }else{
                                    obj.addClass("newsNumSingle");
                                }
                            }
                            $(obj).text(count);

                            /* var obj3 = $("#rightApplyCount");
                             var count3 = $(obj3).text();
                             if(null == count3 || $.trim(count3).length <= 0){
                             count3 = 0;
                             }
                             $(obj3).text(parseInt(count3)+parseInt(message.content.count));
                             if(!$(obj3).hasClass("gs")){
                             $(obj3).addClass("gs");
                             } */
                        }

                        //弹窗
                        //RBTIPS(message.content);
                    }else if(message.type == 13){//私信人工翻译通知	邢冬阳
                        $.Letter.SendAfterTranslationPush(message.content);
                    }else if(message.type == 14){//私信红包打开通知	邢冬阳
                        //console.log("拆红包通知"+JSON.stringify(message));
                        //console.log("拆红包通知"+message);
                        $.Letter.getRedEnvelopeNotice(message.content);
                    }else if(message.type == 15){//私信加好友通知	邢冬阳
                        //console.log("加好友通知："+JSON.stringify(message));
                        //console.log("加好友通知："+message);
                        //message.content
                        $.IM.addFriendNoticeFun(message.content);

                    }else if(message.type == 16){//女性邀请联系失效通知	邢冬阳
                        //console.log("女性邀请联系失效通知："+JSON.stringify(message));
                        //console.log("女性邀请联系失效通知："+message);
                        $.Letter.invitationUpgradeOverTime(message.content);
                    }else if(message.type == 17){//动态实时翻译
                        $.zone.changeZoneTrans(message.content);
                    }else if(message.type == 18){//评论实时翻译
                        $.zone.changeCommentTrans(message.content);
                    }else if(message.type == 20){//实时更新被赠送人翻译包字节数  郭印
                        var num = $("#totalTranslate").text();
                        if(null == num || $.trim(num).length <= 0){
                            num = 0;
                        }
                        $("#totalTranslate").text(parseInt(num)+parseInt(message.content.trpaCharcount));
                        //更新session
                        updateSession();
                    }else if(message.type == 21){//实时更新被升级会员 郭印
                        if(null != message.content && null != message.content.mfstRelevel){
                            $(".lfttop").find(".ari:first").find("img").remove();//首先删除元素
                            if(message.content.mfstRelevel == "2"){//高级
                                $(".lfttop").find(".ari:first").append("<img src=\"<%=path%>/common/images/hg.jpg\">");
                            }else if(message.content.mfstRelevel == "3"){//vip
                                $(".lfttop").find(".ari:first").append("<img src=\"<%=path%>/common/images/vip-hg.jpg\">");
                            }

                            //更新session
                            updateSession();
                        }
                    }else if(message.type == 22){//实时更新金币 郭印
                        if(null != message.content && null != message.content.gold){
                            var obj = $("#totalMoney");
                            var count = $(obj).text();
                            if(null != count && $.trim(count).length > 0 ){
                                count = parseFloat(count) - parseFloat(message.content.gold);
                                if(parseFloat(count) <= 0){
                                    count = "0";
                                }
                                $(obj).text(count);
                                $(obj).parent().attr("data-explain",count);
                            }

                            //更新session
                            updateSession();
                        }
                    }

                }else if(msg.type=="1"){//IM
                    $.IM.receiveMessage(msg.message);
                }else if(msg.type=="2"){//私信
                    $.Letter.ReceiveMessage(msg.message);
                }else if(msg.type=="10"){//用户下线通知
                    if(msg.message.isOnline){//上线
                        //console.log("上线用户"+msg.message.users);
                        $.IM.userOnline(msg.message.users);
                        $.Letter.userOnline(msg.message.users);
                    }else{//下线
                        //console.log("下线用户"+msg.message.users);
                        $.IM.userOffline(msg.message.users);
                        $.Letter.userOffline(msg.message.users);
                    }
                }
            },
            onError:function(msg){
                if(msg=="6"){//Token 失效
                    //alert("Token 失效");
                }
            }
        });

    });


    /*
     var sdata = {
     name: '蛮王',
     what: "逗你玩了",
     link:"ssss",
     image:"img/head.png"
     };
     */
    var TIPCOUNT=1;
    function RBTIPS (option) {
        var rbTipItem_tem="";
        var data = option||{
                    name: '前端攻城师',
                    what: "逗你玩了",
                    link:"ssss",
                    image:"img/head.png"
                };
        var gettpl = document.getElementById('rbTipItem_tem').innerHTML;
        rbTipItem_tem=laytpl(gettpl).render(data);

        layer.open({
            type: 1,
            title: false,
            closeBtn: 0, //不显示关闭按钮
            shade: 0,
            area: ['218px', '46px'],
            offset: [
                $(window).height()-(46+15)*TIPCOUNT,$(window).width()-218-66
            ],
            //  offset: 'rb', //右下角弹出
            time: 5000, //5秒后自动关闭
            shift: 2,
            content:rbTipItem_tem, //iframe的url，no代表不显示滚动条
            end: function(){ //此处用于演示
                if($(".layui-layer").length===0){
                    TIPCOUNT=1;
                }
            },
            zIndex: layer.zIndex, //重点1
            success: function(layero,index){
                layer.setTop(layero); //重点2
                $(layero).css({
                    "border-radius": 23
                });
                $(layero).find(".layui-layer-content").css({
                    padding: 0,
                    height: "100%"
                })
                TIPCOUNT++;
            },
            cancel: function(index){
            }
        });
    }

    /**
     * 更新session（金融）
     */
    function updateSession(){
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Member/updateSession",
            contentType : "application/x-www-form-urlencoded",
            success: function(data){
                //window.location.reload();
            }
        });
    }

</script>
</html>

