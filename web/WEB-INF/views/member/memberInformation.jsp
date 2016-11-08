<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
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
    <title>gagahi_多语言国际交友_跨越语言,向世界say hi</title>
    <link href="<%=path%>/common/images/favicon.ico" rel="shortcut icon">
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="gagahi,国际交友,多语言社交,多语言交友网站,多语言交友平台,翻译社交,国际交友平台,多语言社交网站,多语言社交平台,翻译社交平台,跨语言社交平台" name="keywords">
    <meta content="gagahi是一个基于翻译的国际社交平台,为您提供国际社交,多语言国际交友,随时随地翻译等社交服务,让您跨越语言障碍轻松扩大国际社交圈." name="description">
    <link href="<%=path%>/common/js/ScrollBar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/base.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/common.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/webupload.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/jquery.range.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/jquery.range.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/lang.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/lrtk.css" rel="stylesheet" type="text/css">
    <!-- <link href="common/css/skin/zhongqiu/style.css" rel="stylesheet" type="text/css"> -->
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
    <script src="<%=path%>/common/js/webuploader.js" type="text/javascript"></script>
    <script src="<%=path%>/common/layer/js/layer.js" type="text/javascript"></script>
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
            if('encounterIndex'=='leftVisitorIndex'){
                $("#encounterIndex").attr("class","on");
            }
            if('zoneIndex'=='leftVisitorIndex'){
                $("#zoneIndex").attr("class","on");
            }
            if('gameIndex'=='leftVisitorIndex'){
                $("#gameIndex").attr("class","on");
            }
            if('shopIndex'=='leftVisitorIndex'){
                $("#shopIndex").attr("class","on");
            }

            //左侧导航
            if('leftSixinIndex'=='leftVisitorIndex'){
                $("#leftSixinIndexImg").attr("class","on");
                $("#leftSixinIndexText").attr("class","on");
            }
            if('leftLikeMeIndex'=='leftVisitorIndex'){
                $("#leftLikeMeIndexImg").attr("class","lkm on");
                $("#leftLikeMeIndexText").attr("class","on");
            }
            if('leftIlikeIndex'=='leftVisitorIndex'){
                $("#leftIlikeIndexImg").attr("class","mlk on");
                $("#leftIlikeIndexText").attr("class","on");
            }
            if('leftFriendIndex'=='leftVisitorIndex'){
                $("#leftFriendIndexImg").attr("class","each-lk on");
                $("#leftFriendIndexText").attr("class","on");
            }
            if('leftVisitorIndex'=='leftVisitorIndex'){
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
                        str +="<h3 id='h31'>加好友申请</h3>";
                        if(null != data.obj.list && data.obj.list.length > 0){
                            for(var i = 0; i < data.obj.list.length;i++){//好友申请
                                str +="<li class='addfriend'><span class='tx'>"
                                        +"<a href='"+ctx+"/Member/otherHome/"+data.obj.list[i].frapGagaid+"'><img src='http://images.gagahi.com//"+ data.obj.list[i].member.membBigimg +"'></a>"
                                        +"</span><span class='nm' title='"+ data.obj.list[i].member.membNickname +"'><a href='"+ctx+"/Member/otherHome/"+data.obj.list[i].frapGagaid+"'>"+ data.obj.list[i].member.membNickname + "</a></span>"
                                        +"<p class='fr'><button onclick='friendApplyHandle(this,3,"+ data.obj.list[i].frapId +")' title='同意'>"
                                        +"同意</button>"
                                        +"<button onclick='friendApplyHandle(this,2,"+ data.obj.list[i].frapId +")' title='忽略'>"
                                        +"忽略</button></p></li>";
                            }
                        }else{
                            str += "<li style=\"color:#696969; text-align:center;\">没有新好友请求！</li>";
                        }

                        //可能认识的人
                        str += "<h3 id='h32'>" + $.t('global.addFirendWord1') + "</h3>";
                        if(null != data.obj.mList && data.obj.mList.length > 0){
                            for(var i = 0; i < data.obj.mList.length;i++){//好友申请
                                str +="<li><span class='tx'>"
                                        +"<a href='"+ctx+"/Member/otherHome/"+data.obj.mList[i].membGagaid+"'><img src='http://images.gagahi.com//"+ data.obj.mList[i].membBigimg +"'></a>"
                                        +"</span><span class='nm' title='"+ data.obj.mList[i].membNickname +"'><a href='"+ctx+"/Member/otherHome/"+data.obj.mList[i].membGagaid+"'>"+ data.obj.mList[i].membNickname + "</a></span>"
                                        +"<p class='fr'><button onclick='applyFriend(this,"+ data.obj.mList[i].membGagaid +")' class='agree_bt' title='加好友'>"
                                        +"加好友</button>"
                                        +"<button onclick='friendApplyHandle(this,2,"+ data.obj.mList[i].membGagaid +")' title='忽略'>"
                                        +"忽略</button></p></li>";
                            }
                            str += "<h3 id='h33' style='display:none;'></h3>";
                        }else{
                            str += "<li style=\"color:#696969; text-align:center;\">暂无可推荐的人</li>";
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
                            $('#h31').after("<li style=\"color:#696969; text-align:center;\">没有新好友请求！</li>");
                        }

                        $('#h32').nextUntil('#h33').addClass('liclazz2');
                        var count1 = $(".ihome_top_apply_friend_ul").find('.liclazz2').length;
                        if(count1 <= 0){
                            $('#h32').after("<li style=\"color:#696969; text-align:center;\">暂无可推荐的人</li>");
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
                            $('#h31').after("<li style=\"color:#696969; text-align:center;\">没有新好友请求！</li>");
                        }

                        $('#h32').nextUntil('#h33').addClass('liclazz2');
                        var count1 = $(".ihome_top_apply_friend_ul").find('.liclazz2').length;
                        if(count1 <= 0){
                            $('#h32').after("<li style=\"color:#696969; text-align:center;\">暂无可推荐的人</li>");
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

<body style="position:relative;" class='zh-cn'>
<div class="coverall">
    <div class=" w1100 jz searchTip">
        <div class="step1">
            <p>没有找到喜欢的人？试试筛选吧</p>
        </div>
        <div class="step2">
            <p>喜欢ta，就给ta点赞吧</p>
        </div>
        <div class="step3">
            <p>请先上传头像，大家都想见你</p>
        </div>
    </div>
</div>
<!-- 新版说明-->
<div class="coverall1">
    <div class="xbtc">
        <div id="fsD1" class="focus">
            <div id="D1pic1" class="fPic">
                <div class="fcon" style="display: none;">
                    <a><img src="<%=path%>/common/images/zh-cn-xb01.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu1"></span>
                </div>

                <div class="fcon" style="display: none;">
                    <a><img src="<%=path%>/common/images/zh-cn-xb02.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu2"></span>
                </div>

                <div class="fcon" style="display: none;">
                    <a><img src="<%=path%>/common/images/zh-cn-xb03.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu3"></span>
                </div>

                <div class="fcon" style="display: none;">
                    <a><img src="<%=path%>/common/images/zh-cn-xb04.jpg" style="opacity: 1; "></a>
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
            <a href="<%=path%>/index/iHome" id="encounterIndex"  >偶遇</a>
            <a href="<%=path%>/zone/myZone"  id="zoneIndex" >动态</a>
            <!--<a href="http://game.gagahi.com/" target="blank"  id="gameIndex" >游戏</a>-->
            <a href="<%=path%>/mall/giftReal/shopHome" id="shopIndex" >商城</a>
        </div>
        <div class="fr">
            <!--<a class="fhlb" data-i18n="fhlb.nr"></a> -->
            <a class="xbsm"  data-i18n="xbsm.nr"></a>
            <a class="vip" href="<%=path%>/pay/recharge" >充值</a>
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
                        <li><a href="<%=path%>/member/memberInformation">个人资料</a></li>
                        <li><a href="<%=path%>/member/memberInformation#showinfo">账号设置</a></li>
                        <li style=" border-bottom:none;"><a href="javascript:loginout()">退出</a></li>
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
    var token="e712cc82a9c04bb6a8305ebe4e992326";
    var sendGender = "1";//1男2女
    var sendHeadImgUrl = "images/default/male.png";//小头像
    var myNickname = "Quintion";//自己昵称
    var myLanguage = "zh-cn";
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
                新消息
            </div>
        </div>
        <div id="js-hiddenScrollBar" class="hiddenScrollContainer">
            <ul class="hiddenContactsCon">
                <li class="content singleNum" data-signid="people" data-gagaid="-1" data-remarkname="嘎嘎客服" data-nickname="嘎嘎客服" data-shield="0" data-online="2" data-language="zh">
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
                   value="搜索联系人"><i
                id="js-searchBtn" class="searchBtn"></i> <i id="js-SearchCloseBtn"
                                                            class="searchCloseBtn"></i>

        </div>
        <div class="showTab">
			<span class="js-contacts contacts">联系人
                <!-- 联系人 --></span> <span class="js-group group">群
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
							<span>最近聊天
                                <!-- 最近聊天 --></span><span class="recentlyNum">12</span>
                        </p>
                    </h6>
                    <div class="clear"></div>
                    <ul class="recentlyContainer FoldContainer">
                        <li class="showContent" data-signid="people" data-gagaid="-1" data-remarkname="嘎嘎客服" data-nickname="嘎嘎客服" data-shield="0" data-online="2" data-language="zh">
                            <div class="showHead">
                                <img class="headImg" src="<%=path%>/common/images/gagaService.png">
                                <img class="headLine" src="<%=path%>/common/IM/img/On-line.png" style="display:none">
                            </div>
                            <span class="showRemarkName">嘎嘎客服</span>
                            <span class="newsNum newsNumSingle" style="display:none">0</span></li>
                    </ul>
                </div>
                <!-- 在线联系人-->
                <div id="onLineGroup">
                    <h6 class="onLineTitle FoldTitle openTitle">
                        <i class="foldingBtn js-foldingBtn"></i>
                        <p>
                            <span>在线用户</span> <span class="onLineNum">0</span>
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
							<span>我的好友
                                <!-- 我的好友 --></span><span class="friendNum">12</span><i
                                class="separator">/</i><span class="friendNumTotal">24</span>
                        </p>
                    </h6>
                    <ul class="friendContainer FoldContainer">
                        <li class="showContent" data-signid="people" data-gagaid="-1" data-remarkname="嘎嘎客服" data-nickname="嘎嘎客服" data-shield="0" data-online="2" data-language="zh">
                            <div class="showHead">
                                <img class="headImg" src="<%=path%>/common/images/gagaService.png">
                                <img class="headLine" src="<%=path%>/common/IM/img/On-line.png" style="display:none">
                            </div>
                            <span class="showRemarkName">嘎嘎客服</span>
                            <span class="newsNum newsNumSingle" style="display:none">0</span>
                        </li>
                    </ul>

                </div>


            </div>
        </div>
        <!------ 群组-----start--------->
        <div id="groupGroup" class="js-groupGroup">
            <div id="js-createGroup" class="createGroup">
				<span>创建群聊
                    <!-- 创建群聊 -->
            </div>
            <div id="js-groupScrollBar">
                <div class="groupCon">
                    <div class="groupContent">
                        <h6 class="groupTitle FoldTitle openTitle">
                            <i class="foldingBtn js-foldingBtn"></i>
                            <p>
								<span>群
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
						<span>最近聊天
                            <!-- 最近聊天 --></span>
                    </p>
                </h6>
                <ul class="recentlyContainer FoldContainer"></ul>
            </div>
            <div id="searchFriendGroup">
                <h6 class="friendTitle FoldTitle openTitle">
                    <i class="foldingBtn js-foldingBtn"></i>
                    <p>
						<span>我的好友
                            <!-- 我的好友 --></span>
                    </p>
                </h6>
                <ul class="friendContainer FoldContainer"></ul>
            </div>
            <div id="searchgroupGroup">
                <h6 class="groupTitle FoldTitle openTitle">
                    <i class="foldingBtn js-foldingBtn"></i>
                    <p>
						<span>群
                            <!-- 群 --></span>
                    </p>
                </h6>
                <ul class="groupContainer FoldContainer"></ul>
            </div>
            <div class="searchResultNothing">
                <i class="searchResultNothingImg"></i><span
                    class="searchResultNothingTXT">无搜索结果
                <!-- 无搜索结果 --></span>
            </div>
        </div>

    </div>
    <div id="IMgagaService">
        <img src="<%=path%>/common/IM/img/gagaService.png">
        <div class="gagaServiceTXT">嘎嘎客服<!-- 嘎嘎客服 --></div>
        <span class="close-gagaservice"></span>
    </div>

</div>

<div id="chatBox">
    <div  id="chatBoxUpper" class="chatBoxUpper">
        <div class="upperLeft">
            全部
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

			<span class="createGroupBtn">建群
                <!-- 建群 --></span> <span class="inviteFriends">邀请好友
            <!-- 邀请好友 --></span> <span class="functionBtn"> <i class="functionI"></i>
				<ul class="functionMore">
                    <li class="functionBack">退群
                        <!-- 退群 --></li>
                    <li class="functionRelationState">删除好友
                        <!-- 删除好友 --></li>
                    <li class="functionReport">举报
                        <!-- 举报 --></li>
                    <li class="functionShieldState">屏蔽
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
                            <span class="upgradeTipsTXT">系统提示<!-- 系统提示 -->：</span>
                            你今日聊天条数已用完，继续聊天 点此升级<!-- 你今日聊天条数已用完，继续聊天 点此升级 --></p>
                        <a href="<%=path%>/pay/upgradeMember"><span class="upgradeTipsBtn">点击升级<!-- 点击升级 --></span></a>
                        <div class="upgradeTipsBG"></div>
                    </div>
                    <div class="sendContentCon">
						<textarea id="inputBox" class="inputBox">
							按回车键发送消息
                            <!-- 按回车键发送消息 -->
						</textarea>
                    </div>
                    <div class="FunBtncontainer">
                        <div class="fl">
                            <div class="languageOptions">
                                <div class="languageSpan js-receiveOptions">
                                    <div class="translateTXT">
										<span>翻译
                                            <!-- 翻译 -->：
                                    </div>
                                    <div class="txt">
                                        <span class="language" langs-lang="en">English</span> <i
                                            class="Triangle"></i>
                                    </div>
                                </div>
                                <ul class="languageUl">
                                    <li class="langLi noTranslation" langs-lang="">
                                        不翻译
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
                                <li class="qqFaceBtn" data-Explain="选择表情"></li>
                                <li class="imgBtn js_imgBtn" data-Explain="发送图片"></li>
                                <li class="giftBtn" data-explain="发送礼物"></li>
                                <li class="redBtn" data-Explain="发红包"></li>
                                <!--<li class="giftBtn"></li>
	                              <li class="redBtn"></li>-->
                                <li class="HistoricalRecords" data-Explain="显示消息记录"></li>
                                <li class="HistoricalRecordsClosed" data-Explain="显示消息记录"></li>
                                <li class="sendBtn">发送
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
							按回车键发送消息
                            <!-- 按回车键发送消息 -->
						</textarea>
                    </div>
                    <div class="FunBtncontainer">
                        <div class="fl">
                            <div class="languageOptions">
                                <div class="languageSpan js-receiveOptions">
                                    <div class="translateTXT">
										<span>翻译
                                            <!-- 翻译 -->：
                                    </div>
                                    <div class="txt">
                                        <span class="language" langs-lang="en">English</span> <i
                                            class="Triangle"></i>
                                    </div>
                                </div>
                                <ul class="languageUl">
                                    <li class="langLi noTranslation" langs-lang="">
                                        不翻译
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
                                <li class="qqFaceBtn" data-Explain="选择表情"></li>
                                <li class="imgBtn js_imgBtn" data-Explain="发送图片"></li>
                                <!--<li class="giftBtn"></li>
	                              <li class="redBtn"></li>-->
                                <li class="HistoricalRecords" data-Explain="显示消息记录"></li>
                                <li class="HistoricalRecordsClosed" data-Explain="显示消息记录"></li>
                                <li class="sendBtn">发送
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
                群成员
                <!-- 群成员 -->
                （<span class="chatGroupNum">0</span>/<span class="chatGroupTotalNum">0</span>）
            </p>
            <div id="GroupMembScrollBar">
                <ul class="GroupMembContainer"></ul>
            </div>
        </div>
        <div class="chatHistorical">
            <h6>
                聊天记录
                <!-- 聊天记录 -->
                <i class="historicalClosed"></i>
            </h6>
            <div class="historicalContainer">
                <div class="textCenter marT5 IMnoChat" style="display:none">暂无聊天记录<!-- 暂无聊天记录 --></div>
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
		<span>创建群聊
            <!-- 创建群聊 -->
    </h2>
    <div class="CreateGroupLeft">
        <div class="searchDiv">
            <input type="text" class="searchInput"
                   value="搜索联系人<!-- 搜索联系人 -->" />
            <i class="searchBtn"></i> <i class="searchCloseBtn"></i>
        </div>
        <div class="CreateGroupLeftScrollBar">
            <div class="CreateGroupLeftCon">
                <!--  最近联系人-----start--------->
                <div id="CreateGroupRecently">
                    <h6 class="CreateGroupRecentlyTitle FoldTitle openTitle">
                        <i class="CreateGroupFoldingBtn "></i>
                        <p>
							<span>最近聊天
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
							<span>我的好友
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
						<span>最近聊天
                            <!-- 最近聊天 --></span>
                    </p>
                </h6>
                <ul class="recentlyContainer FoldContainer"></ul>
            </div>
            <div id="CreateGroupFriendSearch">
                <h6 class="friendTitle FoldTitle openTitle">
                    <i class="foldingBtn js-foldingBtn"></i>
                    <p>
						<span>我的好友
                            <!-- 我的好友 --></span>
                    </p>
                </h6>
                <ul class="friendContainer FoldContainer"></ul>
            </div>
            <div class="searchResultNothing">
                <i class="searchResultNothingImg"></i> <span
                    class="searchResultNothingTXT">无搜索结果
                <!-- 无搜索结果 --></span>
            </div>
        </div>
    </div>
    <div class="CreateGroupCenter"></div>
    <div class="CreateGroupRight">
        <h6>
            已选联系人
            <!-- 已选联系人 -->
            <span class="PeopleNum">0</span><span>/</span><span>50</span>
        </h6>
        <div class="CreateGroupRightScrollBar">
            <ul class="SelectedPeople"></ul>
        </div>
    </div>
    <div class="clear"></div>
    <div class="CreateGroupButtom">
		<span class="CreateGroupOK">确定
            <!-- 确定 --></span> <span class="CreateGroupCncel">取消
        <!-- 取消 --></span>
    </div>
</div>

<div id="cacheDiv"></div>

<!-- 商品列表 -->
<div class="giftCon" style="display: none;">
    <div class="gift-top">
        <div class="fl">
            <span class="mr15 f16 gift-chose pb5" id="gift">虚拟礼物</span>

        </div>
        <div class="fr"><a href="<%=path%>/mall/giftReal/shopHome" class="c-2d57a1 pb5">去商城逛逛</a></div>
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
            <div class="marT25">金币:<!-- 金币 --></div>
            <div class="marT100">留言:<!-- 留言 --></div>
        </div>
        <div class="RedEnvelopeTCRight">
            <p class="tips">金币不足<!-- 金币不足 -->，请先充值<!-- 请先充值 --></p>
            <input type="text" class="moneyTXT" value="请输入1-200个金币，仅限整数" onkeyup="this.value=this.value.replace(/\D/g,'')"
                   onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
            <div class="Remind">
                <i class="RemindIcon"></i>
                <div class="RemindContent">
                    <div class="triangle-left"></div>
                    <div class="triangle-bg"></div>
                    <span>红包规则<!-- 红包规则 --></span> 1、每个红包金额为1-200金币，仅限整数；<!-- 每个红包金额为1-200金币，仅限整数； -->
                    <br> 2、发红包可使用账户余额中的金币，如账户余额不足，请先充值再发送；<!-- 发红包可使用账户余额中的金币，如账户余额不足，请先充值再发送； -->
                    <br> 3、红包金币被领取后，直接进入领取人账户余额，可用于GaGaHi网站消费。<!-- 红包金币被领取后，直接进入领取人账户余额，可用于GaGaHi网站消费。 -->
                    <br> 4、红包一旦发出将不予退回，一直保留到对方领取。<!-- 红包一旦发出将不予退回，一直保留到对方领取。 -->
                    <br>
                </div>
            </div>
            <div class="clear"></div>
            <div class="moneyDiv cleard">账户可用金币<!-- 账户可用金币 -->： <i class="money"></i><span class="moneyNum"> 0.00 </span><br/><a class="toRecharge" href="<%=path%>/pay/recharge">去充值<!-- 去充值 --></a></div>
            <div class="textMSGDiv">
                <textarea class="textMSG">你的祝福语</textarea>
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
            <p class="titleName"><span class="name"></span>的红包</p>
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

            红包是在红色的信封里包上钱钞给出去的礼物，通常在中国新年的时候家庭中的长辈需要给孩子们包红包，作为一年开始的幸运礼物。红包里的钱的数目通常是诸如600或者800一类的偶数，因为偶数在中国文化中被赋予了幸运吉祥的寓意。如今，许多人还将红包视作一种变相的社交。
        </div>
    </div>
</div>





<script type="text/javascript" src="<%=path%>/common/IM/js/ImUploadIMG.js"></script>
<script type="text/javascript" src="<%=path%>/common/IM/js/jquery.qqFace.js"></script>
<script type="text/javascript" src="<%=path%>/common/IM/js/IMAjax.js"></script>
<script type="text/javascript" src="<%=path%>/common/IM/js/chatBox.js"></script>




<link href="<%=path%>/common/css/like.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/common/css/jquery.Jcrop.css" rel="stylesheet" type="text/css">
<script src="<%=path%>/common/js/slides-1.1.1-min.js" type="text/javascript"></script>
<script src="<%=path%>/common/js/slide.js" type="text/javascript"></script>

<script src="<%=path%>/common/js/selectdate.js" type="text/javascript"></script>
<script src="<%=path%>/common/js/jquery.Jcrop.js"></script>


<div class="mid">
    <div class="w1100 jz">

        <!-- 资料完善度 -->



        <!-- 金币 -->



        <!-- 翻译包 -->







        <!-- 会员等级 -->







        <div class="lft fl">
            <div class="lfttop">
                <div class="yhtx fl">
                    <a href="<%=path%>/member/myInformation"><img src="http://images.gagahi.com//images/default/male.png"></a>
                </div>
                <div class="yhxx fr">
                    <p class="ari">
                        <a class="ellipsis-name" href="<%=path%>/member/myInformation"  title="Quintion">Quintion</a>

                    </p>
                    <p class="ari hui f12" style="margin: 8px 0">GaGaID:30039931</p>

                    <p class="jd"><span class="jdt"><span class="jdts f12">0%</span></span></p>
                </div>
                <div class="clear"></div>
            </div>

            <p class="wsw">








                <a href="<%=path%>/member/memberInformation"><span class="ws"></span>请上传您的靓照</a><br>



                <span class="hui f12">完善资料，让朋友们更快了解你</a></span>


            </p>
            <div class="lf-cz">
                <button class="leftMoneyTranslate leftMoney bdra15  pad1-2 overVisible" data-explain="0" data-suffix="金币"><!-- 金币 -->
                    <span></span>
                    <div id="totalMoney">0</div>
                    <!-- <p class="totalMoney"><a class="Money"></a>金币</p>-->
                </button>
                <button class="leftMoneyTranslate leftTranslate bdra15  pad1-2 overVisible" data-explain="0" data-suffix="字符"><!-- 翻译包 -->
                    <span class="fy"></span>
                    <div id="totalTranslate">0</div>

                </button>
            </div>
            <div class="lf-lb">
                <span id="leftSixinIndexImg" class="on"></span><a href="<%=path%>/platform/privateLetter" id="leftSixinIndexText" class="on">私信</a>
                <div class="inlineblock newsNum" id="leftSixinNotice"></div>
            </div>
            <div class="lf-lb">
                <span class="lkm" id="leftLikeMeIndexImg"></span><a href="<%=path%>/member/like/likeMe" id="leftLikeMeIndexText">喜欢我的人</a>
                <div class="inlineblock newsNum" id="leftLikeMeNotice"></div>
            </div>
            <div class="lf-lb">
                <span class="mlk" id="leftIlikeIndexImg"></span><a href="<%=path%>/member/like/iLike" id="leftIlikeIndexText">我喜欢的人</a>
                <div class="inlineblock newsNum" id="leftIlike"></div>
            </div>
            <div class="lf-lb lf-mutual">
                <span class="each-lk" id="leftFriendIndexImg"></span><a href="<%=path%>/member/like/likeMeAndILike" id="leftFriendIndexText">互相喜欢</a>
                <div class="inlineblock newsNum" id="leftFriendNotice"></div>
            </div>
            <div class="lf-lb" >
                <span class="visitor" id="leftVisitorIndexImg" ></span><a href="<%=path%>/member/visitor/myVisitor" id="leftVisitorIndexText">访客</a>
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
                window.open("<%=path%>/pay/recharge","_blank");
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
            <div class="set-up">
                <div class="set-up-top pl15 pr15">
                    <div class="fl">设置</div>
                    <div class="fr"><a href="<%=path%>/member/myInformation" class="c-2d57a1" >返回个人主页&gt;&gt;</a></div>
                </div>
                <div class=" rht">
                    <div class="set-dom">
                        <h1 class="set-dom-title pb5 f18">您的个人资料<span class="set-dom-edit ml5"></span></h1>
                        <div class="set-content">



                            <div class="set-hidden" style="display:none;" id="information1">



                                <input type="hidden" id="language" value="zh-cn">
                                <ul>
                                    <li>
                                        <div class="set-content-title"><div class="yhtx tr inlineblock"><img id="headimgshow" src="http://images.gagahi.com//images/default/male.png" class="mr10"></div></div>
                                        <span class="img-edit c-2d57a1 tc mt10 ">编辑照片</span>
                                    </li>
                                    <li>
                                        <span class="set-content-title">昵称：</span>
                                        <span class="set-content-con"><input class="inp-edit bdra15 h30 pl15" id="membNickname" maxlength="20" value="Quintion"><span class="f12 bir-Infor-Tip  nicknamelength " id="nicknamelength" style="display: none;">昵称长度限制为3-20位字符</span></span>
                                    </li>
                                    <li>
                                        <span class="set-content-title">GaGa 号：</span>
                                        <span class=""><input disabled="disabled" class="inp-edit bdra15 h30 pl15" value="30039931"></span>
                                    </li>
                                    <li>
                                        <span class="set-content-title">年龄：</span>
                                        <div class="form-field set-content-con" style="width: 60%;">
                                            <div class="reg_form_sel mr10" style="z-index: 105;">
                                                <p id="reg_year"></p>
                                                <ul class="option year1" id="selYear" style="display: none;">
                                                </ul>
                                            </div>
                                            <div class="reg_form_sel mr10" style="z-index: 105;">
                                                <p id="reg_month"></p>
                                                <ul class="option month1" id="selMonth"
                                                    style="display: none;">
                                                </ul>
                                            </div>
                                            <div class="reg_form_sel" style="z-index: 105;">
                                                <p id="reg_day"></p>
                                                <ul class="option day1 " id="selDay" style="display: none;">
                                                </ul>
                                            </div>
                                            <span class="f12 bir-Infor-Tip "  id="bir-Infor-Tip" style="display: none;">你输入的生日不完整</span>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="set-content-title">性别：</span>
								<span class="set-content-con">


									<input id="b" class="radio" type="radio" checked="checked" value="y" name="sex">
									<label class="radio" for="b">男</label>

								</span>
                                    </li>
                                    <li>
                                        <span class="set-content-title">职业：</span>
                                        <div class="inlineblock occupation  h30 bdra30" style="z-index: 102">
                                            <span class="xld inlineblock" data-tongyong="" id="membJob"></span>
                                            <ul class="xld-select occupationList" style="display: none; top: 33px;height: 184px;overflow: auto;">

                                                <li style="margin:0px;" class="" data-chuandi="1">文案</li>

                                                <li style="margin:0px;" class="" data-chuandi="2">文员</li>

                                                <li style="margin:0px;" class="" data-chuandi="3">程序员</li>

                                                <li style="margin:0px;" class="" data-chuandi="4">设计</li>

                                                <li style="margin:0px;" class="" data-chuandi="5">销售</li>

                                                <li style="margin:0px;" class="" data-chuandi="6">客户经理</li>

                                                <li style="margin:0px;" class="" data-chuandi="7">工程师</li>

                                                <li style="margin:0px;" class="" data-chuandi="8">CEO</li>

                                                <li style="margin:0px;" class="" data-chuandi="9">会计</li>

                                                <li style="margin:0px;" class="" data-chuandi="10">出纳</li>

                                                <li style="margin:0px;" class="" data-chuandi="11">公务员</li>

                                                <li style="margin:0px;" class="" data-chuandi="12">农民</li>

                                                <li style="margin:0px;" class="" data-chuandi="13">渔民</li>

                                                <li style="margin:0px;" class="" data-chuandi="14">医生</li>

                                                <li style="margin:0px;" class="" data-chuandi="15">护士</li>

                                                <li style="margin:0px;" class="" data-chuandi="16">清洁工</li>

                                                <li style="margin:0px;" class="" data-chuandi="17">保安</li>

                                                <li style="margin:0px;" class="" data-chuandi="18">警察</li>

                                                <li style="margin:0px;" class="" data-chuandi="19">教练</li>

                                                <li style="margin:0px;" class="" data-chuandi="20">运动员</li>

                                                <li style="margin:0px;" class="" data-chuandi="21">司机</li>

                                                <li style="margin:0px;" class="" data-chuandi="22">快递员</li>

                                                <li style="margin:0px;" class="" data-chuandi="23">服务员</li>

                                                <li style="margin:0px;" class="" data-chuandi="24">空姐</li>

                                                <li style="margin:0px;" class="" data-chuandi="25">机长</li>

                                                <li style="margin:0px;" class="" data-chuandi="26">维修工</li>

                                                <li style="margin:0px;" class="" data-chuandi="27">采购</li>

                                                <li style="margin:0px;" class="" data-chuandi="28">厨师</li>

                                                <li style="margin:0px;" class="" data-chuandi="29">美食家</li>

                                                <li style="margin:0px;" class="" data-chuandi="30">导游</li>

                                                <li style="margin:0px;" class="" data-chuandi="31">老师</li>

                                                <li style="margin:0px;" class="" data-chuandi="32">学生</li>

                                                <li style="margin:0px;" class="" data-chuandi="33">校工</li>

                                                <li style="margin:0px;" class="" data-chuandi="34">营业员</li>

                                                <li style="margin:0px;" class="" data-chuandi="36">律师</li>

                                                <li style="margin:0px;" class="" data-chuandi="37">理发师</li>

                                                <li style="margin:0px;" class="" data-chuandi="38">美容师</li>

                                                <li style="margin:0px;" class="" data-chuandi="39">牧师</li>

                                                <li style="margin:0px;" class="" data-chuandi="40">演员</li>

                                                <li style="margin:0px;" class="" data-chuandi="41">歌手</li>

                                                <li style="margin:0px;" class="" data-chuandi="42">经纪人</li>

                                                <li style="margin:0px;" class="" data-chuandi="43">摄影师</li>

                                                <li style="margin:0px;" class="" data-chuandi="44">导演</li>

                                                <li style="margin:0px;" class="" data-chuandi="45">舞蹈家</li>

                                                <li style="margin:0px;" class="" data-chuandi="46">画家</li>

                                                <li style="margin:0px;" class="" data-chuandi="47">作家</li>

                                                <li style="margin:0px;" class="" data-chuandi="48">个体店老板</li>

                                                <li style="margin:0px;" class="" data-chuandi="49">家庭主妇</li>

                                                <li style="margin:0px;" class="" data-chuandi="50">自由职业</li>

                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="set-content-title">国家：</span>
                                        <div class="inlineblock occupation  h30 bdra30">
                                            <span class=" inlineblock country-sle" data-country="" style="z-index: 1" id="countryshow"></span>
                                            <input type="hidden" id="country" value=""><input type="hidden" id="countrycode" value="">
                                        </div>
                                    </li>
                                    <li>
                                        <span class="set-content-title">语言：</span>
                                        <div class="inlineblock occupation  h30 bdra30" style="z-index: 100">
                                            <span class="xld inlineblock" data-tongyong="en-us" id="membLanguage">English</span>
                                            <ul class="xld-select" style="display: none; top: 33px;">

                                                <li class="" data-chuandi="en-us">English</li>

                                                <li class="" data-chuandi="ja-jp">日本語</li>

                                                <li class="" data-chuandi="ru-ru">русский</li>

                                                <li class="" data-chuandi="es-es">Español</li>

                                                <li class="" data-chuandi="zh-cn">简体中文</li>

                                                <li class="" data-chuandi="zh-tw">繁體中文</li>

                                                <li class="" data-chuandi="ko-kr">한국어</li>

                                                <li class="" data-chuandi="de-de">Deutsch</li>

                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="set-content-title">身高（cm）：</span>
                                        <span class="set-content-con" style="z-index: 1"> <input class="inp-edit bdra15 h30 pl15" id="membHeight" maxlength="3" value=""></span>
                                    </li>
                                    <li>
                                        <span class="set-content-title">体重（kg）：</span>
                                        <span class="set-content-con" style="z-index: 1"> <input class="inp-edit bdra15 h30 pl15" id="membWeight" maxlength="3" value=""></span>
                                    </li>
                                    <li>
                                        <span class="set-content-title">个性签名：</span>
                                        <span class="set-content-con"> <textarea class="text-edit bdra15" maxlength="25" id="membSignature"></textarea></span>
                                    </li>
                                    <li>
                                        <span class="set-content-title">兴趣：</span>
                                        <div class="interest-edit bdra15">
                                            <div class="interest-edit-selected" id="lableselected">

                                                <!-- <span class="1">健身</span><span class="2">唱歌</span><span class="3">宅</span> -->
                                            </div>
                                            <div class="interest-edit-select">
                                                <div id="refreshlable">

                                                    <span class="465cd4e76e9a404c9cf2f55bf75ff3be" name="美容">美容</span>

                                                    <span class="381049eaad3a4e169f808bd35c33e4a0" name="丰田">丰田</span>

                                                    <span class="b8b5610a4d5d4046a0fc5f4951f6146a" name="高尔夫">高尔夫</span>

                                                    <span class="355e36b28e714a288ef00875a99c132a" name="美女">美女</span>

                                                    <span class="f8d66ed63c504a33b16172558c18fdfc" name="摄影">摄影</span>

                                                    <span class="e4c53f7f61d8486c845b5620a2a1f801" name="赛场">赛场</span>

                                                    <span class="4ab79e0b7c1e4d4f9ddfb1a1be250366" name="电影">电影</span>

                                                    <span class="fb59f4f46b754dbd9eb36bf3a183026f" name="瑜伽">瑜伽</span>

                                                    <span class="0b691f7e7e084a2991e455044158b035" name="聚会">聚会</span>

                                                    <span class="584850978a8147a5bb792d5dce823b04" name="车友">车友</span>

                                                    <span class="349ecfe5bd8347b7a7f8c885907e4ad0" name="帅哥">帅哥</span>

                                                </div>
                                                <div class="edit-Refresh c-2d57a1" id="refreshlablediv">
                                                    <i class="mr5"></i>
                                                    刷新
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <div class="preservation">
                                    <button class="bdra15 h30 bgc-2d57a1 c-fff set-safess" onclick="saveMemberinfo()">保存</button>
                                    <button class="bdra15 h30 cancel ml20" id="cancelbtn" >取消</button>
                                </div>
                            </div>
                            <!--个人信息展示部分开始-->



                            <ul class="set-show" style="display:block;" id="information2">



                                <li>
                                    <div class="set-content-title"><div class="yhtx tr inlineblock"><img src="http://images.gagahi.com//images/default/male.png"></div></div>
                                </li>
                                <li><span class="set-content-title">昵称：</span><span class="set-content-con">Quintion</span></li>
                                <li><span class="set-content-title">GaGa 号：</span><span class="set-content-con">30039931</span></li>
                                <li><span class="set-content-title">年龄：</span><span class="set-content-con">0</span></li>
                                <li><span class="set-content-title">性别：</span><span class="set-content-con">男</span></li>
                                <li><span class="set-content-title">职业：</span><span class="set-content-con"></span></li>
                                <li><span class="set-content-title">国家：</span><span class="set-content-con"></span></li>
                                <li><span class="set-content-title">语言：</span><span class="set-content-con">




							English








				</span>
                                </li>
                                <li><span class="set-content-title">身高（cm）：</span><span class="set-content-con"></span></li>
                                <li><span class="set-content-title">体重（kg）：</span><span class="set-content-con"></span></li>
                                <li><span class="set-content-title" id="showinfo">个性签名：</span><span class="set-content-con"></span></li>
                                <li><span class="set-content-title" >兴趣：</span><span class="set-content-con" >

                </span></li>
                            </ul>
                        </div>
                    </div>
                    <div  class="set-dom">
                        <h1 class="set-dom-title pb5 f18">您的账号<span class="set-dom-edit ml5"  id="editAccount"></span></h1>
                        <div class="set-content">
                            <div  id="personalinformationWin" class="set-hidden" style="display:none;">
                                <ul>
                                    <li><span class="set-content-title">金币：</span><span class="set-content-con">0.00<a href="<%=path%>/pay/recharge"><span class="set-recharge c-2d57a1">充值</span></a> </span></li>
                                    <li><span class="set-content-title">会员级别：</span><span class="set-content-con">


							普通会员





				<a href="<%=path%>/pay/upgradeMember"><span class="set-member c-2d57a1" style=" margin-left:30px;">升级</span></a></span></li>
                                    <li><span class="set-content-title">翻译包字符数：</span><span class="set-content-con" ><span id="myTotalTranslateNum">0</span></span></li>

                                    <li><span class="set-content-title">邮箱：</span>
                                        <div class="form-field set-content-con" style="width: 60%;">
                                            <div style="display:inline-block;width:auto">
                  <span class="set-content-con">



                  		<input class="inp-edit bdra15 h30 pl15" value="" id="mememail">


                  </span></div>
                                            <span class="f12 bir-Infor-Tip emailcheck" style="display: none;">邮箱已被占用</span>
                                            <span class="f12 bir-Infor-Tip emailerror" style="display: none;">邮箱格式不正确</span></div>
                                    </li>

                                    <li><span class="set-content-title">手机号码：</span><span class="set-content-con">
                    <div style="display: inline;">
                        <span class="f12 ts ts1 memphone" style="display: none;">号码不正确</span>
                    </div>
                  <input class="inp-edit bdra15 h30 pl15" value="" id="memphone">
                  </span></li>
                                    <input type="hidden" id="membPassword" value=""/>
                                    <input type="hidden" id="membEmail" value=""/>

                                    <li><span class="set-content-title">新密码：</span><span class="set-content-con">
                   <div style="display: inline;">
                       <span class="f12 ts ts1 mxy" style="display: none;">密码为6～20位的数字或字母</span>
                       <span class="f12 ts ts1 mdy" style="display: none;">密码为6～20位的数字或字母</span>
                   </div>
                  <input class="inp-edit bdra15 h30 pl15" type="password" id="newpwd" >
                  </span></li>
                                    <li>
                                        <span class="set-content-title">确认密码：</span><span class="set-content-con">
                  <input class="inp-edit bdra15 h30 pl15" type="password" id="confirmpwd">
                <div style="display: inline;">
                    <span class="f12 ts kd " style="display: none;" id="qrnewpwd">两次密码不一致</span>
                </div>
                  </span></li>
                                </ul>
                                <div class="preservation">
                                    <button class="bdra15 h30 bgc-2d57a1 c-fff set-safe111" onclick="accountSave()">保存</button>
                                    <button class="bdra15 h30 cancel ml20">取消</button>
                                </div>
                            </div>
                            <!--账号展示开始-->
                            <ul class="set-show">
                                <li><span class="set-content-title">金币：</span><span class="set-content-con">0.00</span></li>
                                <li><span class="set-content-title">会员级别：</span><span class="set-content-con">


							普通会员





                </span></li>
                                <li><span class="set-content-title">翻译包字符数：</span><span class="set-content-con meminfo-fnayi-num" id="mymefiTranslate">0</span></li>

                                <li><span class="set-content-title">邮箱：</span><span class="set-content-con"></span></li>
                                <li><span class="set-content-title">手机号码：</span><span class="set-content-con"></span></li>
                                <li><span class="set-content-title" id="membercard">密码：</span><span class="set-content-con">******</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="set-dom">
                        <h1 class="set-dom-title pb5 f18" >信用卡管理<span class="set-dom-edit ml5"></span></h1>
                        <div>
                            <div class="set-content set-hidden" style="display:none;">
                                <h3 class="tc m15">已添加0张信用卡</h3>

                                <div class="set-Credit bdra15">
                                    <p class="c-2d57a1 p15 tc set-add-credit" style="cursor:pointer;"><span class="fb f18 mr5"></span><span data-i18n="home.addCredit"></span></p>
                                </div>

                            </div>
                            <!--信用卡信息展示开始-->
                            <div class="set-content set-show">
                                <h3 class="tc m15">已添加0张信用卡</h3>



                            </div>
                        </div>
                    </div>
                    <div class="set-dom mt20 pt15 mb45">
                        <h1 class="set-dom-title pb5 f18 ">认证<span class="set-dom-edit ml5"></span></h1>
                        <div>
                            <div class="set-content p30 set-hidden" style="display:none;">
                                <p style="margin-left:25%;display:none;" class="red" id="tostshow">邮箱格式不正确</p>
                                <ul>
                                    <li><span class="set-content-title">认证邮箱：</span> <span class="set-email">
                  <input type="text" value="" id="rzemail">
                  <button onclick = "sendemail()" class="meminfo-send-email">发送邮件</button>
                  <br>
                  <span class="pl15 inlineblock pt10">1、在忘记登陆密码时可以通过此邮箱来重置密码，让您的账号更加安全！<br>
                  2、如果未收到认证邮件，请用户联系客服管理人员提出您的问题。</span> </span></li>
                                </ul>
                                <div class="preservation">
                                    <button class="bdra15 h30 bgc-2d57a1 c-fff set-safe2" onclick = "sendemail()">保存</button>
                                    <button class="bdra15 h30 cancel ml20">取消</button>
                                </div>
                            </div>
                            <!--邮箱展示部分开始-->
                            <div class="set-content set-show">
                                <ul>
                                    <li><span class="set-content-title" style="width:25%;"></span><span class="set-content-con" >


							邮箱未认证






                </span></li>
                                </ul>
                            </div>
                            <!--邮箱展示部分结束-->
                        </div>
                    </div>
                    <div class="set-dom">
                        <h1 class="set-dom-title pb5 f18">隐私<span class="set-dom-edit ml5"></span></h1>
                        <div class="set-content">
                            <div class="set-hidden" style="display:none;">
                                <ul>
                                    <li><span class="set-content-title">是否公开我的个人档案？ ：</span><span class="set-content-con" style="position:relative">
                  <input id="e" class="radio" type="radio" checked value="1" name="mecoIsopenperson">
                  <label class="radio" for="e">公开</label>
                  <input id="f" class="radio" type="radio"  value="2" name="mecoIsopenperson" style="left:95px;">
                  <label class="radio  ml30" for="f">好友</label>
                  <input id="g" class="radio" type="radio"   value="3" name="mecoIsopenperson" style="left:190px;">
                  <label class="radio ml30" for="g">仅限自己</label>
                  </span></li>
                                    <li><span class="set-content-title">显示我的在线状态：</span><span class="set-content-con" style="position:relative;">
                  <input id="h" class="radio" type="radio" checked value="1" name="mecoIsonline">
                  <label class="radio" for="h">是</label>
                  <input id="i" class="radio" type="radio"  value="2" name="mecoIsonline" style="left:91px;">
                  <label class="radio  ml30" for="i">否</label>
                  </span></li>
                                    <li><span class="set-content-title">加好友申请：</span><span class="set-content-con" style="position:relative;">
                  <input id="j" class="radio" type="radio" checked value="1" name="mecoIsallowaddfriend">
                  <label class="radio" for="j">允许任何人把我加为好友</label>
                  <input id="k" class="radio" type="radio"   value="2" name="mecoIsallowaddfriend" style="left:231px;">
                  <label class="radio" for="k"> 需要验证才能把我加为好友</label>
                  </span></li>
                                </ul>
                                <div class="preservation">
                                    <button class="bdra15 h30 bgc-2d57a1 c-fff set-safe">保存</button>
                                    <button class="bdra15 h30 cancel ml20">取消</button>
                                </div>
                            </div>
                            <!--隐私展示部分开始-->
                            <ul class="set-show">
                                <li><span class="set-content-title">是否公开我的个人档案？ ：</span><span class="set-content-con">





						 公开


              	</span></li>
                                <li><span class="set-content-title">显示我的在线状态：</span><span class="set-content-con">




						是

				</span></li>
                                <li><span class="set-content-title">加好友申请：</span><span class="set-content-con">




						 允许任何人把我加为好友

				</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="set-dom">
                        <h1 class="set-dom-title pb5 f18">通知<span class="set-dom-edit ml5"></span></h1>
                        <div class="set-content">
                            <div class="set-hidden" style=" display:none">

                                <ul>
                                    <li><span class="set-content-title">信息：</span><span class="set-content-con">
                 <input id="mecoId"  type="hidden" value=""/>
                  <input id="mecoIsletter" class="radio" type="checkbox" checked name="mecoIsletter">
                  <label class="radio" for="l"></label>
                  </span></li>
                                    <li><span class="set-content-title">当有其他人喜欢你：</span><span class="set-content-con">
                  <input id="mecoIslike" class="radio" type="checkbox" checked="checked"  name="mecoIslike">
                  <label class="radio" for="m"></label>
                  </span></li>
                                    <li><span class="set-content-title">当有访客：</span><span class="set-content-con">
                  <input id="mecoIsvisito" class="radio" type="checkbox" checked  name="mecoIsvisito">
                  <label class="radio" for="n"></label>
                  </span></li>

                                    <li><span class="set-content-title">收到礼物：</span><span class="set-content-con">
                  <input  id="mecoIsacceptgift" class="radio" type="checkbox" checked name="mecoIsacceptgift">
                  <label class="radio" for="p"></label>
                  </span></li>



                                </ul>
                                <div class="preservation">
                                    <button class="bdra15 h30 bgc-2d57a1 c-fff set-safe" type="submit">保存</button>
                                    <button class="bdra15 h30 cancel ml20">取消</button>
                                </div>
                            </div>
                            <ul class="set-show" id="confignotice">
                                <li><span class="set-content-title">信息：</span><span class="set-content-con">




						是

				</span></li>
                                <li><span class="set-content-title">当有人喜欢你：</span><span class="set-content-con">




						 是

				</span></li>
                                <li><span class="set-content-title">当有访客：</span><span class="set-content-con">




						是

				</span></li>

                                <li><span class="set-content-title">收到礼物：</span><span class="set-content-con">




						 是

				 </span></li>



                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>




<!--登录弹出框开始-->
<link href="<%=path%>/common/css/login-layer.css" rel="stylesheet" type="text/css"/>

<div class="creditcon"></div>
<div class="logn-con">
    <div class="diy-layer-top">
        登录<span class="diy-close2"></span>
    </div>
    <div class="logn-con-bottom">
        <div style="display: block;">
            <div class="form-control">
                <div style="display: inline;">
                    <span style="display: none;" class="f12 ts kd ">请输入帐号<!-- 用户名不能为空 --></span>
                </div>
                <input type="text" placeholder='邮箱'
                       data-type-diy-regex="^(1\d{10})|(([0-9a-zA-Z]+[-._+&amp;])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6})$"
                       data-type="required|diy-regex" name="name"
                       class="inp txt-name bdra30" autocomplete="off" id="txt-name">
            </div>
            <div class="form-control">
                <div style="display: inline;">
                    <span style="display: none;" class="f12 ts mkd ">请输入密码<!-- 密码不能为空！ --></span>
                </div>
                <input type="password" err="required" name="pwd"
                       data-type="required|diy-regex"
                       data-type-diy-regex="^[\da-zA-Z]{6,20}$" maxlength="20"
                       id="txt-pwd" class="inp txt-pwd bdra30" placeholder='密码'
                       autocomplete="off">
            </div>
            <div style="text-align: center; margin: 10px 0 15px;">
                <button id="log-bnt" class="btn">登录<!-- 登录 --></button>
            </div>
            <div class=" mt10">
                <a href="http://www.gagahi.com:80/Platform/inviteRegIndex?source=2&inviter=2935185&sysid=" class="fl c-2d57a1 f13">注册<!-- 注册 --></a>
                <a href="http://www.gagahi.com:80/Platform/forgotPassword" class="fr c-2d57a1 f13">忘记密码<!-- 忘记密码？ --></a>
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
            <a href="http://www.gagahi.com:80/Platform/abutUs" target="_blank">关于我们</a> |
            <a href="http://www.gagahi.com:80/Platform/friendssafe" target="_blank">安全交友</a> |
            <a href="http://www.gagahi.com:80/Platform/privacyclause" target="_blank">隐私条款</a> |
            <a href="http://www.gagahi.com:80/Platform/help" target="_blank">帮助中心</a> |
            <a href="http://www.gagahi.com:80/Platform/contactus" target="_blank">联系我们</a>
        </p>
        <div class="fhdb">
            <div class="scroll_t">
                <img src="<%=path%>/common/images/xs.png">
            </div>
            <!-- <div class="fk">
				<a href="#" class="f12">意见反馈意见反馈</a>
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

        var token="e712cc82a9c04bb6a8305ebe4e992326";
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
<script src="<%=path%>/common/js/jquery.page.js"></script>
<!--添加信用卡弹窗html开始-->
<div class="creditcon"></div>
<div class="diy-layer">
    <div class="diy-layer-top">添加信用卡信息<span class="diy-close"></span></div>
    <div class="diy-tip">
        <span class="no-name" id="tipErrorMsg"></span>
    </div>
    <p class="mt15 mb15"><span class="creditcon-tile c-2d57a1">发卡机构类型：</span><span class="creditcon-con" style="position:relative;">
    <input id="w" class="radio" type="radio" value="master" checked="checked" name="mecrCardtype">
    <label class="radio" for="w">Master</label>
    <input id="x" class="radio" type="radio" value="visa" name="mecrCardtype" style="left:96px">
    <label class="radio  ml30" for="x">VISA</label>
    <input id="y" class="radio" type="radio" value="JCB" name="mecrCardtype" style="left:190px;">
    <label class="radio ml30" for="y">JCB</label>
    </span></p>
    <p class="mt15 mb15"><span class="creditcon-tile">持卡人姓名：</span><span class="creditcon-con">
    <input type="text" placeholder="持卡人姓名" class="diy-inp diy-name" id="mecrCardname" name="mecrCardname" >
    </span> </p>
    <p class="mt15 mb15"><span class="creditcon-tile">信用卡号码：</span><span class="creditcon-con">
    <input type="text" placeholder="信用卡号码" class="diy-inp" id="mecrCardnumber" name="mecrCardnumber">
    </span> </p>
    <div class="mt15 mb15" ><span class="creditcon-tile">有效期：</span>
        <div class="creditcon-con" >
            <div class="diy-con " style=" position:relative; "> <span class="xld diy-menu bdra15" data-tongyong="01" id="addmonth">01</span>
                <ul class=" xld-select diy-list diymonth" style="display:none;">
                    <li class="default" data-chuandi="01">01</li>
                    <li  data-chuandi="02">02</li>
                    <li  data-chuandi="03">03</li>
                    <li  data-chuandi="04">04</li>
                    <li  data-chuandi="05">05</li>
                    <li  data-chuandi="06">06</li>
                    <li  data-chuandi="07">07</li>
                    <li  data-chuandi="08">08</li>
                    <li  data-chuandi="09">09</li>
                    <li  data-chuandi="10">10</li>
                    <li  data-chuandi="11">11</li>
                    <li  data-chuandi="12">12</li>
                </ul>
            </div>
            <div class="diy-con" style=" position:relative;"> <span class="xld diy-menu bdra15" data-tongyong="2016" id="addyear">2016</span>
                <ul class=" xld-select diy-list diyyear" style="display:none;">
                    <li class="default" data-chuandi="2016">2016</li>
                    <li  data-chuandi="2017">2017</li>
                    <li  data-chuandi="2018">2018</li>
                    <li  data-chuandi="2019">2019</li>
                    <li  data-chuandi="2020">2020</li>
                    <li  data-chuandi="2021">2021</li>
                    <li  data-chuandi="2022">2022</li>
                </ul>
            </div>
        </div>
    </div>
    <p class="mt15 mb15"><span class="creditcon-tile">安全码：</span><span class="creditcon-con">
    <input type="text" placeholder="卡背后三位数" class="diy-inp" id="mecrSafetycode" name="mecrSafetycode">
    </span> </p>
    <p class="mt15 mb15"><span class="creditcon-tile">手机号码：</span><span class="creditcon-con">
    <input type="text" placeholder="银行预留号码" class="diy-inp" id="mecrPhone" name="mecrPhone">
    </span> </p>
    <p class="mt15 mb15">
        <span class="creditcon-tile"></span>
        <span class="creditcon-con"><input id="agreement" class="vm" type="checkbox"><a class="c-2d57a1 f12 vm" href="http://www.gagahi.com:80/Platform/QuickAgreement">我已阅读并同意《快捷支付服务协议》</a></span>
    </p>
    <p class="mt15 mb15 " id="payPasswordItems"><span class="creditcon-tile">支付密码：</span><span class="creditcon-con">
	    <input type="password" placeholder='请输入6-12位字母、数字相组合密码' class="diy-inp" id="payPassword" name="payPassword">
	    </span>
    </p>
    <p class="mt15 mb15 c-fe2525">
        <span class="creditcon-tile"></span>
        <span class="creditcon-con">若您没有支付密码，请输入想要设置的密码</span>
    </p>
    <div class="diy-btn">
        <button class="bdra15 h30 bgc-2d57a1 c-fff add-safe">保存</button>
        <button class="bdra15 h30 cancel ml20">取消</button>
    </div>
</div>

<!--添加信用卡弹窗html结束-->
<!--修改信用卡弹窗html开始-->
<div class="diy-layer-modify">
    <div class="diy-layer-top">
        修改信用卡信息<span class="diy-close1"></span>
    </div>
    <div class="diy-tip">
        <span class="upno-name" id="updateno-name"></span>
    </div>
    <div id="cardhtml">
        <input type="hidden" id="updatecardid">
        <p class="mt15 mb15">
            <span class="creditcon-tile c-2d57a1">发卡机构类型：</span><span class="creditcon-con" id="updatecardtype"> VISA </span>
        </p>
        <p class="mt15 mb15">
            <span class="creditcon-tile">信用卡号码：</span><span class="creditcon-con" id="updatecardnum">
				****6768 </span>
        </p>
        <p class="mt15 mb15">
            <span class="creditcon-tile">持卡人姓名：</span><span class="creditcon-con">
				<input type="text" placeholder="持卡人姓名" class="diy-inp" id="updatecardname">
			</span>
        </p>
        <div class="mt15 mb15">
            <span class="creditcon-tile">有效期：</span>
            <div class="creditcon-con">
                <div class="diy-con " style="position: relative;">
                    <span class="xld diy-menu bdra15" data-tongyong="01" id="updatecardmonth">01</span>
                    <ul class=" xld-select diy-list diymonth" style="display: none;">
                        <li class="default" data-chuandi="01">01</li>
                        <li data-chuandi="02">02</li>
                        <li data-chuandi="03">03</li>
                        <li data-chuandi="04">04</li>
                        <li data-chuandi="05">05</li>
                        <li data-chuandi="06">06</li>
                        <li data-chuandi="07">07</li>
                        <li data-chuandi="08">08</li>
                        <li data-chuandi="09">09</li>
                        <li data-chuandi="10">10</li>
                        <li data-chuandi="11">11</li>
                        <li data-chuandi="12">12</li>
                    </ul>
                </div>
                <div class="diy-con" style="position: relative;">
                    <span class="xld diy-menu bdra15" data-tongyong="2016" id="updatecardyear">2016</span>
                    <ul class=" xld-select diy-list diyyear" style="display: none;">
                        <li class="default" data-chuandi="2016">2016</li>
                        <li data-chuandi="2017">2017</li>
                        <li data-chuandi="2018">2018</li>
                        <li data-chuandi="2019">2019</li>
                        <li data-chuandi="2020">2020</li>
                        <li data-chuandi="2021">2021</li>
                        <li data-chuandi="2022">2022</li>
                    </ul>
                </div>
            </div>
        </div>
        <p class="mt15 mb15">
            <span class="creditcon-tile">安全码：</span><span class="creditcon-con">
				<input type="text" placeholder="卡背后三位数" class="diy-inp" id="updatecardsafecode">
			</span>
        </p>
        <p class="mt15 mb15">
            <span class="creditcon-tile">手机号码：</span> <span class="creditcon-con">
				<input type="text" placeholder="银行预留号码" class="diy-inp" id="updatecardphone" />
			</span>
        </p>
        <div class="diy-btn">
            <button class="bdra15 h30 bgc-2d57a1 c-fff modify-safe" onclick="updatesavecard()">保存</button>
            <button class="bdra15 h30 cancel ml20">取消</button>
        </div>
    </div>
</div>
<!--修改信用卡弹窗html结束-->
<!--修改头像弹窗html开始-->
<div class="img-editcon" >
    <div class="diy-layer-top">修改头像信息<span class="diy-close2"></span></div>
    <div class="img-editcon-top"><span class="img-chosed">本地上传</span></div>
    <div class="img-editcon-bottom mb100 mt100">
        <div id="uploader-demo">
            <div id="filePicker" class="diy-upload bgc-2d57a1 bdra30 tc c-fff">选择照片</div>
            <input type="hidden" value="" name="token" id="token" />
            <input type="hidden" value="" name="key" id="key" />
            <p class="tc hui">支持 JPG,JPEG,PNG,BMP,GIF格式，且文件小于5M</p>
        </div>
    </div>
</div>
<!--修改头像弹窗html结束-->
<!--裁剪头像弹窗html开始-->
<div class="img-shear" style=" width:540px;">

    <div class="diy-layer-top">编辑缩略图<span class="diy-close3"></span></div>
    <div class="img-shear-bottom">
        <div class="img-shear-con fl tc jc-demo-box">
            <input type="hidden" id="cjimgurl">
            <input type="hidden" id="imgdataurl">
            <img src="http://7xqybr.com1.z0.glb.clouddn.com/Z-c907588da0e1484ca32eb780c094e6e3?imageMogr2/thumbnail/410x300" id="target" />
        </div>
        <div class="img-shear-preview fr">预览：
            <div class="img-w60 mt10 mb10"><img id="imgval1" src="http://7xqybr.com1.z0.glb.clouddn.com/Z-c907588da0e1484ca32eb780c094e6e3?imageMogr2/thumbnail/410x300" class="return-data" /></div>
            <p class="mb15 tc">60*60</p>
            <div class="img-w45 mb10" style="margin-left:7px;"><img id="imgval2" src="http://7xqybr.com1.z0.glb.clouddn.com/Z-c907588da0e1484ca32eb780c094e6e3?imageMogr2/thumbnail/410x300" class="return-data" /></div>
            <p class="mb15 tc">45*45</p>
            <div class="img-w30 mb10 ml15"><img id="imgval3" src="http://7xqybr.com1.z0.glb.clouddn.com/Z-c907588da0e1484ca32eb780c094e6e3?imageMogr2/thumbnail/410x300" class="return-data" /></div>
            <p class="tc">30*30</p>
        </div>
        <div class=" clear"></div>
        <div class="img-preservation"><button class="bdra15 h30 bgc-2d57a1 c-fff" onclick="saveimgdata()">保存</button><button class="bdra15 h30 cancel ml20" id="photocancel">取消</button></div>
    </div>

</div>
<script type="text" id="resetPasswordJS">
  <div class="resetPassword-con">
     <label class="password-label">原支付密码：<input type="password" class="oldPassword marL5 h30 pl15 bdra15 " placeholder="" /></label>
     <label class="password-label">新支付密码：<input type="password" class="newPassword marL5 h30 pl15 bdra15 " placeholder="" /></label>
     <label class="password-label">  确认密码：<input type="password" class="confirmPassword marL5 h30 pl15 bdra15 " placeholder="" /></label>
  </div>
</script>


<!--裁剪头像弹窗html结束-->

<script>
    //-----------------------------------上传调用开始----------------------------------------
    /*编辑头像*/
    var jcrop_api="";
    /*裁剪开始*/
    jQuery(function(){
        getTranslateWordNum();
        /*裁剪结束*/

        $(".img-shear,.img-editcon").css("left",($(window).width()-$(".img-shear,.img-editcon").width())/2+'px');
        $(".img-edit").click(function(e) {
            $(".img-editcon,.creditcon").css("display","block");
            $(".img-editcon-top span").click(function(e) {
                $(this).addClass("img-chosed").siblings().removeClass("img-chosed");
            });
            $.getScript("<%=path%>/common/js/photoUp.js").done(function() {});
            //$.ajaxSetup({cache: true});
        });
        $(".diy-upload").click(function(e) {

        });

        //关闭弹窗
        $(".diy-close3").click(function(e) {
            $(".img-shear,.creditcon").css("display","none");
        });
        $(".diy-close2").click(function(e) {
            $(".img-editcon,.creditcon").css("display","none");
        });

    });

    // Simple event handler, called from onChange and onSelect
    // event handlers, as per the Jcrop invocation above
    function updatePreview(c){
        // console.log(c);
        var Crop,newCrop;
        Crop = "/thumbnail/410x300/thumbnail/400x400/crop/!"+ c.w + "x" +c.h +"a"+c.x+"a"+c.y;
        var img = $("#imgdataurl").val();
        //$("#cjimgurl").val(img);
        $("#cjimgurl").val(img+"?imageMogr2"+Crop);
        //$("#cjimgurl").val(img+"?imageMogr2/thumbnail/410x300");
        //newCrop = "http://7xqybr.com1.z0.glb.clouddn.com/Z-c907588da0e1484ca32eb780c094e6e3?imageMogr2/thumbnail/410x300" + Crop;
        newCrop = $('#target').attr("src") + Crop;
        //alert(newCrop);
        $(".return-data").attr("src",newCrop);
    };



    //入库保存头像信息
    function saveimgdata(){
        var cjimgurl = $("#cjimgurl").val();
        //alert(cjimgurl);
        $.post("http://www.gagahi.com:80/Member/membphotoupload",{
            bigimg:cjimgurl
        },function(result){
            if(result.success){
                if(result.obj !=1){
                    layer.msg('提交成功，请等待审核');
                }

                $("#headimgshow").attr("src","http://images.gagahi.com//"+cjimgurl)
                $(".img-shear,.creditcon").css("display", "none")
                if(result.obj==1){
                    layer.msg('提交成功，请等待审核<br/>保存成功',{time: 500},function(){
                        var contentTip = '<p style=" text-align:center; margin-top:20px; width:300px;">恭喜您获得7天高级会员权限 </p>';
                        layer.open({
                            type: 0,
                            /* title: '提示',*/
                            title: false,
                            content: contentTip,
                            btn: ['知道了'],
                            yes: function (index, layero) {
                                layer.close(index);
                                //window.location.href ="http://www.gagahi.com:80/Member/memberinformation"
                            },
                            cancel: function (index) {
                                layer.close(index);
                                //window.location.href ="http://www.gagahi.com:80/Member/memberinformation"
                            }
                        });
                    });
                }
            }
        });
    }

    //-----------------------------------上传调用结束----------------------------------------
    //按键松开的效果onkeyup
    $("#membHeight,#membWeight").on("keyup",function(){
        var val=$(this).val();
        val=val.replace(/[^\d]/g,'');
        $(this).val(val);
    });

    /**
     * 随机获取兴趣
     */
    $("#refreshlablediv").click(function(e){
        $.post("http://www.gagahi.com:80/Member/randomlables",{
        },function(result){

            var html="";
            for(var i = 0;i < result.length;i++){
                html+="<span class="+result[i].dilaParentcode+" name="+result[i].dilaName+" >"+result[i].dilaName+"</span>";
            }
            $("#refreshlable").html(html);
        });
    });

    $("#photocancel").click(function(e){
        $(".img-shear,.creditcon").css("display", "none")

    })

    //获取翻译字符数
    function getTranslateWordNum(){
        $.IM.getTranslationCharacterNum();
        var num = $.IM.myCharacterNum
        $("#myTotalTranslateNum").text(num);
        $("#mymefiTranslate").text(num);
        /* $.post("http://www.gagahi.com:80/memberFinance/getTranslatePackTotalNum",{},
         function(data,textStatus){
         if(data.success){
         $("#myTotalTranslateNum").text(data.obj);
         $("#mymefiTranslate").text(data.obj);

         }
         }) */
    }
    //-----------------------------------上传调用结束----------------------------------------
    /*修改滚动轴*/
    $(window).load(function(){
        $(".month1,.year1,.day1,.diymonth,.diyyear,.occupationList").mCustomScrollbar();
    });
    /*下拉菜单*/
    /*下拉菜单*/
    $(".xld").each(function(index, element) {
        $(this).click(function (e) {
            e.stopPropagation();
            $(this).next("ul").css("display","block");
            $(this).css("background-image","url(<%=path%>/common/images/xld1.png)");
            $(".xld-select li").each(function (e) {
                var _selt = $(this);
                $(this).hover(function (){
                    $(this).addClass("default").siblings().removeClass("default");
                })
                $(this).click(function (e) {
                    $(_selt.parents(".xld-select").siblings("span")).text(_selt.text()).css("background-image","url(<%=path%>/common/images/xld.png)");
                    $(_selt.parents(".xld-select").siblings("span")).attr("data-tongyong",$(_selt).data("chuandi"));
                    _selt.parents(".xld-select").css("display", "none");
                });
            });
        })
    });
    //点击关闭
    $(document).click(function(){
        $(".xld-select").hide();
    });

    $(document).ready(function () {
        var myDate = new Date();
        $("#dateSelector").DateSelector({
            ctlYearId: 'selYear',
            ctlMonthId: 'selMonth',
            ctlDayId: 'selDay',
            defYear: myDate.getFullYear(),
            defMonth: (myDate.getMonth()+1),
            defDay: myDate.getDate(),
            minYear: myDate.getFullYear()-100,
            maxYear: (myDate.getFullYear()-18)
        });
        /*选择生日*/
        $(".reg_form_sel").hover(function (e) {
            //$($(this).children(".option")).stop(false, true).slideDown("fast");
            $($(this).children(".option")).show();
        }, function (e) {
            $($(this).children(".option")).hide();
            //  $($(this).children(".option")).stop(false, true).slideUp("fast");
        });
        $(".reg_form_sel .option>li").each(function (e) {
            var _selt = $(this);
            $(this).click(function (e1) {
                $(_selt.parent(".option").siblings("p")).text(_selt.text());
                _selt.parent(".option").css("display", "none");
            });
        });
    });
    /*选择国家*/
    $(".country-sle").click(function(e) {
        /*国家拼接*/
        var platformZHCountryGroupMap={"T-Z":[{"dicoId":55,"dicoCountryid":"AM","dicoAreacode":0,"dicoLocationcode":374,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"亚美尼亚","dicoDescription":"","dicoIsdel":1},{"dicoId":215,"dicoCountryid":"BN","dicoAreacode":0,"dicoLocationcode":673,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"zh-cn","dicoName":"文莱","dicoDescription":"","dicoIsdel":1},{"dicoId":287,"dicoCountryid":"CF","dicoAreacode":0,"dicoLocationcode":236,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"中非共和国","dicoDescription":"","dicoIsdel":1},{"dicoId":335,"dicoCountryid":"CL","dicoAreacode":0,"dicoLocationcode":56,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"智利","dicoDescription":"","dicoIsdel":1},{"dicoId":351,"dicoCountryid":"CN","dicoAreacode":1,"dicoLocationcode":86,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"中国","dicoDescription":"","dicoIsdel":1},{"dicoId":479,"dicoCountryid":"EH","dicoAreacode":0,"dicoLocationcode":0,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"西撒哈拉","dicoDescription":"","dicoIsdel":1},{"dicoId":495,"dicoCountryid":"ES","dicoAreacode":3,"dicoLocationcode":34,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"西班牙","dicoDescription":"","dicoIsdel":1},{"dicoId":567,"dicoCountryid":"GB","dicoAreacode":3,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"英国","dicoDescription":"","dicoIsdel":1},{"dicoId":623,"dicoCountryid":"GI","dicoAreacode":0,"dicoLocationcode":350,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"直布罗陀","dicoDescription":"","dicoIsdel":1},{"dicoId":671,"dicoCountryid":"GR","dicoAreacode":3,"dicoLocationcode":30,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"希腊","dicoDescription":"","dicoIsdel":1},{"dicoId":679,"dicoCountryid":"GT","dicoAreacode":0,"dicoLocationcode":502,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"危地马拉","dicoDescription":"","dicoIsdel":1},{"dicoId":711,"dicoCountryid":"HK","dicoAreacode":1,"dicoLocationcode":852,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"中国香港","dicoDescription":"","dicoIsdel":1},{"dicoId":743,"dicoCountryid":"HU","dicoAreacode":3,"dicoLocationcode":36,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"匈牙利","dicoDescription":"","dicoIsdel":1},{"dicoId":751,"dicoCountryid":"ID","dicoAreacode":0,"dicoLocationcode":62,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"印度尼西亚","dicoDescription":"","dicoIsdel":1},{"dicoId":767,"dicoCountryid":"IL","dicoAreacode":0,"dicoLocationcode":972,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"以色列","dicoDescription":"","dicoIsdel":1},{"dicoId":783,"dicoCountryid":"IN","dicoAreacode":0,"dicoLocationcode":91,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"印度","dicoDescription":"","dicoIsdel":1},{"dicoId":791,"dicoCountryid":"IQ","dicoAreacode":0,"dicoLocationcode":964,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"伊拉克","dicoDescription":"","dicoIsdel":1},{"dicoId":799,"dicoCountryid":"IR","dicoAreacode":0,"dicoLocationcode":98,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"伊朗","dicoDescription":"","dicoIsdel":1},{"dicoId":815,"dicoCountryid":"IT","dicoAreacode":3,"dicoLocationcode":39,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"意大利","dicoDescription":"","dicoIsdel":1},{"dicoId":823,"dicoCountryid":"JM","dicoAreacode":0,"dicoLocationcode":1876,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"牙买加","dicoDescription":"","dicoIsdel":1},{"dicoId":831,"dicoCountryid":"JO","dicoAreacode":0,"dicoLocationcode":962,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"约旦","dicoDescription":"","dicoIsdel":1},{"dicoId":1103,"dicoCountryid":"MO","dicoAreacode":1,"dicoLocationcode":853,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"中国澳门","dicoDescription":"","dicoIsdel":1},{"dicoId":1199,"dicoCountryid":"NC","dicoAreacode":0,"dicoLocationcode":687,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"zh-cn","dicoName":"新喀里多尼亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1263,"dicoCountryid":"NZ","dicoAreacode":0,"dicoLocationcode":64,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"zh-cn","dicoName":"新西兰","dicoDescription":"","dicoIsdel":1},{"dicoId":1463,"dicoCountryid":"SG","dicoAreacode":0,"dicoLocationcode":65,"dicoIssms":1,"dicoJetlag":0.3,"dicoLanguage":"zh-cn","dicoName":"新加坡","dicoDescription":"","dicoIsdel":1},{"dicoId":1559,"dicoCountryid":"SY","dicoAreacode":0,"dicoLocationcode":963,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"叙利亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1575,"dicoCountryid":"TC","dicoAreacode":0,"dicoLocationcode":1649,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"特克斯和凯科斯群岛","dicoDescription":"","dicoIsdel":1},{"dicoId":1583,"dicoCountryid":"TD","dicoAreacode":0,"dicoLocationcode":235,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"乍得","dicoDescription":"","dicoIsdel":1},{"dicoId":1599,"dicoCountryid":"TH","dicoAreacode":0,"dicoLocationcode":66,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"泰国","dicoDescription":"","dicoIsdel":1},{"dicoId":1607,"dicoCountryid":"TJ","dicoAreacode":0,"dicoLocationcode":992,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"塔吉克斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":1615,"dicoCountryid":"TK","dicoAreacode":0,"dicoLocationcode":993,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"土库曼斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":1631,"dicoCountryid":"TN","dicoAreacode":0,"dicoLocationcode":216,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"突尼斯","dicoDescription":"","dicoIsdel":1},{"dicoId":1639,"dicoCountryid":"TO","dicoAreacode":0,"dicoLocationcode":676,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"zh-cn","dicoName":"汤加","dicoDescription":"","dicoIsdel":1},{"dicoId":1647,"dicoCountryid":"TR","dicoAreacode":0,"dicoLocationcode":90,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"土耳其","dicoDescription":"","dicoIsdel":1},{"dicoId":1655,"dicoCountryid":"TT","dicoAreacode":0,"dicoLocationcode":1868,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"特立尼达和多巴哥","dicoDescription":"","dicoIsdel":1},{"dicoId":1663,"dicoCountryid":"TV","dicoAreacode":0,"dicoLocationcode":688,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"zh-cn","dicoName":"图瓦卢","dicoDescription":"","dicoIsdel":1},{"dicoId":1671,"dicoCountryid":"TW","dicoAreacode":1,"dicoLocationcode":886,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"中国台湾","dicoDescription":"","dicoIsdel":1},{"dicoId":1679,"dicoCountryid":"TZ","dicoAreacode":0,"dicoLocationcode":255,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"坦桑尼亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1687,"dicoCountryid":"UA","dicoAreacode":3,"dicoLocationcode":380,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"乌克兰","dicoDescription":"","dicoIsdel":1},{"dicoId":1695,"dicoCountryid":"UG","dicoAreacode":0,"dicoLocationcode":256,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"乌干达","dicoDescription":"","dicoIsdel":1},{"dicoId":1711,"dicoCountryid":"UY","dicoAreacode":0,"dicoLocationcode":598,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"乌拉圭","dicoDescription":"","dicoIsdel":1},{"dicoId":1719,"dicoCountryid":"UZ","dicoAreacode":0,"dicoLocationcode":998,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"乌兹别克斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":1743,"dicoCountryid":"VE","dicoAreacode":0,"dicoLocationcode":58,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"委内瑞拉","dicoDescription":"","dicoIsdel":1},{"dicoId":1751,"dicoCountryid":"VG","dicoAreacode":0,"dicoLocationcode":1284,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"英属维尔京群岛","dicoDescription":"","dicoIsdel":1},{"dicoId":1767,"dicoCountryid":"VN","dicoAreacode":0,"dicoLocationcode":84,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"越南","dicoDescription":"","dicoIsdel":1},{"dicoId":1775,"dicoCountryid":"VU","dicoAreacode":0,"dicoLocationcode":678,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"zh-cn","dicoName":"瓦努阿图","dicoDescription":"","dicoIsdel":1},{"dicoId":1783,"dicoCountryid":"WF","dicoAreacode":0,"dicoLocationcode":681,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"瓦利斯和富图纳群岛","dicoDescription":"","dicoIsdel":1},{"dicoId":1799,"dicoCountryid":"YE","dicoAreacode":0,"dicoLocationcode":967,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"也门","dicoDescription":"","dicoIsdel":1},{"dicoId":1815,"dicoCountryid":"ZM","dicoAreacode":0,"dicoLocationcode":260,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"赞比亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1831,"dicoCountryid":"ZXA","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"泽西岛","dicoDescription":"","dicoIsdel":1}],"H-M":[{"dicoId":63,"dicoCountryid":"AN","dicoAreacode":0,"dicoLocationcode":599,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"荷属安的列斯库拉索岛","dicoDescription":"","dicoIsdel":1},{"dicoId":95,"dicoCountryid":"AS","dicoAreacode":0,"dicoLocationcode":684,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"美属萨摩亚","dicoDescription":"","dicoIsdel":1},{"dicoId":151,"dicoCountryid":"BD","dicoAreacode":0,"dicoLocationcode":880,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"孟加拉国","dicoDescription":"","dicoIsdel":1},{"dicoId":279,"dicoCountryid":"CA","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"加拿大","dicoDescription":"","dicoIsdel":1},{"dicoId":319,"dicoCountryid":"CI","dicoAreacode":0,"dicoLocationcode":225,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"科特迪瓦","dicoDescription":"","dicoIsdel":1},{"dicoId":327,"dicoCountryid":"CK","dicoAreacode":0,"dicoLocationcode":682,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"库克群岛","dicoDescription":"","dicoIsdel":1},{"dicoId":343,"dicoCountryid":"CM","dicoAreacode":0,"dicoLocationcode":237,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"喀麦隆","dicoDescription":"","dicoIsdel":1},{"dicoId":399,"dicoCountryid":"CZ","dicoAreacode":3,"dicoLocationcode":420,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"捷克","dicoDescription":"","dicoIsdel":1},{"dicoId":415,"dicoCountryid":"DJ","dicoAreacode":0,"dicoLocationcode":253,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"吉布提","dicoDescription":"","dicoIsdel":1},{"dicoId":535,"dicoCountryid":"FM","dicoAreacode":0,"dicoLocationcode":691,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"zh-cn","dicoName":"密克罗尼西亚","dicoDescription":"","dicoIsdel":1},{"dicoId":559,"dicoCountryid":"GA","dicoAreacode":0,"dicoLocationcode":241,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"加蓬","dicoDescription":"","dicoIsdel":1},{"dicoId":615,"dicoCountryid":"GH","dicoAreacode":0,"dicoLocationcode":233,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"加纳","dicoDescription":"","dicoIsdel":1},{"dicoId":647,"dicoCountryid":"GN","dicoAreacode":0,"dicoLocationcode":224,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"几内亚","dicoDescription":"","dicoIsdel":1},{"dicoId":695,"dicoCountryid":"GW","dicoAreacode":0,"dicoLocationcode":245,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"几内亚比绍","dicoDescription":"","dicoIsdel":1},{"dicoId":719,"dicoCountryid":"HN","dicoAreacode":0,"dicoLocationcode":504,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"洪都拉斯","dicoDescription":"","dicoIsdel":1},{"dicoId":727,"dicoCountryid":"HR","dicoAreacode":3,"dicoLocationcode":385,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"克罗地亚","dicoDescription":"","dicoIsdel":1},{"dicoId":735,"dicoCountryid":"HT","dicoAreacode":0,"dicoLocationcode":509,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"海地","dicoDescription":"","dicoIsdel":1},{"dicoId":775,"dicoCountryid":"IM","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"马恩岛","dicoDescription":"","dicoIsdel":1},{"dicoId":847,"dicoCountryid":"KE","dicoAreacode":0,"dicoLocationcode":254,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"肯尼亚","dicoDescription":"","dicoIsdel":1},{"dicoId":855,"dicoCountryid":"KG","dicoAreacode":0,"dicoLocationcode":996,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"吉尔吉斯斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":863,"dicoCountryid":"KH","dicoAreacode":0,"dicoLocationcode":855,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"柬埔寨","dicoDescription":"","dicoIsdel":1},{"dicoId":871,"dicoCountryid":"KI","dicoAreacode":0,"dicoLocationcode":686,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"基里巴斯","dicoDescription":"","dicoIsdel":1},{"dicoId":879,"dicoCountryid":"KM","dicoAreacode":0,"dicoLocationcode":269,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"科摩罗","dicoDescription":"","dicoIsdel":1},{"dicoId":903,"dicoCountryid":"KR","dicoAreacode":2,"dicoLocationcode":82,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"zh-cn","dicoName":"韩国","dicoDescription":"","dicoIsdel":1},{"dicoId":911,"dicoCountryid":"KW","dicoAreacode":0,"dicoLocationcode":965,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"科威特","dicoDescription":"","dicoIsdel":1},{"dicoId":919,"dicoCountryid":"KY","dicoAreacode":0,"dicoLocationcode":1345,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"开曼群岛","dicoDescription":"","dicoIsdel":1},{"dicoId":927,"dicoCountryid":"KZ","dicoAreacode":0,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"哈萨克斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":935,"dicoCountryid":"LA","dicoAreacode":0,"dicoLocationcode":856,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"老挝","dicoDescription":"","dicoIsdel":1},{"dicoId":943,"dicoCountryid":"LB","dicoAreacode":0,"dicoLocationcode":961,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"黎巴嫩","dicoDescription":"","dicoIsdel":1},{"dicoId":959,"dicoCountryid":"LI","dicoAreacode":3,"dicoLocationcode":423,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"列支敦士登","dicoDescription":"","dicoIsdel":1},{"dicoId":975,"dicoCountryid":"LR","dicoAreacode":0,"dicoLocationcode":231,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"利比里亚","dicoDescription":"","dicoIsdel":1},{"dicoId":983,"dicoCountryid":"LS","dicoAreacode":0,"dicoLocationcode":266,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"莱索托","dicoDescription":"","dicoIsdel":1},{"dicoId":991,"dicoCountryid":"LT","dicoAreacode":3,"dicoLocationcode":370,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"立陶宛","dicoDescription":"","dicoIsdel":1},{"dicoId":999,"dicoCountryid":"LU","dicoAreacode":3,"dicoLocationcode":352,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"卢森堡","dicoDescription":"","dicoIsdel":1},{"dicoId":1007,"dicoCountryid":"LV","dicoAreacode":3,"dicoLocationcode":371,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"拉脱维亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1015,"dicoCountryid":"LY","dicoAreacode":0,"dicoLocationcode":218,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"利比亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1023,"dicoCountryid":"MA","dicoAreacode":0,"dicoLocationcode":212,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"摩洛哥","dicoDescription":"","dicoIsdel":1},{"dicoId":1031,"dicoCountryid":"MC","dicoAreacode":3,"dicoLocationcode":377,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"摩纳哥","dicoDescription":"","dicoIsdel":1},{"dicoId":1039,"dicoCountryid":"MD","dicoAreacode":3,"dicoLocationcode":373,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"摩尔多瓦","dicoDescription":"","dicoIsdel":1},{"dicoId":1047,"dicoCountryid":"ME","dicoAreacode":3,"dicoLocationcode":382,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"黑山","dicoDescription":"","dicoIsdel":1},{"dicoId":1055,"dicoCountryid":"MG","dicoAreacode":0,"dicoLocationcode":261,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"马达加斯加","dicoDescription":"","dicoIsdel":1},{"dicoId":1063,"dicoCountryid":"MH","dicoAreacode":0,"dicoLocationcode":692,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"zh-cn","dicoName":"马绍尔群岛","dicoDescription":"","dicoIsdel":1},{"dicoId":1071,"dicoCountryid":"MK","dicoAreacode":3,"dicoLocationcode":389,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"马其顿","dicoDescription":"","dicoIsdel":1},{"dicoId":1079,"dicoCountryid":"ML","dicoAreacode":0,"dicoLocationcode":223,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"马里","dicoDescription":"","dicoIsdel":1},{"dicoId":1087,"dicoCountryid":"MM","dicoAreacode":0,"dicoLocationcode":95,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"缅甸","dicoDescription":"","dicoIsdel":1},{"dicoId":1095,"dicoCountryid":"MN","dicoAreacode":0,"dicoLocationcode":976,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"蒙古","dicoDescription":"","dicoIsdel":1},{"dicoId":1111,"dicoCountryid":"MQ","dicoAreacode":0,"dicoLocationcode":596,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"马提尼克","dicoDescription":"","dicoIsdel":1},{"dicoId":1119,"dicoCountryid":"MR","dicoAreacode":0,"dicoLocationcode":222,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"毛里塔尼亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1127,"dicoCountryid":"MS","dicoAreacode":0,"dicoLocationcode":1664,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"蒙特塞拉特","dicoDescription":"","dicoIsdel":1},{"dicoId":1135,"dicoCountryid":"MT","dicoAreacode":3,"dicoLocationcode":356,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"马耳他","dicoDescription":"","dicoIsdel":1},{"dicoId":1143,"dicoCountryid":"MU","dicoAreacode":0,"dicoLocationcode":230,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"毛里求斯","dicoDescription":"","dicoIsdel":1},{"dicoId":1151,"dicoCountryid":"MV","dicoAreacode":0,"dicoLocationcode":960,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"马尔代夫","dicoDescription":"","dicoIsdel":1},{"dicoId":1159,"dicoCountryid":"MW","dicoAreacode":0,"dicoLocationcode":265,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"马拉维","dicoDescription":"","dicoIsdel":1},{"dicoId":1167,"dicoCountryid":"MX","dicoAreacode":0,"dicoLocationcode":52,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"墨西哥","dicoDescription":"","dicoIsdel":1},{"dicoId":1175,"dicoCountryid":"MY","dicoAreacode":0,"dicoLocationcode":60,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"马来西亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1183,"dicoCountryid":"MZ","dicoAreacode":0,"dicoLocationcode":258,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"莫桑比克","dicoDescription":"","dicoIsdel":1},{"dicoId":1231,"dicoCountryid":"NL","dicoAreacode":3,"dicoLocationcode":31,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"荷兰","dicoDescription":"","dicoIsdel":1},{"dicoId":1295,"dicoCountryid":"PE","dicoAreacode":0,"dicoLocationcode":51,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"秘鲁","dicoDescription":"","dicoIsdel":1},{"dicoId":1375,"dicoCountryid":"QA","dicoAreacode":0,"dicoLocationcode":974,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"卡塔尔","dicoDescription":"","dicoIsdel":1},{"dicoId":1383,"dicoCountryid":"RE","dicoAreacode":0,"dicoLocationcode":262,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"留尼汪岛","dicoDescription":"","dicoIsdel":1},{"dicoId":1391,"dicoCountryid":"RO","dicoAreacode":3,"dicoLocationcode":40,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"罗马尼亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1415,"dicoCountryid":"RW","dicoAreacode":0,"dicoLocationcode":250,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"卢旺达","dicoDescription":"","dicoIsdel":1},{"dicoId":1703,"dicoCountryid":"US","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"美国","dicoDescription":"","dicoIsdel":1},{"dicoId":1759,"dicoCountryid":"VI","dicoAreacode":0,"dicoLocationcode":1340,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"美属维尔京群岛","dicoDescription":"","dicoIsdel":1},{"dicoId":1823,"dicoCountryid":"ZW","dicoAreacode":0,"dicoLocationcode":263,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"津巴布韦","dicoDescription":"","dicoIsdel":1}],"A-G":[{"dicoId":7,"dicoCountryid":"AD","dicoAreacode":3,"dicoLocationcode":376,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"安道尔","dicoDescription":"","dicoIsdel":1},{"dicoId":15,"dicoCountryid":"AE","dicoAreacode":0,"dicoLocationcode":971,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"阿联酋","dicoDescription":"","dicoIsdel":1},{"dicoId":23,"dicoCountryid":"AF","dicoAreacode":0,"dicoLocationcode":93,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"阿富汗","dicoDescription":"","dicoIsdel":1},{"dicoId":31,"dicoCountryid":"AG","dicoAreacode":0,"dicoLocationcode":1268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"安提瓜和巴布达","dicoDescription":"","dicoIsdel":1},{"dicoId":39,"dicoCountryid":"AI","dicoAreacode":0,"dicoLocationcode":1264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"安圭拉","dicoDescription":"","dicoIsdel":1},{"dicoId":47,"dicoCountryid":"AL","dicoAreacode":3,"dicoLocationcode":355,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"阿尔巴尼亚","dicoDescription":"","dicoIsdel":1},{"dicoId":71,"dicoCountryid":"AO","dicoAreacode":0,"dicoLocationcode":244,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"安哥拉","dicoDescription":"","dicoIsdel":1},{"dicoId":87,"dicoCountryid":"AR","dicoAreacode":0,"dicoLocationcode":54,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"阿根廷","dicoDescription":"","dicoIsdel":1},{"dicoId":103,"dicoCountryid":"AT","dicoAreacode":3,"dicoLocationcode":43,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"奥地利","dicoDescription":"","dicoIsdel":1},{"dicoId":111,"dicoCountryid":"AU","dicoAreacode":0,"dicoLocationcode":61,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"zh-cn","dicoName":"澳大利亚","dicoDescription":"","dicoIsdel":1},{"dicoId":119,"dicoCountryid":"AW","dicoAreacode":0,"dicoLocationcode":297,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"阿鲁巴","dicoDescription":"","dicoIsdel":1},{"dicoId":127,"dicoCountryid":"AZ","dicoAreacode":0,"dicoLocationcode":994,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"阿塞拜疆","dicoDescription":"","dicoIsdel":1},{"dicoId":135,"dicoCountryid":"BA","dicoAreacode":3,"dicoLocationcode":387,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"波黑","dicoDescription":"","dicoIsdel":1},{"dicoId":143,"dicoCountryid":"BB","dicoAreacode":0,"dicoLocationcode":1246,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"巴巴多斯","dicoDescription":"","dicoIsdel":1},{"dicoId":159,"dicoCountryid":"BE","dicoAreacode":3,"dicoLocationcode":32,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"比利时","dicoDescription":"","dicoIsdel":1},{"dicoId":167,"dicoCountryid":"BF","dicoAreacode":0,"dicoLocationcode":226,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"布基纳法索","dicoDescription":"","dicoIsdel":1},{"dicoId":175,"dicoCountryid":"BG","dicoAreacode":3,"dicoLocationcode":359,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"保加利亚","dicoDescription":"","dicoIsdel":1},{"dicoId":183,"dicoCountryid":"BH","dicoAreacode":0,"dicoLocationcode":973,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"巴林","dicoDescription":"","dicoIsdel":1},{"dicoId":191,"dicoCountryid":"BI","dicoAreacode":0,"dicoLocationcode":257,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"布隆迪","dicoDescription":"","dicoIsdel":1},{"dicoId":199,"dicoCountryid":"BJ","dicoAreacode":0,"dicoLocationcode":229,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"贝宁","dicoDescription":"","dicoIsdel":1},{"dicoId":207,"dicoCountryid":"BM","dicoAreacode":0,"dicoLocationcode":1441,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"百慕大","dicoDescription":"","dicoIsdel":1},{"dicoId":223,"dicoCountryid":"BO","dicoAreacode":0,"dicoLocationcode":591,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"玻利维亚","dicoDescription":"","dicoIsdel":1},{"dicoId":231,"dicoCountryid":"BR","dicoAreacode":0,"dicoLocationcode":55,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"巴西","dicoDescription":"","dicoIsdel":1},{"dicoId":239,"dicoCountryid":"BS","dicoAreacode":0,"dicoLocationcode":1242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"巴哈马","dicoDescription":"","dicoIsdel":1},{"dicoId":247,"dicoCountryid":"BT","dicoAreacode":0,"dicoLocationcode":975,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"不丹","dicoDescription":"","dicoIsdel":1},{"dicoId":255,"dicoCountryid":"BW","dicoAreacode":0,"dicoLocationcode":267,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"博茨瓦纳","dicoDescription":"","dicoIsdel":1},{"dicoId":263,"dicoCountryid":"BY","dicoAreacode":3,"dicoLocationcode":375,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"白俄罗斯","dicoDescription":"","dicoIsdel":1},{"dicoId":271,"dicoCountryid":"BZ","dicoAreacode":0,"dicoLocationcode":501,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"伯利兹","dicoDescription":"","dicoIsdel":1},{"dicoId":295,"dicoCountryid":"CG","dicoAreacode":0,"dicoLocationcode":243,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"刚果民主共和国","dicoDescription":"","dicoIsdel":1},{"dicoId":303,"dicoCountryid":"CGB","dicoAreacode":0,"dicoLocationcode":242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"刚果(布)","dicoDescription":"","dicoIsdel":1},{"dicoId":359,"dicoCountryid":"CO","dicoAreacode":0,"dicoLocationcode":57,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"哥伦比亚","dicoDescription":"","dicoIsdel":1},{"dicoId":367,"dicoCountryid":"CR","dicoAreacode":0,"dicoLocationcode":506,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"哥斯达黎加","dicoDescription":"","dicoIsdel":1},{"dicoId":375,"dicoCountryid":"CU","dicoAreacode":0,"dicoLocationcode":53,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"古巴","dicoDescription":"","dicoIsdel":1},{"dicoId":383,"dicoCountryid":"CV","dicoAreacode":0,"dicoLocationcode":238,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"佛得角","dicoDescription":"","dicoIsdel":1},{"dicoId":407,"dicoCountryid":"DE","dicoAreacode":3,"dicoLocationcode":49,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"德国","dicoDescription":"","dicoIsdel":1},{"dicoId":423,"dicoCountryid":"DK","dicoAreacode":3,"dicoLocationcode":45,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"丹麦","dicoDescription":"","dicoIsdel":1},{"dicoId":431,"dicoCountryid":"DM","dicoAreacode":0,"dicoLocationcode":1767,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"多米尼克","dicoDescription":"","dicoIsdel":1},{"dicoId":439,"dicoCountryid":"DO","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"多米尼加共和国","dicoDescription":"","dicoIsdel":1},{"dicoId":447,"dicoCountryid":"DZ","dicoAreacode":0,"dicoLocationcode":213,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"阿尔及利亚","dicoDescription":"","dicoIsdel":1},{"dicoId":455,"dicoCountryid":"EC","dicoAreacode":0,"dicoLocationcode":593,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"厄瓜多尔","dicoDescription":"","dicoIsdel":1},{"dicoId":463,"dicoCountryid":"EE","dicoAreacode":3,"dicoLocationcode":372,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"爱沙尼亚","dicoDescription":"","dicoIsdel":1},{"dicoId":471,"dicoCountryid":"EG","dicoAreacode":0,"dicoLocationcode":20,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"埃及","dicoDescription":"","dicoIsdel":1},{"dicoId":487,"dicoCountryid":"ER","dicoAreacode":0,"dicoLocationcode":291,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"厄立特里亚","dicoDescription":"","dicoIsdel":1},{"dicoId":503,"dicoCountryid":"ET","dicoAreacode":0,"dicoLocationcode":251,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"埃塞俄比亚","dicoDescription":"","dicoIsdel":1},{"dicoId":511,"dicoCountryid":"FI","dicoAreacode":3,"dicoLocationcode":358,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"芬兰","dicoDescription":"","dicoIsdel":1},{"dicoId":519,"dicoCountryid":"FJ","dicoAreacode":0,"dicoLocationcode":679,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"zh-cn","dicoName":"斐济","dicoDescription":"","dicoIsdel":1},{"dicoId":527,"dicoCountryid":"FK","dicoAreacode":0,"dicoLocationcode":500,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"福克兰群岛","dicoDescription":"","dicoIsdel":1},{"dicoId":543,"dicoCountryid":"FO","dicoAreacode":3,"dicoLocationcode":298,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"法罗群岛","dicoDescription":"","dicoIsdel":1},{"dicoId":551,"dicoCountryid":"FR","dicoAreacode":3,"dicoLocationcode":33,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"法国","dicoDescription":"","dicoIsdel":1},{"dicoId":575,"dicoCountryid":"GCI","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"根西岛","dicoDescription":"","dicoIsdel":1},{"dicoId":583,"dicoCountryid":"GD","dicoAreacode":0,"dicoLocationcode":1473,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"格林纳达","dicoDescription":"","dicoIsdel":1},{"dicoId":591,"dicoCountryid":"GE","dicoAreacode":0,"dicoLocationcode":995,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"格鲁吉亚","dicoDescription":"","dicoIsdel":1},{"dicoId":599,"dicoCountryid":"GF","dicoAreacode":0,"dicoLocationcode":689,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"zh-cn","dicoName":"法属波利尼西亚","dicoDescription":"","dicoIsdel":1},{"dicoId":607,"dicoCountryid":"GFN","dicoAreacode":0,"dicoLocationcode":594,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"法属圭亚那","dicoDescription":"","dicoIsdel":1},{"dicoId":631,"dicoCountryid":"GL","dicoAreacode":0,"dicoLocationcode":299,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"格陵兰岛","dicoDescription":"","dicoIsdel":1},{"dicoId":639,"dicoCountryid":"GM","dicoAreacode":0,"dicoLocationcode":220,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"冈比亚","dicoDescription":"","dicoIsdel":1},{"dicoId":655,"dicoCountryid":"GP","dicoAreacode":0,"dicoLocationcode":590,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"瓜德罗普岛","dicoDescription":"","dicoIsdel":1},{"dicoId":663,"dicoCountryid":"GQ","dicoAreacode":0,"dicoLocationcode":240,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"赤道几内亚","dicoDescription":"","dicoIsdel":1},{"dicoId":687,"dicoCountryid":"GU","dicoAreacode":0,"dicoLocationcode":1671,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"关岛","dicoDescription":"","dicoIsdel":1},{"dicoId":703,"dicoCountryid":"GY","dicoAreacode":0,"dicoLocationcode":592,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"圭亚那","dicoDescription":"","dicoIsdel":1},{"dicoId":759,"dicoCountryid":"IE","dicoAreacode":3,"dicoLocationcode":353,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"爱尔兰","dicoDescription":"","dicoIsdel":1},{"dicoId":807,"dicoCountryid":"IS","dicoAreacode":3,"dicoLocationcode":354,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"冰岛","dicoDescription":"","dicoIsdel":1},{"dicoId":895,"dicoCountryid":"KP","dicoAreacode":0,"dicoLocationcode":850,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"zh-cn","dicoName":"朝鲜","dicoDescription":"","dicoIsdel":1},{"dicoId":1271,"dicoCountryid":"OM","dicoAreacode":0,"dicoLocationcode":968,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"阿曼","dicoDescription":"","dicoIsdel":1},{"dicoId":1279,"dicoCountryid":"PA","dicoAreacode":0,"dicoLocationcode":507,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"巴拿马","dicoDescription":"","dicoIsdel":1},{"dicoId":1303,"dicoCountryid":"PG","dicoAreacode":0,"dicoLocationcode":675,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"zh-cn","dicoName":"巴布亚新几内亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1311,"dicoCountryid":"PH","dicoAreacode":0,"dicoLocationcode":63,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"菲律宾","dicoDescription":"","dicoIsdel":1},{"dicoId":1319,"dicoCountryid":"PK","dicoAreacode":0,"dicoLocationcode":92,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"巴基斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":1327,"dicoCountryid":"PL","dicoAreacode":3,"dicoLocationcode":48,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"波兰","dicoDescription":"","dicoIsdel":1},{"dicoId":1335,"dicoCountryid":"PR","dicoAreacode":0,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"波多黎各","dicoDescription":"","dicoIsdel":1},{"dicoId":1343,"dicoCountryid":"PS","dicoAreacode":0,"dicoLocationcode":970,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"巴勒斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":1367,"dicoCountryid":"PY","dicoAreacode":0,"dicoLocationcode":595,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"巴拉圭","dicoDescription":"","dicoIsdel":1},{"dicoId":1407,"dicoCountryid":"RU","dicoAreacode":3,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"俄罗斯","dicoDescription":"","dicoIsdel":1},{"dicoId":1479,"dicoCountryid":"SIA","dicoAreacode":0,"dicoLocationcode":809,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"zh-cn","dicoName":"法属西印度群岛","dicoDescription":"","dicoIsdel":1},{"dicoId":1591,"dicoCountryid":"TG","dicoAreacode":0,"dicoLocationcode":228,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"多哥","dicoDescription":"","dicoIsdel":1},{"dicoId":1623,"dicoCountryid":"TL","dicoAreacode":0,"dicoLocationcode":670,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"东帝汶","dicoDescription":"","dicoIsdel":1},{"dicoId":1727,"dicoCountryid":"VA","dicoAreacode":3,"dicoLocationcode":379,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"梵蒂冈","dicoDescription":"","dicoIsdel":1}],"N-S":[{"dicoId":79,"dicoCountryid":"AQ","dicoAreacode":0,"dicoLocationcode":672,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"zh-cn","dicoName":"南极洲","dicoDescription":"","dicoIsdel":1},{"dicoId":311,"dicoCountryid":"CH","dicoAreacode":3,"dicoLocationcode":41,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"瑞士","dicoDescription":"","dicoIsdel":1},{"dicoId":391,"dicoCountryid":"CY","dicoAreacode":3,"dicoLocationcode":357,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"塞浦路斯","dicoDescription":"","dicoIsdel":1},{"dicoId":839,"dicoCountryid":"JP","dicoAreacode":2,"dicoLocationcode":81,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"zh-cn","dicoName":"日本","dicoDescription":"","dicoIsdel":1},{"dicoId":887,"dicoCountryid":"KNA","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"圣基茨和尼维斯","dicoDescription":"","dicoIsdel":1},{"dicoId":951,"dicoCountryid":"LC","dicoAreacode":0,"dicoLocationcode":1758,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"圣卢西亚","dicoDescription":"","dicoIsdel":1},{"dicoId":967,"dicoCountryid":"LK","dicoAreacode":0,"dicoLocationcode":94,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"斯里兰卡","dicoDescription":"","dicoIsdel":1},{"dicoId":1191,"dicoCountryid":"NA","dicoAreacode":0,"dicoLocationcode":264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"纳米比亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1207,"dicoCountryid":"NE","dicoAreacode":0,"dicoLocationcode":227,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"尼日尔","dicoDescription":"","dicoIsdel":1},{"dicoId":1215,"dicoCountryid":"NG","dicoAreacode":0,"dicoLocationcode":234,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"尼日利亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1223,"dicoCountryid":"NI","dicoAreacode":0,"dicoLocationcode":505,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"尼加拉瓜","dicoDescription":"","dicoIsdel":1},{"dicoId":1239,"dicoCountryid":"NO","dicoAreacode":3,"dicoLocationcode":47,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"挪威","dicoDescription":"","dicoIsdel":1},{"dicoId":1247,"dicoCountryid":"NP","dicoAreacode":0,"dicoLocationcode":977,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"尼泊尔","dicoDescription":"","dicoIsdel":1},{"dicoId":1255,"dicoCountryid":"NR","dicoAreacode":0,"dicoLocationcode":674,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"zh-cn","dicoName":"瑙鲁","dicoDescription":"","dicoIsdel":1},{"dicoId":1287,"dicoCountryid":"PC","dicoAreacode":0,"dicoLocationcode":870,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"皮特凯恩群岛","dicoDescription":"","dicoIsdel":1},{"dicoId":1351,"dicoCountryid":"PT","dicoAreacode":3,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"葡萄牙","dicoDescription":"","dicoIsdel":1},{"dicoId":1359,"dicoCountryid":"PW","dicoAreacode":0,"dicoLocationcode":97,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"帕劳","dicoDescription":"","dicoIsdel":1},{"dicoId":1399,"dicoCountryid":"RS","dicoAreacode":3,"dicoLocationcode":381,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"塞尔维亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1423,"dicoCountryid":"SA","dicoAreacode":0,"dicoLocationcode":966,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"沙特","dicoDescription":"","dicoIsdel":1},{"dicoId":1431,"dicoCountryid":"SB","dicoAreacode":0,"dicoLocationcode":677,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"zh-cn","dicoName":"所罗门群岛","dicoDescription":"","dicoIsdel":1},{"dicoId":1439,"dicoCountryid":"SC","dicoAreacode":0,"dicoLocationcode":248,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"塞舌尔","dicoDescription":"","dicoIsdel":1},{"dicoId":1447,"dicoCountryid":"SD","dicoAreacode":0,"dicoLocationcode":249,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"苏丹","dicoDescription":"","dicoIsdel":1},{"dicoId":1455,"dicoCountryid":"SE","dicoAreacode":3,"dicoLocationcode":46,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"瑞典","dicoDescription":"","dicoIsdel":1},{"dicoId":1471,"dicoCountryid":"SI","dicoAreacode":3,"dicoLocationcode":386,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"斯洛文尼亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1487,"dicoCountryid":"SK","dicoAreacode":3,"dicoLocationcode":421,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"斯洛伐克","dicoDescription":"","dicoIsdel":1},{"dicoId":1495,"dicoCountryid":"SL","dicoAreacode":0,"dicoLocationcode":232,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"塞拉利昂","dicoDescription":"","dicoIsdel":1},{"dicoId":1503,"dicoCountryid":"SM","dicoAreacode":3,"dicoLocationcode":378,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"圣马力诺","dicoDescription":"","dicoIsdel":1},{"dicoId":1511,"dicoCountryid":"SN","dicoAreacode":0,"dicoLocationcode":221,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"塞内加尔","dicoDescription":"","dicoIsdel":1},{"dicoId":1519,"dicoCountryid":"SO","dicoAreacode":0,"dicoLocationcode":252,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"索马里","dicoDescription":"","dicoIsdel":1},{"dicoId":1527,"dicoCountryid":"SR","dicoAreacode":0,"dicoLocationcode":597,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"苏里南","dicoDescription":"","dicoIsdel":1},{"dicoId":1535,"dicoCountryid":"SSD","dicoAreacode":0,"dicoLocationcode":211,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"南苏丹","dicoDescription":"","dicoIsdel":1},{"dicoId":1543,"dicoCountryid":"ST","dicoAreacode":0,"dicoLocationcode":239,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"圣多美和普林西比","dicoDescription":"","dicoIsdel":1},{"dicoId":1551,"dicoCountryid":"SV","dicoAreacode":0,"dicoLocationcode":503,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"萨尔瓦多","dicoDescription":"","dicoIsdel":1},{"dicoId":1567,"dicoCountryid":"SZ","dicoAreacode":0,"dicoLocationcode":268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"斯威士兰","dicoDescription":"","dicoIsdel":1},{"dicoId":1735,"dicoCountryid":"VCT","dicoAreacode":0,"dicoLocationcode":784,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"圣文森特和格林纳丁斯","dicoDescription":"","dicoIsdel":1},{"dicoId":1791,"dicoCountryid":"WS","dicoAreacode":0,"dicoLocationcode":685,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"萨摩亚","dicoDescription":"","dicoIsdel":1},{"dicoId":1807,"dicoCountryid":"ZA","dicoAreacode":0,"dicoLocationcode":27,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-cn","dicoName":"南非","dicoDescription":"","dicoIsdel":1}]};
        var platformENCountryGroupMap={"T-Z":[{"dicoId":10,"dicoCountryid":"AE","dicoAreacode":0,"dicoLocationcode":971,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"United Arab Emirates","dicoDescription":"","dicoIsdel":1},{"dicoId":474,"dicoCountryid":"EH","dicoAreacode":0,"dicoLocationcode":0,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Western Sahara","dicoDescription":"","dicoIsdel":1},{"dicoId":562,"dicoCountryid":"GB","dicoAreacode":3,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"United Kingdom","dicoDescription":"","dicoIsdel":1},{"dicoId":1570,"dicoCountryid":"TC","dicoAreacode":0,"dicoLocationcode":1649,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Turks and Caicos Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":1586,"dicoCountryid":"TG","dicoAreacode":0,"dicoLocationcode":228,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Togo","dicoDescription":"","dicoIsdel":1},{"dicoId":1594,"dicoCountryid":"TH","dicoAreacode":0,"dicoLocationcode":66,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Thailand","dicoDescription":"","dicoIsdel":1},{"dicoId":1602,"dicoCountryid":"TJ","dicoAreacode":0,"dicoLocationcode":992,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Tajikistan","dicoDescription":"","dicoIsdel":1},{"dicoId":1610,"dicoCountryid":"TK","dicoAreacode":0,"dicoLocationcode":993,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Turkmenistan","dicoDescription":"","dicoIsdel":1},{"dicoId":1626,"dicoCountryid":"TN","dicoAreacode":0,"dicoLocationcode":216,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Tunisia","dicoDescription":"","dicoIsdel":1},{"dicoId":1634,"dicoCountryid":"TO","dicoAreacode":0,"dicoLocationcode":676,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"en-us","dicoName":"Tonga","dicoDescription":"","dicoIsdel":1},{"dicoId":1642,"dicoCountryid":"TR","dicoAreacode":0,"dicoLocationcode":90,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Turkey","dicoDescription":"","dicoIsdel":1},{"dicoId":1650,"dicoCountryid":"TT","dicoAreacode":0,"dicoLocationcode":1868,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Trinidad and Tobago","dicoDescription":"","dicoIsdel":1},{"dicoId":1658,"dicoCountryid":"TV","dicoAreacode":0,"dicoLocationcode":688,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"en-us","dicoName":"Tuvalu","dicoDescription":"","dicoIsdel":1},{"dicoId":1666,"dicoCountryid":"TW","dicoAreacode":1,"dicoLocationcode":886,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Taiwan(China)","dicoDescription":"","dicoIsdel":1},{"dicoId":1674,"dicoCountryid":"TZ","dicoAreacode":0,"dicoLocationcode":255,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Tanzania","dicoDescription":"","dicoIsdel":1},{"dicoId":1682,"dicoCountryid":"UA","dicoAreacode":3,"dicoLocationcode":380,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Ukraine","dicoDescription":"","dicoIsdel":1},{"dicoId":1690,"dicoCountryid":"UG","dicoAreacode":0,"dicoLocationcode":256,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Uganda","dicoDescription":"","dicoIsdel":1},{"dicoId":1698,"dicoCountryid":"US","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"United States","dicoDescription":"","dicoIsdel":1},{"dicoId":1706,"dicoCountryid":"UY","dicoAreacode":0,"dicoLocationcode":598,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Uruguay","dicoDescription":"","dicoIsdel":1},{"dicoId":1714,"dicoCountryid":"UZ","dicoAreacode":0,"dicoLocationcode":998,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Uzbekistan","dicoDescription":"","dicoIsdel":1},{"dicoId":1738,"dicoCountryid":"VE","dicoAreacode":0,"dicoLocationcode":58,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Venezuela","dicoDescription":"","dicoIsdel":1},{"dicoId":1746,"dicoCountryid":"VG","dicoAreacode":0,"dicoLocationcode":1284,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Virgin Islands (British)","dicoDescription":"","dicoIsdel":1},{"dicoId":1754,"dicoCountryid":"VI","dicoAreacode":0,"dicoLocationcode":1340,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Virgin Islands (US)","dicoDescription":"","dicoIsdel":1},{"dicoId":1762,"dicoCountryid":"VN","dicoAreacode":0,"dicoLocationcode":84,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Vietnam","dicoDescription":"","dicoIsdel":1},{"dicoId":1770,"dicoCountryid":"VU","dicoAreacode":0,"dicoLocationcode":678,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"en-us","dicoName":"Vanuatu","dicoDescription":"","dicoIsdel":1},{"dicoId":1778,"dicoCountryid":"WF","dicoAreacode":0,"dicoLocationcode":681,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Wallis and Futuna","dicoDescription":"","dicoIsdel":1},{"dicoId":1794,"dicoCountryid":"YE","dicoAreacode":0,"dicoLocationcode":967,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Yemen","dicoDescription":"","dicoIsdel":1},{"dicoId":1810,"dicoCountryid":"ZM","dicoAreacode":0,"dicoLocationcode":260,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Zambia","dicoDescription":"","dicoIsdel":1},{"dicoId":1818,"dicoCountryid":"ZW","dicoAreacode":0,"dicoLocationcode":263,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Zimbabwe","dicoDescription":"","dicoIsdel":1}],"H-M":[{"dicoId":530,"dicoCountryid":"FM","dicoAreacode":0,"dicoLocationcode":691,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"en-us","dicoName":"Micronesia","dicoDescription":"","dicoIsdel":1},{"dicoId":706,"dicoCountryid":"HK","dicoAreacode":1,"dicoLocationcode":852,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Hongkong(China)","dicoDescription":"","dicoIsdel":1},{"dicoId":714,"dicoCountryid":"HN","dicoAreacode":0,"dicoLocationcode":504,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Honduras","dicoDescription":"","dicoIsdel":1},{"dicoId":730,"dicoCountryid":"HT","dicoAreacode":0,"dicoLocationcode":509,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Haiti","dicoDescription":"","dicoIsdel":1},{"dicoId":738,"dicoCountryid":"HU","dicoAreacode":3,"dicoLocationcode":36,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Hungary","dicoDescription":"","dicoIsdel":1},{"dicoId":818,"dicoCountryid":"JM","dicoAreacode":0,"dicoLocationcode":1876,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Jamaica","dicoDescription":"","dicoIsdel":1},{"dicoId":826,"dicoCountryid":"JO","dicoAreacode":0,"dicoLocationcode":962,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Jordan","dicoDescription":"","dicoIsdel":1},{"dicoId":834,"dicoCountryid":"JP","dicoAreacode":2,"dicoLocationcode":81,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"en-us","dicoName":"Japan","dicoDescription":"","dicoIsdel":1},{"dicoId":842,"dicoCountryid":"KE","dicoAreacode":0,"dicoLocationcode":254,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Kenya","dicoDescription":"","dicoIsdel":1},{"dicoId":850,"dicoCountryid":"KG","dicoAreacode":0,"dicoLocationcode":996,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Kyrgyzstan","dicoDescription":"","dicoIsdel":1},{"dicoId":866,"dicoCountryid":"KI","dicoAreacode":0,"dicoLocationcode":686,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Kiribati","dicoDescription":"","dicoIsdel":1},{"dicoId":906,"dicoCountryid":"KW","dicoAreacode":0,"dicoLocationcode":965,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Kuwait","dicoDescription":"","dicoIsdel":1},{"dicoId":922,"dicoCountryid":"KZ","dicoAreacode":0,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Kazakhstan","dicoDescription":"","dicoIsdel":1},{"dicoId":930,"dicoCountryid":"LA","dicoAreacode":0,"dicoLocationcode":856,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Laos","dicoDescription":"","dicoIsdel":1},{"dicoId":938,"dicoCountryid":"LB","dicoAreacode":0,"dicoLocationcode":961,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Lebanon","dicoDescription":"","dicoIsdel":1},{"dicoId":954,"dicoCountryid":"LI","dicoAreacode":3,"dicoLocationcode":423,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Liechtenstein","dicoDescription":"","dicoIsdel":1},{"dicoId":970,"dicoCountryid":"LR","dicoAreacode":0,"dicoLocationcode":231,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Liberia","dicoDescription":"","dicoIsdel":1},{"dicoId":978,"dicoCountryid":"LS","dicoAreacode":0,"dicoLocationcode":266,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Lesotho","dicoDescription":"","dicoIsdel":1},{"dicoId":986,"dicoCountryid":"LT","dicoAreacode":3,"dicoLocationcode":370,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Lithuania","dicoDescription":"","dicoIsdel":1},{"dicoId":994,"dicoCountryid":"LU","dicoAreacode":3,"dicoLocationcode":352,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Luxembourg","dicoDescription":"","dicoIsdel":1},{"dicoId":1002,"dicoCountryid":"LV","dicoAreacode":3,"dicoLocationcode":371,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Latvia","dicoDescription":"","dicoIsdel":1},{"dicoId":1010,"dicoCountryid":"LY","dicoAreacode":0,"dicoLocationcode":218,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Libya","dicoDescription":"","dicoIsdel":1},{"dicoId":1018,"dicoCountryid":"MA","dicoAreacode":0,"dicoLocationcode":212,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Morocco","dicoDescription":"","dicoIsdel":1},{"dicoId":1026,"dicoCountryid":"MC","dicoAreacode":3,"dicoLocationcode":377,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Monaco","dicoDescription":"","dicoIsdel":1},{"dicoId":1034,"dicoCountryid":"MD","dicoAreacode":3,"dicoLocationcode":373,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Moldova","dicoDescription":"","dicoIsdel":1},{"dicoId":1042,"dicoCountryid":"ME","dicoAreacode":3,"dicoLocationcode":382,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Montenegro","dicoDescription":"","dicoIsdel":1},{"dicoId":1050,"dicoCountryid":"MG","dicoAreacode":0,"dicoLocationcode":261,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Madagascar","dicoDescription":"","dicoIsdel":1},{"dicoId":1058,"dicoCountryid":"MH","dicoAreacode":0,"dicoLocationcode":692,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"en-us","dicoName":"Marshall Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":1066,"dicoCountryid":"MK","dicoAreacode":3,"dicoLocationcode":389,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Macedonia (FYR)","dicoDescription":"","dicoIsdel":1},{"dicoId":1074,"dicoCountryid":"ML","dicoAreacode":0,"dicoLocationcode":223,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Mali","dicoDescription":"","dicoIsdel":1},{"dicoId":1082,"dicoCountryid":"MM","dicoAreacode":0,"dicoLocationcode":95,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Myanmar","dicoDescription":"","dicoIsdel":1},{"dicoId":1090,"dicoCountryid":"MN","dicoAreacode":0,"dicoLocationcode":976,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Mongolia","dicoDescription":"","dicoIsdel":1},{"dicoId":1098,"dicoCountryid":"MO","dicoAreacode":1,"dicoLocationcode":853,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Macau(China)","dicoDescription":"","dicoIsdel":1},{"dicoId":1106,"dicoCountryid":"MQ","dicoAreacode":0,"dicoLocationcode":596,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Martinique","dicoDescription":"","dicoIsdel":1},{"dicoId":1114,"dicoCountryid":"MR","dicoAreacode":0,"dicoLocationcode":222,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Mauritania","dicoDescription":"","dicoIsdel":1},{"dicoId":1122,"dicoCountryid":"MS","dicoAreacode":0,"dicoLocationcode":1664,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Montserrat","dicoDescription":"","dicoIsdel":1},{"dicoId":1130,"dicoCountryid":"MT","dicoAreacode":3,"dicoLocationcode":356,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Malta","dicoDescription":"","dicoIsdel":1},{"dicoId":1138,"dicoCountryid":"MU","dicoAreacode":0,"dicoLocationcode":230,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Mauritius","dicoDescription":"","dicoIsdel":1},{"dicoId":1146,"dicoCountryid":"MV","dicoAreacode":0,"dicoLocationcode":960,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Maldives","dicoDescription":"","dicoIsdel":1},{"dicoId":1154,"dicoCountryid":"MW","dicoAreacode":0,"dicoLocationcode":265,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Malawi","dicoDescription":"","dicoIsdel":1},{"dicoId":1162,"dicoCountryid":"MX","dicoAreacode":0,"dicoLocationcode":52,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Mexico","dicoDescription":"","dicoIsdel":1},{"dicoId":1170,"dicoCountryid":"MY","dicoAreacode":0,"dicoLocationcode":60,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Malaysia","dicoDescription":"","dicoIsdel":1},{"dicoId":1178,"dicoCountryid":"MZ","dicoAreacode":0,"dicoLocationcode":258,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Mozambique","dicoDescription":"","dicoIsdel":1},{"dicoId":1722,"dicoCountryid":"VA","dicoAreacode":3,"dicoLocationcode":379,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Holy See (Vatican City)","dicoDescription":"","dicoIsdel":1},{"dicoId":1826,"dicoCountryid":"ZXA","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Jersey","dicoDescription":"","dicoIsdel":1}],"A-G":[{"dicoId":2,"dicoCountryid":"AD","dicoAreacode":3,"dicoLocationcode":376,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Andorra","dicoDescription":"","dicoIsdel":1},{"dicoId":18,"dicoCountryid":"AF","dicoAreacode":0,"dicoLocationcode":93,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Afghanistan","dicoDescription":"","dicoIsdel":1},{"dicoId":26,"dicoCountryid":"AG","dicoAreacode":0,"dicoLocationcode":1268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Antigua and Barbuda","dicoDescription":"","dicoIsdel":1},{"dicoId":34,"dicoCountryid":"AI","dicoAreacode":0,"dicoLocationcode":1264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Anguilla","dicoDescription":"","dicoIsdel":1},{"dicoId":42,"dicoCountryid":"AL","dicoAreacode":3,"dicoLocationcode":355,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Albania","dicoDescription":"","dicoIsdel":1},{"dicoId":50,"dicoCountryid":"AM","dicoAreacode":0,"dicoLocationcode":374,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Armenia","dicoDescription":"","dicoIsdel":1},{"dicoId":66,"dicoCountryid":"AO","dicoAreacode":0,"dicoLocationcode":244,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Angola","dicoDescription":"","dicoIsdel":1},{"dicoId":74,"dicoCountryid":"AQ","dicoAreacode":0,"dicoLocationcode":672,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"en-us","dicoName":"Antarctica","dicoDescription":"","dicoIsdel":1},{"dicoId":82,"dicoCountryid":"AR","dicoAreacode":0,"dicoLocationcode":54,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Argentina","dicoDescription":"","dicoIsdel":1},{"dicoId":90,"dicoCountryid":"AS","dicoAreacode":0,"dicoLocationcode":684,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"American Samoa","dicoDescription":"","dicoIsdel":1},{"dicoId":98,"dicoCountryid":"AT","dicoAreacode":3,"dicoLocationcode":43,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Austria","dicoDescription":"","dicoIsdel":1},{"dicoId":106,"dicoCountryid":"AU","dicoAreacode":0,"dicoLocationcode":61,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"en-us","dicoName":"Australia","dicoDescription":"","dicoIsdel":1},{"dicoId":114,"dicoCountryid":"AW","dicoAreacode":0,"dicoLocationcode":297,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Aruba","dicoDescription":"","dicoIsdel":1},{"dicoId":122,"dicoCountryid":"AZ","dicoAreacode":0,"dicoLocationcode":994,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Azerbaijan","dicoDescription":"","dicoIsdel":1},{"dicoId":130,"dicoCountryid":"BA","dicoAreacode":3,"dicoLocationcode":387,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Bosnia and Herzegovina","dicoDescription":"","dicoIsdel":1},{"dicoId":138,"dicoCountryid":"BB","dicoAreacode":0,"dicoLocationcode":1246,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Barbados","dicoDescription":"","dicoIsdel":1},{"dicoId":146,"dicoCountryid":"BD","dicoAreacode":0,"dicoLocationcode":880,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Bangladesh","dicoDescription":"","dicoIsdel":1},{"dicoId":154,"dicoCountryid":"BE","dicoAreacode":3,"dicoLocationcode":32,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Belgium","dicoDescription":"","dicoIsdel":1},{"dicoId":162,"dicoCountryid":"BF","dicoAreacode":0,"dicoLocationcode":226,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Burkina Faso","dicoDescription":"","dicoIsdel":1},{"dicoId":170,"dicoCountryid":"BG","dicoAreacode":3,"dicoLocationcode":359,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Bulgaria","dicoDescription":"","dicoIsdel":1},{"dicoId":178,"dicoCountryid":"BH","dicoAreacode":0,"dicoLocationcode":973,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Bahrain","dicoDescription":"","dicoIsdel":1},{"dicoId":186,"dicoCountryid":"BI","dicoAreacode":0,"dicoLocationcode":257,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Burundi","dicoDescription":"","dicoIsdel":1},{"dicoId":194,"dicoCountryid":"BJ","dicoAreacode":0,"dicoLocationcode":229,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Benin","dicoDescription":"","dicoIsdel":1},{"dicoId":202,"dicoCountryid":"BM","dicoAreacode":0,"dicoLocationcode":1441,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Bermuda","dicoDescription":"","dicoIsdel":1},{"dicoId":210,"dicoCountryid":"BN","dicoAreacode":0,"dicoLocationcode":673,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"en-us","dicoName":"Brunei","dicoDescription":"","dicoIsdel":1},{"dicoId":218,"dicoCountryid":"BO","dicoAreacode":0,"dicoLocationcode":591,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Bolivia","dicoDescription":"","dicoIsdel":1},{"dicoId":226,"dicoCountryid":"BR","dicoAreacode":0,"dicoLocationcode":55,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Brazil","dicoDescription":"","dicoIsdel":1},{"dicoId":234,"dicoCountryid":"BS","dicoAreacode":0,"dicoLocationcode":1242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Bahamas","dicoDescription":"","dicoIsdel":1},{"dicoId":242,"dicoCountryid":"BT","dicoAreacode":0,"dicoLocationcode":975,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Bhutan","dicoDescription":"","dicoIsdel":1},{"dicoId":250,"dicoCountryid":"BW","dicoAreacode":0,"dicoLocationcode":267,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Botswana","dicoDescription":"","dicoIsdel":1},{"dicoId":258,"dicoCountryid":"BY","dicoAreacode":3,"dicoLocationcode":375,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Belarus","dicoDescription":"","dicoIsdel":1},{"dicoId":266,"dicoCountryid":"BZ","dicoAreacode":0,"dicoLocationcode":501,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Belize","dicoDescription":"","dicoIsdel":1},{"dicoId":274,"dicoCountryid":"CA","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Canada","dicoDescription":"","dicoIsdel":1},{"dicoId":282,"dicoCountryid":"CF","dicoAreacode":0,"dicoLocationcode":236,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Central African Republic","dicoDescription":"","dicoIsdel":1},{"dicoId":298,"dicoCountryid":"CGB","dicoAreacode":0,"dicoLocationcode":242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Congo-Brazzaville","dicoDescription":"","dicoIsdel":1},{"dicoId":314,"dicoCountryid":"CI","dicoAreacode":0,"dicoLocationcode":225,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Cote d’Ivoire","dicoDescription":"","dicoIsdel":1},{"dicoId":322,"dicoCountryid":"CK","dicoAreacode":0,"dicoLocationcode":682,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Cook Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":330,"dicoCountryid":"CL","dicoAreacode":0,"dicoLocationcode":56,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Chile","dicoDescription":"","dicoIsdel":1},{"dicoId":338,"dicoCountryid":"CM","dicoAreacode":0,"dicoLocationcode":237,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Cameroon","dicoDescription":"","dicoIsdel":1},{"dicoId":346,"dicoCountryid":"CN","dicoAreacode":1,"dicoLocationcode":86,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"China","dicoDescription":"","dicoIsdel":1},{"dicoId":354,"dicoCountryid":"CO","dicoAreacode":0,"dicoLocationcode":57,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Colombia","dicoDescription":"","dicoIsdel":1},{"dicoId":362,"dicoCountryid":"CR","dicoAreacode":0,"dicoLocationcode":506,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Costa Rica","dicoDescription":"","dicoIsdel":1},{"dicoId":370,"dicoCountryid":"CU","dicoAreacode":0,"dicoLocationcode":53,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Cuba","dicoDescription":"","dicoIsdel":1},{"dicoId":378,"dicoCountryid":"CV","dicoAreacode":0,"dicoLocationcode":238,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Cape Verde","dicoDescription":"","dicoIsdel":1},{"dicoId":386,"dicoCountryid":"CY","dicoAreacode":3,"dicoLocationcode":357,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Cyprus","dicoDescription":"","dicoIsdel":1},{"dicoId":394,"dicoCountryid":"CZ","dicoAreacode":3,"dicoLocationcode":420,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Czech Republic","dicoDescription":"","dicoIsdel":1},{"dicoId":402,"dicoCountryid":"DE","dicoAreacode":3,"dicoLocationcode":49,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Germany","dicoDescription":"","dicoIsdel":1},{"dicoId":410,"dicoCountryid":"DJ","dicoAreacode":0,"dicoLocationcode":253,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Djibouti","dicoDescription":"","dicoIsdel":1},{"dicoId":418,"dicoCountryid":"DK","dicoAreacode":3,"dicoLocationcode":45,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Denmark","dicoDescription":"","dicoIsdel":1},{"dicoId":426,"dicoCountryid":"DM","dicoAreacode":0,"dicoLocationcode":1767,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Dominica","dicoDescription":"","dicoIsdel":1},{"dicoId":434,"dicoCountryid":"DO","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Dominican Republic","dicoDescription":"","dicoIsdel":1},{"dicoId":442,"dicoCountryid":"DZ","dicoAreacode":0,"dicoLocationcode":213,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Algeria","dicoDescription":"","dicoIsdel":1},{"dicoId":450,"dicoCountryid":"EC","dicoAreacode":0,"dicoLocationcode":593,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Ecuador","dicoDescription":"","dicoIsdel":1},{"dicoId":458,"dicoCountryid":"EE","dicoAreacode":3,"dicoLocationcode":372,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Estonia","dicoDescription":"","dicoIsdel":1},{"dicoId":466,"dicoCountryid":"EG","dicoAreacode":0,"dicoLocationcode":20,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Egypt","dicoDescription":"","dicoIsdel":1},{"dicoId":482,"dicoCountryid":"ER","dicoAreacode":0,"dicoLocationcode":291,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Eritrea","dicoDescription":"","dicoIsdel":1},{"dicoId":498,"dicoCountryid":"ET","dicoAreacode":0,"dicoLocationcode":251,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Ethiopia","dicoDescription":"","dicoIsdel":1},{"dicoId":506,"dicoCountryid":"FI","dicoAreacode":3,"dicoLocationcode":358,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Finland","dicoDescription":"","dicoIsdel":1},{"dicoId":514,"dicoCountryid":"FJ","dicoAreacode":0,"dicoLocationcode":679,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"en-us","dicoName":"Fiji","dicoDescription":"","dicoIsdel":1},{"dicoId":522,"dicoCountryid":"FK","dicoAreacode":0,"dicoLocationcode":500,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Falkland Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":538,"dicoCountryid":"FO","dicoAreacode":3,"dicoLocationcode":298,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Faroe Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":546,"dicoCountryid":"FR","dicoAreacode":3,"dicoLocationcode":33,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"France","dicoDescription":"","dicoIsdel":1},{"dicoId":554,"dicoCountryid":"GA","dicoAreacode":0,"dicoLocationcode":241,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Gabon","dicoDescription":"","dicoIsdel":1},{"dicoId":570,"dicoCountryid":"GCI","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Guernsey","dicoDescription":"","dicoIsdel":1},{"dicoId":578,"dicoCountryid":"GD","dicoAreacode":0,"dicoLocationcode":1473,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Grenada","dicoDescription":"","dicoIsdel":1},{"dicoId":586,"dicoCountryid":"GE","dicoAreacode":0,"dicoLocationcode":995,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Georgia","dicoDescription":"","dicoIsdel":1},{"dicoId":594,"dicoCountryid":"GF","dicoAreacode":0,"dicoLocationcode":689,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"en-us","dicoName":"French Polynesia","dicoDescription":"","dicoIsdel":1},{"dicoId":602,"dicoCountryid":"GFN","dicoAreacode":0,"dicoLocationcode":594,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"French Guiana","dicoDescription":"","dicoIsdel":1},{"dicoId":610,"dicoCountryid":"GH","dicoAreacode":0,"dicoLocationcode":233,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Ghana","dicoDescription":"","dicoIsdel":1},{"dicoId":618,"dicoCountryid":"GI","dicoAreacode":0,"dicoLocationcode":350,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Gibraltar","dicoDescription":"","dicoIsdel":1},{"dicoId":626,"dicoCountryid":"GL","dicoAreacode":0,"dicoLocationcode":299,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Greenland","dicoDescription":"","dicoIsdel":1},{"dicoId":634,"dicoCountryid":"GM","dicoAreacode":0,"dicoLocationcode":220,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Gambia","dicoDescription":"","dicoIsdel":1},{"dicoId":642,"dicoCountryid":"GN","dicoAreacode":0,"dicoLocationcode":224,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Guinea","dicoDescription":"","dicoIsdel":1},{"dicoId":650,"dicoCountryid":"GP","dicoAreacode":0,"dicoLocationcode":590,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Guadeloupe","dicoDescription":"","dicoIsdel":1},{"dicoId":658,"dicoCountryid":"GQ","dicoAreacode":0,"dicoLocationcode":240,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Equatorial Guinea","dicoDescription":"","dicoIsdel":1},{"dicoId":666,"dicoCountryid":"GR","dicoAreacode":3,"dicoLocationcode":30,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Greece","dicoDescription":"","dicoIsdel":1},{"dicoId":674,"dicoCountryid":"GT","dicoAreacode":0,"dicoLocationcode":502,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Guatemala","dicoDescription":"","dicoIsdel":1},{"dicoId":682,"dicoCountryid":"GU","dicoAreacode":0,"dicoLocationcode":1671,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Guam","dicoDescription":"","dicoIsdel":1},{"dicoId":690,"dicoCountryid":"GW","dicoAreacode":0,"dicoLocationcode":245,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Guinea-Bissau","dicoDescription":"","dicoIsdel":1},{"dicoId":698,"dicoCountryid":"GY","dicoAreacode":0,"dicoLocationcode":592,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Guyana","dicoDescription":"","dicoIsdel":1},{"dicoId":722,"dicoCountryid":"HR","dicoAreacode":3,"dicoLocationcode":385,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Croatia","dicoDescription":"","dicoIsdel":1},{"dicoId":858,"dicoCountryid":"KH","dicoAreacode":0,"dicoLocationcode":855,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Cambodia","dicoDescription":"","dicoIsdel":1},{"dicoId":874,"dicoCountryid":"KM","dicoAreacode":0,"dicoLocationcode":269,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Comoros","dicoDescription":"","dicoIsdel":1},{"dicoId":914,"dicoCountryid":"KY","dicoAreacode":0,"dicoLocationcode":1345,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Cayman Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":1474,"dicoCountryid":"SIA","dicoAreacode":0,"dicoLocationcode":809,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"en-us","dicoName":"French West Indies","dicoDescription":"","dicoIsdel":1},{"dicoId":1546,"dicoCountryid":"SV","dicoAreacode":0,"dicoLocationcode":503,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"El Salvador","dicoDescription":"","dicoIsdel":1},{"dicoId":1578,"dicoCountryid":"TD","dicoAreacode":0,"dicoLocationcode":235,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Chad","dicoDescription":"","dicoIsdel":1},{"dicoId":1618,"dicoCountryid":"TL","dicoAreacode":0,"dicoLocationcode":670,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"East Timor","dicoDescription":"","dicoIsdel":1}],"N-S":[{"dicoId":58,"dicoCountryid":"AN","dicoAreacode":0,"dicoLocationcode":599,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Netherlands Antilles","dicoDescription":"","dicoIsdel":1},{"dicoId":290,"dicoCountryid":"CG","dicoAreacode":0,"dicoLocationcode":243,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Republic of the Congo","dicoDescription":"","dicoIsdel":1},{"dicoId":306,"dicoCountryid":"CH","dicoAreacode":3,"dicoLocationcode":41,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Switzerland","dicoDescription":"","dicoIsdel":1},{"dicoId":490,"dicoCountryid":"ES","dicoAreacode":3,"dicoLocationcode":34,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Spain","dicoDescription":"","dicoIsdel":1},{"dicoId":882,"dicoCountryid":"KNA","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Saint Kitts and Nevis","dicoDescription":"","dicoIsdel":1},{"dicoId":890,"dicoCountryid":"KP","dicoAreacode":0,"dicoLocationcode":850,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"en-us","dicoName":"North Korea","dicoDescription":"","dicoIsdel":1},{"dicoId":898,"dicoCountryid":"KR","dicoAreacode":2,"dicoLocationcode":82,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"en-us","dicoName":"South Korea","dicoDescription":"","dicoIsdel":1},{"dicoId":946,"dicoCountryid":"LC","dicoAreacode":0,"dicoLocationcode":1758,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Saint Lucia","dicoDescription":"","dicoIsdel":1},{"dicoId":962,"dicoCountryid":"LK","dicoAreacode":0,"dicoLocationcode":94,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Sri Lanka","dicoDescription":"","dicoIsdel":1},{"dicoId":1186,"dicoCountryid":"NA","dicoAreacode":0,"dicoLocationcode":264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Namibia","dicoDescription":"","dicoIsdel":1},{"dicoId":1194,"dicoCountryid":"NC","dicoAreacode":0,"dicoLocationcode":687,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"en-us","dicoName":"New Caledonia","dicoDescription":"","dicoIsdel":1},{"dicoId":1202,"dicoCountryid":"NE","dicoAreacode":0,"dicoLocationcode":227,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Niger","dicoDescription":"","dicoIsdel":1},{"dicoId":1210,"dicoCountryid":"NG","dicoAreacode":0,"dicoLocationcode":234,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Nigeria","dicoDescription":"","dicoIsdel":1},{"dicoId":1218,"dicoCountryid":"NI","dicoAreacode":0,"dicoLocationcode":505,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Nicaragua","dicoDescription":"","dicoIsdel":1},{"dicoId":1226,"dicoCountryid":"NL","dicoAreacode":3,"dicoLocationcode":31,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Netherlands","dicoDescription":"","dicoIsdel":1},{"dicoId":1234,"dicoCountryid":"NO","dicoAreacode":3,"dicoLocationcode":47,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Norway","dicoDescription":"","dicoIsdel":1},{"dicoId":1242,"dicoCountryid":"NP","dicoAreacode":0,"dicoLocationcode":977,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Nepal","dicoDescription":"","dicoIsdel":1},{"dicoId":1250,"dicoCountryid":"NR","dicoAreacode":0,"dicoLocationcode":674,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"en-us","dicoName":"Nauru","dicoDescription":"","dicoIsdel":1},{"dicoId":1258,"dicoCountryid":"NZ","dicoAreacode":0,"dicoLocationcode":64,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"en-us","dicoName":"New Zealand","dicoDescription":"","dicoIsdel":1},{"dicoId":1266,"dicoCountryid":"OM","dicoAreacode":0,"dicoLocationcode":968,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Oman","dicoDescription":"","dicoIsdel":1},{"dicoId":1274,"dicoCountryid":"PA","dicoAreacode":0,"dicoLocationcode":507,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Panama","dicoDescription":"","dicoIsdel":1},{"dicoId":1282,"dicoCountryid":"PC","dicoAreacode":0,"dicoLocationcode":870,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Pitcairn Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":1290,"dicoCountryid":"PE","dicoAreacode":0,"dicoLocationcode":51,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Peru","dicoDescription":"","dicoIsdel":1},{"dicoId":1298,"dicoCountryid":"PG","dicoAreacode":0,"dicoLocationcode":675,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"en-us","dicoName":"Papua New Guinea","dicoDescription":"","dicoIsdel":1},{"dicoId":1306,"dicoCountryid":"PH","dicoAreacode":0,"dicoLocationcode":63,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Philippines","dicoDescription":"","dicoIsdel":1},{"dicoId":1314,"dicoCountryid":"PK","dicoAreacode":0,"dicoLocationcode":92,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Pakistan","dicoDescription":"","dicoIsdel":1},{"dicoId":1322,"dicoCountryid":"PL","dicoAreacode":3,"dicoLocationcode":48,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Poland","dicoDescription":"","dicoIsdel":1},{"dicoId":1330,"dicoCountryid":"PR","dicoAreacode":0,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Puerto Rico","dicoDescription":"","dicoIsdel":1},{"dicoId":1338,"dicoCountryid":"PS","dicoAreacode":0,"dicoLocationcode":970,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Palestine","dicoDescription":"","dicoIsdel":1},{"dicoId":1346,"dicoCountryid":"PT","dicoAreacode":3,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Portugal","dicoDescription":"","dicoIsdel":1},{"dicoId":1354,"dicoCountryid":"PW","dicoAreacode":0,"dicoLocationcode":97,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Palau","dicoDescription":"","dicoIsdel":1},{"dicoId":1362,"dicoCountryid":"PY","dicoAreacode":0,"dicoLocationcode":595,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Paraguay","dicoDescription":"","dicoIsdel":1},{"dicoId":1370,"dicoCountryid":"QA","dicoAreacode":0,"dicoLocationcode":974,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Qatar","dicoDescription":"","dicoIsdel":1},{"dicoId":1378,"dicoCountryid":"RE","dicoAreacode":0,"dicoLocationcode":262,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Reunion","dicoDescription":"","dicoIsdel":1},{"dicoId":1386,"dicoCountryid":"RO","dicoAreacode":3,"dicoLocationcode":40,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Romania","dicoDescription":"","dicoIsdel":1},{"dicoId":1394,"dicoCountryid":"RS","dicoAreacode":3,"dicoLocationcode":381,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Serbia","dicoDescription":"","dicoIsdel":1},{"dicoId":1402,"dicoCountryid":"RU","dicoAreacode":3,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Russia","dicoDescription":"","dicoIsdel":1},{"dicoId":1410,"dicoCountryid":"RW","dicoAreacode":0,"dicoLocationcode":250,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Rwanda","dicoDescription":"","dicoIsdel":1},{"dicoId":1418,"dicoCountryid":"SA","dicoAreacode":0,"dicoLocationcode":966,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Saudi Arabia","dicoDescription":"","dicoIsdel":1},{"dicoId":1426,"dicoCountryid":"SB","dicoAreacode":0,"dicoLocationcode":677,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"en-us","dicoName":"Solomon Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":1434,"dicoCountryid":"SC","dicoAreacode":0,"dicoLocationcode":248,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Seychelles","dicoDescription":"","dicoIsdel":1},{"dicoId":1442,"dicoCountryid":"SD","dicoAreacode":0,"dicoLocationcode":249,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Sudan","dicoDescription":"","dicoIsdel":1},{"dicoId":1450,"dicoCountryid":"SE","dicoAreacode":3,"dicoLocationcode":46,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Sweden","dicoDescription":"","dicoIsdel":1},{"dicoId":1458,"dicoCountryid":"SG","dicoAreacode":0,"dicoLocationcode":65,"dicoIssms":1,"dicoJetlag":0.3,"dicoLanguage":"en-us","dicoName":"Singapore","dicoDescription":"","dicoIsdel":1},{"dicoId":1466,"dicoCountryid":"SI","dicoAreacode":3,"dicoLocationcode":386,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Slovenia","dicoDescription":"","dicoIsdel":1},{"dicoId":1482,"dicoCountryid":"SK","dicoAreacode":3,"dicoLocationcode":421,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Slovakia","dicoDescription":"","dicoIsdel":1},{"dicoId":1490,"dicoCountryid":"SL","dicoAreacode":0,"dicoLocationcode":232,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Sierra Leone","dicoDescription":"","dicoIsdel":1},{"dicoId":1498,"dicoCountryid":"SM","dicoAreacode":3,"dicoLocationcode":378,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"San Marino","dicoDescription":"","dicoIsdel":1},{"dicoId":1506,"dicoCountryid":"SN","dicoAreacode":0,"dicoLocationcode":221,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Senegal","dicoDescription":"","dicoIsdel":1},{"dicoId":1514,"dicoCountryid":"SO","dicoAreacode":0,"dicoLocationcode":252,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Somalia","dicoDescription":"","dicoIsdel":1},{"dicoId":1522,"dicoCountryid":"SR","dicoAreacode":0,"dicoLocationcode":597,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Suriname","dicoDescription":"","dicoIsdel":1},{"dicoId":1530,"dicoCountryid":"SSD","dicoAreacode":0,"dicoLocationcode":211,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"South Sudan","dicoDescription":"","dicoIsdel":1},{"dicoId":1538,"dicoCountryid":"ST","dicoAreacode":0,"dicoLocationcode":239,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Sao Tome and Principe","dicoDescription":"","dicoIsdel":1},{"dicoId":1554,"dicoCountryid":"SY","dicoAreacode":0,"dicoLocationcode":963,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Syria","dicoDescription":"","dicoIsdel":1},{"dicoId":1562,"dicoCountryid":"SZ","dicoAreacode":0,"dicoLocationcode":268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Swaziland","dicoDescription":"","dicoIsdel":1},{"dicoId":1730,"dicoCountryid":"VCT","dicoAreacode":0,"dicoLocationcode":784,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Saint Vincent and the Grenadines","dicoDescription":"","dicoIsdel":1},{"dicoId":1786,"dicoCountryid":"WS","dicoAreacode":0,"dicoLocationcode":685,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"Samoa","dicoDescription":"","dicoIsdel":1},{"dicoId":1802,"dicoCountryid":"ZA","dicoAreacode":0,"dicoLocationcode":27,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"en-us","dicoName":"South Africa","dicoDescription":"","dicoIsdel":1}]};
        var platformRUCountryGroupMap={"T-Z":[{"dicoId":1574,"dicoCountryid":"TC","dicoAreacode":0,"dicoLocationcode":1649,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Turks and Caicos Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":1582,"dicoCountryid":"TD","dicoAreacode":0,"dicoLocationcode":235,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Чад","dicoDescription":"","dicoIsdel":1},{"dicoId":1590,"dicoCountryid":"TG","dicoAreacode":0,"dicoLocationcode":228,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Идти","dicoDescription":"","dicoIsdel":1},{"dicoId":1598,"dicoCountryid":"TH","dicoAreacode":0,"dicoLocationcode":66,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Таиланд","dicoDescription":"","dicoIsdel":1},{"dicoId":1606,"dicoCountryid":"TJ","dicoAreacode":0,"dicoLocationcode":992,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Таджикистан","dicoDescription":"","dicoIsdel":1},{"dicoId":1614,"dicoCountryid":"TK","dicoAreacode":0,"dicoLocationcode":993,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Туркменистан","dicoDescription":"","dicoIsdel":1},{"dicoId":1622,"dicoCountryid":"TL","dicoAreacode":0,"dicoLocationcode":670,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Восточный Тимор","dicoDescription":"","dicoIsdel":1},{"dicoId":1630,"dicoCountryid":"TN","dicoAreacode":0,"dicoLocationcode":216,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Тунис","dicoDescription":"","dicoIsdel":1},{"dicoId":1638,"dicoCountryid":"TO","dicoAreacode":0,"dicoLocationcode":676,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"ru-ru","dicoName":"Тонга","dicoDescription":"","dicoIsdel":1},{"dicoId":1646,"dicoCountryid":"TR","dicoAreacode":0,"dicoLocationcode":90,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"индейка","dicoDescription":"","dicoIsdel":1},{"dicoId":1654,"dicoCountryid":"TT","dicoAreacode":0,"dicoLocationcode":1868,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Тринидад и Тобаго","dicoDescription":"","dicoIsdel":1},{"dicoId":1662,"dicoCountryid":"TV","dicoAreacode":0,"dicoLocationcode":688,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ru-ru","dicoName":"Тувалу","dicoDescription":"","dicoIsdel":1},{"dicoId":1670,"dicoCountryid":"TW","dicoAreacode":1,"dicoLocationcode":886,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Тайвань","dicoDescription":"","dicoIsdel":1},{"dicoId":1678,"dicoCountryid":"TZ","dicoAreacode":0,"dicoLocationcode":255,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Танзания","dicoDescription":"","dicoIsdel":1},{"dicoId":1686,"dicoCountryid":"UA","dicoAreacode":3,"dicoLocationcode":380,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Украина","dicoDescription":"","dicoIsdel":1},{"dicoId":1694,"dicoCountryid":"UG","dicoAreacode":0,"dicoLocationcode":256,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Уганда","dicoDescription":"","dicoIsdel":1},{"dicoId":1702,"dicoCountryid":"US","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Соединенные Штаты","dicoDescription":"","dicoIsdel":1},{"dicoId":1710,"dicoCountryid":"UY","dicoAreacode":0,"dicoLocationcode":598,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Уругвай","dicoDescription":"","dicoIsdel":1},{"dicoId":1718,"dicoCountryid":"UZ","dicoAreacode":0,"dicoLocationcode":998,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Узбекистан","dicoDescription":"","dicoIsdel":1},{"dicoId":1726,"dicoCountryid":"VA","dicoAreacode":3,"dicoLocationcode":379,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Ватикан","dicoDescription":"","dicoIsdel":1},{"dicoId":1734,"dicoCountryid":"VCT","dicoAreacode":0,"dicoLocationcode":784,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Saint Vincent and the Grenadines","dicoDescription":"","dicoIsdel":1},{"dicoId":1742,"dicoCountryid":"VE","dicoAreacode":0,"dicoLocationcode":58,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Венесуэла","dicoDescription":"","dicoIsdel":1},{"dicoId":1750,"dicoCountryid":"VG","dicoAreacode":0,"dicoLocationcode":1284,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Британские Виргинские Острова","dicoDescription":"","dicoIsdel":1},{"dicoId":1758,"dicoCountryid":"VI","dicoAreacode":0,"dicoLocationcode":1340,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Американские Виргинские острова","dicoDescription":"","dicoIsdel":1},{"dicoId":1766,"dicoCountryid":"VN","dicoAreacode":0,"dicoLocationcode":84,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Вьетнам","dicoDescription":"","dicoIsdel":1},{"dicoId":1774,"dicoCountryid":"VU","dicoAreacode":0,"dicoLocationcode":678,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"ru-ru","dicoName":"Вануату","dicoDescription":"","dicoIsdel":1},{"dicoId":1782,"dicoCountryid":"WF","dicoAreacode":0,"dicoLocationcode":681,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Уоллис и Футуна","dicoDescription":"","dicoIsdel":1},{"dicoId":1790,"dicoCountryid":"WS","dicoAreacode":0,"dicoLocationcode":685,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Самоа","dicoDescription":"","dicoIsdel":1},{"dicoId":1798,"dicoCountryid":"YE","dicoAreacode":0,"dicoLocationcode":967,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Йемен","dicoDescription":"","dicoIsdel":1},{"dicoId":1806,"dicoCountryid":"ZA","dicoAreacode":0,"dicoLocationcode":27,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Южная Африка","dicoDescription":"","dicoIsdel":1},{"dicoId":1814,"dicoCountryid":"ZM","dicoAreacode":0,"dicoLocationcode":260,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Замбия","dicoDescription":"","dicoIsdel":1},{"dicoId":1822,"dicoCountryid":"ZW","dicoAreacode":0,"dicoLocationcode":263,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Зимбабве","dicoDescription":"","dicoIsdel":1},{"dicoId":1830,"dicoCountryid":"ZXA","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Jersey","dicoDescription":"","dicoIsdel":1}],"N-S":[{"dicoId":1190,"dicoCountryid":"NA","dicoAreacode":0,"dicoLocationcode":264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Намибия","dicoDescription":"","dicoIsdel":1},{"dicoId":1198,"dicoCountryid":"NC","dicoAreacode":0,"dicoLocationcode":687,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ru-ru","dicoName":"Новая Каледония","dicoDescription":"","dicoIsdel":1},{"dicoId":1206,"dicoCountryid":"NE","dicoAreacode":0,"dicoLocationcode":227,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Нигер","dicoDescription":"","dicoIsdel":1},{"dicoId":1214,"dicoCountryid":"NG","dicoAreacode":0,"dicoLocationcode":234,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Нигерия","dicoDescription":"","dicoIsdel":1},{"dicoId":1222,"dicoCountryid":"NI","dicoAreacode":0,"dicoLocationcode":505,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Никарагуа","dicoDescription":"","dicoIsdel":1},{"dicoId":1230,"dicoCountryid":"NL","dicoAreacode":3,"dicoLocationcode":31,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Нидерланды","dicoDescription":"","dicoIsdel":1},{"dicoId":1238,"dicoCountryid":"NO","dicoAreacode":3,"dicoLocationcode":47,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Норвегия","dicoDescription":"","dicoIsdel":1},{"dicoId":1246,"dicoCountryid":"NP","dicoAreacode":0,"dicoLocationcode":977,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Непал","dicoDescription":"","dicoIsdel":1},{"dicoId":1254,"dicoCountryid":"NR","dicoAreacode":0,"dicoLocationcode":674,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"ru-ru","dicoName":"Науру","dicoDescription":"","dicoIsdel":1},{"dicoId":1262,"dicoCountryid":"NZ","dicoAreacode":0,"dicoLocationcode":64,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"ru-ru","dicoName":"Новая Зеландия","dicoDescription":"","dicoIsdel":1},{"dicoId":1270,"dicoCountryid":"OM","dicoAreacode":0,"dicoLocationcode":968,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Оман","dicoDescription":"","dicoIsdel":1},{"dicoId":1278,"dicoCountryid":"PA","dicoAreacode":0,"dicoLocationcode":507,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Панама","dicoDescription":"","dicoIsdel":1},{"dicoId":1286,"dicoCountryid":"PC","dicoAreacode":0,"dicoLocationcode":870,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Питкэрн острова","dicoDescription":"","dicoIsdel":1},{"dicoId":1294,"dicoCountryid":"PE","dicoAreacode":0,"dicoLocationcode":51,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Перу","dicoDescription":"","dicoIsdel":1},{"dicoId":1302,"dicoCountryid":"PG","dicoAreacode":0,"dicoLocationcode":675,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"ru-ru","dicoName":"Папуа - Новая Гвинея","dicoDescription":"","dicoIsdel":1},{"dicoId":1310,"dicoCountryid":"PH","dicoAreacode":0,"dicoLocationcode":63,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Филиппины","dicoDescription":"","dicoIsdel":1},{"dicoId":1318,"dicoCountryid":"PK","dicoAreacode":0,"dicoLocationcode":92,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Пакистан","dicoDescription":"","dicoIsdel":1},{"dicoId":1326,"dicoCountryid":"PL","dicoAreacode":3,"dicoLocationcode":48,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Польша","dicoDescription":"","dicoIsdel":1},{"dicoId":1334,"dicoCountryid":"PR","dicoAreacode":0,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Пуэрто-Рико","dicoDescription":"","dicoIsdel":1},{"dicoId":1342,"dicoCountryid":"PS","dicoAreacode":0,"dicoLocationcode":970,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Палестина","dicoDescription":"","dicoIsdel":1},{"dicoId":1350,"dicoCountryid":"PT","dicoAreacode":3,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Португалия","dicoDescription":"","dicoIsdel":1},{"dicoId":1358,"dicoCountryid":"PW","dicoAreacode":0,"dicoLocationcode":97,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Палау","dicoDescription":"","dicoIsdel":1},{"dicoId":1366,"dicoCountryid":"PY","dicoAreacode":0,"dicoLocationcode":595,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Парагвай","dicoDescription":"","dicoIsdel":1},{"dicoId":1374,"dicoCountryid":"QA","dicoAreacode":0,"dicoLocationcode":974,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Катар","dicoDescription":"","dicoIsdel":1},{"dicoId":1382,"dicoCountryid":"RE","dicoAreacode":0,"dicoLocationcode":262,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"воссоединение","dicoDescription":"","dicoIsdel":1},{"dicoId":1390,"dicoCountryid":"RO","dicoAreacode":3,"dicoLocationcode":40,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Румыния","dicoDescription":"","dicoIsdel":1},{"dicoId":1398,"dicoCountryid":"RS","dicoAreacode":3,"dicoLocationcode":381,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Сербия","dicoDescription":"","dicoIsdel":1},{"dicoId":1406,"dicoCountryid":"RU","dicoAreacode":3,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Россия","dicoDescription":"","dicoIsdel":1},{"dicoId":1414,"dicoCountryid":"RW","dicoAreacode":0,"dicoLocationcode":250,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Руанда","dicoDescription":"","dicoIsdel":1},{"dicoId":1422,"dicoCountryid":"SA","dicoAreacode":0,"dicoLocationcode":966,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Саудовская Аравия","dicoDescription":"","dicoIsdel":1},{"dicoId":1430,"dicoCountryid":"SB","dicoAreacode":0,"dicoLocationcode":677,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ru-ru","dicoName":"Соломоновы острова","dicoDescription":"","dicoIsdel":1},{"dicoId":1438,"dicoCountryid":"SC","dicoAreacode":0,"dicoLocationcode":248,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Сейшельские острова","dicoDescription":"","dicoIsdel":1},{"dicoId":1446,"dicoCountryid":"SD","dicoAreacode":0,"dicoLocationcode":249,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Судан","dicoDescription":"","dicoIsdel":1},{"dicoId":1454,"dicoCountryid":"SE","dicoAreacode":3,"dicoLocationcode":46,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Швеция","dicoDescription":"","dicoIsdel":1},{"dicoId":1462,"dicoCountryid":"SG","dicoAreacode":0,"dicoLocationcode":65,"dicoIssms":1,"dicoJetlag":0.3,"dicoLanguage":"ru-ru","dicoName":"Сингапур","dicoDescription":"","dicoIsdel":1},{"dicoId":1470,"dicoCountryid":"SI","dicoAreacode":3,"dicoLocationcode":386,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Словения","dicoDescription":"","dicoIsdel":1},{"dicoId":1478,"dicoCountryid":"SIA","dicoAreacode":0,"dicoLocationcode":809,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ru-ru","dicoName":"French West Indies","dicoDescription":"","dicoIsdel":1},{"dicoId":1486,"dicoCountryid":"SK","dicoAreacode":3,"dicoLocationcode":421,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Словакия","dicoDescription":"","dicoIsdel":1},{"dicoId":1494,"dicoCountryid":"SL","dicoAreacode":0,"dicoLocationcode":232,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Сьерра-Леоне","dicoDescription":"","dicoIsdel":1},{"dicoId":1502,"dicoCountryid":"SM","dicoAreacode":3,"dicoLocationcode":378,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Сан - Марино","dicoDescription":"","dicoIsdel":1},{"dicoId":1510,"dicoCountryid":"SN","dicoAreacode":0,"dicoLocationcode":221,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Сенегал","dicoDescription":"","dicoIsdel":1},{"dicoId":1518,"dicoCountryid":"SO","dicoAreacode":0,"dicoLocationcode":252,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Сомали","dicoDescription":"","dicoIsdel":1},{"dicoId":1526,"dicoCountryid":"SR","dicoAreacode":0,"dicoLocationcode":597,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Суринам","dicoDescription":"","dicoIsdel":1},{"dicoId":1534,"dicoCountryid":"SSD","dicoAreacode":0,"dicoLocationcode":211,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Южный Судан","dicoDescription":"","dicoIsdel":1},{"dicoId":1542,"dicoCountryid":"ST","dicoAreacode":0,"dicoLocationcode":239,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Сан-Томе и Принсипи","dicoDescription":"","dicoIsdel":1},{"dicoId":1550,"dicoCountryid":"SV","dicoAreacode":0,"dicoLocationcode":503,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Сальвадор","dicoDescription":"","dicoIsdel":1},{"dicoId":1558,"dicoCountryid":"SY","dicoAreacode":0,"dicoLocationcode":963,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Сирия","dicoDescription":"","dicoIsdel":1},{"dicoId":1566,"dicoCountryid":"SZ","dicoAreacode":0,"dicoLocationcode":268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Свазиленд","dicoDescription":"","dicoIsdel":1}],"H-M":[{"dicoId":710,"dicoCountryid":"HK","dicoAreacode":1,"dicoLocationcode":852,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гонконг","dicoDescription":"","dicoIsdel":1},{"dicoId":718,"dicoCountryid":"HN","dicoAreacode":0,"dicoLocationcode":504,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гондурас","dicoDescription":"","dicoIsdel":1},{"dicoId":726,"dicoCountryid":"HR","dicoAreacode":3,"dicoLocationcode":385,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Хорватия","dicoDescription":"","dicoIsdel":1},{"dicoId":734,"dicoCountryid":"HT","dicoAreacode":0,"dicoLocationcode":509,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гаити","dicoDescription":"","dicoIsdel":1},{"dicoId":742,"dicoCountryid":"HU","dicoAreacode":3,"dicoLocationcode":36,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Венгрия","dicoDescription":"","dicoIsdel":1},{"dicoId":750,"dicoCountryid":"ID","dicoAreacode":0,"dicoLocationcode":62,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Индонезия","dicoDescription":"","dicoIsdel":1},{"dicoId":758,"dicoCountryid":"IE","dicoAreacode":3,"dicoLocationcode":353,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Ирландия","dicoDescription":"","dicoIsdel":1},{"dicoId":766,"dicoCountryid":"IL","dicoAreacode":0,"dicoLocationcode":972,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Израиль","dicoDescription":"","dicoIsdel":1},{"dicoId":774,"dicoCountryid":"IM","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Остров Мэн","dicoDescription":"","dicoIsdel":1},{"dicoId":782,"dicoCountryid":"IN","dicoAreacode":0,"dicoLocationcode":91,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Индия","dicoDescription":"","dicoIsdel":1},{"dicoId":790,"dicoCountryid":"IQ","dicoAreacode":0,"dicoLocationcode":964,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Ирак","dicoDescription":"","dicoIsdel":1},{"dicoId":798,"dicoCountryid":"IR","dicoAreacode":0,"dicoLocationcode":98,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Иран","dicoDescription":"","dicoIsdel":1},{"dicoId":806,"dicoCountryid":"IS","dicoAreacode":3,"dicoLocationcode":354,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Исландия","dicoDescription":"","dicoIsdel":1},{"dicoId":814,"dicoCountryid":"IT","dicoAreacode":3,"dicoLocationcode":39,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Италия","dicoDescription":"","dicoIsdel":1},{"dicoId":822,"dicoCountryid":"JM","dicoAreacode":0,"dicoLocationcode":1876,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Ямайка","dicoDescription":"","dicoIsdel":1},{"dicoId":830,"dicoCountryid":"JO","dicoAreacode":0,"dicoLocationcode":962,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Иордания","dicoDescription":"","dicoIsdel":1},{"dicoId":838,"dicoCountryid":"JP","dicoAreacode":2,"dicoLocationcode":81,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"ru-ru","dicoName":"Япония","dicoDescription":"","dicoIsdel":1},{"dicoId":846,"dicoCountryid":"KE","dicoAreacode":0,"dicoLocationcode":254,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Кения","dicoDescription":"","dicoIsdel":1},{"dicoId":854,"dicoCountryid":"KG","dicoAreacode":0,"dicoLocationcode":996,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Киргизия","dicoDescription":"","dicoIsdel":1},{"dicoId":862,"dicoCountryid":"KH","dicoAreacode":0,"dicoLocationcode":855,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Камбоджа","dicoDescription":"","dicoIsdel":1},{"dicoId":870,"dicoCountryid":"KI","dicoAreacode":0,"dicoLocationcode":686,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Кирибати","dicoDescription":"","dicoIsdel":1},{"dicoId":878,"dicoCountryid":"KM","dicoAreacode":0,"dicoLocationcode":269,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Коморские острова","dicoDescription":"","dicoIsdel":1},{"dicoId":886,"dicoCountryid":"KNA","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Saint Kitts and Nevis","dicoDescription":"","dicoIsdel":1},{"dicoId":894,"dicoCountryid":"KP","dicoAreacode":0,"dicoLocationcode":850,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"ru-ru","dicoName":"Корея","dicoDescription":"","dicoIsdel":1},{"dicoId":902,"dicoCountryid":"KR","dicoAreacode":2,"dicoLocationcode":82,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"ru-ru","dicoName":"Корея","dicoDescription":"","dicoIsdel":1},{"dicoId":910,"dicoCountryid":"KW","dicoAreacode":0,"dicoLocationcode":965,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Кувейт","dicoDescription":"","dicoIsdel":1},{"dicoId":918,"dicoCountryid":"KY","dicoAreacode":0,"dicoLocationcode":1345,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Каймановы Острова","dicoDescription":"","dicoIsdel":1},{"dicoId":926,"dicoCountryid":"KZ","dicoAreacode":0,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Казахстан","dicoDescription":"","dicoIsdel":1},{"dicoId":934,"dicoCountryid":"LA","dicoAreacode":0,"dicoLocationcode":856,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Лаос","dicoDescription":"","dicoIsdel":1},{"dicoId":942,"dicoCountryid":"LB","dicoAreacode":0,"dicoLocationcode":961,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Ливан","dicoDescription":"","dicoIsdel":1},{"dicoId":950,"dicoCountryid":"LC","dicoAreacode":0,"dicoLocationcode":1758,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Сент-Люсия","dicoDescription":"","dicoIsdel":1},{"dicoId":958,"dicoCountryid":"LI","dicoAreacode":3,"dicoLocationcode":423,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Лихтенштейн","dicoDescription":"","dicoIsdel":1},{"dicoId":966,"dicoCountryid":"LK","dicoAreacode":0,"dicoLocationcode":94,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Шри-Ланка","dicoDescription":"","dicoIsdel":1},{"dicoId":974,"dicoCountryid":"LR","dicoAreacode":0,"dicoLocationcode":231,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Либерия","dicoDescription":"","dicoIsdel":1},{"dicoId":982,"dicoCountryid":"LS","dicoAreacode":0,"dicoLocationcode":266,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Лесото","dicoDescription":"","dicoIsdel":1},{"dicoId":990,"dicoCountryid":"LT","dicoAreacode":3,"dicoLocationcode":370,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Литва","dicoDescription":"","dicoIsdel":1},{"dicoId":998,"dicoCountryid":"LU","dicoAreacode":3,"dicoLocationcode":352,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Люксембург","dicoDescription":"","dicoIsdel":1},{"dicoId":1006,"dicoCountryid":"LV","dicoAreacode":3,"dicoLocationcode":371,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Латвия","dicoDescription":"","dicoIsdel":1},{"dicoId":1014,"dicoCountryid":"LY","dicoAreacode":0,"dicoLocationcode":218,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Ливия","dicoDescription":"","dicoIsdel":1},{"dicoId":1022,"dicoCountryid":"MA","dicoAreacode":0,"dicoLocationcode":212,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Марокко","dicoDescription":"","dicoIsdel":1},{"dicoId":1030,"dicoCountryid":"MC","dicoAreacode":3,"dicoLocationcode":377,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Монако","dicoDescription":"","dicoIsdel":1},{"dicoId":1038,"dicoCountryid":"MD","dicoAreacode":3,"dicoLocationcode":373,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Молдова","dicoDescription":"","dicoIsdel":1},{"dicoId":1046,"dicoCountryid":"ME","dicoAreacode":3,"dicoLocationcode":382,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Черногория","dicoDescription":"","dicoIsdel":1},{"dicoId":1054,"dicoCountryid":"MG","dicoAreacode":0,"dicoLocationcode":261,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Мадагаскар","dicoDescription":"","dicoIsdel":1},{"dicoId":1062,"dicoCountryid":"MH","dicoAreacode":0,"dicoLocationcode":692,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"ru-ru","dicoName":"Маршалловы Острова","dicoDescription":"","dicoIsdel":1},{"dicoId":1070,"dicoCountryid":"MK","dicoAreacode":3,"dicoLocationcode":389,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Македония","dicoDescription":"","dicoIsdel":1},{"dicoId":1078,"dicoCountryid":"ML","dicoAreacode":0,"dicoLocationcode":223,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Мали","dicoDescription":"","dicoIsdel":1},{"dicoId":1086,"dicoCountryid":"MM","dicoAreacode":0,"dicoLocationcode":95,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Мьянма","dicoDescription":"","dicoIsdel":1},{"dicoId":1094,"dicoCountryid":"MN","dicoAreacode":0,"dicoLocationcode":976,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Монголия","dicoDescription":"","dicoIsdel":1},{"dicoId":1102,"dicoCountryid":"MO","dicoAreacode":1,"dicoLocationcode":853,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Макао","dicoDescription":"","dicoIsdel":1},{"dicoId":1110,"dicoCountryid":"MQ","dicoAreacode":0,"dicoLocationcode":596,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Мартиника","dicoDescription":"","dicoIsdel":1},{"dicoId":1118,"dicoCountryid":"MR","dicoAreacode":0,"dicoLocationcode":222,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Мавритания","dicoDescription":"","dicoIsdel":1},{"dicoId":1126,"dicoCountryid":"MS","dicoAreacode":0,"dicoLocationcode":1664,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Монтсеррат","dicoDescription":"","dicoIsdel":1},{"dicoId":1134,"dicoCountryid":"MT","dicoAreacode":3,"dicoLocationcode":356,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Мальта","dicoDescription":"","dicoIsdel":1},{"dicoId":1142,"dicoCountryid":"MU","dicoAreacode":0,"dicoLocationcode":230,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Маврикий","dicoDescription":"","dicoIsdel":1},{"dicoId":1150,"dicoCountryid":"MV","dicoAreacode":0,"dicoLocationcode":960,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Мальдивы","dicoDescription":"","dicoIsdel":1},{"dicoId":1158,"dicoCountryid":"MW","dicoAreacode":0,"dicoLocationcode":265,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Малави","dicoDescription":"","dicoIsdel":1},{"dicoId":1166,"dicoCountryid":"MX","dicoAreacode":0,"dicoLocationcode":52,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Мексика","dicoDescription":"","dicoIsdel":1},{"dicoId":1174,"dicoCountryid":"MY","dicoAreacode":0,"dicoLocationcode":60,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Малайзия","dicoDescription":"","dicoIsdel":1},{"dicoId":1182,"dicoCountryid":"MZ","dicoAreacode":0,"dicoLocationcode":258,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Мозамбик","dicoDescription":"","dicoIsdel":1}],"A-G":[{"dicoId":6,"dicoCountryid":"AD","dicoAreacode":3,"dicoLocationcode":376,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"андорра","dicoDescription":"","dicoIsdel":1},{"dicoId":14,"dicoCountryid":"AE","dicoAreacode":0,"dicoLocationcode":971,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Объединенные Арабские Эмираты","dicoDescription":"","dicoIsdel":1},{"dicoId":22,"dicoCountryid":"AF","dicoAreacode":0,"dicoLocationcode":93,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Афганистан","dicoDescription":"","dicoIsdel":1},{"dicoId":30,"dicoCountryid":"AG","dicoAreacode":0,"dicoLocationcode":1268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Антигуа и Барбуда","dicoDescription":"","dicoIsdel":1},{"dicoId":38,"dicoCountryid":"AI","dicoAreacode":0,"dicoLocationcode":1264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Ангилья","dicoDescription":"","dicoIsdel":1},{"dicoId":46,"dicoCountryid":"AL","dicoAreacode":3,"dicoLocationcode":355,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Албания","dicoDescription":"","dicoIsdel":1},{"dicoId":54,"dicoCountryid":"AM","dicoAreacode":0,"dicoLocationcode":374,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Армения","dicoDescription":"","dicoIsdel":1},{"dicoId":62,"dicoCountryid":"AN","dicoAreacode":0,"dicoLocationcode":599,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Кюрасао, Нидерландские Антильские острова","dicoDescription":"","dicoIsdel":1},{"dicoId":70,"dicoCountryid":"AO","dicoAreacode":0,"dicoLocationcode":244,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Ангола","dicoDescription":"","dicoIsdel":1},{"dicoId":78,"dicoCountryid":"AQ","dicoAreacode":0,"dicoLocationcode":672,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"ru-ru","dicoName":"Антарктида","dicoDescription":"","dicoIsdel":1},{"dicoId":86,"dicoCountryid":"AR","dicoAreacode":0,"dicoLocationcode":54,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Аргентина","dicoDescription":"","dicoIsdel":1},{"dicoId":94,"dicoCountryid":"AS","dicoAreacode":0,"dicoLocationcode":684,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Самоа","dicoDescription":"","dicoIsdel":1},{"dicoId":102,"dicoCountryid":"AT","dicoAreacode":3,"dicoLocationcode":43,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Австрия","dicoDescription":"","dicoIsdel":1},{"dicoId":110,"dicoCountryid":"AU","dicoAreacode":0,"dicoLocationcode":61,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"ru-ru","dicoName":"Австралия","dicoDescription":"","dicoIsdel":1},{"dicoId":118,"dicoCountryid":"AW","dicoAreacode":0,"dicoLocationcode":297,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Аруба","dicoDescription":"","dicoIsdel":1},{"dicoId":126,"dicoCountryid":"AZ","dicoAreacode":0,"dicoLocationcode":994,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Азербайджан","dicoDescription":"","dicoIsdel":1},{"dicoId":134,"dicoCountryid":"BA","dicoAreacode":3,"dicoLocationcode":387,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Босния и Герцеговина","dicoDescription":"","dicoIsdel":1},{"dicoId":142,"dicoCountryid":"BB","dicoAreacode":0,"dicoLocationcode":1246,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Барбадос","dicoDescription":"","dicoIsdel":1},{"dicoId":150,"dicoCountryid":"BD","dicoAreacode":0,"dicoLocationcode":880,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Бангладеш","dicoDescription":"","dicoIsdel":1},{"dicoId":158,"dicoCountryid":"BE","dicoAreacode":3,"dicoLocationcode":32,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Бельгия","dicoDescription":"","dicoIsdel":1},{"dicoId":166,"dicoCountryid":"BF","dicoAreacode":0,"dicoLocationcode":226,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Буркина-Фасо","dicoDescription":"","dicoIsdel":1},{"dicoId":174,"dicoCountryid":"BG","dicoAreacode":3,"dicoLocationcode":359,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"болгарский","dicoDescription":"","dicoIsdel":1},{"dicoId":182,"dicoCountryid":"BH","dicoAreacode":0,"dicoLocationcode":973,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Бахрейн","dicoDescription":"","dicoIsdel":1},{"dicoId":190,"dicoCountryid":"BI","dicoAreacode":0,"dicoLocationcode":257,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Бурунди","dicoDescription":"","dicoIsdel":1},{"dicoId":198,"dicoCountryid":"BJ","dicoAreacode":0,"dicoLocationcode":229,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Бенин","dicoDescription":"","dicoIsdel":1},{"dicoId":206,"dicoCountryid":"BM","dicoAreacode":0,"dicoLocationcode":1441,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Бермудские острова","dicoDescription":"","dicoIsdel":1},{"dicoId":214,"dicoCountryid":"BN","dicoAreacode":0,"dicoLocationcode":673,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"ru-ru","dicoName":"Бруней","dicoDescription":"","dicoIsdel":1},{"dicoId":222,"dicoCountryid":"BO","dicoAreacode":0,"dicoLocationcode":591,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Боливия","dicoDescription":"","dicoIsdel":1},{"dicoId":230,"dicoCountryid":"BR","dicoAreacode":0,"dicoLocationcode":55,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Бразилия","dicoDescription":"","dicoIsdel":1},{"dicoId":238,"dicoCountryid":"BS","dicoAreacode":0,"dicoLocationcode":1242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Багамские о-ва","dicoDescription":"","dicoIsdel":1},{"dicoId":246,"dicoCountryid":"BT","dicoAreacode":0,"dicoLocationcode":975,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Бутан","dicoDescription":"","dicoIsdel":1},{"dicoId":254,"dicoCountryid":"BW","dicoAreacode":0,"dicoLocationcode":267,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Ботсвана","dicoDescription":"","dicoIsdel":1},{"dicoId":262,"dicoCountryid":"BY","dicoAreacode":3,"dicoLocationcode":375,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Беларусь","dicoDescription":"","dicoIsdel":1},{"dicoId":270,"dicoCountryid":"BZ","dicoAreacode":0,"dicoLocationcode":501,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Белиз","dicoDescription":"","dicoIsdel":1},{"dicoId":278,"dicoCountryid":"CA","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Канада","dicoDescription":"","dicoIsdel":1},{"dicoId":286,"dicoCountryid":"CF","dicoAreacode":0,"dicoLocationcode":236,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Центрально-Африканская Республика","dicoDescription":"","dicoIsdel":1},{"dicoId":294,"dicoCountryid":"CG","dicoAreacode":0,"dicoLocationcode":243,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Демократическая Республика Конго","dicoDescription":"","dicoIsdel":1},{"dicoId":302,"dicoCountryid":"CGB","dicoAreacode":0,"dicoLocationcode":242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Congo-Brazzaville","dicoDescription":"","dicoIsdel":1},{"dicoId":310,"dicoCountryid":"CH","dicoAreacode":3,"dicoLocationcode":41,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Швейцария","dicoDescription":"","dicoIsdel":1},{"dicoId":318,"dicoCountryid":"CI","dicoAreacode":0,"dicoLocationcode":225,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Берег Слоновой Кости","dicoDescription":"","dicoIsdel":1},{"dicoId":326,"dicoCountryid":"CK","dicoAreacode":0,"dicoLocationcode":682,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"острова Кука","dicoDescription":"","dicoIsdel":1},{"dicoId":334,"dicoCountryid":"CL","dicoAreacode":0,"dicoLocationcode":56,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Чили","dicoDescription":"","dicoIsdel":1},{"dicoId":342,"dicoCountryid":"CM","dicoAreacode":0,"dicoLocationcode":237,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Камерун","dicoDescription":"","dicoIsdel":1},{"dicoId":350,"dicoCountryid":"CN","dicoAreacode":1,"dicoLocationcode":86,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"китайский","dicoDescription":"","dicoIsdel":1},{"dicoId":358,"dicoCountryid":"CO","dicoAreacode":0,"dicoLocationcode":57,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Колумбия","dicoDescription":"","dicoIsdel":1},{"dicoId":366,"dicoCountryid":"CR","dicoAreacode":0,"dicoLocationcode":506,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Коста-Рика","dicoDescription":"","dicoIsdel":1},{"dicoId":374,"dicoCountryid":"CU","dicoAreacode":0,"dicoLocationcode":53,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Куба","dicoDescription":"","dicoIsdel":1},{"dicoId":382,"dicoCountryid":"CV","dicoAreacode":0,"dicoLocationcode":238,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Кабо-Верде","dicoDescription":"","dicoIsdel":1},{"dicoId":390,"dicoCountryid":"CY","dicoAreacode":3,"dicoLocationcode":357,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Кипр","dicoDescription":"","dicoIsdel":1},{"dicoId":398,"dicoCountryid":"CZ","dicoAreacode":3,"dicoLocationcode":420,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"чешский","dicoDescription":"","dicoIsdel":1},{"dicoId":406,"dicoCountryid":"DE","dicoAreacode":3,"dicoLocationcode":49,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Германия","dicoDescription":"","dicoIsdel":1},{"dicoId":414,"dicoCountryid":"DJ","dicoAreacode":0,"dicoLocationcode":253,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Джибути","dicoDescription":"","dicoIsdel":1},{"dicoId":422,"dicoCountryid":"DK","dicoAreacode":3,"dicoLocationcode":45,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Дания","dicoDescription":"","dicoIsdel":1},{"dicoId":430,"dicoCountryid":"DM","dicoAreacode":0,"dicoLocationcode":1767,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Доминика","dicoDescription":"","dicoIsdel":1},{"dicoId":438,"dicoCountryid":"DO","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Доминиканская Республика","dicoDescription":"","dicoIsdel":1},{"dicoId":446,"dicoCountryid":"DZ","dicoAreacode":0,"dicoLocationcode":213,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Алжир","dicoDescription":"","dicoIsdel":1},{"dicoId":454,"dicoCountryid":"EC","dicoAreacode":0,"dicoLocationcode":593,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Эквадор","dicoDescription":"","dicoIsdel":1},{"dicoId":462,"dicoCountryid":"EE","dicoAreacode":3,"dicoLocationcode":372,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Эстония","dicoDescription":"","dicoIsdel":1},{"dicoId":470,"dicoCountryid":"EG","dicoAreacode":0,"dicoLocationcode":20,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Египет","dicoDescription":"","dicoIsdel":1},{"dicoId":478,"dicoCountryid":"EH","dicoAreacode":0,"dicoLocationcode":0,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Западная Сахара","dicoDescription":"","dicoIsdel":1},{"dicoId":486,"dicoCountryid":"ER","dicoAreacode":0,"dicoLocationcode":291,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Эритрея","dicoDescription":"","dicoIsdel":1},{"dicoId":494,"dicoCountryid":"ES","dicoAreacode":3,"dicoLocationcode":34,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Испания","dicoDescription":"","dicoIsdel":1},{"dicoId":502,"dicoCountryid":"ET","dicoAreacode":0,"dicoLocationcode":251,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Эфиопия","dicoDescription":"","dicoIsdel":1},{"dicoId":510,"dicoCountryid":"FI","dicoAreacode":3,"dicoLocationcode":358,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Финляндия","dicoDescription":"","dicoIsdel":1},{"dicoId":518,"dicoCountryid":"FJ","dicoAreacode":0,"dicoLocationcode":679,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"ru-ru","dicoName":"Фиджи","dicoDescription":"","dicoIsdel":1},{"dicoId":526,"dicoCountryid":"FK","dicoAreacode":0,"dicoLocationcode":500,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Фолклендские острова","dicoDescription":"","dicoIsdel":1},{"dicoId":534,"dicoCountryid":"FM","dicoAreacode":0,"dicoLocationcode":691,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"ru-ru","dicoName":"Микронезия","dicoDescription":"","dicoIsdel":1},{"dicoId":542,"dicoCountryid":"FO","dicoAreacode":3,"dicoLocationcode":298,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Фарерские Острова","dicoDescription":"","dicoIsdel":1},{"dicoId":550,"dicoCountryid":"FR","dicoAreacode":3,"dicoLocationcode":33,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Франция","dicoDescription":"","dicoIsdel":1},{"dicoId":558,"dicoCountryid":"GA","dicoAreacode":0,"dicoLocationcode":241,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Габон","dicoDescription":"","dicoIsdel":1},{"dicoId":566,"dicoCountryid":"GB","dicoAreacode":3,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Великобритания","dicoDescription":"","dicoIsdel":1},{"dicoId":574,"dicoCountryid":"GCI","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Шерстяная фуфайка","dicoDescription":"","dicoIsdel":1},{"dicoId":582,"dicoCountryid":"GD","dicoAreacode":0,"dicoLocationcode":1473,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гренада","dicoDescription":"","dicoIsdel":1},{"dicoId":590,"dicoCountryid":"GE","dicoAreacode":0,"dicoLocationcode":995,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Грузия","dicoDescription":"","dicoIsdel":1},{"dicoId":598,"dicoCountryid":"GF","dicoAreacode":0,"dicoLocationcode":689,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ru-ru","dicoName":"Французская Полинезия","dicoDescription":"","dicoIsdel":1},{"dicoId":606,"dicoCountryid":"GFN","dicoAreacode":0,"dicoLocationcode":594,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"French Guiana","dicoDescription":"","dicoIsdel":1},{"dicoId":614,"dicoCountryid":"GH","dicoAreacode":0,"dicoLocationcode":233,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гана","dicoDescription":"","dicoIsdel":1},{"dicoId":622,"dicoCountryid":"GI","dicoAreacode":0,"dicoLocationcode":350,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гибралтар","dicoDescription":"","dicoIsdel":1},{"dicoId":630,"dicoCountryid":"GL","dicoAreacode":0,"dicoLocationcode":299,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гренландия","dicoDescription":"","dicoIsdel":1},{"dicoId":638,"dicoCountryid":"GM","dicoAreacode":0,"dicoLocationcode":220,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гамбия","dicoDescription":"","dicoIsdel":1},{"dicoId":646,"dicoCountryid":"GN","dicoAreacode":0,"dicoLocationcode":224,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гвинея","dicoDescription":"","dicoIsdel":1},{"dicoId":654,"dicoCountryid":"GP","dicoAreacode":0,"dicoLocationcode":590,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гваделупа","dicoDescription":"","dicoIsdel":1},{"dicoId":662,"dicoCountryid":"GQ","dicoAreacode":0,"dicoLocationcode":240,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Экваториальная Гвинея","dicoDescription":"","dicoIsdel":1},{"dicoId":670,"dicoCountryid":"GR","dicoAreacode":3,"dicoLocationcode":30,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Греция","dicoDescription":"","dicoIsdel":1},{"dicoId":678,"dicoCountryid":"GT","dicoAreacode":0,"dicoLocationcode":502,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гватемала","dicoDescription":"","dicoIsdel":1},{"dicoId":686,"dicoCountryid":"GU","dicoAreacode":0,"dicoLocationcode":1671,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гуам","dicoDescription":"","dicoIsdel":1},{"dicoId":694,"dicoCountryid":"GW","dicoAreacode":0,"dicoLocationcode":245,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гвинея-Бисау","dicoDescription":"","dicoIsdel":1},{"dicoId":702,"dicoCountryid":"GY","dicoAreacode":0,"dicoLocationcode":592,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ru-ru","dicoName":"Гайана","dicoDescription":"","dicoIsdel":1}]}
        var platformESCountryGroupMap={"T-Z":[{"dicoId":1571,"dicoCountryid":"TC","dicoAreacode":0,"dicoLocationcode":1649,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Turks and Caicos Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":1579,"dicoCountryid":"TD","dicoAreacode":0,"dicoLocationcode":235,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Chad","dicoDescription":"","dicoIsdel":1},{"dicoId":1587,"dicoCountryid":"TG","dicoAreacode":0,"dicoLocationcode":228,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"el Togo","dicoDescription":"","dicoIsdel":1},{"dicoId":1595,"dicoCountryid":"TH","dicoAreacode":0,"dicoLocationcode":66,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Tailandia","dicoDescription":"","dicoIsdel":1},{"dicoId":1603,"dicoCountryid":"TJ","dicoAreacode":0,"dicoLocationcode":992,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Tayikistán","dicoDescription":"","dicoIsdel":1},{"dicoId":1611,"dicoCountryid":"TK","dicoAreacode":0,"dicoLocationcode":993,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Turkmenistán","dicoDescription":"","dicoIsdel":1},{"dicoId":1619,"dicoCountryid":"TL","dicoAreacode":0,"dicoLocationcode":670,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Timor Oriental","dicoDescription":"","dicoIsdel":1},{"dicoId":1627,"dicoCountryid":"TN","dicoAreacode":0,"dicoLocationcode":216,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Tunisia","dicoDescription":"","dicoIsdel":1},{"dicoId":1635,"dicoCountryid":"TO","dicoAreacode":0,"dicoLocationcode":676,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"es-es","dicoName":"Tonga","dicoDescription":"","dicoIsdel":1},{"dicoId":1643,"dicoCountryid":"TR","dicoAreacode":0,"dicoLocationcode":90,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Turquía","dicoDescription":"","dicoIsdel":1},{"dicoId":1651,"dicoCountryid":"TT","dicoAreacode":0,"dicoLocationcode":1868,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Trinidad y Tobago","dicoDescription":"","dicoIsdel":1},{"dicoId":1659,"dicoCountryid":"TV","dicoAreacode":0,"dicoLocationcode":688,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"es-es","dicoName":"Tuvalu","dicoDescription":"","dicoIsdel":1},{"dicoId":1667,"dicoCountryid":"TW","dicoAreacode":1,"dicoLocationcode":886,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Taiwan (China)","dicoDescription":"","dicoIsdel":1},{"dicoId":1675,"dicoCountryid":"TZ","dicoAreacode":0,"dicoLocationcode":255,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Tanzania","dicoDescription":"","dicoIsdel":1},{"dicoId":1683,"dicoCountryid":"UA","dicoAreacode":3,"dicoLocationcode":380,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Ucrania","dicoDescription":"","dicoIsdel":1},{"dicoId":1691,"dicoCountryid":"UG","dicoAreacode":0,"dicoLocationcode":256,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Uganda","dicoDescription":"","dicoIsdel":1},{"dicoId":1699,"dicoCountryid":"US","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Estados Unidos","dicoDescription":"","dicoIsdel":1},{"dicoId":1707,"dicoCountryid":"UY","dicoAreacode":0,"dicoLocationcode":598,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Uraguay","dicoDescription":"","dicoIsdel":1},{"dicoId":1715,"dicoCountryid":"UZ","dicoAreacode":0,"dicoLocationcode":998,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Uzbekistán","dicoDescription":"","dicoIsdel":1},{"dicoId":1723,"dicoCountryid":"VA","dicoAreacode":3,"dicoLocationcode":379,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Santa Sede (Ciudad del Vaticano)","dicoDescription":"","dicoIsdel":1},{"dicoId":1731,"dicoCountryid":"VCT","dicoAreacode":0,"dicoLocationcode":784,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Saint Vincent and the Grenadines","dicoDescription":"","dicoIsdel":1},{"dicoId":1739,"dicoCountryid":"VE","dicoAreacode":0,"dicoLocationcode":58,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Venezuela","dicoDescription":"","dicoIsdel":1},{"dicoId":1747,"dicoCountryid":"VG","dicoAreacode":0,"dicoLocationcode":1284,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Islas Vírgenes (Británicas)","dicoDescription":"","dicoIsdel":1},{"dicoId":1755,"dicoCountryid":"VI","dicoAreacode":0,"dicoLocationcode":1340,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Islas Vírgenes (EE.UU.)","dicoDescription":"","dicoIsdel":1},{"dicoId":1763,"dicoCountryid":"VN","dicoAreacode":0,"dicoLocationcode":84,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Vietnám","dicoDescription":"","dicoIsdel":1},{"dicoId":1771,"dicoCountryid":"VU","dicoAreacode":0,"dicoLocationcode":678,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"es-es","dicoName":"Vanuatu","dicoDescription":"","dicoIsdel":1},{"dicoId":1779,"dicoCountryid":"WF","dicoAreacode":0,"dicoLocationcode":681,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Wallis y Futuna","dicoDescription":"","dicoIsdel":1},{"dicoId":1787,"dicoCountryid":"WS","dicoAreacode":0,"dicoLocationcode":685,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Samoa","dicoDescription":"","dicoIsdel":1},{"dicoId":1795,"dicoCountryid":"YE","dicoAreacode":0,"dicoLocationcode":967,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Yemen","dicoDescription":"","dicoIsdel":1},{"dicoId":1803,"dicoCountryid":"ZA","dicoAreacode":0,"dicoLocationcode":27,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Sudáfrica","dicoDescription":"","dicoIsdel":1},{"dicoId":1811,"dicoCountryid":"ZM","dicoAreacode":0,"dicoLocationcode":260,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Zambia","dicoDescription":"","dicoIsdel":1},{"dicoId":1819,"dicoCountryid":"ZW","dicoAreacode":0,"dicoLocationcode":263,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Zimbabue","dicoDescription":"","dicoIsdel":1},{"dicoId":1827,"dicoCountryid":"ZXA","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Jersey","dicoDescription":"","dicoIsdel":1}],"N-S":[{"dicoId":1187,"dicoCountryid":"NA","dicoAreacode":0,"dicoLocationcode":264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Namibia","dicoDescription":"","dicoIsdel":1},{"dicoId":1195,"dicoCountryid":"NC","dicoAreacode":0,"dicoLocationcode":687,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"es-es","dicoName":"Nueva Caledonia","dicoDescription":"","dicoIsdel":1},{"dicoId":1203,"dicoCountryid":"NE","dicoAreacode":0,"dicoLocationcode":227,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Níger","dicoDescription":"","dicoIsdel":1},{"dicoId":1211,"dicoCountryid":"NG","dicoAreacode":0,"dicoLocationcode":234,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Nigeria","dicoDescription":"","dicoIsdel":1},{"dicoId":1219,"dicoCountryid":"NI","dicoAreacode":0,"dicoLocationcode":505,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Nicaragua","dicoDescription":"","dicoIsdel":1},{"dicoId":1227,"dicoCountryid":"NL","dicoAreacode":3,"dicoLocationcode":31,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Holanda","dicoDescription":"","dicoIsdel":1},{"dicoId":1235,"dicoCountryid":"NO","dicoAreacode":3,"dicoLocationcode":47,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Noruega","dicoDescription":"","dicoIsdel":1},{"dicoId":1243,"dicoCountryid":"NP","dicoAreacode":0,"dicoLocationcode":977,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Nepal","dicoDescription":"","dicoIsdel":1},{"dicoId":1251,"dicoCountryid":"NR","dicoAreacode":0,"dicoLocationcode":674,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"es-es","dicoName":"Nauru","dicoDescription":"","dicoIsdel":1},{"dicoId":1259,"dicoCountryid":"NZ","dicoAreacode":0,"dicoLocationcode":64,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"es-es","dicoName":"Nueva Zelanda","dicoDescription":"","dicoIsdel":1},{"dicoId":1267,"dicoCountryid":"OM","dicoAreacode":0,"dicoLocationcode":968,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Omán","dicoDescription":"","dicoIsdel":1},{"dicoId":1275,"dicoCountryid":"PA","dicoAreacode":0,"dicoLocationcode":507,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Panamá","dicoDescription":"","dicoIsdel":1},{"dicoId":1283,"dicoCountryid":"PC","dicoAreacode":0,"dicoLocationcode":870,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Islas Pitcairn","dicoDescription":"","dicoIsdel":1},{"dicoId":1291,"dicoCountryid":"PE","dicoAreacode":0,"dicoLocationcode":51,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Perú","dicoDescription":"","dicoIsdel":1},{"dicoId":1299,"dicoCountryid":"PG","dicoAreacode":0,"dicoLocationcode":675,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"es-es","dicoName":"Papúa Nueva Guinea","dicoDescription":"","dicoIsdel":1},{"dicoId":1307,"dicoCountryid":"PH","dicoAreacode":0,"dicoLocationcode":63,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Filipinas","dicoDescription":"","dicoIsdel":1},{"dicoId":1315,"dicoCountryid":"PK","dicoAreacode":0,"dicoLocationcode":92,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Pakistán","dicoDescription":"","dicoIsdel":1},{"dicoId":1323,"dicoCountryid":"PL","dicoAreacode":3,"dicoLocationcode":48,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Polonia","dicoDescription":"","dicoIsdel":1},{"dicoId":1331,"dicoCountryid":"PR","dicoAreacode":0,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Puerto Rico","dicoDescription":"","dicoIsdel":1},{"dicoId":1339,"dicoCountryid":"PS","dicoAreacode":0,"dicoLocationcode":970,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Palestina","dicoDescription":"","dicoIsdel":1},{"dicoId":1347,"dicoCountryid":"PT","dicoAreacode":3,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Portugal","dicoDescription":"","dicoIsdel":1},{"dicoId":1355,"dicoCountryid":"PW","dicoAreacode":0,"dicoLocationcode":97,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Palau","dicoDescription":"","dicoIsdel":1},{"dicoId":1363,"dicoCountryid":"PY","dicoAreacode":0,"dicoLocationcode":595,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Paraguay","dicoDescription":"","dicoIsdel":1},{"dicoId":1371,"dicoCountryid":"QA","dicoAreacode":0,"dicoLocationcode":974,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Katar","dicoDescription":"","dicoIsdel":1},{"dicoId":1379,"dicoCountryid":"RE","dicoAreacode":0,"dicoLocationcode":262,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Reunión","dicoDescription":"","dicoIsdel":1},{"dicoId":1387,"dicoCountryid":"RO","dicoAreacode":3,"dicoLocationcode":40,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Romania","dicoDescription":"","dicoIsdel":1},{"dicoId":1395,"dicoCountryid":"RS","dicoAreacode":3,"dicoLocationcode":381,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Serbia","dicoDescription":"","dicoIsdel":1},{"dicoId":1403,"dicoCountryid":"RU","dicoAreacode":3,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Rusia","dicoDescription":"","dicoIsdel":1},{"dicoId":1411,"dicoCountryid":"RW","dicoAreacode":0,"dicoLocationcode":250,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Ruanda","dicoDescription":"","dicoIsdel":1},{"dicoId":1419,"dicoCountryid":"SA","dicoAreacode":0,"dicoLocationcode":966,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Arabia Saudita","dicoDescription":"","dicoIsdel":1},{"dicoId":1427,"dicoCountryid":"SB","dicoAreacode":0,"dicoLocationcode":677,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"es-es","dicoName":"Islas Salomón","dicoDescription":"","dicoIsdel":1},{"dicoId":1435,"dicoCountryid":"SC","dicoAreacode":0,"dicoLocationcode":248,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Seychelles","dicoDescription":"","dicoIsdel":1},{"dicoId":1443,"dicoCountryid":"SD","dicoAreacode":0,"dicoLocationcode":249,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Sudán","dicoDescription":"","dicoIsdel":1},{"dicoId":1451,"dicoCountryid":"SE","dicoAreacode":3,"dicoLocationcode":46,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Suecia","dicoDescription":"","dicoIsdel":1},{"dicoId":1459,"dicoCountryid":"SG","dicoAreacode":0,"dicoLocationcode":65,"dicoIssms":1,"dicoJetlag":0.3,"dicoLanguage":"es-es","dicoName":"Singapur","dicoDescription":"","dicoIsdel":1},{"dicoId":1467,"dicoCountryid":"SI","dicoAreacode":3,"dicoLocationcode":386,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Eslovenia","dicoDescription":"","dicoIsdel":1},{"dicoId":1475,"dicoCountryid":"SIA","dicoAreacode":0,"dicoLocationcode":809,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"es-es","dicoName":"French West Indies","dicoDescription":"","dicoIsdel":1},{"dicoId":1483,"dicoCountryid":"SK","dicoAreacode":3,"dicoLocationcode":421,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Eslovaquia","dicoDescription":"","dicoIsdel":1},{"dicoId":1491,"dicoCountryid":"SL","dicoAreacode":0,"dicoLocationcode":232,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Sierra Leona","dicoDescription":"","dicoIsdel":1},{"dicoId":1499,"dicoCountryid":"SM","dicoAreacode":3,"dicoLocationcode":378,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"San Marino","dicoDescription":"","dicoIsdel":1},{"dicoId":1507,"dicoCountryid":"SN","dicoAreacode":0,"dicoLocationcode":221,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Senegal","dicoDescription":"","dicoIsdel":1},{"dicoId":1515,"dicoCountryid":"SO","dicoAreacode":0,"dicoLocationcode":252,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Somalia","dicoDescription":"","dicoIsdel":1},{"dicoId":1523,"dicoCountryid":"SR","dicoAreacode":0,"dicoLocationcode":597,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Suriname","dicoDescription":"","dicoIsdel":1},{"dicoId":1531,"dicoCountryid":"SSD","dicoAreacode":0,"dicoLocationcode":211,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Sudán Sur","dicoDescription":"","dicoIsdel":1},{"dicoId":1539,"dicoCountryid":"ST","dicoAreacode":0,"dicoLocationcode":239,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"San Tomé \u0026 Princípe","dicoDescription":"","dicoIsdel":1},{"dicoId":1547,"dicoCountryid":"SV","dicoAreacode":0,"dicoLocationcode":503,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"El Salvador","dicoDescription":"","dicoIsdel":1},{"dicoId":1555,"dicoCountryid":"SY","dicoAreacode":0,"dicoLocationcode":963,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Siria","dicoDescription":"","dicoIsdel":1},{"dicoId":1563,"dicoCountryid":"SZ","dicoAreacode":0,"dicoLocationcode":268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Swazilandia","dicoDescription":"","dicoIsdel":1}],"H-M":[{"dicoId":707,"dicoCountryid":"HK","dicoAreacode":1,"dicoLocationcode":852,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"HongKong","dicoDescription":"","dicoIsdel":1},{"dicoId":715,"dicoCountryid":"HN","dicoAreacode":0,"dicoLocationcode":504,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Honduras","dicoDescription":"","dicoIsdel":1},{"dicoId":723,"dicoCountryid":"HR","dicoAreacode":3,"dicoLocationcode":385,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Croacia","dicoDescription":"","dicoIsdel":1},{"dicoId":731,"dicoCountryid":"HT","dicoAreacode":0,"dicoLocationcode":509,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Haití","dicoDescription":"","dicoIsdel":1},{"dicoId":739,"dicoCountryid":"HU","dicoAreacode":3,"dicoLocationcode":36,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Hungría","dicoDescription":"","dicoIsdel":1},{"dicoId":747,"dicoCountryid":"ID","dicoAreacode":0,"dicoLocationcode":62,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Indonesia","dicoDescription":"","dicoIsdel":1},{"dicoId":755,"dicoCountryid":"IE","dicoAreacode":3,"dicoLocationcode":353,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Irlanda","dicoDescription":"","dicoIsdel":1},{"dicoId":763,"dicoCountryid":"IL","dicoAreacode":0,"dicoLocationcode":972,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Isreal","dicoDescription":"","dicoIsdel":1},{"dicoId":771,"dicoCountryid":"IM","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Isla de Man","dicoDescription":"","dicoIsdel":1},{"dicoId":779,"dicoCountryid":"IN","dicoAreacode":0,"dicoLocationcode":91,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"India","dicoDescription":"","dicoIsdel":1},{"dicoId":787,"dicoCountryid":"IQ","dicoAreacode":0,"dicoLocationcode":964,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Irak","dicoDescription":"","dicoIsdel":1},{"dicoId":795,"dicoCountryid":"IR","dicoAreacode":0,"dicoLocationcode":98,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Irán","dicoDescription":"","dicoIsdel":1},{"dicoId":803,"dicoCountryid":"IS","dicoAreacode":3,"dicoLocationcode":354,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Islandia","dicoDescription":"","dicoIsdel":1},{"dicoId":811,"dicoCountryid":"IT","dicoAreacode":3,"dicoLocationcode":39,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Italia","dicoDescription":"","dicoIsdel":1},{"dicoId":819,"dicoCountryid":"JM","dicoAreacode":0,"dicoLocationcode":1876,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Jamaica","dicoDescription":"","dicoIsdel":1},{"dicoId":827,"dicoCountryid":"JO","dicoAreacode":0,"dicoLocationcode":962,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Jordania","dicoDescription":"","dicoIsdel":1},{"dicoId":835,"dicoCountryid":"JP","dicoAreacode":2,"dicoLocationcode":81,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"es-es","dicoName":"Japón","dicoDescription":"","dicoIsdel":1},{"dicoId":843,"dicoCountryid":"KE","dicoAreacode":0,"dicoLocationcode":254,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Kenia","dicoDescription":"","dicoIsdel":1},{"dicoId":851,"dicoCountryid":"KG","dicoAreacode":0,"dicoLocationcode":996,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Kirguistán","dicoDescription":"","dicoIsdel":1},{"dicoId":859,"dicoCountryid":"KH","dicoAreacode":0,"dicoLocationcode":855,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Camboya","dicoDescription":"","dicoIsdel":1},{"dicoId":867,"dicoCountryid":"KI","dicoAreacode":0,"dicoLocationcode":686,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Kiribati","dicoDescription":"","dicoIsdel":1},{"dicoId":875,"dicoCountryid":"KM","dicoAreacode":0,"dicoLocationcode":269,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Comoras","dicoDescription":"","dicoIsdel":1},{"dicoId":883,"dicoCountryid":"KNA","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Saint Kitts and Nevis","dicoDescription":"","dicoIsdel":1},{"dicoId":891,"dicoCountryid":"KP","dicoAreacode":0,"dicoLocationcode":850,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"es-es","dicoName":"Korea Norte","dicoDescription":"","dicoIsdel":1},{"dicoId":899,"dicoCountryid":"KR","dicoAreacode":2,"dicoLocationcode":82,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"es-es","dicoName":"Korea Sur","dicoDescription":"","dicoIsdel":1},{"dicoId":907,"dicoCountryid":"KW","dicoAreacode":0,"dicoLocationcode":965,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Kuwait","dicoDescription":"","dicoIsdel":1},{"dicoId":915,"dicoCountryid":"KY","dicoAreacode":0,"dicoLocationcode":1345,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Islas Caimán","dicoDescription":"","dicoIsdel":1},{"dicoId":923,"dicoCountryid":"KZ","dicoAreacode":0,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Kazajstán","dicoDescription":"","dicoIsdel":1},{"dicoId":931,"dicoCountryid":"LA","dicoAreacode":0,"dicoLocationcode":856,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Laos","dicoDescription":"","dicoIsdel":1},{"dicoId":939,"dicoCountryid":"LB","dicoAreacode":0,"dicoLocationcode":961,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Líbano","dicoDescription":"","dicoIsdel":1},{"dicoId":947,"dicoCountryid":"LC","dicoAreacode":0,"dicoLocationcode":1758,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Santa Lucia","dicoDescription":"","dicoIsdel":1},{"dicoId":955,"dicoCountryid":"LI","dicoAreacode":3,"dicoLocationcode":423,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Liechtenstein","dicoDescription":"","dicoIsdel":1},{"dicoId":963,"dicoCountryid":"LK","dicoAreacode":0,"dicoLocationcode":94,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Sri Lanka","dicoDescription":"","dicoIsdel":1},{"dicoId":971,"dicoCountryid":"LR","dicoAreacode":0,"dicoLocationcode":231,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Liberia","dicoDescription":"","dicoIsdel":1},{"dicoId":979,"dicoCountryid":"LS","dicoAreacode":0,"dicoLocationcode":266,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Lesoto","dicoDescription":"","dicoIsdel":1},{"dicoId":987,"dicoCountryid":"LT","dicoAreacode":3,"dicoLocationcode":370,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Lituania","dicoDescription":"","dicoIsdel":1},{"dicoId":995,"dicoCountryid":"LU","dicoAreacode":3,"dicoLocationcode":352,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Luxemburgo","dicoDescription":"","dicoIsdel":1},{"dicoId":1003,"dicoCountryid":"LV","dicoAreacode":3,"dicoLocationcode":371,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Letonia","dicoDescription":"","dicoIsdel":1},{"dicoId":1011,"dicoCountryid":"LY","dicoAreacode":0,"dicoLocationcode":218,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Libia","dicoDescription":"","dicoIsdel":1},{"dicoId":1019,"dicoCountryid":"MA","dicoAreacode":0,"dicoLocationcode":212,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Moroco","dicoDescription":"","dicoIsdel":1},{"dicoId":1027,"dicoCountryid":"MC","dicoAreacode":3,"dicoLocationcode":377,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Monaco","dicoDescription":"","dicoIsdel":1},{"dicoId":1035,"dicoCountryid":"MD","dicoAreacode":3,"dicoLocationcode":373,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Moldavia","dicoDescription":"","dicoIsdel":1},{"dicoId":1043,"dicoCountryid":"ME","dicoAreacode":3,"dicoLocationcode":382,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Montenegro","dicoDescription":"","dicoIsdel":1},{"dicoId":1051,"dicoCountryid":"MG","dicoAreacode":0,"dicoLocationcode":261,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Madagascar","dicoDescription":"","dicoIsdel":1},{"dicoId":1059,"dicoCountryid":"MH","dicoAreacode":0,"dicoLocationcode":692,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"es-es","dicoName":"Islas Marshall","dicoDescription":"","dicoIsdel":1},{"dicoId":1067,"dicoCountryid":"MK","dicoAreacode":3,"dicoLocationcode":389,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Macedonia (FYR)","dicoDescription":"","dicoIsdel":1},{"dicoId":1075,"dicoCountryid":"ML","dicoAreacode":0,"dicoLocationcode":223,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Mali","dicoDescription":"","dicoIsdel":1},{"dicoId":1083,"dicoCountryid":"MM","dicoAreacode":0,"dicoLocationcode":95,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Myanmar","dicoDescription":"","dicoIsdel":1},{"dicoId":1091,"dicoCountryid":"MN","dicoAreacode":0,"dicoLocationcode":976,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Mongolia","dicoDescription":"","dicoIsdel":1},{"dicoId":1099,"dicoCountryid":"MO","dicoAreacode":1,"dicoLocationcode":853,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Macau (China)","dicoDescription":"","dicoIsdel":1},{"dicoId":1107,"dicoCountryid":"MQ","dicoAreacode":0,"dicoLocationcode":596,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Martinica","dicoDescription":"","dicoIsdel":1},{"dicoId":1115,"dicoCountryid":"MR","dicoAreacode":0,"dicoLocationcode":222,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Mauritania","dicoDescription":"","dicoIsdel":1},{"dicoId":1123,"dicoCountryid":"MS","dicoAreacode":0,"dicoLocationcode":1664,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Montserrat","dicoDescription":"","dicoIsdel":1},{"dicoId":1131,"dicoCountryid":"MT","dicoAreacode":3,"dicoLocationcode":356,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Malta","dicoDescription":"","dicoIsdel":1},{"dicoId":1139,"dicoCountryid":"MU","dicoAreacode":0,"dicoLocationcode":230,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Mauricio","dicoDescription":"","dicoIsdel":1},{"dicoId":1147,"dicoCountryid":"MV","dicoAreacode":0,"dicoLocationcode":960,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Maldivas","dicoDescription":"","dicoIsdel":1},{"dicoId":1155,"dicoCountryid":"MW","dicoAreacode":0,"dicoLocationcode":265,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Malawi","dicoDescription":"","dicoIsdel":1},{"dicoId":1163,"dicoCountryid":"MX","dicoAreacode":0,"dicoLocationcode":52,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"México","dicoDescription":"","dicoIsdel":1},{"dicoId":1171,"dicoCountryid":"MY","dicoAreacode":0,"dicoLocationcode":60,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Malasia","dicoDescription":"","dicoIsdel":1},{"dicoId":1179,"dicoCountryid":"MZ","dicoAreacode":0,"dicoLocationcode":258,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Mozambique","dicoDescription":"","dicoIsdel":1}],"A-G":[{"dicoId":3,"dicoCountryid":"AD","dicoAreacode":3,"dicoLocationcode":376,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Andorra","dicoDescription":"","dicoIsdel":1},{"dicoId":11,"dicoCountryid":"AE","dicoAreacode":0,"dicoLocationcode":971,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Emiratos Árabes Unidos","dicoDescription":"","dicoIsdel":1},{"dicoId":19,"dicoCountryid":"AF","dicoAreacode":0,"dicoLocationcode":93,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Afganistán","dicoDescription":"","dicoIsdel":1},{"dicoId":27,"dicoCountryid":"AG","dicoAreacode":0,"dicoLocationcode":1268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Antigua y Barbuda","dicoDescription":"","dicoIsdel":1},{"dicoId":35,"dicoCountryid":"AI","dicoAreacode":0,"dicoLocationcode":1264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Anguila","dicoDescription":"","dicoIsdel":1},{"dicoId":43,"dicoCountryid":"AL","dicoAreacode":3,"dicoLocationcode":355,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Albania","dicoDescription":"","dicoIsdel":1},{"dicoId":51,"dicoCountryid":"AM","dicoAreacode":0,"dicoLocationcode":374,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Arménia","dicoDescription":"","dicoIsdel":1},{"dicoId":59,"dicoCountryid":"AN","dicoAreacode":0,"dicoLocationcode":599,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Antillas Holandesas","dicoDescription":"","dicoIsdel":1},{"dicoId":67,"dicoCountryid":"AO","dicoAreacode":0,"dicoLocationcode":244,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Angola","dicoDescription":"","dicoIsdel":1},{"dicoId":75,"dicoCountryid":"AQ","dicoAreacode":0,"dicoLocationcode":672,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"es-es","dicoName":"Antarctica","dicoDescription":"","dicoIsdel":1},{"dicoId":83,"dicoCountryid":"AR","dicoAreacode":0,"dicoLocationcode":54,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Argentina","dicoDescription":"","dicoIsdel":1},{"dicoId":91,"dicoCountryid":"AS","dicoAreacode":0,"dicoLocationcode":684,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Samoa Americana","dicoDescription":"","dicoIsdel":1},{"dicoId":99,"dicoCountryid":"AT","dicoAreacode":3,"dicoLocationcode":43,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Austria","dicoDescription":"","dicoIsdel":1},{"dicoId":107,"dicoCountryid":"AU","dicoAreacode":0,"dicoLocationcode":61,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"es-es","dicoName":"Austrália","dicoDescription":"","dicoIsdel":1},{"dicoId":115,"dicoCountryid":"AW","dicoAreacode":0,"dicoLocationcode":297,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Aruba","dicoDescription":"","dicoIsdel":1},{"dicoId":123,"dicoCountryid":"AZ","dicoAreacode":0,"dicoLocationcode":994,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Azerbaiyán","dicoDescription":"","dicoIsdel":1},{"dicoId":131,"dicoCountryid":"BA","dicoAreacode":3,"dicoLocationcode":387,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Bosnia-Herzegovina","dicoDescription":"","dicoIsdel":1},{"dicoId":139,"dicoCountryid":"BB","dicoAreacode":0,"dicoLocationcode":1246,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Barbados","dicoDescription":"","dicoIsdel":1},{"dicoId":147,"dicoCountryid":"BD","dicoAreacode":0,"dicoLocationcode":880,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Bangladesh","dicoDescription":"","dicoIsdel":1},{"dicoId":155,"dicoCountryid":"BE","dicoAreacode":3,"dicoLocationcode":32,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Bélgica","dicoDescription":"","dicoIsdel":1},{"dicoId":163,"dicoCountryid":"BF","dicoAreacode":0,"dicoLocationcode":226,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Burkina Faso","dicoDescription":"","dicoIsdel":1},{"dicoId":171,"dicoCountryid":"BG","dicoAreacode":3,"dicoLocationcode":359,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Bulgaria","dicoDescription":"","dicoIsdel":1},{"dicoId":179,"dicoCountryid":"BH","dicoAreacode":0,"dicoLocationcode":973,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Bahrein","dicoDescription":"","dicoIsdel":1},{"dicoId":187,"dicoCountryid":"BI","dicoAreacode":0,"dicoLocationcode":257,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Burundi","dicoDescription":"","dicoIsdel":1},{"dicoId":195,"dicoCountryid":"BJ","dicoAreacode":0,"dicoLocationcode":229,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Benin","dicoDescription":"","dicoIsdel":1},{"dicoId":203,"dicoCountryid":"BM","dicoAreacode":0,"dicoLocationcode":1441,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Bermuda","dicoDescription":"","dicoIsdel":1},{"dicoId":211,"dicoCountryid":"BN","dicoAreacode":0,"dicoLocationcode":673,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"es-es","dicoName":"Brunei","dicoDescription":"","dicoIsdel":1},{"dicoId":219,"dicoCountryid":"BO","dicoAreacode":0,"dicoLocationcode":591,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Bolivia","dicoDescription":"","dicoIsdel":1},{"dicoId":227,"dicoCountryid":"BR","dicoAreacode":0,"dicoLocationcode":55,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Brazil","dicoDescription":"","dicoIsdel":1},{"dicoId":235,"dicoCountryid":"BS","dicoAreacode":0,"dicoLocationcode":1242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Bahamas","dicoDescription":"","dicoIsdel":1},{"dicoId":243,"dicoCountryid":"BT","dicoAreacode":0,"dicoLocationcode":975,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Bhután","dicoDescription":"","dicoIsdel":1},{"dicoId":251,"dicoCountryid":"BW","dicoAreacode":0,"dicoLocationcode":267,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Botswana","dicoDescription":"","dicoIsdel":1},{"dicoId":259,"dicoCountryid":"BY","dicoAreacode":3,"dicoLocationcode":375,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Bielorrusia","dicoDescription":"","dicoIsdel":1},{"dicoId":267,"dicoCountryid":"BZ","dicoAreacode":0,"dicoLocationcode":501,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Belice","dicoDescription":"","dicoIsdel":1},{"dicoId":275,"dicoCountryid":"CA","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Canadá","dicoDescription":"","dicoIsdel":1},{"dicoId":283,"dicoCountryid":"CF","dicoAreacode":0,"dicoLocationcode":236,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"República Centroafricana","dicoDescription":"","dicoIsdel":1},{"dicoId":291,"dicoCountryid":"CG","dicoAreacode":0,"dicoLocationcode":243,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"República de Congo","dicoDescription":"","dicoIsdel":1},{"dicoId":299,"dicoCountryid":"CGB","dicoAreacode":0,"dicoLocationcode":242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Congo-Brazzaville","dicoDescription":"","dicoIsdel":1},{"dicoId":307,"dicoCountryid":"CH","dicoAreacode":3,"dicoLocationcode":41,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Suiza","dicoDescription":"","dicoIsdel":1},{"dicoId":315,"dicoCountryid":"CI","dicoAreacode":0,"dicoLocationcode":225,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Costa de Marfil","dicoDescription":"","dicoIsdel":1},{"dicoId":323,"dicoCountryid":"CK","dicoAreacode":0,"dicoLocationcode":682,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Islas Cook","dicoDescription":"","dicoIsdel":1},{"dicoId":331,"dicoCountryid":"CL","dicoAreacode":0,"dicoLocationcode":56,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Chile","dicoDescription":"","dicoIsdel":1},{"dicoId":339,"dicoCountryid":"CM","dicoAreacode":0,"dicoLocationcode":237,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Camerún","dicoDescription":"","dicoIsdel":1},{"dicoId":347,"dicoCountryid":"CN","dicoAreacode":1,"dicoLocationcode":86,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"China","dicoDescription":"","dicoIsdel":1},{"dicoId":355,"dicoCountryid":"CO","dicoAreacode":0,"dicoLocationcode":57,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Colimbia","dicoDescription":"","dicoIsdel":1},{"dicoId":363,"dicoCountryid":"CR","dicoAreacode":0,"dicoLocationcode":506,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Costa Rica","dicoDescription":"","dicoIsdel":1},{"dicoId":371,"dicoCountryid":"CU","dicoAreacode":0,"dicoLocationcode":53,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Cuba","dicoDescription":"","dicoIsdel":1},{"dicoId":379,"dicoCountryid":"CV","dicoAreacode":0,"dicoLocationcode":238,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Cabo Verde","dicoDescription":"","dicoIsdel":1},{"dicoId":387,"dicoCountryid":"CY","dicoAreacode":3,"dicoLocationcode":357,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Chipre","dicoDescription":"","dicoIsdel":1},{"dicoId":395,"dicoCountryid":"CZ","dicoAreacode":3,"dicoLocationcode":420,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"República Checa","dicoDescription":"","dicoIsdel":1},{"dicoId":403,"dicoCountryid":"DE","dicoAreacode":3,"dicoLocationcode":49,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Alemania","dicoDescription":"","dicoIsdel":1},{"dicoId":411,"dicoCountryid":"DJ","dicoAreacode":0,"dicoLocationcode":253,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Djibouti","dicoDescription":"","dicoIsdel":1},{"dicoId":419,"dicoCountryid":"DK","dicoAreacode":3,"dicoLocationcode":45,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Dinamarca","dicoDescription":"","dicoIsdel":1},{"dicoId":427,"dicoCountryid":"DM","dicoAreacode":0,"dicoLocationcode":1767,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Dominica","dicoDescription":"","dicoIsdel":1},{"dicoId":435,"dicoCountryid":"DO","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"República Dominicana","dicoDescription":"","dicoIsdel":1},{"dicoId":443,"dicoCountryid":"DZ","dicoAreacode":0,"dicoLocationcode":213,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Algeria","dicoDescription":"","dicoIsdel":1},{"dicoId":451,"dicoCountryid":"EC","dicoAreacode":0,"dicoLocationcode":593,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Ecuador","dicoDescription":"","dicoIsdel":1},{"dicoId":459,"dicoCountryid":"EE","dicoAreacode":3,"dicoLocationcode":372,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Estonia","dicoDescription":"","dicoIsdel":1},{"dicoId":467,"dicoCountryid":"EG","dicoAreacode":0,"dicoLocationcode":20,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Egipto","dicoDescription":"","dicoIsdel":1},{"dicoId":475,"dicoCountryid":"EH","dicoAreacode":0,"dicoLocationcode":0,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Sahara Occidental","dicoDescription":"","dicoIsdel":1},{"dicoId":483,"dicoCountryid":"ER","dicoAreacode":0,"dicoLocationcode":291,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Eritrea","dicoDescription":"","dicoIsdel":1},{"dicoId":491,"dicoCountryid":"ES","dicoAreacode":3,"dicoLocationcode":34,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"España","dicoDescription":"","dicoIsdel":1},{"dicoId":499,"dicoCountryid":"ET","dicoAreacode":0,"dicoLocationcode":251,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Etiopía","dicoDescription":"","dicoIsdel":1},{"dicoId":507,"dicoCountryid":"FI","dicoAreacode":3,"dicoLocationcode":358,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Finlandia","dicoDescription":"","dicoIsdel":1},{"dicoId":515,"dicoCountryid":"FJ","dicoAreacode":0,"dicoLocationcode":679,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"es-es","dicoName":"Fiji","dicoDescription":"","dicoIsdel":1},{"dicoId":523,"dicoCountryid":"FK","dicoAreacode":0,"dicoLocationcode":500,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Islas Malvinas","dicoDescription":"","dicoIsdel":1},{"dicoId":531,"dicoCountryid":"FM","dicoAreacode":0,"dicoLocationcode":691,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"es-es","dicoName":"Micronesia","dicoDescription":"","dicoIsdel":1},{"dicoId":539,"dicoCountryid":"FO","dicoAreacode":3,"dicoLocationcode":298,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Islas Faroe","dicoDescription":"","dicoIsdel":1},{"dicoId":547,"dicoCountryid":"FR","dicoAreacode":3,"dicoLocationcode":33,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Francia","dicoDescription":"","dicoIsdel":1},{"dicoId":555,"dicoCountryid":"GA","dicoAreacode":0,"dicoLocationcode":241,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Gabón","dicoDescription":"","dicoIsdel":1},{"dicoId":563,"dicoCountryid":"GB","dicoAreacode":3,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Reino Unido","dicoDescription":"","dicoIsdel":1},{"dicoId":571,"dicoCountryid":"GCI","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Guernsey","dicoDescription":"","dicoIsdel":1},{"dicoId":579,"dicoCountryid":"GD","dicoAreacode":0,"dicoLocationcode":1473,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Granada","dicoDescription":"","dicoIsdel":1},{"dicoId":587,"dicoCountryid":"GE","dicoAreacode":0,"dicoLocationcode":995,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Georgia","dicoDescription":"","dicoIsdel":1},{"dicoId":595,"dicoCountryid":"GF","dicoAreacode":0,"dicoLocationcode":689,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"es-es","dicoName":"Polinesia francés","dicoDescription":"","dicoIsdel":1},{"dicoId":603,"dicoCountryid":"GFN","dicoAreacode":0,"dicoLocationcode":594,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Congo-Brazzaville","dicoDescription":"","dicoIsdel":1},{"dicoId":611,"dicoCountryid":"GH","dicoAreacode":0,"dicoLocationcode":233,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Ghana","dicoDescription":"","dicoIsdel":1},{"dicoId":619,"dicoCountryid":"GI","dicoAreacode":0,"dicoLocationcode":350,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Gibraltar","dicoDescription":"","dicoIsdel":1},{"dicoId":627,"dicoCountryid":"GL","dicoAreacode":0,"dicoLocationcode":299,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Groenlandia","dicoDescription":"","dicoIsdel":1},{"dicoId":635,"dicoCountryid":"GM","dicoAreacode":0,"dicoLocationcode":220,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Gambia","dicoDescription":"","dicoIsdel":1},{"dicoId":643,"dicoCountryid":"GN","dicoAreacode":0,"dicoLocationcode":224,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Guinea","dicoDescription":"","dicoIsdel":1},{"dicoId":651,"dicoCountryid":"GP","dicoAreacode":0,"dicoLocationcode":590,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Guadalupe","dicoDescription":"","dicoIsdel":1},{"dicoId":659,"dicoCountryid":"GQ","dicoAreacode":0,"dicoLocationcode":240,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Guinea Ecuatorial","dicoDescription":"","dicoIsdel":1},{"dicoId":667,"dicoCountryid":"GR","dicoAreacode":3,"dicoLocationcode":30,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Grecia","dicoDescription":"","dicoIsdel":1},{"dicoId":675,"dicoCountryid":"GT","dicoAreacode":0,"dicoLocationcode":502,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Guatemala","dicoDescription":"","dicoIsdel":1},{"dicoId":683,"dicoCountryid":"GU","dicoAreacode":0,"dicoLocationcode":1671,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Guam","dicoDescription":"","dicoIsdel":1},{"dicoId":691,"dicoCountryid":"GW","dicoAreacode":0,"dicoLocationcode":245,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Guinea-Bissau","dicoDescription":"","dicoIsdel":1},{"dicoId":699,"dicoCountryid":"GY","dicoAreacode":0,"dicoLocationcode":592,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"es-es","dicoName":"Guayana","dicoDescription":"","dicoIsdel":1}]}
        var platformKOCountryGroupMap={"T-Z":[{"dicoId":1573,"dicoCountryid":"TC","dicoAreacode":0,"dicoLocationcode":1649,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"Turks and Caicos Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":1581,"dicoCountryid":"TD","dicoAreacode":0,"dicoLocationcode":235,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"차드","dicoDescription":"","dicoIsdel":1},{"dicoId":1589,"dicoCountryid":"TG","dicoAreacode":0,"dicoLocationcode":228,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"토고","dicoDescription":"","dicoIsdel":1},{"dicoId":1597,"dicoCountryid":"TH","dicoAreacode":0,"dicoLocationcode":66,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"태국","dicoDescription":"","dicoIsdel":1},{"dicoId":1605,"dicoCountryid":"TJ","dicoAreacode":0,"dicoLocationcode":992,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"타지키스탄","dicoDescription":"","dicoIsdel":1},{"dicoId":1613,"dicoCountryid":"TK","dicoAreacode":0,"dicoLocationcode":993,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"투르크메니스탄","dicoDescription":"","dicoIsdel":1},{"dicoId":1621,"dicoCountryid":"TL","dicoAreacode":0,"dicoLocationcode":670,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"동티모르","dicoDescription":"","dicoIsdel":1},{"dicoId":1629,"dicoCountryid":"TN","dicoAreacode":0,"dicoLocationcode":216,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"튀니지","dicoDescription":"","dicoIsdel":1},{"dicoId":1637,"dicoCountryid":"TO","dicoAreacode":0,"dicoLocationcode":676,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"ko-kr","dicoName":"통가","dicoDescription":"","dicoIsdel":1},{"dicoId":1645,"dicoCountryid":"TR","dicoAreacode":0,"dicoLocationcode":90,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"터키","dicoDescription":"","dicoIsdel":1},{"dicoId":1653,"dicoCountryid":"TT","dicoAreacode":0,"dicoLocationcode":1868,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"트리니다드토바고","dicoDescription":"","dicoIsdel":1},{"dicoId":1661,"dicoCountryid":"TV","dicoAreacode":0,"dicoLocationcode":688,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ko-kr","dicoName":"투발루","dicoDescription":"","dicoIsdel":1},{"dicoId":1669,"dicoCountryid":"TW","dicoAreacode":1,"dicoLocationcode":886,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"대만","dicoDescription":"","dicoIsdel":1},{"dicoId":1677,"dicoCountryid":"TZ","dicoAreacode":0,"dicoLocationcode":255,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"탄자니아","dicoDescription":"","dicoIsdel":1},{"dicoId":1685,"dicoCountryid":"UA","dicoAreacode":3,"dicoLocationcode":380,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"우크라이나","dicoDescription":"","dicoIsdel":1},{"dicoId":1693,"dicoCountryid":"UG","dicoAreacode":0,"dicoLocationcode":256,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"우간다","dicoDescription":"","dicoIsdel":1},{"dicoId":1701,"dicoCountryid":"US","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"미국","dicoDescription":"","dicoIsdel":1},{"dicoId":1709,"dicoCountryid":"UY","dicoAreacode":0,"dicoLocationcode":598,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"우루과이","dicoDescription":"","dicoIsdel":1},{"dicoId":1717,"dicoCountryid":"UZ","dicoAreacode":0,"dicoLocationcode":998,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"우즈베키스탄 ","dicoDescription":"","dicoIsdel":1},{"dicoId":1725,"dicoCountryid":"VA","dicoAreacode":3,"dicoLocationcode":379,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"바티칸시국","dicoDescription":"","dicoIsdel":1},{"dicoId":1733,"dicoCountryid":"VCT","dicoAreacode":0,"dicoLocationcode":784,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"Saint Vincent and the Grenadines","dicoDescription":"","dicoIsdel":1},{"dicoId":1741,"dicoCountryid":"VE","dicoAreacode":0,"dicoLocationcode":58,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"베네수엘라","dicoDescription":"","dicoIsdel":1},{"dicoId":1749,"dicoCountryid":"VG","dicoAreacode":0,"dicoLocationcode":1284,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"영국령 버진아일랜드","dicoDescription":"","dicoIsdel":1},{"dicoId":1757,"dicoCountryid":"VI","dicoAreacode":0,"dicoLocationcode":1340,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"미국령 버진아일랜드","dicoDescription":"","dicoIsdel":1},{"dicoId":1765,"dicoCountryid":"VN","dicoAreacode":0,"dicoLocationcode":84,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"월남","dicoDescription":"","dicoIsdel":1},{"dicoId":1773,"dicoCountryid":"VU","dicoAreacode":0,"dicoLocationcode":678,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"ko-kr","dicoName":"바누아투","dicoDescription":"","dicoIsdel":1},{"dicoId":1781,"dicoCountryid":"WF","dicoAreacode":0,"dicoLocationcode":681,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"월리스푸투나제도","dicoDescription":"","dicoIsdel":1},{"dicoId":1789,"dicoCountryid":"WS","dicoAreacode":0,"dicoLocationcode":685,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"사모아","dicoDescription":"","dicoIsdel":1},{"dicoId":1797,"dicoCountryid":"YE","dicoAreacode":0,"dicoLocationcode":967,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"예멘","dicoDescription":"","dicoIsdel":1},{"dicoId":1805,"dicoCountryid":"ZA","dicoAreacode":0,"dicoLocationcode":27,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"남아프리카","dicoDescription":"","dicoIsdel":1},{"dicoId":1813,"dicoCountryid":"ZM","dicoAreacode":0,"dicoLocationcode":260,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"잠비아","dicoDescription":"","dicoIsdel":1},{"dicoId":1821,"dicoCountryid":"ZW","dicoAreacode":0,"dicoLocationcode":263,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"짐바브웨","dicoDescription":"","dicoIsdel":1},{"dicoId":1829,"dicoCountryid":"ZXA","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"Jersey","dicoDescription":"","dicoIsdel":1}],"N-S":[{"dicoId":1189,"dicoCountryid":"NA","dicoAreacode":0,"dicoLocationcode":264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"나미비아","dicoDescription":"","dicoIsdel":1},{"dicoId":1197,"dicoCountryid":"NC","dicoAreacode":0,"dicoLocationcode":687,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ko-kr","dicoName":"뉴칼레도니아","dicoDescription":"","dicoIsdel":1},{"dicoId":1205,"dicoCountryid":"NE","dicoAreacode":0,"dicoLocationcode":227,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"니제르","dicoDescription":"","dicoIsdel":1},{"dicoId":1213,"dicoCountryid":"NG","dicoAreacode":0,"dicoLocationcode":234,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"나이지리아","dicoDescription":"","dicoIsdel":1},{"dicoId":1221,"dicoCountryid":"NI","dicoAreacode":0,"dicoLocationcode":505,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"니카라과","dicoDescription":"","dicoIsdel":1},{"dicoId":1229,"dicoCountryid":"NL","dicoAreacode":3,"dicoLocationcode":31,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"네덜란드","dicoDescription":"","dicoIsdel":1},{"dicoId":1237,"dicoCountryid":"NO","dicoAreacode":3,"dicoLocationcode":47,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"노르웨이","dicoDescription":"","dicoIsdel":1},{"dicoId":1245,"dicoCountryid":"NP","dicoAreacode":0,"dicoLocationcode":977,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"네팔","dicoDescription":"","dicoIsdel":1},{"dicoId":1253,"dicoCountryid":"NR","dicoAreacode":0,"dicoLocationcode":674,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"ko-kr","dicoName":"나우루","dicoDescription":"","dicoIsdel":1},{"dicoId":1261,"dicoCountryid":"NZ","dicoAreacode":0,"dicoLocationcode":64,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"ko-kr","dicoName":"뉴질랜드","dicoDescription":"","dicoIsdel":1},{"dicoId":1269,"dicoCountryid":"OM","dicoAreacode":0,"dicoLocationcode":968,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"오만","dicoDescription":"","dicoIsdel":1},{"dicoId":1277,"dicoCountryid":"PA","dicoAreacode":0,"dicoLocationcode":507,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"파나마","dicoDescription":"","dicoIsdel":1},{"dicoId":1285,"dicoCountryid":"PC","dicoAreacode":0,"dicoLocationcode":870,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"핏케언제도","dicoDescription":"","dicoIsdel":1},{"dicoId":1293,"dicoCountryid":"PE","dicoAreacode":0,"dicoLocationcode":51,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"페루","dicoDescription":"","dicoIsdel":1},{"dicoId":1301,"dicoCountryid":"PG","dicoAreacode":0,"dicoLocationcode":675,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"ko-kr","dicoName":"파푸아 뉴기니","dicoDescription":"","dicoIsdel":1},{"dicoId":1309,"dicoCountryid":"PH","dicoAreacode":0,"dicoLocationcode":63,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"필리핀","dicoDescription":"","dicoIsdel":1},{"dicoId":1317,"dicoCountryid":"PK","dicoAreacode":0,"dicoLocationcode":92,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"파키스탄","dicoDescription":"","dicoIsdel":1},{"dicoId":1325,"dicoCountryid":"PL","dicoAreacode":3,"dicoLocationcode":48,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"폴란드","dicoDescription":"","dicoIsdel":1},{"dicoId":1333,"dicoCountryid":"PR","dicoAreacode":0,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"푸에르토리코","dicoDescription":"","dicoIsdel":1},{"dicoId":1341,"dicoCountryid":"PS","dicoAreacode":0,"dicoLocationcode":970,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"팔레스타인","dicoDescription":"","dicoIsdel":1},{"dicoId":1349,"dicoCountryid":"PT","dicoAreacode":3,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"포르투갈","dicoDescription":"","dicoIsdel":1},{"dicoId":1357,"dicoCountryid":"PW","dicoAreacode":0,"dicoLocationcode":97,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"팔라우공화국","dicoDescription":"","dicoIsdel":1},{"dicoId":1365,"dicoCountryid":"PY","dicoAreacode":0,"dicoLocationcode":595,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"파라과이","dicoDescription":"","dicoIsdel":1},{"dicoId":1373,"dicoCountryid":"QA","dicoAreacode":0,"dicoLocationcode":974,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"카타르","dicoDescription":"","dicoIsdel":1},{"dicoId":1381,"dicoCountryid":"RE","dicoAreacode":0,"dicoLocationcode":262,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"레위니옹섬","dicoDescription":"","dicoIsdel":1},{"dicoId":1389,"dicoCountryid":"RO","dicoAreacode":3,"dicoLocationcode":40,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"루마니아","dicoDescription":"","dicoIsdel":1},{"dicoId":1397,"dicoCountryid":"RS","dicoAreacode":3,"dicoLocationcode":381,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"세르비아 ","dicoDescription":"","dicoIsdel":1},{"dicoId":1405,"dicoCountryid":"RU","dicoAreacode":3,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"러시아","dicoDescription":"","dicoIsdel":1},{"dicoId":1413,"dicoCountryid":"RW","dicoAreacode":0,"dicoLocationcode":250,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"르완다","dicoDescription":"","dicoIsdel":1},{"dicoId":1421,"dicoCountryid":"SA","dicoAreacode":0,"dicoLocationcode":966,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"사우디아라비아","dicoDescription":"","dicoIsdel":1},{"dicoId":1429,"dicoCountryid":"SB","dicoAreacode":0,"dicoLocationcode":677,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ko-kr","dicoName":"솔로몬 제도","dicoDescription":"","dicoIsdel":1},{"dicoId":1437,"dicoCountryid":"SC","dicoAreacode":0,"dicoLocationcode":248,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"세이셸","dicoDescription":"","dicoIsdel":1},{"dicoId":1445,"dicoCountryid":"SD","dicoAreacode":0,"dicoLocationcode":249,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"수단","dicoDescription":"","dicoIsdel":1},{"dicoId":1453,"dicoCountryid":"SE","dicoAreacode":3,"dicoLocationcode":46,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"스웨덴","dicoDescription":"","dicoIsdel":1},{"dicoId":1461,"dicoCountryid":"SG","dicoAreacode":0,"dicoLocationcode":65,"dicoIssms":1,"dicoJetlag":0.3,"dicoLanguage":"ko-kr","dicoName":"싱가포르","dicoDescription":"","dicoIsdel":1},{"dicoId":1469,"dicoCountryid":"SI","dicoAreacode":3,"dicoLocationcode":386,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"슬로베니아","dicoDescription":"","dicoIsdel":1},{"dicoId":1477,"dicoCountryid":"SIA","dicoAreacode":0,"dicoLocationcode":809,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ko-kr","dicoName":"French West Indies","dicoDescription":"","dicoIsdel":1},{"dicoId":1485,"dicoCountryid":"SK","dicoAreacode":3,"dicoLocationcode":421,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"슬로바키아","dicoDescription":"","dicoIsdel":1},{"dicoId":1493,"dicoCountryid":"SL","dicoAreacode":0,"dicoLocationcode":232,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"시에라리온","dicoDescription":"","dicoIsdel":1},{"dicoId":1501,"dicoCountryid":"SM","dicoAreacode":3,"dicoLocationcode":378,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"산마리노","dicoDescription":"","dicoIsdel":1},{"dicoId":1509,"dicoCountryid":"SN","dicoAreacode":0,"dicoLocationcode":221,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"세네갈","dicoDescription":"","dicoIsdel":1},{"dicoId":1517,"dicoCountryid":"SO","dicoAreacode":0,"dicoLocationcode":252,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"소말리아","dicoDescription":"","dicoIsdel":1},{"dicoId":1525,"dicoCountryid":"SR","dicoAreacode":0,"dicoLocationcode":597,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"수리남","dicoDescription":"","dicoIsdel":1},{"dicoId":1533,"dicoCountryid":"SSD","dicoAreacode":0,"dicoLocationcode":211,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"남수단 ","dicoDescription":"","dicoIsdel":1},{"dicoId":1541,"dicoCountryid":"ST","dicoAreacode":0,"dicoLocationcode":239,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"상투메프린시페","dicoDescription":"","dicoIsdel":1},{"dicoId":1549,"dicoCountryid":"SV","dicoAreacode":0,"dicoLocationcode":503,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"엘살바도르","dicoDescription":"","dicoIsdel":1},{"dicoId":1557,"dicoCountryid":"SY","dicoAreacode":0,"dicoLocationcode":963,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"시리아","dicoDescription":"","dicoIsdel":1},{"dicoId":1565,"dicoCountryid":"SZ","dicoAreacode":0,"dicoLocationcode":268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"스와질란드","dicoDescription":"","dicoIsdel":1}],"H-M":[{"dicoId":709,"dicoCountryid":"HK","dicoAreacode":1,"dicoLocationcode":852,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"홍콩","dicoDescription":"","dicoIsdel":1},{"dicoId":717,"dicoCountryid":"HN","dicoAreacode":0,"dicoLocationcode":504,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"온두라스","dicoDescription":"","dicoIsdel":1},{"dicoId":725,"dicoCountryid":"HR","dicoAreacode":3,"dicoLocationcode":385,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"크로아티아","dicoDescription":"","dicoIsdel":1},{"dicoId":733,"dicoCountryid":"HT","dicoAreacode":0,"dicoLocationcode":509,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"아이티","dicoDescription":"","dicoIsdel":1},{"dicoId":741,"dicoCountryid":"HU","dicoAreacode":3,"dicoLocationcode":36,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"헝가리","dicoDescription":"","dicoIsdel":1},{"dicoId":749,"dicoCountryid":"ID","dicoAreacode":0,"dicoLocationcode":62,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"인도네시아","dicoDescription":"","dicoIsdel":1},{"dicoId":757,"dicoCountryid":"IE","dicoAreacode":3,"dicoLocationcode":353,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"아일랜드","dicoDescription":"","dicoIsdel":1},{"dicoId":765,"dicoCountryid":"IL","dicoAreacode":0,"dicoLocationcode":972,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"이스라엘","dicoDescription":"","dicoIsdel":1},{"dicoId":773,"dicoCountryid":"IM","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"맨섬","dicoDescription":"","dicoIsdel":1},{"dicoId":781,"dicoCountryid":"IN","dicoAreacode":0,"dicoLocationcode":91,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"인도","dicoDescription":"","dicoIsdel":1},{"dicoId":789,"dicoCountryid":"IQ","dicoAreacode":0,"dicoLocationcode":964,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"이라크","dicoDescription":"","dicoIsdel":1},{"dicoId":797,"dicoCountryid":"IR","dicoAreacode":0,"dicoLocationcode":98,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"이란","dicoDescription":"","dicoIsdel":1},{"dicoId":805,"dicoCountryid":"IS","dicoAreacode":3,"dicoLocationcode":354,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"아이슬란드","dicoDescription":"","dicoIsdel":1},{"dicoId":813,"dicoCountryid":"IT","dicoAreacode":3,"dicoLocationcode":39,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"이탈리아","dicoDescription":"","dicoIsdel":1},{"dicoId":821,"dicoCountryid":"JM","dicoAreacode":0,"dicoLocationcode":1876,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"자메이카","dicoDescription":"","dicoIsdel":1},{"dicoId":829,"dicoCountryid":"JO","dicoAreacode":0,"dicoLocationcode":962,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"요르단","dicoDescription":"","dicoIsdel":1},{"dicoId":837,"dicoCountryid":"JP","dicoAreacode":2,"dicoLocationcode":81,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"ko-kr","dicoName":"일본어","dicoDescription":"","dicoIsdel":1},{"dicoId":845,"dicoCountryid":"KE","dicoAreacode":0,"dicoLocationcode":254,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"케냐","dicoDescription":"","dicoIsdel":1},{"dicoId":853,"dicoCountryid":"KG","dicoAreacode":0,"dicoLocationcode":996,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"키르기스스탄","dicoDescription":"","dicoIsdel":1},{"dicoId":861,"dicoCountryid":"KH","dicoAreacode":0,"dicoLocationcode":855,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"캄보디아","dicoDescription":"","dicoIsdel":1},{"dicoId":869,"dicoCountryid":"KI","dicoAreacode":0,"dicoLocationcode":686,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"키리바시","dicoDescription":"","dicoIsdel":1},{"dicoId":877,"dicoCountryid":"KM","dicoAreacode":0,"dicoLocationcode":269,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"코모로","dicoDescription":"","dicoIsdel":1},{"dicoId":885,"dicoCountryid":"KNA","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"Saint Kitts and Nevis","dicoDescription":"","dicoIsdel":1},{"dicoId":893,"dicoCountryid":"KP","dicoAreacode":0,"dicoLocationcode":850,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"ko-kr","dicoName":"조선","dicoDescription":"","dicoIsdel":1},{"dicoId":901,"dicoCountryid":"KR","dicoAreacode":2,"dicoLocationcode":82,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"ko-kr","dicoName":"한국","dicoDescription":"","dicoIsdel":1},{"dicoId":909,"dicoCountryid":"KW","dicoAreacode":0,"dicoLocationcode":965,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"쿠웨이트","dicoDescription":"","dicoIsdel":1},{"dicoId":917,"dicoCountryid":"KY","dicoAreacode":0,"dicoLocationcode":1345,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"케이맨 제도","dicoDescription":"","dicoIsdel":1},{"dicoId":925,"dicoCountryid":"KZ","dicoAreacode":0,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"카자흐스탄","dicoDescription":"","dicoIsdel":1},{"dicoId":933,"dicoCountryid":"LA","dicoAreacode":0,"dicoLocationcode":856,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"라오스","dicoDescription":"","dicoIsdel":1},{"dicoId":941,"dicoCountryid":"LB","dicoAreacode":0,"dicoLocationcode":961,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"레바논","dicoDescription":"","dicoIsdel":1},{"dicoId":949,"dicoCountryid":"LC","dicoAreacode":0,"dicoLocationcode":1758,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"세인트루시아","dicoDescription":"","dicoIsdel":1},{"dicoId":957,"dicoCountryid":"LI","dicoAreacode":3,"dicoLocationcode":423,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"리히텐슈타인","dicoDescription":"","dicoIsdel":1},{"dicoId":965,"dicoCountryid":"LK","dicoAreacode":0,"dicoLocationcode":94,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"스리랑카","dicoDescription":"","dicoIsdel":1},{"dicoId":973,"dicoCountryid":"LR","dicoAreacode":0,"dicoLocationcode":231,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"라이베리아","dicoDescription":"","dicoIsdel":1},{"dicoId":981,"dicoCountryid":"LS","dicoAreacode":0,"dicoLocationcode":266,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"레소토","dicoDescription":"","dicoIsdel":1},{"dicoId":989,"dicoCountryid":"LT","dicoAreacode":3,"dicoLocationcode":370,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"리투아니아","dicoDescription":"","dicoIsdel":1},{"dicoId":997,"dicoCountryid":"LU","dicoAreacode":3,"dicoLocationcode":352,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"룩셈부르크","dicoDescription":"","dicoIsdel":1},{"dicoId":1005,"dicoCountryid":"LV","dicoAreacode":3,"dicoLocationcode":371,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"라트비아","dicoDescription":"","dicoIsdel":1},{"dicoId":1013,"dicoCountryid":"LY","dicoAreacode":0,"dicoLocationcode":218,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"리비아","dicoDescription":"","dicoIsdel":1},{"dicoId":1021,"dicoCountryid":"MA","dicoAreacode":0,"dicoLocationcode":212,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"모로코","dicoDescription":"","dicoIsdel":1},{"dicoId":1029,"dicoCountryid":"MC","dicoAreacode":3,"dicoLocationcode":377,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"모나코","dicoDescription":"","dicoIsdel":1},{"dicoId":1037,"dicoCountryid":"MD","dicoAreacode":3,"dicoLocationcode":373,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"몰도바","dicoDescription":"","dicoIsdel":1},{"dicoId":1045,"dicoCountryid":"ME","dicoAreacode":3,"dicoLocationcode":382,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"몬테네그로","dicoDescription":"","dicoIsdel":1},{"dicoId":1053,"dicoCountryid":"MG","dicoAreacode":0,"dicoLocationcode":261,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"마다가스카르","dicoDescription":"","dicoIsdel":1},{"dicoId":1061,"dicoCountryid":"MH","dicoAreacode":0,"dicoLocationcode":692,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"ko-kr","dicoName":"마셜 제도","dicoDescription":"","dicoIsdel":1},{"dicoId":1069,"dicoCountryid":"MK","dicoAreacode":3,"dicoLocationcode":389,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"마케도니아","dicoDescription":"","dicoIsdel":1},{"dicoId":1077,"dicoCountryid":"ML","dicoAreacode":0,"dicoLocationcode":223,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"말리","dicoDescription":"","dicoIsdel":1},{"dicoId":1085,"dicoCountryid":"MM","dicoAreacode":0,"dicoLocationcode":95,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"미얀마","dicoDescription":"","dicoIsdel":1},{"dicoId":1093,"dicoCountryid":"MN","dicoAreacode":0,"dicoLocationcode":976,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"몽고","dicoDescription":"","dicoIsdel":1},{"dicoId":1101,"dicoCountryid":"MO","dicoAreacode":1,"dicoLocationcode":853,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"마카오","dicoDescription":"","dicoIsdel":1},{"dicoId":1109,"dicoCountryid":"MQ","dicoAreacode":0,"dicoLocationcode":596,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"마르티니크섬","dicoDescription":"","dicoIsdel":1},{"dicoId":1117,"dicoCountryid":"MR","dicoAreacode":0,"dicoLocationcode":222,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"모리타니","dicoDescription":"","dicoIsdel":1},{"dicoId":1125,"dicoCountryid":"MS","dicoAreacode":0,"dicoLocationcode":1664,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"몬트세라트","dicoDescription":"","dicoIsdel":1},{"dicoId":1133,"dicoCountryid":"MT","dicoAreacode":3,"dicoLocationcode":356,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"몰타","dicoDescription":"","dicoIsdel":1},{"dicoId":1141,"dicoCountryid":"MU","dicoAreacode":0,"dicoLocationcode":230,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"모리셔스","dicoDescription":"","dicoIsdel":1},{"dicoId":1149,"dicoCountryid":"MV","dicoAreacode":0,"dicoLocationcode":960,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"몰디브","dicoDescription":"","dicoIsdel":1},{"dicoId":1157,"dicoCountryid":"MW","dicoAreacode":0,"dicoLocationcode":265,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"말라위","dicoDescription":"","dicoIsdel":1},{"dicoId":1165,"dicoCountryid":"MX","dicoAreacode":0,"dicoLocationcode":52,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"멕시코","dicoDescription":"","dicoIsdel":1},{"dicoId":1173,"dicoCountryid":"MY","dicoAreacode":0,"dicoLocationcode":60,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"말레이시아","dicoDescription":"","dicoIsdel":1},{"dicoId":1181,"dicoCountryid":"MZ","dicoAreacode":0,"dicoLocationcode":258,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"모잠비크","dicoDescription":"","dicoIsdel":1}],"A-G":[{"dicoId":5,"dicoCountryid":"AD","dicoAreacode":3,"dicoLocationcode":376,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"안도라","dicoDescription":"","dicoIsdel":1},{"dicoId":13,"dicoCountryid":"AE","dicoAreacode":0,"dicoLocationcode":971,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"아랍에미리트","dicoDescription":"","dicoIsdel":1},{"dicoId":21,"dicoCountryid":"AF","dicoAreacode":0,"dicoLocationcode":93,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"아프가니스탄","dicoDescription":"","dicoIsdel":1},{"dicoId":29,"dicoCountryid":"AG","dicoAreacode":0,"dicoLocationcode":1268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"앤티가 바부다","dicoDescription":"","dicoIsdel":1},{"dicoId":37,"dicoCountryid":"AI","dicoAreacode":0,"dicoLocationcode":1264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"앵귈라","dicoDescription":"","dicoIsdel":1},{"dicoId":45,"dicoCountryid":"AL","dicoAreacode":3,"dicoLocationcode":355,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"알바니아","dicoDescription":"","dicoIsdel":1},{"dicoId":53,"dicoCountryid":"AM","dicoAreacode":0,"dicoLocationcode":374,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"아르메니아","dicoDescription":"","dicoIsdel":1},{"dicoId":61,"dicoCountryid":"AN","dicoAreacode":0,"dicoLocationcode":599,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"네덜란드령 안틸 제도","dicoDescription":"","dicoIsdel":1},{"dicoId":69,"dicoCountryid":"AO","dicoAreacode":0,"dicoLocationcode":244,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"앙골라","dicoDescription":"","dicoIsdel":1},{"dicoId":77,"dicoCountryid":"AQ","dicoAreacode":0,"dicoLocationcode":672,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"ko-kr","dicoName":"남극주","dicoDescription":"","dicoIsdel":1},{"dicoId":85,"dicoCountryid":"AR","dicoAreacode":0,"dicoLocationcode":54,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"아르헨티나","dicoDescription":"","dicoIsdel":1},{"dicoId":93,"dicoCountryid":"AS","dicoAreacode":0,"dicoLocationcode":684,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"아메리칸 사모아","dicoDescription":"","dicoIsdel":1},{"dicoId":101,"dicoCountryid":"AT","dicoAreacode":3,"dicoLocationcode":43,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"오스트리아","dicoDescription":"","dicoIsdel":1},{"dicoId":109,"dicoCountryid":"AU","dicoAreacode":0,"dicoLocationcode":61,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"ko-kr","dicoName":"오스트레일리아","dicoDescription":"","dicoIsdel":1},{"dicoId":117,"dicoCountryid":"AW","dicoAreacode":0,"dicoLocationcode":297,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"아루바","dicoDescription":"","dicoIsdel":1},{"dicoId":125,"dicoCountryid":"AZ","dicoAreacode":0,"dicoLocationcode":994,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"아제르바이잔","dicoDescription":"","dicoIsdel":1},{"dicoId":133,"dicoCountryid":"BA","dicoAreacode":3,"dicoLocationcode":387,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"보스니아","dicoDescription":"","dicoIsdel":1},{"dicoId":141,"dicoCountryid":"BB","dicoAreacode":0,"dicoLocationcode":1246,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"바베이도스","dicoDescription":"","dicoIsdel":1},{"dicoId":149,"dicoCountryid":"BD","dicoAreacode":0,"dicoLocationcode":880,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"방글라데시","dicoDescription":"","dicoIsdel":1},{"dicoId":157,"dicoCountryid":"BE","dicoAreacode":3,"dicoLocationcode":32,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"벨기에","dicoDescription":"","dicoIsdel":1},{"dicoId":165,"dicoCountryid":"BF","dicoAreacode":0,"dicoLocationcode":226,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"부르키나파소","dicoDescription":"","dicoIsdel":1},{"dicoId":173,"dicoCountryid":"BG","dicoAreacode":3,"dicoLocationcode":359,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"불가리아","dicoDescription":"","dicoIsdel":1},{"dicoId":181,"dicoCountryid":"BH","dicoAreacode":0,"dicoLocationcode":973,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"바레인","dicoDescription":"","dicoIsdel":1},{"dicoId":189,"dicoCountryid":"BI","dicoAreacode":0,"dicoLocationcode":257,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"부룬디","dicoDescription":"","dicoIsdel":1},{"dicoId":197,"dicoCountryid":"BJ","dicoAreacode":0,"dicoLocationcode":229,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"베냉","dicoDescription":"","dicoIsdel":1},{"dicoId":205,"dicoCountryid":"BM","dicoAreacode":0,"dicoLocationcode":1441,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"버뮤다","dicoDescription":"","dicoIsdel":1},{"dicoId":213,"dicoCountryid":"BN","dicoAreacode":0,"dicoLocationcode":673,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"ko-kr","dicoName":"브루나이","dicoDescription":"","dicoIsdel":1},{"dicoId":221,"dicoCountryid":"BO","dicoAreacode":0,"dicoLocationcode":591,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"볼리비아","dicoDescription":"","dicoIsdel":1},{"dicoId":229,"dicoCountryid":"BR","dicoAreacode":0,"dicoLocationcode":55,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"브라질","dicoDescription":"","dicoIsdel":1},{"dicoId":237,"dicoCountryid":"BS","dicoAreacode":0,"dicoLocationcode":1242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"바하마","dicoDescription":"","dicoIsdel":1},{"dicoId":245,"dicoCountryid":"BT","dicoAreacode":0,"dicoLocationcode":975,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"부탄","dicoDescription":"","dicoIsdel":1},{"dicoId":253,"dicoCountryid":"BW","dicoAreacode":0,"dicoLocationcode":267,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"보츠와나","dicoDescription":"","dicoIsdel":1},{"dicoId":261,"dicoCountryid":"BY","dicoAreacode":3,"dicoLocationcode":375,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"벨로루시","dicoDescription":"","dicoIsdel":1},{"dicoId":269,"dicoCountryid":"BZ","dicoAreacode":0,"dicoLocationcode":501,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"벨리즈","dicoDescription":"","dicoIsdel":1},{"dicoId":277,"dicoCountryid":"CA","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"캐나다","dicoDescription":"","dicoIsdel":1},{"dicoId":285,"dicoCountryid":"CF","dicoAreacode":0,"dicoLocationcode":236,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"중앙아프리카공화국","dicoDescription":"","dicoIsdel":1},{"dicoId":293,"dicoCountryid":"CG","dicoAreacode":0,"dicoLocationcode":243,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"콩고민주공화국","dicoDescription":"","dicoIsdel":1},{"dicoId":301,"dicoCountryid":"CGB","dicoAreacode":0,"dicoLocationcode":242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"Congo-Brazzaville","dicoDescription":"","dicoIsdel":1},{"dicoId":309,"dicoCountryid":"CH","dicoAreacode":3,"dicoLocationcode":41,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"스위스","dicoDescription":"","dicoIsdel":1},{"dicoId":317,"dicoCountryid":"CI","dicoAreacode":0,"dicoLocationcode":225,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"코트디부아르","dicoDescription":"","dicoIsdel":1},{"dicoId":325,"dicoCountryid":"CK","dicoAreacode":0,"dicoLocationcode":682,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"쿡제도","dicoDescription":"","dicoIsdel":1},{"dicoId":333,"dicoCountryid":"CL","dicoAreacode":0,"dicoLocationcode":56,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"칠레","dicoDescription":"","dicoIsdel":1},{"dicoId":341,"dicoCountryid":"CM","dicoAreacode":0,"dicoLocationcode":237,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"카메룬","dicoDescription":"","dicoIsdel":1},{"dicoId":349,"dicoCountryid":"CN","dicoAreacode":1,"dicoLocationcode":86,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"중국","dicoDescription":"","dicoIsdel":1},{"dicoId":357,"dicoCountryid":"CO","dicoAreacode":0,"dicoLocationcode":57,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"콜롬비아","dicoDescription":"","dicoIsdel":1},{"dicoId":365,"dicoCountryid":"CR","dicoAreacode":0,"dicoLocationcode":506,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"코스타리카","dicoDescription":"","dicoIsdel":1},{"dicoId":373,"dicoCountryid":"CU","dicoAreacode":0,"dicoLocationcode":53,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"쿠바","dicoDescription":"","dicoIsdel":1},{"dicoId":381,"dicoCountryid":"CV","dicoAreacode":0,"dicoLocationcode":238,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"카보베르데","dicoDescription":"","dicoIsdel":1},{"dicoId":389,"dicoCountryid":"CY","dicoAreacode":3,"dicoLocationcode":357,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"키프로스","dicoDescription":"","dicoIsdel":1},{"dicoId":397,"dicoCountryid":"CZ","dicoAreacode":3,"dicoLocationcode":420,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"체코","dicoDescription":"","dicoIsdel":1},{"dicoId":405,"dicoCountryid":"DE","dicoAreacode":3,"dicoLocationcode":49,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"독일","dicoDescription":"","dicoIsdel":1},{"dicoId":413,"dicoCountryid":"DJ","dicoAreacode":0,"dicoLocationcode":253,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"지부티","dicoDescription":"","dicoIsdel":1},{"dicoId":421,"dicoCountryid":"DK","dicoAreacode":3,"dicoLocationcode":45,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"덴마크","dicoDescription":"","dicoIsdel":1},{"dicoId":429,"dicoCountryid":"DM","dicoAreacode":0,"dicoLocationcode":1767,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"도미니카연방","dicoDescription":"","dicoIsdel":1},{"dicoId":437,"dicoCountryid":"DO","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"도미니카공화국","dicoDescription":"","dicoIsdel":1},{"dicoId":445,"dicoCountryid":"DZ","dicoAreacode":0,"dicoLocationcode":213,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"알제리","dicoDescription":"","dicoIsdel":1},{"dicoId":453,"dicoCountryid":"EC","dicoAreacode":0,"dicoLocationcode":593,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"에콰도르","dicoDescription":"","dicoIsdel":1},{"dicoId":461,"dicoCountryid":"EE","dicoAreacode":3,"dicoLocationcode":372,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"에스토니아","dicoDescription":"","dicoIsdel":1},{"dicoId":469,"dicoCountryid":"EG","dicoAreacode":0,"dicoLocationcode":20,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"이집트","dicoDescription":"","dicoIsdel":1},{"dicoId":477,"dicoCountryid":"EH","dicoAreacode":0,"dicoLocationcode":0,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"서사하라 ","dicoDescription":"","dicoIsdel":1},{"dicoId":485,"dicoCountryid":"ER","dicoAreacode":0,"dicoLocationcode":291,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"에리트리아","dicoDescription":"","dicoIsdel":1},{"dicoId":493,"dicoCountryid":"ES","dicoAreacode":3,"dicoLocationcode":34,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"스페인","dicoDescription":"","dicoIsdel":1},{"dicoId":501,"dicoCountryid":"ET","dicoAreacode":0,"dicoLocationcode":251,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"에티오피아","dicoDescription":"","dicoIsdel":1},{"dicoId":509,"dicoCountryid":"FI","dicoAreacode":3,"dicoLocationcode":358,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"핀란드","dicoDescription":"","dicoIsdel":1},{"dicoId":517,"dicoCountryid":"FJ","dicoAreacode":0,"dicoLocationcode":679,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"ko-kr","dicoName":"피지","dicoDescription":"","dicoIsdel":1},{"dicoId":525,"dicoCountryid":"FK","dicoAreacode":0,"dicoLocationcode":500,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"포클랜드 제도","dicoDescription":"","dicoIsdel":1},{"dicoId":533,"dicoCountryid":"FM","dicoAreacode":0,"dicoLocationcode":691,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"ko-kr","dicoName":"미크로네시아","dicoDescription":"","dicoIsdel":1},{"dicoId":541,"dicoCountryid":"FO","dicoAreacode":3,"dicoLocationcode":298,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"페로 제도","dicoDescription":"","dicoIsdel":1},{"dicoId":549,"dicoCountryid":"FR","dicoAreacode":3,"dicoLocationcode":33,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"프랑스","dicoDescription":"","dicoIsdel":1},{"dicoId":557,"dicoCountryid":"GA","dicoAreacode":0,"dicoLocationcode":241,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"가봉","dicoDescription":"","dicoIsdel":1},{"dicoId":565,"dicoCountryid":"GB","dicoAreacode":3,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"영국","dicoDescription":"","dicoIsdel":1},{"dicoId":573,"dicoCountryid":"GCI","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"건지 섬","dicoDescription":"","dicoIsdel":1},{"dicoId":581,"dicoCountryid":"GD","dicoAreacode":0,"dicoLocationcode":1473,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"그레나다","dicoDescription":"","dicoIsdel":1},{"dicoId":589,"dicoCountryid":"GE","dicoAreacode":0,"dicoLocationcode":995,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"그루지야","dicoDescription":"","dicoIsdel":1},{"dicoId":597,"dicoCountryid":"GF","dicoAreacode":0,"dicoLocationcode":689,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ko-kr","dicoName":"프랑스령 폴리네시아","dicoDescription":"","dicoIsdel":1},{"dicoId":605,"dicoCountryid":"GFN","dicoAreacode":0,"dicoLocationcode":594,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"French Guiana","dicoDescription":"","dicoIsdel":1},{"dicoId":613,"dicoCountryid":"GH","dicoAreacode":0,"dicoLocationcode":233,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"가나","dicoDescription":"","dicoIsdel":1},{"dicoId":621,"dicoCountryid":"GI","dicoAreacode":0,"dicoLocationcode":350,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"지브롤터","dicoDescription":"","dicoIsdel":1},{"dicoId":629,"dicoCountryid":"GL","dicoAreacode":0,"dicoLocationcode":299,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"그린란드","dicoDescription":"","dicoIsdel":1},{"dicoId":637,"dicoCountryid":"GM","dicoAreacode":0,"dicoLocationcode":220,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"감비아","dicoDescription":"","dicoIsdel":1},{"dicoId":645,"dicoCountryid":"GN","dicoAreacode":0,"dicoLocationcode":224,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"기니","dicoDescription":"","dicoIsdel":1},{"dicoId":653,"dicoCountryid":"GP","dicoAreacode":0,"dicoLocationcode":590,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"과들루프","dicoDescription":"","dicoIsdel":1},{"dicoId":661,"dicoCountryid":"GQ","dicoAreacode":0,"dicoLocationcode":240,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"적도 기니","dicoDescription":"","dicoIsdel":1},{"dicoId":669,"dicoCountryid":"GR","dicoAreacode":3,"dicoLocationcode":30,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"그리스","dicoDescription":"","dicoIsdel":1},{"dicoId":677,"dicoCountryid":"GT","dicoAreacode":0,"dicoLocationcode":502,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"과테말라","dicoDescription":"","dicoIsdel":1},{"dicoId":685,"dicoCountryid":"GU","dicoAreacode":0,"dicoLocationcode":1671,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"괌","dicoDescription":"","dicoIsdel":1},{"dicoId":693,"dicoCountryid":"GW","dicoAreacode":0,"dicoLocationcode":245,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"기니비사우","dicoDescription":"","dicoIsdel":1},{"dicoId":701,"dicoCountryid":"GY","dicoAreacode":0,"dicoLocationcode":592,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ko-kr","dicoName":"가이아나","dicoDescription":"","dicoIsdel":1}]}
        var platformJPCountryGroupMap={"T-Z":[{"dicoId":1572,"dicoCountryid":"TC","dicoAreacode":0,"dicoLocationcode":1649,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"Turks and Caicos Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":1580,"dicoCountryid":"TD","dicoAreacode":0,"dicoLocationcode":235,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"チャド","dicoDescription":"","dicoIsdel":1},{"dicoId":1588,"dicoCountryid":"TG","dicoAreacode":0,"dicoLocationcode":228,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"トーゴ","dicoDescription":"","dicoIsdel":1},{"dicoId":1596,"dicoCountryid":"TH","dicoAreacode":0,"dicoLocationcode":66,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"タイ","dicoDescription":"","dicoIsdel":1},{"dicoId":1604,"dicoCountryid":"TJ","dicoAreacode":0,"dicoLocationcode":992,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"タジキスタン","dicoDescription":"","dicoIsdel":1},{"dicoId":1612,"dicoCountryid":"TK","dicoAreacode":0,"dicoLocationcode":993,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"トルクメニスタン","dicoDescription":"","dicoIsdel":1},{"dicoId":1620,"dicoCountryid":"TL","dicoAreacode":0,"dicoLocationcode":670,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"東チモール","dicoDescription":"","dicoIsdel":1},{"dicoId":1628,"dicoCountryid":"TN","dicoAreacode":0,"dicoLocationcode":216,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"チュニジア","dicoDescription":"","dicoIsdel":1},{"dicoId":1636,"dicoCountryid":"TO","dicoAreacode":0,"dicoLocationcode":676,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"ja-jp","dicoName":"トンガ","dicoDescription":"","dicoIsdel":1},{"dicoId":1644,"dicoCountryid":"TR","dicoAreacode":0,"dicoLocationcode":90,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"七面鳥","dicoDescription":"","dicoIsdel":1},{"dicoId":1652,"dicoCountryid":"TT","dicoAreacode":0,"dicoLocationcode":1868,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"トリニダード·トバゴ","dicoDescription":"","dicoIsdel":1},{"dicoId":1660,"dicoCountryid":"TV","dicoAreacode":0,"dicoLocationcode":688,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ja-jp","dicoName":"ツバル","dicoDescription":"","dicoIsdel":1},{"dicoId":1668,"dicoCountryid":"TW","dicoAreacode":1,"dicoLocationcode":886,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"台湾（中国）","dicoDescription":"","dicoIsdel":1},{"dicoId":1676,"dicoCountryid":"TZ","dicoAreacode":0,"dicoLocationcode":255,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"タンザニア","dicoDescription":"","dicoIsdel":1},{"dicoId":1684,"dicoCountryid":"UA","dicoAreacode":3,"dicoLocationcode":380,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ウクライナ","dicoDescription":"","dicoIsdel":1},{"dicoId":1692,"dicoCountryid":"UG","dicoAreacode":0,"dicoLocationcode":256,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ウガンダ","dicoDescription":"","dicoIsdel":1},{"dicoId":1700,"dicoCountryid":"US","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"米国","dicoDescription":"","dicoIsdel":1},{"dicoId":1708,"dicoCountryid":"UY","dicoAreacode":0,"dicoLocationcode":598,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ウルグアイ","dicoDescription":"","dicoIsdel":1},{"dicoId":1716,"dicoCountryid":"UZ","dicoAreacode":0,"dicoLocationcode":998,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ウズベキスタン","dicoDescription":"","dicoIsdel":1},{"dicoId":1724,"dicoCountryid":"VA","dicoAreacode":3,"dicoLocationcode":379,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"バチカン市国","dicoDescription":"","dicoIsdel":1},{"dicoId":1732,"dicoCountryid":"VCT","dicoAreacode":0,"dicoLocationcode":784,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"Saint Vincent and the Grenadines","dicoDescription":"","dicoIsdel":1},{"dicoId":1740,"dicoCountryid":"VE","dicoAreacode":0,"dicoLocationcode":58,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ベネズエラ","dicoDescription":"","dicoIsdel":1},{"dicoId":1748,"dicoCountryid":"VG","dicoAreacode":0,"dicoLocationcode":1284,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"バージン諸島（イギリス）","dicoDescription":"","dicoIsdel":1},{"dicoId":1756,"dicoCountryid":"VI","dicoAreacode":0,"dicoLocationcode":1340,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"バージン諸島（米国）","dicoDescription":"","dicoIsdel":1},{"dicoId":1764,"dicoCountryid":"VN","dicoAreacode":0,"dicoLocationcode":84,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ベトナム","dicoDescription":"","dicoIsdel":1},{"dicoId":1772,"dicoCountryid":"VU","dicoAreacode":0,"dicoLocationcode":678,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"ja-jp","dicoName":"バヌアツ","dicoDescription":"","dicoIsdel":1},{"dicoId":1780,"dicoCountryid":"WF","dicoAreacode":0,"dicoLocationcode":681,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ワリー·エ·フトゥーナ","dicoDescription":"","dicoIsdel":1},{"dicoId":1788,"dicoCountryid":"WS","dicoAreacode":0,"dicoLocationcode":685,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"サモア","dicoDescription":"","dicoIsdel":1},{"dicoId":1796,"dicoCountryid":"YE","dicoAreacode":0,"dicoLocationcode":967,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"イエメン","dicoDescription":"","dicoIsdel":1},{"dicoId":1804,"dicoCountryid":"ZA","dicoAreacode":0,"dicoLocationcode":27,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"南アフリカ","dicoDescription":"","dicoIsdel":1},{"dicoId":1812,"dicoCountryid":"ZM","dicoAreacode":0,"dicoLocationcode":260,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ザンビア","dicoDescription":"","dicoIsdel":1},{"dicoId":1820,"dicoCountryid":"ZW","dicoAreacode":0,"dicoLocationcode":263,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ジンバブエ","dicoDescription":"","dicoIsdel":1},{"dicoId":1828,"dicoCountryid":"ZXA","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"Jersey","dicoDescription":"","dicoIsdel":1}],"N-S":[{"dicoId":1188,"dicoCountryid":"NA","dicoAreacode":0,"dicoLocationcode":264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ナミビア","dicoDescription":"","dicoIsdel":1},{"dicoId":1196,"dicoCountryid":"NC","dicoAreacode":0,"dicoLocationcode":687,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ja-jp","dicoName":"ニューカレドニア","dicoDescription":"","dicoIsdel":1},{"dicoId":1204,"dicoCountryid":"NE","dicoAreacode":0,"dicoLocationcode":227,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ニジェール","dicoDescription":"","dicoIsdel":1},{"dicoId":1212,"dicoCountryid":"NG","dicoAreacode":0,"dicoLocationcode":234,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ナイジェリア","dicoDescription":"","dicoIsdel":1},{"dicoId":1220,"dicoCountryid":"NI","dicoAreacode":0,"dicoLocationcode":505,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ニカラグア","dicoDescription":"","dicoIsdel":1},{"dicoId":1228,"dicoCountryid":"NL","dicoAreacode":3,"dicoLocationcode":31,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"オランダ","dicoDescription":"","dicoIsdel":1},{"dicoId":1236,"dicoCountryid":"NO","dicoAreacode":3,"dicoLocationcode":47,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ノルウェー","dicoDescription":"","dicoIsdel":1},{"dicoId":1244,"dicoCountryid":"NP","dicoAreacode":0,"dicoLocationcode":977,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ネパール","dicoDescription":"","dicoIsdel":1},{"dicoId":1252,"dicoCountryid":"NR","dicoAreacode":0,"dicoLocationcode":674,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"ja-jp","dicoName":"ナウル","dicoDescription":"","dicoIsdel":1},{"dicoId":1260,"dicoCountryid":"NZ","dicoAreacode":0,"dicoLocationcode":64,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"ja-jp","dicoName":"ニュージーランド","dicoDescription":"","dicoIsdel":1},{"dicoId":1268,"dicoCountryid":"OM","dicoAreacode":0,"dicoLocationcode":968,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"オマーン","dicoDescription":"","dicoIsdel":1},{"dicoId":1276,"dicoCountryid":"PA","dicoAreacode":0,"dicoLocationcode":507,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"パナマ","dicoDescription":"","dicoIsdel":1},{"dicoId":1284,"dicoCountryid":"PC","dicoAreacode":0,"dicoLocationcode":870,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ピトケアン諸島","dicoDescription":"","dicoIsdel":1},{"dicoId":1292,"dicoCountryid":"PE","dicoAreacode":0,"dicoLocationcode":51,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ペルー","dicoDescription":"","dicoIsdel":1},{"dicoId":1300,"dicoCountryid":"PG","dicoAreacode":0,"dicoLocationcode":675,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"ja-jp","dicoName":"パプアニューギニア","dicoDescription":"","dicoIsdel":1},{"dicoId":1308,"dicoCountryid":"PH","dicoAreacode":0,"dicoLocationcode":63,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"フィリピン","dicoDescription":"","dicoIsdel":1},{"dicoId":1316,"dicoCountryid":"PK","dicoAreacode":0,"dicoLocationcode":92,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"パキスタン","dicoDescription":"","dicoIsdel":1},{"dicoId":1324,"dicoCountryid":"PL","dicoAreacode":3,"dicoLocationcode":48,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ポーランド","dicoDescription":"","dicoIsdel":1},{"dicoId":1332,"dicoCountryid":"PR","dicoAreacode":0,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"プエルトリコ","dicoDescription":"","dicoIsdel":1},{"dicoId":1340,"dicoCountryid":"PS","dicoAreacode":0,"dicoLocationcode":970,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"パレスチナ","dicoDescription":"","dicoIsdel":1},{"dicoId":1348,"dicoCountryid":"PT","dicoAreacode":3,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ポルトガル","dicoDescription":"","dicoIsdel":1},{"dicoId":1356,"dicoCountryid":"PW","dicoAreacode":0,"dicoLocationcode":97,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"パラオ","dicoDescription":"","dicoIsdel":1},{"dicoId":1364,"dicoCountryid":"PY","dicoAreacode":0,"dicoLocationcode":595,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"パラグアイ","dicoDescription":"","dicoIsdel":1},{"dicoId":1372,"dicoCountryid":"QA","dicoAreacode":0,"dicoLocationcode":974,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"カタール","dicoDescription":"","dicoIsdel":1},{"dicoId":1380,"dicoCountryid":"RE","dicoAreacode":0,"dicoLocationcode":262,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"レユニオン","dicoDescription":"","dicoIsdel":1},{"dicoId":1388,"dicoCountryid":"RO","dicoAreacode":3,"dicoLocationcode":40,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ルーマニア","dicoDescription":"","dicoIsdel":1},{"dicoId":1396,"dicoCountryid":"RS","dicoAreacode":3,"dicoLocationcode":381,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"セルビア","dicoDescription":"","dicoIsdel":1},{"dicoId":1404,"dicoCountryid":"RU","dicoAreacode":3,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ロシア","dicoDescription":"","dicoIsdel":1},{"dicoId":1412,"dicoCountryid":"RW","dicoAreacode":0,"dicoLocationcode":250,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ルワンダ","dicoDescription":"","dicoIsdel":1},{"dicoId":1420,"dicoCountryid":"SA","dicoAreacode":0,"dicoLocationcode":966,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"サウジアラビア","dicoDescription":"","dicoIsdel":1},{"dicoId":1428,"dicoCountryid":"SB","dicoAreacode":0,"dicoLocationcode":677,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ja-jp","dicoName":"ソロモン諸島","dicoDescription":"","dicoIsdel":1},{"dicoId":1436,"dicoCountryid":"SC","dicoAreacode":0,"dicoLocationcode":248,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"セイシェル","dicoDescription":"","dicoIsdel":1},{"dicoId":1444,"dicoCountryid":"SD","dicoAreacode":0,"dicoLocationcode":249,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"スーダン","dicoDescription":"","dicoIsdel":1},{"dicoId":1452,"dicoCountryid":"SE","dicoAreacode":3,"dicoLocationcode":46,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"スウェーデン","dicoDescription":"","dicoIsdel":1},{"dicoId":1460,"dicoCountryid":"SG","dicoAreacode":0,"dicoLocationcode":65,"dicoIssms":1,"dicoJetlag":0.3,"dicoLanguage":"ja-jp","dicoName":"シンガポール","dicoDescription":"","dicoIsdel":1},{"dicoId":1468,"dicoCountryid":"SI","dicoAreacode":3,"dicoLocationcode":386,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"スロベニア","dicoDescription":"","dicoIsdel":1},{"dicoId":1476,"dicoCountryid":"SIA","dicoAreacode":0,"dicoLocationcode":809,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ja-jp","dicoName":"French West Indies","dicoDescription":"","dicoIsdel":1},{"dicoId":1484,"dicoCountryid":"SK","dicoAreacode":3,"dicoLocationcode":421,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"スロバキア","dicoDescription":"","dicoIsdel":1},{"dicoId":1492,"dicoCountryid":"SL","dicoAreacode":0,"dicoLocationcode":232,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"シエラレオネ","dicoDescription":"","dicoIsdel":1},{"dicoId":1500,"dicoCountryid":"SM","dicoAreacode":3,"dicoLocationcode":378,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"サン·マリノ","dicoDescription":"","dicoIsdel":1},{"dicoId":1508,"dicoCountryid":"SN","dicoAreacode":0,"dicoLocationcode":221,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"セネガル","dicoDescription":"","dicoIsdel":1},{"dicoId":1516,"dicoCountryid":"SO","dicoAreacode":0,"dicoLocationcode":252,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ソマリア","dicoDescription":"","dicoIsdel":1},{"dicoId":1524,"dicoCountryid":"SR","dicoAreacode":0,"dicoLocationcode":597,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"スリナム","dicoDescription":"","dicoIsdel":1},{"dicoId":1532,"dicoCountryid":"SSD","dicoAreacode":0,"dicoLocationcode":211,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"南スーダン","dicoDescription":"","dicoIsdel":1},{"dicoId":1540,"dicoCountryid":"ST","dicoAreacode":0,"dicoLocationcode":239,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"サントメプリンシペ＆","dicoDescription":"","dicoIsdel":1},{"dicoId":1548,"dicoCountryid":"SV","dicoAreacode":0,"dicoLocationcode":503,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"エルサルバドル","dicoDescription":"","dicoIsdel":1},{"dicoId":1556,"dicoCountryid":"SY","dicoAreacode":0,"dicoLocationcode":963,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"シリア","dicoDescription":"","dicoIsdel":1},{"dicoId":1564,"dicoCountryid":"SZ","dicoAreacode":0,"dicoLocationcode":268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"スワジランド","dicoDescription":"","dicoIsdel":1}],"H-M":[{"dicoId":708,"dicoCountryid":"HK","dicoAreacode":1,"dicoLocationcode":852,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"香港（中国）","dicoDescription":"","dicoIsdel":1},{"dicoId":716,"dicoCountryid":"HN","dicoAreacode":0,"dicoLocationcode":504,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ホンジュラス","dicoDescription":"","dicoIsdel":1},{"dicoId":724,"dicoCountryid":"HR","dicoAreacode":3,"dicoLocationcode":385,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"クロアチア","dicoDescription":"","dicoIsdel":1},{"dicoId":732,"dicoCountryid":"HT","dicoAreacode":0,"dicoLocationcode":509,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ハイチ","dicoDescription":"","dicoIsdel":1},{"dicoId":740,"dicoCountryid":"HU","dicoAreacode":3,"dicoLocationcode":36,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ハンガリー","dicoDescription":"","dicoIsdel":1},{"dicoId":748,"dicoCountryid":"ID","dicoAreacode":0,"dicoLocationcode":62,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"インドネシア","dicoDescription":"","dicoIsdel":1},{"dicoId":756,"dicoCountryid":"IE","dicoAreacode":3,"dicoLocationcode":353,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アイルランド","dicoDescription":"","dicoIsdel":1},{"dicoId":764,"dicoCountryid":"IL","dicoAreacode":0,"dicoLocationcode":972,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"イスラエル","dicoDescription":"","dicoIsdel":1},{"dicoId":772,"dicoCountryid":"IM","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"マン島","dicoDescription":"","dicoIsdel":1},{"dicoId":780,"dicoCountryid":"IN","dicoAreacode":0,"dicoLocationcode":91,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"インド","dicoDescription":"","dicoIsdel":1},{"dicoId":788,"dicoCountryid":"IQ","dicoAreacode":0,"dicoLocationcode":964,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"イラク","dicoDescription":"","dicoIsdel":1},{"dicoId":796,"dicoCountryid":"IR","dicoAreacode":0,"dicoLocationcode":98,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"イラン","dicoDescription":"","dicoIsdel":1},{"dicoId":804,"dicoCountryid":"IS","dicoAreacode":3,"dicoLocationcode":354,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アイスランド","dicoDescription":"","dicoIsdel":1},{"dicoId":812,"dicoCountryid":"IT","dicoAreacode":3,"dicoLocationcode":39,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"イタリア","dicoDescription":"","dicoIsdel":1},{"dicoId":820,"dicoCountryid":"JM","dicoAreacode":0,"dicoLocationcode":1876,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ジャマイカ","dicoDescription":"","dicoIsdel":1},{"dicoId":828,"dicoCountryid":"JO","dicoAreacode":0,"dicoLocationcode":962,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ヨルダン","dicoDescription":"","dicoIsdel":1},{"dicoId":836,"dicoCountryid":"JP","dicoAreacode":2,"dicoLocationcode":81,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"ja-jp","dicoName":"日本","dicoDescription":"","dicoIsdel":1},{"dicoId":844,"dicoCountryid":"KE","dicoAreacode":0,"dicoLocationcode":254,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ケニア","dicoDescription":"","dicoIsdel":1},{"dicoId":852,"dicoCountryid":"KG","dicoAreacode":0,"dicoLocationcode":996,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"キルギスタン","dicoDescription":"","dicoIsdel":1},{"dicoId":860,"dicoCountryid":"KH","dicoAreacode":0,"dicoLocationcode":855,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"カンボジア","dicoDescription":"","dicoIsdel":1},{"dicoId":868,"dicoCountryid":"KI","dicoAreacode":0,"dicoLocationcode":686,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"キリバス","dicoDescription":"","dicoIsdel":1},{"dicoId":876,"dicoCountryid":"KM","dicoAreacode":0,"dicoLocationcode":269,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"コモロ","dicoDescription":"","dicoIsdel":1},{"dicoId":884,"dicoCountryid":"KNA","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"Saint Kitts and Nevis","dicoDescription":"","dicoIsdel":1},{"dicoId":892,"dicoCountryid":"KP","dicoAreacode":0,"dicoLocationcode":850,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"ja-jp","dicoName":"北朝鮮","dicoDescription":"","dicoIsdel":1},{"dicoId":900,"dicoCountryid":"KR","dicoAreacode":2,"dicoLocationcode":82,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"ja-jp","dicoName":"韓国","dicoDescription":"","dicoIsdel":1},{"dicoId":908,"dicoCountryid":"KW","dicoAreacode":0,"dicoLocationcode":965,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"クウェート","dicoDescription":"","dicoIsdel":1},{"dicoId":916,"dicoCountryid":"KY","dicoAreacode":0,"dicoLocationcode":1345,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ケイマン諸島","dicoDescription":"","dicoIsdel":1},{"dicoId":924,"dicoCountryid":"KZ","dicoAreacode":0,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"カザフスタン","dicoDescription":"","dicoIsdel":1},{"dicoId":932,"dicoCountryid":"LA","dicoAreacode":0,"dicoLocationcode":856,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ラオス","dicoDescription":"","dicoIsdel":1},{"dicoId":940,"dicoCountryid":"LB","dicoAreacode":0,"dicoLocationcode":961,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"レバノン","dicoDescription":"","dicoIsdel":1},{"dicoId":948,"dicoCountryid":"LC","dicoAreacode":0,"dicoLocationcode":1758,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"セントルシア","dicoDescription":"","dicoIsdel":1},{"dicoId":956,"dicoCountryid":"LI","dicoAreacode":3,"dicoLocationcode":423,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"リヒテンシュタイン","dicoDescription":"","dicoIsdel":1},{"dicoId":964,"dicoCountryid":"LK","dicoAreacode":0,"dicoLocationcode":94,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"スリランカ","dicoDescription":"","dicoIsdel":1},{"dicoId":972,"dicoCountryid":"LR","dicoAreacode":0,"dicoLocationcode":231,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"リベリア","dicoDescription":"","dicoIsdel":1},{"dicoId":980,"dicoCountryid":"LS","dicoAreacode":0,"dicoLocationcode":266,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"レソト","dicoDescription":"","dicoIsdel":1},{"dicoId":988,"dicoCountryid":"LT","dicoAreacode":3,"dicoLocationcode":370,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"リトアニア","dicoDescription":"","dicoIsdel":1},{"dicoId":996,"dicoCountryid":"LU","dicoAreacode":3,"dicoLocationcode":352,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ルクセンブルク","dicoDescription":"","dicoIsdel":1},{"dicoId":1004,"dicoCountryid":"LV","dicoAreacode":3,"dicoLocationcode":371,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ラトビア","dicoDescription":"","dicoIsdel":1},{"dicoId":1012,"dicoCountryid":"LY","dicoAreacode":0,"dicoLocationcode":218,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"リビア","dicoDescription":"","dicoIsdel":1},{"dicoId":1020,"dicoCountryid":"MA","dicoAreacode":0,"dicoLocationcode":212,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"モロッコ","dicoDescription":"","dicoIsdel":1},{"dicoId":1028,"dicoCountryid":"MC","dicoAreacode":3,"dicoLocationcode":377,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"モナコ","dicoDescription":"","dicoIsdel":1},{"dicoId":1036,"dicoCountryid":"MD","dicoAreacode":3,"dicoLocationcode":373,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"モルドバ","dicoDescription":"","dicoIsdel":1},{"dicoId":1044,"dicoCountryid":"ME","dicoAreacode":3,"dicoLocationcode":382,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"モンテネグロ","dicoDescription":"","dicoIsdel":1},{"dicoId":1052,"dicoCountryid":"MG","dicoAreacode":0,"dicoLocationcode":261,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"マダガスカル","dicoDescription":"","dicoIsdel":1},{"dicoId":1060,"dicoCountryid":"MH","dicoAreacode":0,"dicoLocationcode":692,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"ja-jp","dicoName":"マーシャル諸島","dicoDescription":"","dicoIsdel":1},{"dicoId":1068,"dicoCountryid":"MK","dicoAreacode":3,"dicoLocationcode":389,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"マケドニア（FYR）","dicoDescription":"","dicoIsdel":1},{"dicoId":1076,"dicoCountryid":"ML","dicoAreacode":0,"dicoLocationcode":223,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"マリ","dicoDescription":"","dicoIsdel":1},{"dicoId":1084,"dicoCountryid":"MM","dicoAreacode":0,"dicoLocationcode":95,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ミャンマー","dicoDescription":"","dicoIsdel":1},{"dicoId":1092,"dicoCountryid":"MN","dicoAreacode":0,"dicoLocationcode":976,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"モンゴル","dicoDescription":"","dicoIsdel":1},{"dicoId":1100,"dicoCountryid":"MO","dicoAreacode":1,"dicoLocationcode":853,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"マカオ（中国）","dicoDescription":"","dicoIsdel":1},{"dicoId":1108,"dicoCountryid":"MQ","dicoAreacode":0,"dicoLocationcode":596,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"マルティニーク島","dicoDescription":"","dicoIsdel":1},{"dicoId":1116,"dicoCountryid":"MR","dicoAreacode":0,"dicoLocationcode":222,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"モーリタニア","dicoDescription":"","dicoIsdel":1},{"dicoId":1124,"dicoCountryid":"MS","dicoAreacode":0,"dicoLocationcode":1664,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"モントセラト","dicoDescription":"","dicoIsdel":1},{"dicoId":1132,"dicoCountryid":"MT","dicoAreacode":3,"dicoLocationcode":356,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"マルタ","dicoDescription":"","dicoIsdel":1},{"dicoId":1140,"dicoCountryid":"MU","dicoAreacode":0,"dicoLocationcode":230,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"モーリシャス","dicoDescription":"","dicoIsdel":1},{"dicoId":1148,"dicoCountryid":"MV","dicoAreacode":0,"dicoLocationcode":960,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"モルディブ","dicoDescription":"","dicoIsdel":1},{"dicoId":1156,"dicoCountryid":"MW","dicoAreacode":0,"dicoLocationcode":265,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"マラウィ","dicoDescription":"","dicoIsdel":1},{"dicoId":1164,"dicoCountryid":"MX","dicoAreacode":0,"dicoLocationcode":52,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"メキシコ","dicoDescription":"","dicoIsdel":1},{"dicoId":1172,"dicoCountryid":"MY","dicoAreacode":0,"dicoLocationcode":60,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"マレーシア","dicoDescription":"","dicoIsdel":1},{"dicoId":1180,"dicoCountryid":"MZ","dicoAreacode":0,"dicoLocationcode":258,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"モザンビーク","dicoDescription":"","dicoIsdel":1}],"A-G":[{"dicoId":4,"dicoCountryid":"AD","dicoAreacode":3,"dicoLocationcode":376,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アンドラ","dicoDescription":"","dicoIsdel":1},{"dicoId":12,"dicoCountryid":"AE","dicoAreacode":0,"dicoLocationcode":971,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アラブ首長国連邦","dicoDescription":"","dicoIsdel":1},{"dicoId":20,"dicoCountryid":"AF","dicoAreacode":0,"dicoLocationcode":93,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アフガニスタン","dicoDescription":"","dicoIsdel":1},{"dicoId":28,"dicoCountryid":"AG","dicoAreacode":0,"dicoLocationcode":1268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アンチグアバーブーダ","dicoDescription":"","dicoIsdel":1},{"dicoId":36,"dicoCountryid":"AI","dicoAreacode":0,"dicoLocationcode":1264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アングィラ","dicoDescription":"","dicoIsdel":1},{"dicoId":44,"dicoCountryid":"AL","dicoAreacode":3,"dicoLocationcode":355,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アルバニア","dicoDescription":"","dicoIsdel":1},{"dicoId":52,"dicoCountryid":"AM","dicoAreacode":0,"dicoLocationcode":374,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アルメニア","dicoDescription":"","dicoIsdel":1},{"dicoId":60,"dicoCountryid":"AN","dicoAreacode":0,"dicoLocationcode":599,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"オランダ領アンティル","dicoDescription":"","dicoIsdel":1},{"dicoId":68,"dicoCountryid":"AO","dicoAreacode":0,"dicoLocationcode":244,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アンゴラ","dicoDescription":"","dicoIsdel":1},{"dicoId":76,"dicoCountryid":"AQ","dicoAreacode":0,"dicoLocationcode":672,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"ja-jp","dicoName":"南極大陸","dicoDescription":"","dicoIsdel":1},{"dicoId":84,"dicoCountryid":"AR","dicoAreacode":0,"dicoLocationcode":54,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アルゼンチン","dicoDescription":"","dicoIsdel":1},{"dicoId":92,"dicoCountryid":"AS","dicoAreacode":0,"dicoLocationcode":684,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アメリカ領サモア","dicoDescription":"","dicoIsdel":1},{"dicoId":100,"dicoCountryid":"AT","dicoAreacode":3,"dicoLocationcode":43,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"オーストリア","dicoDescription":"","dicoIsdel":1},{"dicoId":108,"dicoCountryid":"AU","dicoAreacode":0,"dicoLocationcode":61,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"ja-jp","dicoName":"オーストラリア","dicoDescription":"","dicoIsdel":1},{"dicoId":116,"dicoCountryid":"AW","dicoAreacode":0,"dicoLocationcode":297,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アルバ","dicoDescription":"","dicoIsdel":1},{"dicoId":124,"dicoCountryid":"AZ","dicoAreacode":0,"dicoLocationcode":994,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アゼルバイジャン","dicoDescription":"","dicoIsdel":1},{"dicoId":132,"dicoCountryid":"BA","dicoAreacode":3,"dicoLocationcode":387,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ボスニア＆ヘルツェゴビナ","dicoDescription":"","dicoIsdel":1},{"dicoId":140,"dicoCountryid":"BB","dicoAreacode":0,"dicoLocationcode":1246,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"バルバドス","dicoDescription":"","dicoIsdel":1},{"dicoId":148,"dicoCountryid":"BD","dicoAreacode":0,"dicoLocationcode":880,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"バングラデシュ","dicoDescription":"","dicoIsdel":1},{"dicoId":156,"dicoCountryid":"BE","dicoAreacode":3,"dicoLocationcode":32,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ベルギー","dicoDescription":"","dicoIsdel":1},{"dicoId":164,"dicoCountryid":"BF","dicoAreacode":0,"dicoLocationcode":226,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ブルキナファソ","dicoDescription":"","dicoIsdel":1},{"dicoId":172,"dicoCountryid":"BG","dicoAreacode":3,"dicoLocationcode":359,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ブルガリア","dicoDescription":"","dicoIsdel":1},{"dicoId":180,"dicoCountryid":"BH","dicoAreacode":0,"dicoLocationcode":973,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"バーレーン","dicoDescription":"","dicoIsdel":1},{"dicoId":188,"dicoCountryid":"BI","dicoAreacode":0,"dicoLocationcode":257,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ブルンジ","dicoDescription":"","dicoIsdel":1},{"dicoId":196,"dicoCountryid":"BJ","dicoAreacode":0,"dicoLocationcode":229,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ベニン","dicoDescription":"","dicoIsdel":1},{"dicoId":204,"dicoCountryid":"BM","dicoAreacode":0,"dicoLocationcode":1441,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"バミューダ","dicoDescription":"","dicoIsdel":1},{"dicoId":212,"dicoCountryid":"BN","dicoAreacode":0,"dicoLocationcode":673,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"ja-jp","dicoName":"ブルネイ","dicoDescription":"","dicoIsdel":1},{"dicoId":220,"dicoCountryid":"BO","dicoAreacode":0,"dicoLocationcode":591,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ボリビア","dicoDescription":"","dicoIsdel":1},{"dicoId":228,"dicoCountryid":"BR","dicoAreacode":0,"dicoLocationcode":55,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ブラジル","dicoDescription":"","dicoIsdel":1},{"dicoId":236,"dicoCountryid":"BS","dicoAreacode":0,"dicoLocationcode":1242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"バハマ","dicoDescription":"","dicoIsdel":1},{"dicoId":244,"dicoCountryid":"BT","dicoAreacode":0,"dicoLocationcode":975,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ブータン","dicoDescription":"","dicoIsdel":1},{"dicoId":252,"dicoCountryid":"BW","dicoAreacode":0,"dicoLocationcode":267,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ボツワナ","dicoDescription":"","dicoIsdel":1},{"dicoId":260,"dicoCountryid":"BY","dicoAreacode":3,"dicoLocationcode":375,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ベラルーシ","dicoDescription":"","dicoIsdel":1},{"dicoId":268,"dicoCountryid":"BZ","dicoAreacode":0,"dicoLocationcode":501,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ベリーズ","dicoDescription":"","dicoIsdel":1},{"dicoId":276,"dicoCountryid":"CA","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"カナダ","dicoDescription":"","dicoIsdel":1},{"dicoId":284,"dicoCountryid":"CF","dicoAreacode":0,"dicoLocationcode":236,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"中央アフリカ共和国","dicoDescription":"","dicoIsdel":1},{"dicoId":292,"dicoCountryid":"CG","dicoAreacode":0,"dicoLocationcode":243,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"コンゴ共和国","dicoDescription":"","dicoIsdel":1},{"dicoId":300,"dicoCountryid":"CGB","dicoAreacode":0,"dicoLocationcode":242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"Congo-Brazzaville","dicoDescription":"","dicoIsdel":1},{"dicoId":308,"dicoCountryid":"CH","dicoAreacode":3,"dicoLocationcode":41,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"スイス","dicoDescription":"","dicoIsdel":1},{"dicoId":316,"dicoCountryid":"CI","dicoAreacode":0,"dicoLocationcode":225,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"コートジボアール","dicoDescription":"","dicoIsdel":1},{"dicoId":324,"dicoCountryid":"CK","dicoAreacode":0,"dicoLocationcode":682,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"クック諸島","dicoDescription":"","dicoIsdel":1},{"dicoId":332,"dicoCountryid":"CL","dicoAreacode":0,"dicoLocationcode":56,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"チリ","dicoDescription":"","dicoIsdel":1},{"dicoId":340,"dicoCountryid":"CM","dicoAreacode":0,"dicoLocationcode":237,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"カメルーン","dicoDescription":"","dicoIsdel":1},{"dicoId":348,"dicoCountryid":"CN","dicoAreacode":1,"dicoLocationcode":86,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"中国","dicoDescription":"","dicoIsdel":1},{"dicoId":356,"dicoCountryid":"CO","dicoAreacode":0,"dicoLocationcode":57,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"コロンビア","dicoDescription":"","dicoIsdel":1},{"dicoId":364,"dicoCountryid":"CR","dicoAreacode":0,"dicoLocationcode":506,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"コスタリカ","dicoDescription":"","dicoIsdel":1},{"dicoId":372,"dicoCountryid":"CU","dicoAreacode":0,"dicoLocationcode":53,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"キューバ","dicoDescription":"","dicoIsdel":1},{"dicoId":380,"dicoCountryid":"CV","dicoAreacode":0,"dicoLocationcode":238,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"カーボベルデ","dicoDescription":"","dicoIsdel":1},{"dicoId":388,"dicoCountryid":"CY","dicoAreacode":3,"dicoLocationcode":357,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"キプロス","dicoDescription":"","dicoIsdel":1},{"dicoId":396,"dicoCountryid":"CZ","dicoAreacode":3,"dicoLocationcode":420,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"チェコ共和国","dicoDescription":"","dicoIsdel":1},{"dicoId":404,"dicoCountryid":"DE","dicoAreacode":3,"dicoLocationcode":49,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ドイツ","dicoDescription":"","dicoIsdel":1},{"dicoId":412,"dicoCountryid":"DJ","dicoAreacode":0,"dicoLocationcode":253,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ジブチ","dicoDescription":"","dicoIsdel":1},{"dicoId":420,"dicoCountryid":"DK","dicoAreacode":3,"dicoLocationcode":45,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"デンマーク","dicoDescription":"","dicoIsdel":1},{"dicoId":428,"dicoCountryid":"DM","dicoAreacode":0,"dicoLocationcode":1767,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ドミニカ","dicoDescription":"","dicoIsdel":1},{"dicoId":436,"dicoCountryid":"DO","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ドミニカ共和国","dicoDescription":"","dicoIsdel":1},{"dicoId":444,"dicoCountryid":"DZ","dicoAreacode":0,"dicoLocationcode":213,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"アルジェリア","dicoDescription":"","dicoIsdel":1},{"dicoId":452,"dicoCountryid":"EC","dicoAreacode":0,"dicoLocationcode":593,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"エクアドル","dicoDescription":"","dicoIsdel":1},{"dicoId":460,"dicoCountryid":"EE","dicoAreacode":3,"dicoLocationcode":372,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"エストニア","dicoDescription":"","dicoIsdel":1},{"dicoId":468,"dicoCountryid":"EG","dicoAreacode":0,"dicoLocationcode":20,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"エジプト","dicoDescription":"","dicoIsdel":1},{"dicoId":476,"dicoCountryid":"EH","dicoAreacode":0,"dicoLocationcode":0,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"西サハラ","dicoDescription":"","dicoIsdel":1},{"dicoId":484,"dicoCountryid":"ER","dicoAreacode":0,"dicoLocationcode":291,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"エリトリア","dicoDescription":"","dicoIsdel":1},{"dicoId":492,"dicoCountryid":"ES","dicoAreacode":3,"dicoLocationcode":34,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"スペイン","dicoDescription":"","dicoIsdel":1},{"dicoId":500,"dicoCountryid":"ET","dicoAreacode":0,"dicoLocationcode":251,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"エチオピア","dicoDescription":"","dicoIsdel":1},{"dicoId":508,"dicoCountryid":"FI","dicoAreacode":3,"dicoLocationcode":358,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"フィンランド","dicoDescription":"","dicoIsdel":1},{"dicoId":516,"dicoCountryid":"FJ","dicoAreacode":0,"dicoLocationcode":679,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"ja-jp","dicoName":"フィジー","dicoDescription":"","dicoIsdel":1},{"dicoId":524,"dicoCountryid":"FK","dicoAreacode":0,"dicoLocationcode":500,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"フォークランド諸島","dicoDescription":"","dicoIsdel":1},{"dicoId":532,"dicoCountryid":"FM","dicoAreacode":0,"dicoLocationcode":691,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"ja-jp","dicoName":"ミクロネシア","dicoDescription":"","dicoIsdel":1},{"dicoId":540,"dicoCountryid":"FO","dicoAreacode":3,"dicoLocationcode":298,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"フェロー諸島","dicoDescription":"","dicoIsdel":1},{"dicoId":548,"dicoCountryid":"FR","dicoAreacode":3,"dicoLocationcode":33,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"フランス","dicoDescription":"","dicoIsdel":1},{"dicoId":556,"dicoCountryid":"GA","dicoAreacode":0,"dicoLocationcode":241,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ガボン","dicoDescription":"","dicoIsdel":1},{"dicoId":564,"dicoCountryid":"GB","dicoAreacode":3,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"イギリス","dicoDescription":"","dicoIsdel":1},{"dicoId":572,"dicoCountryid":"GCI","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ガーンジー島","dicoDescription":"","dicoIsdel":1},{"dicoId":580,"dicoCountryid":"GD","dicoAreacode":0,"dicoLocationcode":1473,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"グレナダ","dicoDescription":"","dicoIsdel":1},{"dicoId":588,"dicoCountryid":"GE","dicoAreacode":0,"dicoLocationcode":995,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ジョージア","dicoDescription":"","dicoIsdel":1},{"dicoId":596,"dicoCountryid":"GF","dicoAreacode":0,"dicoLocationcode":689,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"ja-jp","dicoName":"フランス領ポリネシア","dicoDescription":"","dicoIsdel":1},{"dicoId":604,"dicoCountryid":"GFN","dicoAreacode":0,"dicoLocationcode":594,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"French Guiana","dicoDescription":"","dicoIsdel":1},{"dicoId":612,"dicoCountryid":"GH","dicoAreacode":0,"dicoLocationcode":233,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ガーナ","dicoDescription":"","dicoIsdel":1},{"dicoId":620,"dicoCountryid":"GI","dicoAreacode":0,"dicoLocationcode":350,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ジブラルタル","dicoDescription":"","dicoIsdel":1},{"dicoId":628,"dicoCountryid":"GL","dicoAreacode":0,"dicoLocationcode":299,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"グリーンランド","dicoDescription":"","dicoIsdel":1},{"dicoId":636,"dicoCountryid":"GM","dicoAreacode":0,"dicoLocationcode":220,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ガンビア","dicoDescription":"","dicoIsdel":1},{"dicoId":644,"dicoCountryid":"GN","dicoAreacode":0,"dicoLocationcode":224,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ギニア","dicoDescription":"","dicoIsdel":1},{"dicoId":652,"dicoCountryid":"GP","dicoAreacode":0,"dicoLocationcode":590,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"グアドループ島","dicoDescription":"","dicoIsdel":1},{"dicoId":660,"dicoCountryid":"GQ","dicoAreacode":0,"dicoLocationcode":240,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"赤道ギニア","dicoDescription":"","dicoIsdel":1},{"dicoId":668,"dicoCountryid":"GR","dicoAreacode":3,"dicoLocationcode":30,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ギリシャ","dicoDescription":"","dicoIsdel":1},{"dicoId":676,"dicoCountryid":"GT","dicoAreacode":0,"dicoLocationcode":502,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"グアテマラ","dicoDescription":"","dicoIsdel":1},{"dicoId":684,"dicoCountryid":"GU","dicoAreacode":0,"dicoLocationcode":1671,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"グアム","dicoDescription":"","dicoIsdel":1},{"dicoId":692,"dicoCountryid":"GW","dicoAreacode":0,"dicoLocationcode":245,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ギニアビサウ","dicoDescription":"","dicoIsdel":1},{"dicoId":700,"dicoCountryid":"GY","dicoAreacode":0,"dicoLocationcode":592,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"ja-jp","dicoName":"ガイアナ","dicoDescription":"","dicoIsdel":1}]}
        var platformDECountryGroupMap={"T-Z":[{"dicoId":1569,"dicoCountryid":"TC","dicoAreacode":0,"dicoLocationcode":1649,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Turks and Caicos Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":1577,"dicoCountryid":"TD","dicoAreacode":0,"dicoLocationcode":235,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"der Tschad ","dicoDescription":"","dicoIsdel":1},{"dicoId":1585,"dicoCountryid":"TG","dicoAreacode":0,"dicoLocationcode":228,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Togo ","dicoDescription":"","dicoIsdel":1},{"dicoId":1593,"dicoCountryid":"TH","dicoAreacode":0,"dicoLocationcode":66,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Thailand","dicoDescription":"","dicoIsdel":1},{"dicoId":1601,"dicoCountryid":"TJ","dicoAreacode":0,"dicoLocationcode":992,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Tadschikistan","dicoDescription":"","dicoIsdel":1},{"dicoId":1609,"dicoCountryid":"TK","dicoAreacode":0,"dicoLocationcode":993,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Turkmenistan ","dicoDescription":"","dicoIsdel":1},{"dicoId":1617,"dicoCountryid":"TL","dicoAreacode":0,"dicoLocationcode":670,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Ost-Timor","dicoDescription":"","dicoIsdel":1},{"dicoId":1625,"dicoCountryid":"TN","dicoAreacode":0,"dicoLocationcode":216,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Tunesien ","dicoDescription":"","dicoIsdel":1},{"dicoId":1633,"dicoCountryid":"TO","dicoAreacode":0,"dicoLocationcode":676,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"de-de","dicoName":"Tonga","dicoDescription":"","dicoIsdel":1},{"dicoId":1641,"dicoCountryid":"TR","dicoAreacode":0,"dicoLocationcode":90,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Türkei","dicoDescription":"","dicoIsdel":1},{"dicoId":1649,"dicoCountryid":"TT","dicoAreacode":0,"dicoLocationcode":1868,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Trinidad und Tobago ","dicoDescription":"","dicoIsdel":1},{"dicoId":1657,"dicoCountryid":"TV","dicoAreacode":0,"dicoLocationcode":688,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"de-de","dicoName":"Tuvalu ","dicoDescription":"","dicoIsdel":1},{"dicoId":1665,"dicoCountryid":"TW","dicoAreacode":1,"dicoLocationcode":886,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Taiwan(China)","dicoDescription":"","dicoIsdel":1},{"dicoId":1673,"dicoCountryid":"TZ","dicoAreacode":0,"dicoLocationcode":255,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Tansania","dicoDescription":"","dicoIsdel":1},{"dicoId":1681,"dicoCountryid":"UA","dicoAreacode":3,"dicoLocationcode":380,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Ukraine","dicoDescription":"","dicoIsdel":1},{"dicoId":1689,"dicoCountryid":"UG","dicoAreacode":0,"dicoLocationcode":256,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Uganda ","dicoDescription":"","dicoIsdel":1},{"dicoId":1697,"dicoCountryid":"US","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Amerika","dicoDescription":"","dicoIsdel":1},{"dicoId":1705,"dicoCountryid":"UY","dicoAreacode":0,"dicoLocationcode":598,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Uruguay ","dicoDescription":"","dicoIsdel":1},{"dicoId":1713,"dicoCountryid":"UZ","dicoAreacode":0,"dicoLocationcode":998,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Usbekistan ","dicoDescription":"","dicoIsdel":1},{"dicoId":1721,"dicoCountryid":"VA","dicoAreacode":3,"dicoLocationcode":379,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"der Vatikan","dicoDescription":"","dicoIsdel":1},{"dicoId":1729,"dicoCountryid":"VCT","dicoAreacode":0,"dicoLocationcode":784,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Saint Vincent and the Grenadines","dicoDescription":"","dicoIsdel":1},{"dicoId":1737,"dicoCountryid":"VE","dicoAreacode":0,"dicoLocationcode":58,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Venezuela","dicoDescription":"","dicoIsdel":1},{"dicoId":1745,"dicoCountryid":"VG","dicoAreacode":0,"dicoLocationcode":1284,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Britischen Jungferninseln ","dicoDescription":"","dicoIsdel":1},{"dicoId":1753,"dicoCountryid":"VI","dicoAreacode":0,"dicoLocationcode":1340,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Amerikanischen Jungferninseln ","dicoDescription":"","dicoIsdel":1},{"dicoId":1761,"dicoCountryid":"VN","dicoAreacode":0,"dicoLocationcode":84,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Vietnam","dicoDescription":"","dicoIsdel":1},{"dicoId":1769,"dicoCountryid":"VU","dicoAreacode":0,"dicoLocationcode":678,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"de-de","dicoName":"Vanuatu","dicoDescription":"","dicoIsdel":1},{"dicoId":1777,"dicoCountryid":"WF","dicoAreacode":0,"dicoLocationcode":681,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Wallis und Futuna","dicoDescription":"","dicoIsdel":1},{"dicoId":1785,"dicoCountryid":"WS","dicoAreacode":0,"dicoLocationcode":685,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Samoa","dicoDescription":"","dicoIsdel":1},{"dicoId":1793,"dicoCountryid":"YE","dicoAreacode":0,"dicoLocationcode":967,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Jemen ","dicoDescription":"","dicoIsdel":1},{"dicoId":1801,"dicoCountryid":"ZA","dicoAreacode":0,"dicoLocationcode":27,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Südafrika","dicoDescription":"","dicoIsdel":1},{"dicoId":1809,"dicoCountryid":"ZM","dicoAreacode":0,"dicoLocationcode":260,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Sambia","dicoDescription":"","dicoIsdel":1},{"dicoId":1817,"dicoCountryid":"ZW","dicoAreacode":0,"dicoLocationcode":263,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Simbabwe ","dicoDescription":"","dicoIsdel":1},{"dicoId":1825,"dicoCountryid":"ZXA","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Jersey","dicoDescription":"","dicoIsdel":1}],"N-S":[{"dicoId":1185,"dicoCountryid":"NA","dicoAreacode":0,"dicoLocationcode":264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Namibia","dicoDescription":"","dicoIsdel":1},{"dicoId":1193,"dicoCountryid":"NC","dicoAreacode":0,"dicoLocationcode":687,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"de-de","dicoName":"Neukaledonien","dicoDescription":"","dicoIsdel":1},{"dicoId":1201,"dicoCountryid":"NE","dicoAreacode":0,"dicoLocationcode":227,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Niger ","dicoDescription":"","dicoIsdel":1},{"dicoId":1209,"dicoCountryid":"NG","dicoAreacode":0,"dicoLocationcode":234,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Nigeria","dicoDescription":"","dicoIsdel":1},{"dicoId":1217,"dicoCountryid":"NI","dicoAreacode":0,"dicoLocationcode":505,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Nicaragua ","dicoDescription":"","dicoIsdel":1},{"dicoId":1225,"dicoCountryid":"NL","dicoAreacode":3,"dicoLocationcode":31,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Niederlande","dicoDescription":"","dicoIsdel":1},{"dicoId":1233,"dicoCountryid":"NO","dicoAreacode":3,"dicoLocationcode":47,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Norwegen","dicoDescription":"","dicoIsdel":1},{"dicoId":1241,"dicoCountryid":"NP","dicoAreacode":0,"dicoLocationcode":977,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Nepal","dicoDescription":"","dicoIsdel":1},{"dicoId":1249,"dicoCountryid":"NR","dicoAreacode":0,"dicoLocationcode":674,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"de-de","dicoName":"Nauru","dicoDescription":"","dicoIsdel":1},{"dicoId":1257,"dicoCountryid":"NZ","dicoAreacode":0,"dicoLocationcode":64,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"de-de","dicoName":"Neuseeland","dicoDescription":"","dicoIsdel":1},{"dicoId":1265,"dicoCountryid":"OM","dicoAreacode":0,"dicoLocationcode":968,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Amann","dicoDescription":"","dicoIsdel":1},{"dicoId":1273,"dicoCountryid":"PA","dicoAreacode":0,"dicoLocationcode":507,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Panama","dicoDescription":"","dicoIsdel":1},{"dicoId":1281,"dicoCountryid":"PC","dicoAreacode":0,"dicoLocationcode":870,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Pitcairninseln","dicoDescription":"","dicoIsdel":1},{"dicoId":1289,"dicoCountryid":"PE","dicoAreacode":0,"dicoLocationcode":51,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Peru ","dicoDescription":"","dicoIsdel":1},{"dicoId":1297,"dicoCountryid":"PG","dicoAreacode":0,"dicoLocationcode":675,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"de-de","dicoName":"Papua-Neuguinea","dicoDescription":"","dicoIsdel":1},{"dicoId":1305,"dicoCountryid":"PH","dicoAreacode":0,"dicoLocationcode":63,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Philippinen","dicoDescription":"","dicoIsdel":1},{"dicoId":1313,"dicoCountryid":"PK","dicoAreacode":0,"dicoLocationcode":92,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Pakistan","dicoDescription":"","dicoIsdel":1},{"dicoId":1321,"dicoCountryid":"PL","dicoAreacode":3,"dicoLocationcode":48,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Polen","dicoDescription":"","dicoIsdel":1},{"dicoId":1329,"dicoCountryid":"PR","dicoAreacode":0,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Puerto Rico","dicoDescription":"","dicoIsdel":1},{"dicoId":1337,"dicoCountryid":"PS","dicoAreacode":0,"dicoLocationcode":970,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Palästina","dicoDescription":"","dicoIsdel":1},{"dicoId":1345,"dicoCountryid":"PT","dicoAreacode":3,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Portugal ","dicoDescription":"","dicoIsdel":1},{"dicoId":1353,"dicoCountryid":"PW","dicoAreacode":0,"dicoLocationcode":97,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Palau","dicoDescription":"","dicoIsdel":1},{"dicoId":1361,"dicoCountryid":"PY","dicoAreacode":0,"dicoLocationcode":595,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Paraguay ","dicoDescription":"","dicoIsdel":1},{"dicoId":1369,"dicoCountryid":"QA","dicoAreacode":0,"dicoLocationcode":974,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Qatar","dicoDescription":"","dicoIsdel":1},{"dicoId":1377,"dicoCountryid":"RE","dicoAreacode":0,"dicoLocationcode":262,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Réunion","dicoDescription":"","dicoIsdel":1},{"dicoId":1385,"dicoCountryid":"RO","dicoAreacode":3,"dicoLocationcode":40,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Rumänien","dicoDescription":"","dicoIsdel":1},{"dicoId":1393,"dicoCountryid":"RS","dicoAreacode":3,"dicoLocationcode":381,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Serbien","dicoDescription":"","dicoIsdel":1},{"dicoId":1401,"dicoCountryid":"RU","dicoAreacode":3,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Russland","dicoDescription":"","dicoIsdel":1},{"dicoId":1409,"dicoCountryid":"RW","dicoAreacode":0,"dicoLocationcode":250,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Ruanda","dicoDescription":"","dicoIsdel":1},{"dicoId":1417,"dicoCountryid":"SA","dicoAreacode":0,"dicoLocationcode":966,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Saudi-Arabien","dicoDescription":"","dicoIsdel":1},{"dicoId":1425,"dicoCountryid":"SB","dicoAreacode":0,"dicoLocationcode":677,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"de-de","dicoName":"die Salomoneninseln","dicoDescription":"","dicoIsdel":1},{"dicoId":1433,"dicoCountryid":"SC","dicoAreacode":0,"dicoLocationcode":248,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Seychellen","dicoDescription":"","dicoIsdel":1},{"dicoId":1441,"dicoCountryid":"SD","dicoAreacode":0,"dicoLocationcode":249,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"der Sudan","dicoDescription":"","dicoIsdel":1},{"dicoId":1449,"dicoCountryid":"SE","dicoAreacode":3,"dicoLocationcode":46,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Schweden","dicoDescription":"","dicoIsdel":1},{"dicoId":1457,"dicoCountryid":"SG","dicoAreacode":0,"dicoLocationcode":65,"dicoIssms":1,"dicoJetlag":0.3,"dicoLanguage":"de-de","dicoName":"Singapur","dicoDescription":"","dicoIsdel":1},{"dicoId":1465,"dicoCountryid":"SI","dicoAreacode":3,"dicoLocationcode":386,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Slowenien","dicoDescription":"","dicoIsdel":1},{"dicoId":1473,"dicoCountryid":"SIA","dicoAreacode":0,"dicoLocationcode":809,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"de-de","dicoName":"French West Indies","dicoDescription":"","dicoIsdel":1},{"dicoId":1481,"dicoCountryid":"SK","dicoAreacode":3,"dicoLocationcode":421,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Slowakei","dicoDescription":"","dicoIsdel":1},{"dicoId":1489,"dicoCountryid":"SL","dicoAreacode":0,"dicoLocationcode":232,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Sierra Leone","dicoDescription":"","dicoIsdel":1},{"dicoId":1497,"dicoCountryid":"SM","dicoAreacode":3,"dicoLocationcode":378,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"San Marino ","dicoDescription":"","dicoIsdel":1},{"dicoId":1505,"dicoCountryid":"SN","dicoAreacode":0,"dicoLocationcode":221,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"der Senegal","dicoDescription":"","dicoIsdel":1},{"dicoId":1513,"dicoCountryid":"SO","dicoAreacode":0,"dicoLocationcode":252,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Somalia ","dicoDescription":"","dicoIsdel":1},{"dicoId":1521,"dicoCountryid":"SR","dicoAreacode":0,"dicoLocationcode":597,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Surinam","dicoDescription":"","dicoIsdel":1},{"dicoId":1529,"dicoCountryid":"SSD","dicoAreacode":0,"dicoLocationcode":211,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"der Südsudan","dicoDescription":"","dicoIsdel":1},{"dicoId":1537,"dicoCountryid":"ST","dicoAreacode":0,"dicoLocationcode":239,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"São Tomé und Príncipe ","dicoDescription":"","dicoIsdel":1},{"dicoId":1545,"dicoCountryid":"SV","dicoAreacode":0,"dicoLocationcode":503,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"El Salvador ","dicoDescription":"","dicoIsdel":1},{"dicoId":1553,"dicoCountryid":"SY","dicoAreacode":0,"dicoLocationcode":963,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Syrien","dicoDescription":"","dicoIsdel":1},{"dicoId":1561,"dicoCountryid":"SZ","dicoAreacode":0,"dicoLocationcode":268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Swasiland","dicoDescription":"","dicoIsdel":1}],"H-M":[{"dicoId":705,"dicoCountryid":"HK","dicoAreacode":1,"dicoLocationcode":852,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Hongkong(China)","dicoDescription":"","dicoIsdel":1},{"dicoId":713,"dicoCountryid":"HN","dicoAreacode":0,"dicoLocationcode":504,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Honduras","dicoDescription":"","dicoIsdel":1},{"dicoId":721,"dicoCountryid":"HR","dicoAreacode":3,"dicoLocationcode":385,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kroatien","dicoDescription":"","dicoIsdel":1},{"dicoId":729,"dicoCountryid":"HT","dicoAreacode":0,"dicoLocationcode":509,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Haiti ","dicoDescription":"","dicoIsdel":1},{"dicoId":737,"dicoCountryid":"HU","dicoAreacode":3,"dicoLocationcode":36,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Ungarn ","dicoDescription":"","dicoIsdel":1},{"dicoId":745,"dicoCountryid":"ID","dicoAreacode":0,"dicoLocationcode":62,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Indonesien","dicoDescription":"","dicoIsdel":1},{"dicoId":753,"dicoCountryid":"IE","dicoAreacode":3,"dicoLocationcode":353,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Irland ","dicoDescription":"","dicoIsdel":1},{"dicoId":761,"dicoCountryid":"IL","dicoAreacode":0,"dicoLocationcode":972,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Israel","dicoDescription":"","dicoIsdel":1},{"dicoId":769,"dicoCountryid":"IM","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Insel Man","dicoDescription":"","dicoIsdel":1},{"dicoId":777,"dicoCountryid":"IN","dicoAreacode":0,"dicoLocationcode":91,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Indien","dicoDescription":"","dicoIsdel":1},{"dicoId":785,"dicoCountryid":"IQ","dicoAreacode":0,"dicoLocationcode":964,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"der Irak ","dicoDescription":"","dicoIsdel":1},{"dicoId":793,"dicoCountryid":"IR","dicoAreacode":0,"dicoLocationcode":98,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"der Iran","dicoDescription":"","dicoIsdel":1},{"dicoId":801,"dicoCountryid":"IS","dicoAreacode":3,"dicoLocationcode":354,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Island ","dicoDescription":"","dicoIsdel":1},{"dicoId":809,"dicoCountryid":"IT","dicoAreacode":3,"dicoLocationcode":39,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Italien ","dicoDescription":"","dicoIsdel":1},{"dicoId":817,"dicoCountryid":"JM","dicoAreacode":0,"dicoLocationcode":1876,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Jamaika ","dicoDescription":"","dicoIsdel":1},{"dicoId":825,"dicoCountryid":"JO","dicoAreacode":0,"dicoLocationcode":962,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Jordanien  ","dicoDescription":"","dicoIsdel":1},{"dicoId":833,"dicoCountryid":"JP","dicoAreacode":2,"dicoLocationcode":81,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"de-de","dicoName":"Japan","dicoDescription":"","dicoIsdel":1},{"dicoId":841,"dicoCountryid":"KE","dicoAreacode":0,"dicoLocationcode":254,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kenia","dicoDescription":"","dicoIsdel":1},{"dicoId":849,"dicoCountryid":"KG","dicoAreacode":0,"dicoLocationcode":996,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kirgisistan","dicoDescription":"","dicoIsdel":1},{"dicoId":857,"dicoCountryid":"KH","dicoAreacode":0,"dicoLocationcode":855,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kambodscha  ","dicoDescription":"","dicoIsdel":1},{"dicoId":865,"dicoCountryid":"KI","dicoAreacode":0,"dicoLocationcode":686,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kiribati ","dicoDescription":"","dicoIsdel":1},{"dicoId":873,"dicoCountryid":"KM","dicoAreacode":0,"dicoLocationcode":269,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Komoren","dicoDescription":"","dicoIsdel":1},{"dicoId":881,"dicoCountryid":"KNA","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Saint Kitts and Nevis","dicoDescription":"","dicoIsdel":1},{"dicoId":889,"dicoCountryid":"KP","dicoAreacode":0,"dicoLocationcode":850,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"de-de","dicoName":"Nordkorea","dicoDescription":"","dicoIsdel":1},{"dicoId":897,"dicoCountryid":"KR","dicoAreacode":2,"dicoLocationcode":82,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"de-de","dicoName":"Südkorea ","dicoDescription":"","dicoIsdel":1},{"dicoId":905,"dicoCountryid":"KW","dicoAreacode":0,"dicoLocationcode":965,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kuwait","dicoDescription":"","dicoIsdel":1},{"dicoId":913,"dicoCountryid":"KY","dicoAreacode":0,"dicoLocationcode":1345,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kaiman-Inseln","dicoDescription":"","dicoIsdel":1},{"dicoId":921,"dicoCountryid":"KZ","dicoAreacode":0,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kasachstan","dicoDescription":"","dicoIsdel":1},{"dicoId":929,"dicoCountryid":"LA","dicoAreacode":0,"dicoLocationcode":856,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Laos ","dicoDescription":"","dicoIsdel":1},{"dicoId":937,"dicoCountryid":"LB","dicoAreacode":0,"dicoLocationcode":961,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"der Libanon ","dicoDescription":"","dicoIsdel":1},{"dicoId":945,"dicoCountryid":"LC","dicoAreacode":0,"dicoLocationcode":1758,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"St. Lucia","dicoDescription":"","dicoIsdel":1},{"dicoId":953,"dicoCountryid":"LI","dicoAreacode":3,"dicoLocationcode":423,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Liechtenstein ","dicoDescription":"","dicoIsdel":1},{"dicoId":961,"dicoCountryid":"LK","dicoAreacode":0,"dicoLocationcode":94,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Sri Lanka","dicoDescription":"","dicoIsdel":1},{"dicoId":969,"dicoCountryid":"LR","dicoAreacode":0,"dicoLocationcode":231,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Liberia","dicoDescription":"","dicoIsdel":1},{"dicoId":977,"dicoCountryid":"LS","dicoAreacode":0,"dicoLocationcode":266,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Lesotho ","dicoDescription":"","dicoIsdel":1},{"dicoId":985,"dicoCountryid":"LT","dicoAreacode":3,"dicoLocationcode":370,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Litauen","dicoDescription":"","dicoIsdel":1},{"dicoId":993,"dicoCountryid":"LU","dicoAreacode":3,"dicoLocationcode":352,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Luxemburg","dicoDescription":"","dicoIsdel":1},{"dicoId":1001,"dicoCountryid":"LV","dicoAreacode":3,"dicoLocationcode":371,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Lettland ","dicoDescription":"","dicoIsdel":1},{"dicoId":1009,"dicoCountryid":"LY","dicoAreacode":0,"dicoLocationcode":218,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Libyen","dicoDescription":"","dicoIsdel":1},{"dicoId":1017,"dicoCountryid":"MA","dicoAreacode":0,"dicoLocationcode":212,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Marokko","dicoDescription":"","dicoIsdel":1},{"dicoId":1025,"dicoCountryid":"MC","dicoAreacode":3,"dicoLocationcode":377,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Monaco","dicoDescription":"","dicoIsdel":1},{"dicoId":1033,"dicoCountryid":"MD","dicoAreacode":3,"dicoLocationcode":373,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Moldawien","dicoDescription":"","dicoIsdel":1},{"dicoId":1041,"dicoCountryid":"ME","dicoAreacode":3,"dicoLocationcode":382,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Montenegro","dicoDescription":"","dicoIsdel":1},{"dicoId":1049,"dicoCountryid":"MG","dicoAreacode":0,"dicoLocationcode":261,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Madagaskar","dicoDescription":"","dicoIsdel":1},{"dicoId":1057,"dicoCountryid":"MH","dicoAreacode":0,"dicoLocationcode":692,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"de-de","dicoName":"die Marshallinseln","dicoDescription":"","dicoIsdel":1},{"dicoId":1065,"dicoCountryid":"MK","dicoAreacode":3,"dicoLocationcode":389,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Mazedonien","dicoDescription":"","dicoIsdel":1},{"dicoId":1073,"dicoCountryid":"ML","dicoAreacode":0,"dicoLocationcode":223,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Mali ","dicoDescription":"","dicoIsdel":1},{"dicoId":1081,"dicoCountryid":"MM","dicoAreacode":0,"dicoLocationcode":95,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Myanmar","dicoDescription":"","dicoIsdel":1},{"dicoId":1089,"dicoCountryid":"MN","dicoAreacode":0,"dicoLocationcode":976,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Mongolei","dicoDescription":"","dicoIsdel":1},{"dicoId":1097,"dicoCountryid":"MO","dicoAreacode":1,"dicoLocationcode":853,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Macao(China)","dicoDescription":"","dicoIsdel":1},{"dicoId":1105,"dicoCountryid":"MQ","dicoAreacode":0,"dicoLocationcode":596,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Martinique","dicoDescription":"","dicoIsdel":1},{"dicoId":1113,"dicoCountryid":"MR","dicoAreacode":0,"dicoLocationcode":222,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Mauretanien","dicoDescription":"","dicoIsdel":1},{"dicoId":1121,"dicoCountryid":"MS","dicoAreacode":0,"dicoLocationcode":1664,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Montserrat","dicoDescription":"","dicoIsdel":1},{"dicoId":1129,"dicoCountryid":"MT","dicoAreacode":3,"dicoLocationcode":356,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Malta","dicoDescription":"","dicoIsdel":1},{"dicoId":1137,"dicoCountryid":"MU","dicoAreacode":0,"dicoLocationcode":230,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Mauritius","dicoDescription":"","dicoIsdel":1},{"dicoId":1145,"dicoCountryid":"MV","dicoAreacode":0,"dicoLocationcode":960,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Malediven","dicoDescription":"","dicoIsdel":1},{"dicoId":1153,"dicoCountryid":"MW","dicoAreacode":0,"dicoLocationcode":265,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Malawi  ","dicoDescription":"","dicoIsdel":1},{"dicoId":1161,"dicoCountryid":"MX","dicoAreacode":0,"dicoLocationcode":52,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Mexiko","dicoDescription":"","dicoIsdel":1},{"dicoId":1169,"dicoCountryid":"MY","dicoAreacode":0,"dicoLocationcode":60,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Malaysia","dicoDescription":"","dicoIsdel":1},{"dicoId":1177,"dicoCountryid":"MZ","dicoAreacode":0,"dicoLocationcode":258,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Mosambik ","dicoDescription":"","dicoIsdel":1}],"A-G":[{"dicoId":1,"dicoCountryid":"AD","dicoAreacode":3,"dicoLocationcode":376,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Andorra ","dicoDescription":"","dicoIsdel":1},{"dicoId":9,"dicoCountryid":"AE","dicoAreacode":0,"dicoLocationcode":971,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Vereinigten Arabischen Emirate","dicoDescription":"","dicoIsdel":1},{"dicoId":17,"dicoCountryid":"AF","dicoAreacode":0,"dicoLocationcode":93,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Afghanistan","dicoDescription":"","dicoIsdel":1},{"dicoId":25,"dicoCountryid":"AG","dicoAreacode":0,"dicoLocationcode":1268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Antigua und Barbuda","dicoDescription":"","dicoIsdel":1},{"dicoId":33,"dicoCountryid":"AI","dicoAreacode":0,"dicoLocationcode":1264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Anguilla","dicoDescription":"","dicoIsdel":1},{"dicoId":41,"dicoCountryid":"AL","dicoAreacode":3,"dicoLocationcode":355,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Albanien","dicoDescription":"","dicoIsdel":1},{"dicoId":49,"dicoCountryid":"AM","dicoAreacode":0,"dicoLocationcode":374,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Armenien","dicoDescription":"","dicoIsdel":1},{"dicoId":57,"dicoCountryid":"AN","dicoAreacode":0,"dicoLocationcode":599,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Niederländische Antillen","dicoDescription":"","dicoIsdel":1},{"dicoId":65,"dicoCountryid":"AO","dicoAreacode":0,"dicoLocationcode":244,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Angola","dicoDescription":"","dicoIsdel":1},{"dicoId":73,"dicoCountryid":"AQ","dicoAreacode":0,"dicoLocationcode":672,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"de-de","dicoName":"Antarktika ","dicoDescription":"","dicoIsdel":1},{"dicoId":81,"dicoCountryid":"AR","dicoAreacode":0,"dicoLocationcode":54,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Argentinien ","dicoDescription":"","dicoIsdel":1},{"dicoId":89,"dicoCountryid":"AS","dicoAreacode":0,"dicoLocationcode":684,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Amerikanisches Samoa ","dicoDescription":"","dicoIsdel":1},{"dicoId":97,"dicoCountryid":"AT","dicoAreacode":3,"dicoLocationcode":43,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Österreich ","dicoDescription":"","dicoIsdel":1},{"dicoId":105,"dicoCountryid":"AU","dicoAreacode":0,"dicoLocationcode":61,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"de-de","dicoName":"Australien ","dicoDescription":"","dicoIsdel":1},{"dicoId":113,"dicoCountryid":"AW","dicoAreacode":0,"dicoLocationcode":297,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Aruba","dicoDescription":"","dicoIsdel":1},{"dicoId":121,"dicoCountryid":"AZ","dicoAreacode":0,"dicoLocationcode":994,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Aserbaidschan ","dicoDescription":"","dicoIsdel":1},{"dicoId":129,"dicoCountryid":"BA","dicoAreacode":3,"dicoLocationcode":387,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Bosnien und Herzegowina ","dicoDescription":"","dicoIsdel":1},{"dicoId":137,"dicoCountryid":"BB","dicoAreacode":0,"dicoLocationcode":1246,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Barbados","dicoDescription":"","dicoIsdel":1},{"dicoId":145,"dicoCountryid":"BD","dicoAreacode":0,"dicoLocationcode":880,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Bangladesch","dicoDescription":"","dicoIsdel":1},{"dicoId":153,"dicoCountryid":"BE","dicoAreacode":3,"dicoLocationcode":32,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Belgien ","dicoDescription":"","dicoIsdel":1},{"dicoId":161,"dicoCountryid":"BF","dicoAreacode":0,"dicoLocationcode":226,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Burkina Faso","dicoDescription":"","dicoIsdel":1},{"dicoId":169,"dicoCountryid":"BG","dicoAreacode":3,"dicoLocationcode":359,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Bulgarien ","dicoDescription":"","dicoIsdel":1},{"dicoId":177,"dicoCountryid":"BH","dicoAreacode":0,"dicoLocationcode":973,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Ballin  ","dicoDescription":"","dicoIsdel":1},{"dicoId":185,"dicoCountryid":"BI","dicoAreacode":0,"dicoLocationcode":257,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Burundi ","dicoDescription":"","dicoIsdel":1},{"dicoId":193,"dicoCountryid":"BJ","dicoAreacode":0,"dicoLocationcode":229,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Benin","dicoDescription":"","dicoIsdel":1},{"dicoId":201,"dicoCountryid":"BM","dicoAreacode":0,"dicoLocationcode":1441,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Bermudas","dicoDescription":"","dicoIsdel":1},{"dicoId":209,"dicoCountryid":"BN","dicoAreacode":0,"dicoLocationcode":673,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"de-de","dicoName":"Brunei  ","dicoDescription":"","dicoIsdel":1},{"dicoId":217,"dicoCountryid":"BO","dicoAreacode":0,"dicoLocationcode":591,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Bolivien","dicoDescription":"","dicoIsdel":1},{"dicoId":225,"dicoCountryid":"BR","dicoAreacode":0,"dicoLocationcode":55,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Brasilien","dicoDescription":"","dicoIsdel":1},{"dicoId":233,"dicoCountryid":"BS","dicoAreacode":0,"dicoLocationcode":1242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Bahamas","dicoDescription":"","dicoIsdel":1},{"dicoId":241,"dicoCountryid":"BT","dicoAreacode":0,"dicoLocationcode":975,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Bhutan  ","dicoDescription":"","dicoIsdel":1},{"dicoId":249,"dicoCountryid":"BW","dicoAreacode":0,"dicoLocationcode":267,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Botsuana ","dicoDescription":"","dicoIsdel":1},{"dicoId":257,"dicoCountryid":"BY","dicoAreacode":3,"dicoLocationcode":375,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Weissrussland","dicoDescription":"","dicoIsdel":1},{"dicoId":265,"dicoCountryid":"BZ","dicoAreacode":0,"dicoLocationcode":501,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Belize ","dicoDescription":"","dicoIsdel":1},{"dicoId":273,"dicoCountryid":"CA","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kanada","dicoDescription":"","dicoIsdel":1},{"dicoId":281,"dicoCountryid":"CF","dicoAreacode":0,"dicoLocationcode":236,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Zentralafrikanische Republik","dicoDescription":"","dicoIsdel":1},{"dicoId":289,"dicoCountryid":"CG","dicoAreacode":0,"dicoLocationcode":243,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Republik Kongo ","dicoDescription":"","dicoIsdel":1},{"dicoId":297,"dicoCountryid":"CGB","dicoAreacode":0,"dicoLocationcode":242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Congo-Brazzaville","dicoDescription":"","dicoIsdel":1},{"dicoId":305,"dicoCountryid":"CH","dicoAreacode":3,"dicoLocationcode":41,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Schweiz  ","dicoDescription":"","dicoIsdel":1},{"dicoId":313,"dicoCountryid":"CI","dicoAreacode":0,"dicoLocationcode":225,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Cote d’Ivoire","dicoDescription":"","dicoIsdel":1},{"dicoId":321,"dicoCountryid":"CK","dicoAreacode":0,"dicoLocationcode":682,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Cookinseln","dicoDescription":"","dicoIsdel":1},{"dicoId":329,"dicoCountryid":"CL","dicoAreacode":0,"dicoLocationcode":56,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Chile","dicoDescription":"","dicoIsdel":1},{"dicoId":337,"dicoCountryid":"CM","dicoAreacode":0,"dicoLocationcode":237,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kamerun ","dicoDescription":"","dicoIsdel":1},{"dicoId":345,"dicoCountryid":"CN","dicoAreacode":1,"dicoLocationcode":86,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"China","dicoDescription":"","dicoIsdel":1},{"dicoId":353,"dicoCountryid":"CO","dicoAreacode":0,"dicoLocationcode":57,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kolumbien ","dicoDescription":"","dicoIsdel":1},{"dicoId":361,"dicoCountryid":"CR","dicoAreacode":0,"dicoLocationcode":506,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Costa Rica","dicoDescription":"","dicoIsdel":1},{"dicoId":369,"dicoCountryid":"CU","dicoAreacode":0,"dicoLocationcode":53,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kuba","dicoDescription":"","dicoIsdel":1},{"dicoId":377,"dicoCountryid":"CV","dicoAreacode":0,"dicoLocationcode":238,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Kap Verde","dicoDescription":"","dicoIsdel":1},{"dicoId":385,"dicoCountryid":"CY","dicoAreacode":3,"dicoLocationcode":357,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Zypern ","dicoDescription":"","dicoIsdel":1},{"dicoId":393,"dicoCountryid":"CZ","dicoAreacode":3,"dicoLocationcode":420,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Tschechei ","dicoDescription":"","dicoIsdel":1},{"dicoId":401,"dicoCountryid":"DE","dicoAreacode":3,"dicoLocationcode":49,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Deutschland","dicoDescription":"","dicoIsdel":1},{"dicoId":409,"dicoCountryid":"DJ","dicoAreacode":0,"dicoLocationcode":253,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Dschibuti ","dicoDescription":"","dicoIsdel":1},{"dicoId":417,"dicoCountryid":"DK","dicoAreacode":3,"dicoLocationcode":45,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Dänemark ","dicoDescription":"","dicoIsdel":1},{"dicoId":425,"dicoCountryid":"DM","dicoAreacode":0,"dicoLocationcode":1767,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Dominik","dicoDescription":"","dicoIsdel":1},{"dicoId":433,"dicoCountryid":"DO","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Dominikanische Republik ","dicoDescription":"","dicoIsdel":1},{"dicoId":441,"dicoCountryid":"DZ","dicoAreacode":0,"dicoLocationcode":213,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Algerien","dicoDescription":"","dicoIsdel":1},{"dicoId":449,"dicoCountryid":"EC","dicoAreacode":0,"dicoLocationcode":593,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Ecuador ","dicoDescription":"","dicoIsdel":1},{"dicoId":457,"dicoCountryid":"EE","dicoAreacode":3,"dicoLocationcode":372,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Estland","dicoDescription":"","dicoIsdel":1},{"dicoId":465,"dicoCountryid":"EG","dicoAreacode":0,"dicoLocationcode":20,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Ägypten ","dicoDescription":"","dicoIsdel":1},{"dicoId":473,"dicoCountryid":"EH","dicoAreacode":0,"dicoLocationcode":0,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Westsahara","dicoDescription":"","dicoIsdel":1},{"dicoId":481,"dicoCountryid":"ER","dicoAreacode":0,"dicoLocationcode":291,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Eritrea ","dicoDescription":"","dicoIsdel":1},{"dicoId":489,"dicoCountryid":"ES","dicoAreacode":3,"dicoLocationcode":34,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Spanien ","dicoDescription":"","dicoIsdel":1},{"dicoId":497,"dicoCountryid":"ET","dicoAreacode":0,"dicoLocationcode":251,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Äthiopien","dicoDescription":"","dicoIsdel":1},{"dicoId":505,"dicoCountryid":"FI","dicoAreacode":3,"dicoLocationcode":358,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Finnland ","dicoDescription":"","dicoIsdel":1},{"dicoId":513,"dicoCountryid":"FJ","dicoAreacode":0,"dicoLocationcode":679,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"de-de","dicoName":"Fidschi ","dicoDescription":"","dicoIsdel":1},{"dicoId":521,"dicoCountryid":"FK","dicoAreacode":0,"dicoLocationcode":500,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Falklandinseln ","dicoDescription":"","dicoIsdel":1},{"dicoId":529,"dicoCountryid":"FM","dicoAreacode":0,"dicoLocationcode":691,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"de-de","dicoName":"Mikronesien","dicoDescription":"","dicoIsdel":1},{"dicoId":537,"dicoCountryid":"FO","dicoAreacode":3,"dicoLocationcode":298,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"die Färöer","dicoDescription":"","dicoIsdel":1},{"dicoId":545,"dicoCountryid":"FR","dicoAreacode":3,"dicoLocationcode":33,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Frankreich","dicoDescription":"","dicoIsdel":1},{"dicoId":553,"dicoCountryid":"GA","dicoAreacode":0,"dicoLocationcode":241,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Gabun","dicoDescription":"","dicoIsdel":1},{"dicoId":561,"dicoCountryid":"GB","dicoAreacode":3,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"England","dicoDescription":"","dicoIsdel":1},{"dicoId":569,"dicoCountryid":"GCI","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Guernsey","dicoDescription":"","dicoIsdel":1},{"dicoId":577,"dicoCountryid":"GD","dicoAreacode":0,"dicoLocationcode":1473,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Grenada","dicoDescription":"","dicoIsdel":1},{"dicoId":585,"dicoCountryid":"GE","dicoAreacode":0,"dicoLocationcode":995,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Georgien ","dicoDescription":"","dicoIsdel":1},{"dicoId":593,"dicoCountryid":"GF","dicoAreacode":0,"dicoLocationcode":689,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"de-de","dicoName":"Französische Polynesien","dicoDescription":"","dicoIsdel":1},{"dicoId":601,"dicoCountryid":"GFN","dicoAreacode":0,"dicoLocationcode":594,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"French Guiana","dicoDescription":"","dicoIsdel":1},{"dicoId":609,"dicoCountryid":"GH","dicoAreacode":0,"dicoLocationcode":233,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Ghana","dicoDescription":"","dicoIsdel":1},{"dicoId":617,"dicoCountryid":"GI","dicoAreacode":0,"dicoLocationcode":350,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Gibraltar","dicoDescription":"","dicoIsdel":1},{"dicoId":625,"dicoCountryid":"GL","dicoAreacode":0,"dicoLocationcode":299,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Grönland  ","dicoDescription":"","dicoIsdel":1},{"dicoId":633,"dicoCountryid":"GM","dicoAreacode":0,"dicoLocationcode":220,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Gambia ","dicoDescription":"","dicoIsdel":1},{"dicoId":641,"dicoCountryid":"GN","dicoAreacode":0,"dicoLocationcode":224,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Guinea","dicoDescription":"","dicoIsdel":1},{"dicoId":649,"dicoCountryid":"GP","dicoAreacode":0,"dicoLocationcode":590,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Guadeloupe","dicoDescription":"","dicoIsdel":1},{"dicoId":657,"dicoCountryid":"GQ","dicoAreacode":0,"dicoLocationcode":240,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Äquatorialguinea","dicoDescription":"","dicoIsdel":1},{"dicoId":665,"dicoCountryid":"GR","dicoAreacode":3,"dicoLocationcode":30,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Griechenland ","dicoDescription":"","dicoIsdel":1},{"dicoId":673,"dicoCountryid":"GT","dicoAreacode":0,"dicoLocationcode":502,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Guatemala","dicoDescription":"","dicoIsdel":1},{"dicoId":681,"dicoCountryid":"GU","dicoAreacode":0,"dicoLocationcode":1671,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Guam","dicoDescription":"","dicoIsdel":1},{"dicoId":689,"dicoCountryid":"GW","dicoAreacode":0,"dicoLocationcode":245,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Guinea-Bissau ","dicoDescription":"","dicoIsdel":1},{"dicoId":697,"dicoCountryid":"GY","dicoAreacode":0,"dicoLocationcode":592,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"de-de","dicoName":"Guyana ","dicoDescription":"","dicoIsdel":1}]}
        var platformTWCountryGroupMap={"T-Z":[{"dicoId":1576,"dicoCountryid":"TC","dicoAreacode":0,"dicoLocationcode":1649,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"Turks and Caicos Islands","dicoDescription":"","dicoIsdel":1},{"dicoId":1584,"dicoCountryid":"TD","dicoAreacode":0,"dicoLocationcode":235,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"乍得","dicoDescription":"","dicoIsdel":1},{"dicoId":1592,"dicoCountryid":"TG","dicoAreacode":0,"dicoLocationcode":228,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"多哥","dicoDescription":"","dicoIsdel":1},{"dicoId":1600,"dicoCountryid":"TH","dicoAreacode":0,"dicoLocationcode":66,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"泰國","dicoDescription":"","dicoIsdel":1},{"dicoId":1608,"dicoCountryid":"TJ","dicoAreacode":0,"dicoLocationcode":992,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"塔吉克斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":1616,"dicoCountryid":"TK","dicoAreacode":0,"dicoLocationcode":993,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"土庫曼斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":1624,"dicoCountryid":"TL","dicoAreacode":0,"dicoLocationcode":670,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"東帝汶","dicoDescription":"","dicoIsdel":1},{"dicoId":1632,"dicoCountryid":"TN","dicoAreacode":0,"dicoLocationcode":216,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"突尼斯","dicoDescription":"","dicoIsdel":1},{"dicoId":1640,"dicoCountryid":"TO","dicoAreacode":0,"dicoLocationcode":676,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"zh-tw","dicoName":"湯加","dicoDescription":"","dicoIsdel":1},{"dicoId":1648,"dicoCountryid":"TR","dicoAreacode":0,"dicoLocationcode":90,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"土耳其","dicoDescription":"","dicoIsdel":1},{"dicoId":1656,"dicoCountryid":"TT","dicoAreacode":0,"dicoLocationcode":1868,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"特立尼達和多巴哥","dicoDescription":"","dicoIsdel":1},{"dicoId":1664,"dicoCountryid":"TV","dicoAreacode":0,"dicoLocationcode":688,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"zh-tw","dicoName":"圖瓦盧","dicoDescription":"","dicoIsdel":1},{"dicoId":1672,"dicoCountryid":"TW","dicoAreacode":1,"dicoLocationcode":886,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"臺灣","dicoDescription":"","dicoIsdel":1},{"dicoId":1680,"dicoCountryid":"TZ","dicoAreacode":0,"dicoLocationcode":255,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"坦桑尼亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1688,"dicoCountryid":"UA","dicoAreacode":3,"dicoLocationcode":380,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"烏克蘭","dicoDescription":"","dicoIsdel":1},{"dicoId":1696,"dicoCountryid":"UG","dicoAreacode":0,"dicoLocationcode":256,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"烏幹達","dicoDescription":"","dicoIsdel":1},{"dicoId":1704,"dicoCountryid":"US","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"美國","dicoDescription":"","dicoIsdel":1},{"dicoId":1712,"dicoCountryid":"UY","dicoAreacode":0,"dicoLocationcode":598,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"烏拉圭","dicoDescription":"","dicoIsdel":1},{"dicoId":1720,"dicoCountryid":"UZ","dicoAreacode":0,"dicoLocationcode":998,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"烏茲別克斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":1728,"dicoCountryid":"VA","dicoAreacode":3,"dicoLocationcode":379,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"梵蒂岡","dicoDescription":"","dicoIsdel":1},{"dicoId":1736,"dicoCountryid":"VCT","dicoAreacode":0,"dicoLocationcode":784,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"Saint Vincent and the Grenadines","dicoDescription":"","dicoIsdel":1},{"dicoId":1744,"dicoCountryid":"VE","dicoAreacode":0,"dicoLocationcode":58,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"委內瑞拉","dicoDescription":"","dicoIsdel":1},{"dicoId":1752,"dicoCountryid":"VG","dicoAreacode":0,"dicoLocationcode":1284,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"英屬維爾京群島","dicoDescription":"","dicoIsdel":1},{"dicoId":1760,"dicoCountryid":"VI","dicoAreacode":0,"dicoLocationcode":1340,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"美屬維爾京群島","dicoDescription":"","dicoIsdel":1},{"dicoId":1768,"dicoCountryid":"VN","dicoAreacode":0,"dicoLocationcode":84,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"越南","dicoDescription":"","dicoIsdel":1},{"dicoId":1776,"dicoCountryid":"VU","dicoAreacode":0,"dicoLocationcode":678,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"zh-tw","dicoName":"瓦努阿圖","dicoDescription":"","dicoIsdel":1},{"dicoId":1784,"dicoCountryid":"WF","dicoAreacode":0,"dicoLocationcode":681,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"瓦利斯和富圖納群島","dicoDescription":"","dicoIsdel":1},{"dicoId":1792,"dicoCountryid":"WS","dicoAreacode":0,"dicoLocationcode":685,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"薩摩亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1800,"dicoCountryid":"YE","dicoAreacode":0,"dicoLocationcode":967,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"也門","dicoDescription":"","dicoIsdel":1},{"dicoId":1808,"dicoCountryid":"ZA","dicoAreacode":0,"dicoLocationcode":27,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"南非","dicoDescription":"","dicoIsdel":1},{"dicoId":1816,"dicoCountryid":"ZM","dicoAreacode":0,"dicoLocationcode":260,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"贊比亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1824,"dicoCountryid":"ZW","dicoAreacode":0,"dicoLocationcode":263,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"津巴布韋","dicoDescription":"","dicoIsdel":1},{"dicoId":1832,"dicoCountryid":"ZXA","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"Jersey","dicoDescription":"","dicoIsdel":1}],"N-S":[{"dicoId":1192,"dicoCountryid":"NA","dicoAreacode":0,"dicoLocationcode":264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"納米比亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1200,"dicoCountryid":"NC","dicoAreacode":0,"dicoLocationcode":687,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"zh-tw","dicoName":"新喀裏多尼亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1208,"dicoCountryid":"NE","dicoAreacode":0,"dicoLocationcode":227,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"尼日爾","dicoDescription":"","dicoIsdel":1},{"dicoId":1216,"dicoCountryid":"NG","dicoAreacode":0,"dicoLocationcode":234,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"尼日利亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1224,"dicoCountryid":"NI","dicoAreacode":0,"dicoLocationcode":505,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"尼加拉瓜","dicoDescription":"","dicoIsdel":1},{"dicoId":1232,"dicoCountryid":"NL","dicoAreacode":3,"dicoLocationcode":31,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"荷蘭","dicoDescription":"","dicoIsdel":1},{"dicoId":1240,"dicoCountryid":"NO","dicoAreacode":3,"dicoLocationcode":47,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"挪威","dicoDescription":"","dicoIsdel":1},{"dicoId":1248,"dicoCountryid":"NP","dicoAreacode":0,"dicoLocationcode":977,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"尼泊爾","dicoDescription":"","dicoIsdel":1},{"dicoId":1256,"dicoCountryid":"NR","dicoAreacode":0,"dicoLocationcode":674,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"zh-tw","dicoName":"瑙魯","dicoDescription":"","dicoIsdel":1},{"dicoId":1264,"dicoCountryid":"NZ","dicoAreacode":0,"dicoLocationcode":64,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"zh-tw","dicoName":"新西蘭","dicoDescription":"","dicoIsdel":1},{"dicoId":1272,"dicoCountryid":"OM","dicoAreacode":0,"dicoLocationcode":968,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"阿曼","dicoDescription":"","dicoIsdel":1},{"dicoId":1280,"dicoCountryid":"PA","dicoAreacode":0,"dicoLocationcode":507,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"巴拿馬","dicoDescription":"","dicoIsdel":1},{"dicoId":1288,"dicoCountryid":"PC","dicoAreacode":0,"dicoLocationcode":870,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"皮特凱恩群島","dicoDescription":"","dicoIsdel":1},{"dicoId":1296,"dicoCountryid":"PE","dicoAreacode":0,"dicoLocationcode":51,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"秘魯","dicoDescription":"","dicoIsdel":1},{"dicoId":1304,"dicoCountryid":"PG","dicoAreacode":0,"dicoLocationcode":675,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"zh-tw","dicoName":"巴布亞新幾內亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1312,"dicoCountryid":"PH","dicoAreacode":0,"dicoLocationcode":63,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"菲律賓","dicoDescription":"","dicoIsdel":1},{"dicoId":1320,"dicoCountryid":"PK","dicoAreacode":0,"dicoLocationcode":92,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"巴基斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":1328,"dicoCountryid":"PL","dicoAreacode":3,"dicoLocationcode":48,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"波蘭","dicoDescription":"","dicoIsdel":1},{"dicoId":1336,"dicoCountryid":"PR","dicoAreacode":0,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"波多黎各","dicoDescription":"","dicoIsdel":1},{"dicoId":1344,"dicoCountryid":"PS","dicoAreacode":0,"dicoLocationcode":970,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"巴勒斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":1352,"dicoCountryid":"PT","dicoAreacode":3,"dicoLocationcode":1787,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"葡萄牙","dicoDescription":"","dicoIsdel":1},{"dicoId":1360,"dicoCountryid":"PW","dicoAreacode":0,"dicoLocationcode":97,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"帕勞","dicoDescription":"","dicoIsdel":1},{"dicoId":1368,"dicoCountryid":"PY","dicoAreacode":0,"dicoLocationcode":595,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"巴拉圭","dicoDescription":"","dicoIsdel":1},{"dicoId":1376,"dicoCountryid":"QA","dicoAreacode":0,"dicoLocationcode":974,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"卡塔爾","dicoDescription":"","dicoIsdel":1},{"dicoId":1384,"dicoCountryid":"RE","dicoAreacode":0,"dicoLocationcode":262,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"留尼汪島","dicoDescription":"","dicoIsdel":1},{"dicoId":1392,"dicoCountryid":"RO","dicoAreacode":3,"dicoLocationcode":40,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"羅馬尼亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1400,"dicoCountryid":"RS","dicoAreacode":3,"dicoLocationcode":381,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"塞爾維亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1408,"dicoCountryid":"RU","dicoAreacode":3,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"俄羅斯","dicoDescription":"","dicoIsdel":1},{"dicoId":1416,"dicoCountryid":"RW","dicoAreacode":0,"dicoLocationcode":250,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"盧旺達","dicoDescription":"","dicoIsdel":1},{"dicoId":1424,"dicoCountryid":"SA","dicoAreacode":0,"dicoLocationcode":966,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"沙特","dicoDescription":"","dicoIsdel":1},{"dicoId":1432,"dicoCountryid":"SB","dicoAreacode":0,"dicoLocationcode":677,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"zh-tw","dicoName":"所羅門群島","dicoDescription":"","dicoIsdel":1},{"dicoId":1440,"dicoCountryid":"SC","dicoAreacode":0,"dicoLocationcode":248,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"塞舌爾","dicoDescription":"","dicoIsdel":1},{"dicoId":1448,"dicoCountryid":"SD","dicoAreacode":0,"dicoLocationcode":249,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"蘇丹","dicoDescription":"","dicoIsdel":1},{"dicoId":1456,"dicoCountryid":"SE","dicoAreacode":3,"dicoLocationcode":46,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"瑞典","dicoDescription":"","dicoIsdel":1},{"dicoId":1464,"dicoCountryid":"SG","dicoAreacode":0,"dicoLocationcode":65,"dicoIssms":1,"dicoJetlag":0.3,"dicoLanguage":"zh-tw","dicoName":"新加坡","dicoDescription":"","dicoIsdel":1},{"dicoId":1472,"dicoCountryid":"SI","dicoAreacode":3,"dicoLocationcode":386,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"斯洛文尼亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1480,"dicoCountryid":"SIA","dicoAreacode":0,"dicoLocationcode":809,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"zh-tw","dicoName":"French West Indies","dicoDescription":"","dicoIsdel":1},{"dicoId":1488,"dicoCountryid":"SK","dicoAreacode":3,"dicoLocationcode":421,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"斯洛伐克","dicoDescription":"","dicoIsdel":1},{"dicoId":1496,"dicoCountryid":"SL","dicoAreacode":0,"dicoLocationcode":232,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"塞拉利昂","dicoDescription":"","dicoIsdel":1},{"dicoId":1504,"dicoCountryid":"SM","dicoAreacode":3,"dicoLocationcode":378,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"聖馬力諾","dicoDescription":"","dicoIsdel":1},{"dicoId":1512,"dicoCountryid":"SN","dicoAreacode":0,"dicoLocationcode":221,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"塞內加爾","dicoDescription":"","dicoIsdel":1},{"dicoId":1520,"dicoCountryid":"SO","dicoAreacode":0,"dicoLocationcode":252,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"索馬裏","dicoDescription":"","dicoIsdel":1},{"dicoId":1528,"dicoCountryid":"SR","dicoAreacode":0,"dicoLocationcode":597,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"蘇裏南","dicoDescription":"","dicoIsdel":1},{"dicoId":1536,"dicoCountryid":"SSD","dicoAreacode":0,"dicoLocationcode":211,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"南蘇丹","dicoDescription":"","dicoIsdel":1},{"dicoId":1544,"dicoCountryid":"ST","dicoAreacode":0,"dicoLocationcode":239,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"聖多美和普林西比","dicoDescription":"","dicoIsdel":1},{"dicoId":1552,"dicoCountryid":"SV","dicoAreacode":0,"dicoLocationcode":503,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"薩爾瓦多","dicoDescription":"","dicoIsdel":1},{"dicoId":1560,"dicoCountryid":"SY","dicoAreacode":0,"dicoLocationcode":963,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"敘利亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1568,"dicoCountryid":"SZ","dicoAreacode":0,"dicoLocationcode":268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"斯威士蘭","dicoDescription":"","dicoIsdel":1}],"H-M":[{"dicoId":712,"dicoCountryid":"HK","dicoAreacode":1,"dicoLocationcode":852,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"香港","dicoDescription":"","dicoIsdel":1},{"dicoId":720,"dicoCountryid":"HN","dicoAreacode":0,"dicoLocationcode":504,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"洪都拉斯","dicoDescription":"","dicoIsdel":1},{"dicoId":728,"dicoCountryid":"HR","dicoAreacode":3,"dicoLocationcode":385,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"克羅地亞","dicoDescription":"","dicoIsdel":1},{"dicoId":736,"dicoCountryid":"HT","dicoAreacode":0,"dicoLocationcode":509,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"海地","dicoDescription":"","dicoIsdel":1},{"dicoId":744,"dicoCountryid":"HU","dicoAreacode":3,"dicoLocationcode":36,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"匈牙利","dicoDescription":"","dicoIsdel":1},{"dicoId":752,"dicoCountryid":"ID","dicoAreacode":0,"dicoLocationcode":62,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"印度尼西亞","dicoDescription":"","dicoIsdel":1},{"dicoId":760,"dicoCountryid":"IE","dicoAreacode":3,"dicoLocationcode":353,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"愛爾蘭","dicoDescription":"","dicoIsdel":1},{"dicoId":768,"dicoCountryid":"IL","dicoAreacode":0,"dicoLocationcode":972,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"以色列","dicoDescription":"","dicoIsdel":1},{"dicoId":776,"dicoCountryid":"IM","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"馬恩島","dicoDescription":"","dicoIsdel":1},{"dicoId":784,"dicoCountryid":"IN","dicoAreacode":0,"dicoLocationcode":91,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"印度","dicoDescription":"","dicoIsdel":1},{"dicoId":792,"dicoCountryid":"IQ","dicoAreacode":0,"dicoLocationcode":964,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"伊拉克","dicoDescription":"","dicoIsdel":1},{"dicoId":800,"dicoCountryid":"IR","dicoAreacode":0,"dicoLocationcode":98,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"伊朗","dicoDescription":"","dicoIsdel":1},{"dicoId":808,"dicoCountryid":"IS","dicoAreacode":3,"dicoLocationcode":354,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"冰島","dicoDescription":"","dicoIsdel":1},{"dicoId":816,"dicoCountryid":"IT","dicoAreacode":3,"dicoLocationcode":39,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"意大利","dicoDescription":"","dicoIsdel":1},{"dicoId":824,"dicoCountryid":"JM","dicoAreacode":0,"dicoLocationcode":1876,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"牙買加","dicoDescription":"","dicoIsdel":1},{"dicoId":832,"dicoCountryid":"JO","dicoAreacode":0,"dicoLocationcode":962,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"約旦","dicoDescription":"","dicoIsdel":1},{"dicoId":840,"dicoCountryid":"JP","dicoAreacode":2,"dicoLocationcode":81,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"zh-tw","dicoName":"日本","dicoDescription":"","dicoIsdel":1},{"dicoId":848,"dicoCountryid":"KE","dicoAreacode":0,"dicoLocationcode":254,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"肯尼亞","dicoDescription":"","dicoIsdel":1},{"dicoId":856,"dicoCountryid":"KG","dicoAreacode":0,"dicoLocationcode":996,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"吉爾吉斯斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":864,"dicoCountryid":"KH","dicoAreacode":0,"dicoLocationcode":855,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"柬埔寨","dicoDescription":"","dicoIsdel":1},{"dicoId":872,"dicoCountryid":"KI","dicoAreacode":0,"dicoLocationcode":686,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"基裏巴斯","dicoDescription":"","dicoIsdel":1},{"dicoId":880,"dicoCountryid":"KM","dicoAreacode":0,"dicoLocationcode":269,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"科摩羅","dicoDescription":"","dicoIsdel":1},{"dicoId":888,"dicoCountryid":"KNA","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"Saint Kitts and Nevis","dicoDescription":"","dicoIsdel":1},{"dicoId":896,"dicoCountryid":"KP","dicoAreacode":0,"dicoLocationcode":850,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"zh-tw","dicoName":"朝鮮","dicoDescription":"","dicoIsdel":1},{"dicoId":904,"dicoCountryid":"KR","dicoAreacode":2,"dicoLocationcode":82,"dicoIssms":1,"dicoJetlag":1.0,"dicoLanguage":"zh-tw","dicoName":"韓國","dicoDescription":"","dicoIsdel":1},{"dicoId":912,"dicoCountryid":"KW","dicoAreacode":0,"dicoLocationcode":965,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"科威特","dicoDescription":"","dicoIsdel":1},{"dicoId":920,"dicoCountryid":"KY","dicoAreacode":0,"dicoLocationcode":1345,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"開曼群島","dicoDescription":"","dicoIsdel":1},{"dicoId":928,"dicoCountryid":"KZ","dicoAreacode":0,"dicoLocationcode":7,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"哈薩克斯坦","dicoDescription":"","dicoIsdel":1},{"dicoId":936,"dicoCountryid":"LA","dicoAreacode":0,"dicoLocationcode":856,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"老撾","dicoDescription":"","dicoIsdel":1},{"dicoId":944,"dicoCountryid":"LB","dicoAreacode":0,"dicoLocationcode":961,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"黎巴嫩","dicoDescription":"","dicoIsdel":1},{"dicoId":952,"dicoCountryid":"LC","dicoAreacode":0,"dicoLocationcode":1758,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"聖盧西亞","dicoDescription":"","dicoIsdel":1},{"dicoId":960,"dicoCountryid":"LI","dicoAreacode":3,"dicoLocationcode":423,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"列支敦士登","dicoDescription":"","dicoIsdel":1},{"dicoId":968,"dicoCountryid":"LK","dicoAreacode":0,"dicoLocationcode":94,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"斯裏蘭卡","dicoDescription":"","dicoIsdel":1},{"dicoId":976,"dicoCountryid":"LR","dicoAreacode":0,"dicoLocationcode":231,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"利比裏亞","dicoDescription":"","dicoIsdel":1},{"dicoId":984,"dicoCountryid":"LS","dicoAreacode":0,"dicoLocationcode":266,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"萊索托","dicoDescription":"","dicoIsdel":1},{"dicoId":992,"dicoCountryid":"LT","dicoAreacode":3,"dicoLocationcode":370,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"立陶宛","dicoDescription":"","dicoIsdel":1},{"dicoId":1000,"dicoCountryid":"LU","dicoAreacode":3,"dicoLocationcode":352,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"盧森堡","dicoDescription":"","dicoIsdel":1},{"dicoId":1008,"dicoCountryid":"LV","dicoAreacode":3,"dicoLocationcode":371,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"拉脫維亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1016,"dicoCountryid":"LY","dicoAreacode":0,"dicoLocationcode":218,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"利比亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1024,"dicoCountryid":"MA","dicoAreacode":0,"dicoLocationcode":212,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"摩洛哥","dicoDescription":"","dicoIsdel":1},{"dicoId":1032,"dicoCountryid":"MC","dicoAreacode":3,"dicoLocationcode":377,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"摩納哥","dicoDescription":"","dicoIsdel":1},{"dicoId":1040,"dicoCountryid":"MD","dicoAreacode":3,"dicoLocationcode":373,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"摩爾多瓦","dicoDescription":"","dicoIsdel":1},{"dicoId":1048,"dicoCountryid":"ME","dicoAreacode":3,"dicoLocationcode":382,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"黑山","dicoDescription":"","dicoIsdel":1},{"dicoId":1056,"dicoCountryid":"MG","dicoAreacode":0,"dicoLocationcode":261,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"馬達加斯加","dicoDescription":"","dicoIsdel":1},{"dicoId":1064,"dicoCountryid":"MH","dicoAreacode":0,"dicoLocationcode":692,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"zh-tw","dicoName":"馬紹爾群島","dicoDescription":"","dicoIsdel":1},{"dicoId":1072,"dicoCountryid":"MK","dicoAreacode":3,"dicoLocationcode":389,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"馬其頓","dicoDescription":"","dicoIsdel":1},{"dicoId":1080,"dicoCountryid":"ML","dicoAreacode":0,"dicoLocationcode":223,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"馬裏","dicoDescription":"","dicoIsdel":1},{"dicoId":1088,"dicoCountryid":"MM","dicoAreacode":0,"dicoLocationcode":95,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"緬甸","dicoDescription":"","dicoIsdel":1},{"dicoId":1096,"dicoCountryid":"MN","dicoAreacode":0,"dicoLocationcode":976,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"蒙古","dicoDescription":"","dicoIsdel":1},{"dicoId":1104,"dicoCountryid":"MO","dicoAreacode":1,"dicoLocationcode":853,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"澳門","dicoDescription":"","dicoIsdel":1},{"dicoId":1112,"dicoCountryid":"MQ","dicoAreacode":0,"dicoLocationcode":596,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"馬提尼克","dicoDescription":"","dicoIsdel":1},{"dicoId":1120,"dicoCountryid":"MR","dicoAreacode":0,"dicoLocationcode":222,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"毛裏塔尼亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1128,"dicoCountryid":"MS","dicoAreacode":0,"dicoLocationcode":1664,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"蒙特塞拉特","dicoDescription":"","dicoIsdel":1},{"dicoId":1136,"dicoCountryid":"MT","dicoAreacode":3,"dicoLocationcode":356,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"馬耳他","dicoDescription":"","dicoIsdel":1},{"dicoId":1144,"dicoCountryid":"MU","dicoAreacode":0,"dicoLocationcode":230,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"毛裏求斯","dicoDescription":"","dicoIsdel":1},{"dicoId":1152,"dicoCountryid":"MV","dicoAreacode":0,"dicoLocationcode":960,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"馬爾代夫","dicoDescription":"","dicoIsdel":1},{"dicoId":1160,"dicoCountryid":"MW","dicoAreacode":0,"dicoLocationcode":265,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"馬拉維","dicoDescription":"","dicoIsdel":1},{"dicoId":1168,"dicoCountryid":"MX","dicoAreacode":0,"dicoLocationcode":52,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"墨西哥","dicoDescription":"","dicoIsdel":1},{"dicoId":1176,"dicoCountryid":"MY","dicoAreacode":0,"dicoLocationcode":60,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"馬來西亞","dicoDescription":"","dicoIsdel":1},{"dicoId":1184,"dicoCountryid":"MZ","dicoAreacode":0,"dicoLocationcode":258,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"莫桑比克","dicoDescription":"","dicoIsdel":1}],"A-G":[{"dicoId":8,"dicoCountryid":"AD","dicoAreacode":3,"dicoLocationcode":376,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"安道爾","dicoDescription":"","dicoIsdel":1},{"dicoId":16,"dicoCountryid":"AE","dicoAreacode":0,"dicoLocationcode":971,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"阿聯酋","dicoDescription":"","dicoIsdel":1},{"dicoId":24,"dicoCountryid":"AF","dicoAreacode":0,"dicoLocationcode":93,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"阿富汗","dicoDescription":"","dicoIsdel":1},{"dicoId":32,"dicoCountryid":"AG","dicoAreacode":0,"dicoLocationcode":1268,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"安提瓜和巴布達","dicoDescription":"","dicoIsdel":1},{"dicoId":40,"dicoCountryid":"AI","dicoAreacode":0,"dicoLocationcode":1264,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"安圭拉","dicoDescription":"","dicoIsdel":1},{"dicoId":48,"dicoCountryid":"AL","dicoAreacode":3,"dicoLocationcode":355,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"阿爾巴尼亞","dicoDescription":"","dicoIsdel":1},{"dicoId":56,"dicoCountryid":"AM","dicoAreacode":0,"dicoLocationcode":374,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"亞美尼亞","dicoDescription":"","dicoIsdel":1},{"dicoId":64,"dicoCountryid":"AN","dicoAreacode":0,"dicoLocationcode":599,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"荷屬安的列斯庫拉索島","dicoDescription":"","dicoIsdel":1},{"dicoId":72,"dicoCountryid":"AO","dicoAreacode":0,"dicoLocationcode":244,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"安哥拉","dicoDescription":"","dicoIsdel":1},{"dicoId":80,"dicoCountryid":"AQ","dicoAreacode":0,"dicoLocationcode":672,"dicoIssms":0,"dicoJetlag":4.0,"dicoLanguage":"zh-tw","dicoName":"南極洲","dicoDescription":"","dicoIsdel":1},{"dicoId":88,"dicoCountryid":"AR","dicoAreacode":0,"dicoLocationcode":54,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"阿根廷","dicoDescription":"","dicoIsdel":1},{"dicoId":96,"dicoCountryid":"AS","dicoAreacode":0,"dicoLocationcode":684,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"美屬薩摩亞","dicoDescription":"","dicoIsdel":1},{"dicoId":104,"dicoCountryid":"AT","dicoAreacode":3,"dicoLocationcode":43,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"奧地利","dicoDescription":"","dicoIsdel":1},{"dicoId":112,"dicoCountryid":"AU","dicoAreacode":0,"dicoLocationcode":61,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"zh-tw","dicoName":"澳大利亞","dicoDescription":"","dicoIsdel":1},{"dicoId":120,"dicoCountryid":"AW","dicoAreacode":0,"dicoLocationcode":297,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"阿魯巴","dicoDescription":"","dicoIsdel":1},{"dicoId":128,"dicoCountryid":"AZ","dicoAreacode":0,"dicoLocationcode":994,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"阿塞拜疆","dicoDescription":"","dicoIsdel":1},{"dicoId":136,"dicoCountryid":"BA","dicoAreacode":3,"dicoLocationcode":387,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"波黑","dicoDescription":"","dicoIsdel":1},{"dicoId":144,"dicoCountryid":"BB","dicoAreacode":0,"dicoLocationcode":1246,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"巴巴多斯","dicoDescription":"","dicoIsdel":1},{"dicoId":152,"dicoCountryid":"BD","dicoAreacode":0,"dicoLocationcode":880,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"孟加拉國","dicoDescription":"","dicoIsdel":1},{"dicoId":160,"dicoCountryid":"BE","dicoAreacode":3,"dicoLocationcode":32,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"比利時","dicoDescription":"","dicoIsdel":1},{"dicoId":168,"dicoCountryid":"BF","dicoAreacode":0,"dicoLocationcode":226,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"布基納法索","dicoDescription":"","dicoIsdel":1},{"dicoId":176,"dicoCountryid":"BG","dicoAreacode":3,"dicoLocationcode":359,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"保加利亞","dicoDescription":"","dicoIsdel":1},{"dicoId":184,"dicoCountryid":"BH","dicoAreacode":0,"dicoLocationcode":973,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"巴林","dicoDescription":"","dicoIsdel":1},{"dicoId":192,"dicoCountryid":"BI","dicoAreacode":0,"dicoLocationcode":257,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"布隆迪","dicoDescription":"","dicoIsdel":1},{"dicoId":200,"dicoCountryid":"BJ","dicoAreacode":0,"dicoLocationcode":229,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"貝寧","dicoDescription":"","dicoIsdel":1},{"dicoId":208,"dicoCountryid":"BM","dicoAreacode":0,"dicoLocationcode":1441,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"百慕大","dicoDescription":"","dicoIsdel":1},{"dicoId":216,"dicoCountryid":"BN","dicoAreacode":0,"dicoLocationcode":673,"dicoIssms":1,"dicoJetlag":2.0,"dicoLanguage":"zh-tw","dicoName":"文萊","dicoDescription":"","dicoIsdel":1},{"dicoId":224,"dicoCountryid":"BO","dicoAreacode":0,"dicoLocationcode":591,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"玻利維亞","dicoDescription":"","dicoIsdel":1},{"dicoId":232,"dicoCountryid":"BR","dicoAreacode":0,"dicoLocationcode":55,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"巴西","dicoDescription":"","dicoIsdel":1},{"dicoId":240,"dicoCountryid":"BS","dicoAreacode":0,"dicoLocationcode":1242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"巴哈馬","dicoDescription":"","dicoIsdel":1},{"dicoId":248,"dicoCountryid":"BT","dicoAreacode":0,"dicoLocationcode":975,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"不丹","dicoDescription":"","dicoIsdel":1},{"dicoId":256,"dicoCountryid":"BW","dicoAreacode":0,"dicoLocationcode":267,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"博茨瓦納","dicoDescription":"","dicoIsdel":1},{"dicoId":264,"dicoCountryid":"BY","dicoAreacode":3,"dicoLocationcode":375,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"白俄羅斯","dicoDescription":"","dicoIsdel":1},{"dicoId":272,"dicoCountryid":"BZ","dicoAreacode":0,"dicoLocationcode":501,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"伯利茲","dicoDescription":"","dicoIsdel":1},{"dicoId":280,"dicoCountryid":"CA","dicoAreacode":3,"dicoLocationcode":1,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"加拿大","dicoDescription":"","dicoIsdel":1},{"dicoId":288,"dicoCountryid":"CF","dicoAreacode":0,"dicoLocationcode":236,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"中非共和國","dicoDescription":"","dicoIsdel":1},{"dicoId":296,"dicoCountryid":"CG","dicoAreacode":0,"dicoLocationcode":243,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"剛果民主共和國","dicoDescription":"","dicoIsdel":1},{"dicoId":304,"dicoCountryid":"CGB","dicoAreacode":0,"dicoLocationcode":242,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"Congo-Brazzaville","dicoDescription":"","dicoIsdel":1},{"dicoId":312,"dicoCountryid":"CH","dicoAreacode":3,"dicoLocationcode":41,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"瑞士","dicoDescription":"","dicoIsdel":1},{"dicoId":320,"dicoCountryid":"CI","dicoAreacode":0,"dicoLocationcode":225,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"科特迪瓦","dicoDescription":"","dicoIsdel":1},{"dicoId":328,"dicoCountryid":"CK","dicoAreacode":0,"dicoLocationcode":682,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"庫克群島","dicoDescription":"","dicoIsdel":1},{"dicoId":336,"dicoCountryid":"CL","dicoAreacode":0,"dicoLocationcode":56,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"智利","dicoDescription":"","dicoIsdel":1},{"dicoId":344,"dicoCountryid":"CM","dicoAreacode":0,"dicoLocationcode":237,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"喀麥隆","dicoDescription":"","dicoIsdel":1},{"dicoId":352,"dicoCountryid":"CN","dicoAreacode":1,"dicoLocationcode":86,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"中國","dicoDescription":"","dicoIsdel":1},{"dicoId":360,"dicoCountryid":"CO","dicoAreacode":0,"dicoLocationcode":57,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"哥倫比亞","dicoDescription":"","dicoIsdel":1},{"dicoId":368,"dicoCountryid":"CR","dicoAreacode":0,"dicoLocationcode":506,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"哥斯達黎加","dicoDescription":"","dicoIsdel":1},{"dicoId":376,"dicoCountryid":"CU","dicoAreacode":0,"dicoLocationcode":53,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"古巴","dicoDescription":"","dicoIsdel":1},{"dicoId":384,"dicoCountryid":"CV","dicoAreacode":0,"dicoLocationcode":238,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"佛得角","dicoDescription":"","dicoIsdel":1},{"dicoId":392,"dicoCountryid":"CY","dicoAreacode":3,"dicoLocationcode":357,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"塞浦路斯","dicoDescription":"","dicoIsdel":1},{"dicoId":400,"dicoCountryid":"CZ","dicoAreacode":3,"dicoLocationcode":420,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"捷克","dicoDescription":"","dicoIsdel":1},{"dicoId":408,"dicoCountryid":"DE","dicoAreacode":3,"dicoLocationcode":49,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"德國","dicoDescription":"","dicoIsdel":1},{"dicoId":416,"dicoCountryid":"DJ","dicoAreacode":0,"dicoLocationcode":253,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"吉布提","dicoDescription":"","dicoIsdel":1},{"dicoId":424,"dicoCountryid":"DK","dicoAreacode":3,"dicoLocationcode":45,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"丹麥","dicoDescription":"","dicoIsdel":1},{"dicoId":432,"dicoCountryid":"DM","dicoAreacode":0,"dicoLocationcode":1767,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"多米尼克","dicoDescription":"","dicoIsdel":1},{"dicoId":440,"dicoCountryid":"DO","dicoAreacode":0,"dicoLocationcode":1809,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"多米尼加共和國","dicoDescription":"","dicoIsdel":1},{"dicoId":448,"dicoCountryid":"DZ","dicoAreacode":0,"dicoLocationcode":213,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"阿爾巴尼亞","dicoDescription":"","dicoIsdel":1},{"dicoId":456,"dicoCountryid":"EC","dicoAreacode":0,"dicoLocationcode":593,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"厄瓜多爾","dicoDescription":"","dicoIsdel":1},{"dicoId":464,"dicoCountryid":"EE","dicoAreacode":3,"dicoLocationcode":372,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"愛沙尼亞","dicoDescription":"","dicoIsdel":1},{"dicoId":472,"dicoCountryid":"EG","dicoAreacode":0,"dicoLocationcode":20,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"埃及","dicoDescription":"","dicoIsdel":1},{"dicoId":480,"dicoCountryid":"EH","dicoAreacode":0,"dicoLocationcode":0,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"西撒哈拉","dicoDescription":"","dicoIsdel":1},{"dicoId":488,"dicoCountryid":"ER","dicoAreacode":0,"dicoLocationcode":291,"dicoIssms":0,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"厄立特裏亞","dicoDescription":"","dicoIsdel":1},{"dicoId":496,"dicoCountryid":"ES","dicoAreacode":3,"dicoLocationcode":34,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"西班牙","dicoDescription":"","dicoIsdel":1},{"dicoId":504,"dicoCountryid":"ET","dicoAreacode":0,"dicoLocationcode":251,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"埃塞俄比亞","dicoDescription":"","dicoIsdel":1},{"dicoId":512,"dicoCountryid":"FI","dicoAreacode":3,"dicoLocationcode":358,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"芬蘭","dicoDescription":"","dicoIsdel":1},{"dicoId":520,"dicoCountryid":"FJ","dicoAreacode":0,"dicoLocationcode":679,"dicoIssms":1,"dicoJetlag":4.0,"dicoLanguage":"zh-tw","dicoName":"斐濟","dicoDescription":"","dicoIsdel":1},{"dicoId":528,"dicoCountryid":"FK","dicoAreacode":0,"dicoLocationcode":500,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"福克蘭群島","dicoDescription":"","dicoIsdel":1},{"dicoId":536,"dicoCountryid":"FM","dicoAreacode":0,"dicoLocationcode":691,"dicoIssms":0,"dicoJetlag":3.0,"dicoLanguage":"zh-tw","dicoName":"密克羅尼西亞","dicoDescription":"","dicoIsdel":1},{"dicoId":544,"dicoCountryid":"FO","dicoAreacode":3,"dicoLocationcode":298,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"法羅群島","dicoDescription":"","dicoIsdel":1},{"dicoId":552,"dicoCountryid":"FR","dicoAreacode":3,"dicoLocationcode":33,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"法國","dicoDescription":"","dicoIsdel":1},{"dicoId":560,"dicoCountryid":"GA","dicoAreacode":0,"dicoLocationcode":241,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"加蓬","dicoDescription":"","dicoIsdel":1},{"dicoId":568,"dicoCountryid":"GB","dicoAreacode":3,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"英國","dicoDescription":"","dicoIsdel":1},{"dicoId":576,"dicoCountryid":"GCI","dicoAreacode":0,"dicoLocationcode":44,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"根西島","dicoDescription":"","dicoIsdel":1},{"dicoId":584,"dicoCountryid":"GD","dicoAreacode":0,"dicoLocationcode":1473,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"格林納達","dicoDescription":"","dicoIsdel":1},{"dicoId":592,"dicoCountryid":"GE","dicoAreacode":0,"dicoLocationcode":995,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"格魯吉亞","dicoDescription":"","dicoIsdel":1},{"dicoId":600,"dicoCountryid":"GF","dicoAreacode":0,"dicoLocationcode":689,"dicoIssms":1,"dicoJetlag":3.0,"dicoLanguage":"zh-tw","dicoName":"法屬波利尼西亞","dicoDescription":"","dicoIsdel":1},{"dicoId":608,"dicoCountryid":"GFN","dicoAreacode":0,"dicoLocationcode":594,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"French Guiana","dicoDescription":"","dicoIsdel":1},{"dicoId":616,"dicoCountryid":"GH","dicoAreacode":0,"dicoLocationcode":233,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"加納","dicoDescription":"","dicoIsdel":1},{"dicoId":624,"dicoCountryid":"GI","dicoAreacode":0,"dicoLocationcode":350,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"直布羅陀","dicoDescription":"","dicoIsdel":1},{"dicoId":632,"dicoCountryid":"GL","dicoAreacode":0,"dicoLocationcode":299,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"格陵蘭島","dicoDescription":"","dicoIsdel":1},{"dicoId":640,"dicoCountryid":"GM","dicoAreacode":0,"dicoLocationcode":220,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"岡比亞","dicoDescription":"","dicoIsdel":1},{"dicoId":648,"dicoCountryid":"GN","dicoAreacode":0,"dicoLocationcode":224,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"幾內亞","dicoDescription":"","dicoIsdel":1},{"dicoId":656,"dicoCountryid":"GP","dicoAreacode":0,"dicoLocationcode":590,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"瓜德羅普島","dicoDescription":"","dicoIsdel":1},{"dicoId":664,"dicoCountryid":"GQ","dicoAreacode":0,"dicoLocationcode":240,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"赤道幾內亞","dicoDescription":"","dicoIsdel":1},{"dicoId":672,"dicoCountryid":"GR","dicoAreacode":3,"dicoLocationcode":30,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"希臘","dicoDescription":"","dicoIsdel":1},{"dicoId":680,"dicoCountryid":"GT","dicoAreacode":0,"dicoLocationcode":502,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"危地馬拉","dicoDescription":"","dicoIsdel":1},{"dicoId":688,"dicoCountryid":"GU","dicoAreacode":0,"dicoLocationcode":1671,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"關島","dicoDescription":"","dicoIsdel":1},{"dicoId":696,"dicoCountryid":"GW","dicoAreacode":0,"dicoLocationcode":245,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"幾內亞比紹","dicoDescription":"","dicoIsdel":1},{"dicoId":704,"dicoCountryid":"GY","dicoAreacode":0,"dicoLocationcode":592,"dicoIssms":1,"dicoJetlag":0.0,"dicoLanguage":"zh-tw","dicoName":"圭亞那","dicoDescription":"","dicoIsdel":1}]}
        var groupmap=platformZHCountryGroupMap;
        var language = $("#language").val();
        if(language=="zh-tw"){
            groupmap =platformTWCountryGroupMap;
        }else if(language=="ru-ru"){
            groupmap =platformRUCountryGroupMap;
        }else if(language=="ko-kr"){
            groupmap =platformKOCountryGroupMap;
        }else if(language=="ja-jp"){
            groupmap =platformJPCountryGroupMap;
        }else if(language=="es-es"){
            groupmap =platformESCountryGroupMap;
        }else if(language=="en-us"){
            groupmap =platformENCountryGroupMap;
        }else if(language=="de-de"){
            groupmap =platformDECountryGroupMap;
        }else{
            groupmap =platformZHCountryGroupMap;
        }

        var ag = groupmap['A-G'];
        var hm = groupmap['H-M'];
        var ns = groupmap['N-S'];
        var tz = groupmap['T-Z'];
        var html = "";
        //a-g
        html+="<ul class='a-g'>";
        ag.forEach(function(item){
            html+="<li country='"+item.dicoCountryid+"' countrycode='"+item.dicoLocationcode+"'>"+item.dicoName+"</li>";
        });
        html+="</ul>";
        //h-m
        html+="<ul class='a-g' style='display:none;'>";
        hm.forEach(function(item){
            html+="<li country='"+item.dicoCountryid+"' countrycode='"+item.dicoLocationcode+"'>"+item.dicoName+"</li>";
        });
        html+="</ul>";
        //n-s
        html+="<ul class='a-g' style='display:none;'>";
        ns.forEach(function(item){
            html+="<li country='"+item.dicoCountryid+"' countrycode='"+item.dicoLocationcode+"'>"+item.dicoName+"</li>";
        });
        html+="</ul>";
        //t-z
        html+="<ul class='a-g' style='display:none;'>";
        tz.forEach(function(item){
            html+="<li country='"+item.dicoCountryid+"' countrycode='"+item.dicoLocationcode+"'>"+item.dicoName+"</li>";
        });
        html+="</ul>";
        html+="<div class='clear'></div>";
        $("#countryjs").html(html);

        layer.open({
            area: "600px",
            skin: 'country',
            title:$.t("global.selectCountry"),
            content:$(".countrycon").html(),
            btn: [$.t("global.ok"), $.t("global.cancel")],
            yes: function (index, layero) {
                var obj = $('#countryjs ul > li[class=on]');
                //alert(obj.attr("country") + "\t" + obj.attr("countrycode") + "\t" + obj.text());
                $("#country").val(obj.attr("country"));
                $("#countrycode").val(obj.attr("countrycode"));
                $("#countryshow").text(obj.text());
                //$(".a-g li").on;
                //console.log(index+'||'+layero)
                //alert(eval("(" + layero + ")"));
                layer.close(index)
            },
            success:function(){
                $(".country-bottom").mCustomScrollbar();
            },
            cancel: function (index) {

            },

        });

        $(".country .country-top span").each(function(index, element) {
            $(this).click(function(e) {
                $(this).addClass("country-chose").siblings().removeClass("country-chose");
                $(".country .country-bottom ul").eq(index).css("display","block").siblings().css("display","none");
            });
        });
        $(".a-g li").click(function(e) {
            $(".a-g li").removeClass("on");
            $(this).addClass("on")
        });
    });

    //个人简介保存
    function saveMemberinfo(){
        nicknamecheck();
        var membNickname = $("#membNickname").val();
        var reg_year = $("#reg_year").text();
        var reg_month = $("#reg_month").text();
        var reg_day = $("#reg_day").text();
        var membHeight = $("#membHeight").val();
        var membWeight = $("#membWeight").val();
        var membSignature = $("#membSignature").val();
        var membDate = reg_year+"-"+reg_month+"-"+reg_day;
        var membJob=$("#membJob").data("tongyong");
        var membLanguage=$("#membLanguage").data("tongyong");
        var country=$("#country").val();
        var countrycode=$("#countrycode").val();
        var objs = $("#lableselected").find("span");
        var arr = "";

        for(var i=0;i<objs.length;i++){
            var obj = objs[i];
            arr += $(obj).attr("class")+"_"+$(obj).text() + ",";
        }
        if(arr.length>0){
            arr=arr.substring(0,arr.length-1);
        }
        //alert(arr);
        //兴趣
        /* if((reg_year==''||reg_month==''||reg_day=='')&&(!(reg_year==''&&reg_month==''&&reg_day==''))){
         //layer.msg("您输入的生日不完整");
         $(".bir-Infor-Tip").show();
         return;
         }else{
         $(".bir-Infor-Tip").hide();
         } */
        //兴趣
        if((reg_year&& reg_month&& reg_day)||(reg_year==''&&reg_month==''&&reg_day=='')){
            $("#bir-Infor-Tip").hide();
        }else{
            $("#bir-Infor-Tip").show();
            return;
        }
        if(nicknamelength){
            layer.load(0, {shade: 0.1});
            $.post("http://www.gagahi.com:80/Member/InformationPerfect",{
                nickname:membNickname,
                birthday:membDate,
                job:membJob,
                height:membHeight,
                weight:membWeight,
                language:membLanguage,
                signature:membSignature,
                country:country,
                countrycode:countrycode,
                lables:arr
            },function(result){
                layer.closeAll('loading');
                if(result.success){
                    if(result.obj==1){
                        layer.msg('保存成功',{time: 500},function(){
                            var contentTip = '<p style=" text-align:center; margin-top:20px; width:300px;">恭喜您获得7天高级会员权限 </p>';
                            layer.open({
                                type: 0,
                                /* title: '提示',*/
                                title: false,
                                content: contentTip,
                                btn: ['知道了'],
                                yes: function (index, layero) {
                                    layer.close(index);
                                    window.location.href ="<%=path%>/member/memberInformation"
                                },
                                cancel: function (index) {
                                    layer.close(index);
                                    window.location.href ="http://www.gagahi.com:80/Member/memberinformation"
                                }
                            });
                        });
                    }else{
                        layer.msg('保存成功');
                        setTimeout(function(){
                            window.location.href ="http://www.gagahi.com:80/Member/memberinformation"
                        },500);
                    }

                }
            });
        }
    }


    $(document).on("blur", "#membNickname", nicknamecheck);
    $(document).on("blur", "#oldpwd", yhm);
    $(document).on("blur", "#newpwd", newpwdckeck);
    $(document).on("blur", "#confirmpwd", newpwdckeck);
    $(document).on("blur", "#memphone", phoneckeck);

    var memgroldpwdflag = true;
    var confirmpwdflag = true;
    var nicknamelength = false;
    var emailishave = true;
    var phonevalflag=true;

    function phoneckeck(){
        var memphoneval=$("#memphone").val();
        var reg = /^\d{5,12}$/;
        if (reg.test(memphoneval)||memphoneval==='') {
            $('.memphone').css('display', 'none').siblings().css('display', 'none');
            $("#memphone").css("border-color", "#ccc");
            phonevalflag=true;
        }else{
            $(".memphone").css('display', 'block').siblings().css('display', 'none');
            $("#memphone").css("border-color", "#ff9c00");
            phonevalflag=false;
        };
    }
    function nicknamecheck(){
        var membNickname = $("#membNickname").val();
        //去掉字符串首尾空格再做判断
        if($.trim(membNickname).length<3){
            $('#nicknamelength').css('display', 'inline-block');
            $("#memphone").css("border-color", "#ff9c00");
            nicknamelength=false;
        }else{
            $('#nicknamelength').css('display', 'none');
            nicknamelength = true;
        }
    }
    function yhm(){
        var oldpwd = $("#oldpwd").val();
        var newpwd = $("#newpwd").val();
        var confirmpwd = $("#confirmpwd").val();
        if(oldpwd.trim()!=''){
            $.post("http://www.gagahi.com:80/Member/pwdcheck",{
                oldpwd:oldpwd
            },function(result){
                if(!result.success){
                    $('#writeoldpwd').css('display', 'block').siblings().css('display', 'none');
                    $("#oldpwd").css("border-color", "#ff9c00");
                    memgroldpwdflag =  false;
                }else{
                    $('#writeoldpwd').css('display', 'none').siblings().css('display', 'none');
                    $("#oldpwd").css("border-color", "#fff");
                    memgroldpwdflag= true;
                }
            });
        }else if(newpwd!=''||confirmpwd!=''){
            $('.kd1').css('display', 'block').siblings().css('display', 'none');
            $("#oldpwd").css("border-color", "#ff9c00");
            memgroldpwdflag =  false;
        }
    }
    //新密码验证
    function newpwdckeck(){
        var newpwd = $("#newpwd").val();
        var confirmpwd = $("#confirmpwd").val();
        if (newpwd == '') {
            confirmpwdflag = true;
            $("#newpwd").css("border-color", "#ccc");
        }else if (newpwd.length < 6) {
            $('.mxy').css('display', 'block').siblings().css('display', 'none');
            $("#newpwd").css("border-color", "#ff9c00");
            confirmpwdflag = false;
        } else if (newpwd.length > 20) {
            $('.mdy').css('display', 'block').siblings().css('display', 'none');
            $("#newpwd").css("border-color", "#ff9c00");
            confirmpwdflag = false;
        }else{
            $('.mdy').css('display', 'none').siblings().css('display', 'none');
            confirmpwdflag = true;
            $("#newpwd").css("border-color", "#ccc");
        }
        if(confirmpwdflag){
            if(confirmpwd!=''){
                if(newpwd!=confirmpwd){
                    $('#qrnewpwd').css('display', 'block').siblings().css('display', 'none');
                    $("#confirmpwd").css("border-color", "#ff9c00");
                    confirmpwdflag= false;
                }else{
                    $('#qrnewpwd').css('display', 'none').siblings().css('display', 'none');
                    confirmpwdflag= true;
                    $("#confirmpwd").css("border-color", "#ccc");
                }
            }else{
                if(newpwd == ''){
                    return;
                }
                $('#qrnewpwd').css('display', 'block').siblings().css('display', 'none');
                $("#confirmpwd").css("border-color", "#ff9c00");
                confirmpwdflag= false;
            }
        }
    }
    $(document).on("blur", "#mememail", emailcheck);
    //验证邮箱是否已注册
    function emailcheck(){
        var mememail = $("#mememail").val();
        var zcmyreg = /^((((1[345678][0-9])|371)\d{8})|([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6})$/ig;
        if(mememail!=''&&mememail!=null){
            if(!zcmyreg.test(mememail)){
                $('.emailerror').css('display', 'inline-block');
                $('.emailcheck').css('display', 'none');
                $("#mememail").css("border-color", "#ff9c00");
                emailishave = false;
                return false;
            }else{
                $('.emailerror').css('display', 'none');
                $.post("http://www.gagahi.com:80/Platform/emailIsExistence",{email:mememail},function(result){
                    if(result.success){
                        //邮箱存在不通过

                        $('.emailcheck').css('display', 'inline-block');
                        $("#mememail").css("border-color", "#ff9c00");
                        emailishave = false;
                        return false;
                    }else{
                        //邮箱不存在
                        $('.emailcheck').css('display', 'none');
                        $("#mememail").css("border-color", "#ccc");
                        emailishave = true;
                    }
                });
            }
        }
    }
    //完善账户
    function accountSave(){
        var pwd = $("#membPassword").val();
        var membEmail = $("#membEmail").val();
        if(pwd!=""&&membEmail!=""){
            yhm();
        }
        newpwdckeck();
        emailcheck();
        if(confirmpwdflag&&memgroldpwdflag&&emailishave&&phonevalflag){
            var massapay = $("#massapay").is(':checked')?2:1;
            var mempay = $("#mempay").is(':checked')?2:1;
            var memphone = $("#memphone").val();
            var newpwd = $("#newpwd").val();
            var mememail = $("#mememail").val();
            /* $.post("http://www.gagahi.com:80/Platform/emailIsExistence",{email:username},function(result){

             }); */
            $.post("http://www.gagahi.com:80/Member/accountPerfect",{
                newpwd:newpwd,
                ispaypalloop:mempay,
                ismasapayloop:massapay,
                phone:memphone,
                mememail:mememail
            },function(result){
                if(result.success){
                    layer.msg('保存成功');
                    window.location.href ="http://www.gagahi.com:80/Member/memberinformation"
                }
            });
        }
    }
    function sendemail(){
        var zcmyreg = /^((((1[345678][0-9])|371)\d{8})|([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6})$/ig;
        var email=$("#rzemail").val();
        if (email == '') {
            $("#tostshow").css("display","block");
        } else if (!zcmyreg.test(email)) {
            $("#tostshow").css("display","block");
        }else{
            $("#tostshow").css("display","none");
            var date = new Date().Format("yyyy-MM-dd hh:mm:ss");
            $.post("http://www.gagahi.com:80/Member/sendemailauthentication",{
                email:email,nowdate:date
            },function(result){
                if(result.success){
                    window.location.href ="http://www.gagahi.com:80/Member/memberinformation"
                }else{
                    layer.msg(result.msg);
                }
            });

        }
    }
    /*添加信用卡*/
    $(".diy-layer,.diy-layer-modify").css("left",($(window).width()-$(".diy-layer").width())/2+'px');
    $(".set-add-credit").click(function(e) {
        $(".diy-layer,.creditcon").css("display","block");
    });
    $(".diy-close,.diy-layer .cancel").click(function(e) {
        $(".diy-layer,.creditcon").css("display","none");
    });
    /*修改信用卡*/
    /*   $(".credit-modify").click(function(e) {
     $(".diy-layer-modify,.creditcon").css("display","block");
     });   */
    //修改信用卡信息
    /* function updatecard(id){
     $.post("http://www.gagahi.com:80/MemberCredit/getMemCard",{
     memcardid:id
     },function(result){
     if(result.success){
     var item = result.obj;// window.location.href ="http://www.gagahi.com:80/Member/memberinformation"

     $("#updatecardtype").text(item.mecrCardtype);
     $("#updatecardname").val(item.mecrCardname);
     $("#updatecardid").val(item.mecrId);
     $("#updatecardnum").text(item.showCardnumber);
     $("#updatecardmonth").text(item.showmonth);
     $("#updatecardyear").text(item.showyear);
     $("#updatecardsafecode").val(item.mecrSafetycode);
     $("#updatecardphone").val(item.mecrPhone);
     $(".diy-layer-modify,.creditcon").css("display","block");
     }
     });
     } */
    //删除信用卡信息
    function delcard(obj,id){
        var msg = '您确定要删除已绑定的信用卡吗？';
        var delsuccess = '已删除';
        layer.confirm(msg,{btn:[$.t("global.ok"), $.t("global.cancel")],title:$.t("Letter.prompt")},function(index){
            var memcrid
            $.post("http://www.gagahi.com:80/MemberCredit/delCredit",{
                memcrid:id
            },function(result){
                if(result.success){
                    layer.msg(delsuccess);
                    //layer.close(index);
                    setTimeout('window.location.href ="http://www.gagahi.com:80/Member/memberinformation"',1500);
                }
            });
        })
    }
    $(".diy-close1,.diy-layer-modify .cancel").click(function(e) {
        $(".diy-layer-modify,.creditcon").css("display","none");
    });
    //修改信用卡信息
    function updatesavecard(){
        var id = $("#updatecardid").val();
        /* if($("#updatecardname").val()==""){
         $(".no-name").css("display","block");
         } */
        var tipErrorMsg = $("#updateno-name")
        var reg = new RegExp("^[0-9]*$");
        var mecrCardname = $("#updatecardname").val();
        var mecrEnddate =  $("#updatecardyear").text()+"-"+$("#updatecardmonth").text()+"-01";
        var mecrPhone =  $("#updatecardphone").val();
        var mecrSafetycode =  $("#updatecardsafecode").val();
        var payPassword = $("#payPassword").val();
        if($("#updatecardname").val()==""){
            $(".upno-name").css("display","block");
            tipErrorMsg.text("请输入您的持卡人姓名");
        }else if(mecrSafetycode==''){
            $(".upno-name").css("display","block");
            tipErrorMsg.text("请输入正确的安全码");
        }else if(!reg.test(mecrPhone)||mecrPhone==''){
            $(".upno-name").css("display","block");
            tipErrorMsg.text("请输入正确的手机号码");
        }else{
            $(".upno-name").css("display","none");
            $.post("http://www.gagahi.com:80/MemberCredit/insertMembCredit",{
                cardName:mecrCardname,
                safetycode:mecrSafetycode,
                phone:mecrPhone,
                endDate:mecrEnddate,
                caredid:id,
                cardpwd:payPassword
            },function(result){
                if(result.success){
                    window.location.href ="http://www.gagahi.com:80/Member/memberinformation"
                }
            });
        }
    }
    $(document).on("blur", "#creditcheck", creditcheck);
    function creditcheck(){
        var mecrCardnumber = $("#mecrCardnumber").val();
        var mecrPhone = $("#mecrPhone").val();
        var mecrSafetycode = $("#mecrSafetycode").val();
    }

    $("#resetPassword").click(function(){
        layer.open({
            type: 1,
            title:$.t("quickPay.resetPayPassword"),
            skin: 'resetPassword-container paymentLayer',
            area: 'auto',
            maxWidth:"440px",
            content: $("#resetPasswordJS").html(),
            btn: $.t("global.submit"),
            yes:function (index,layero){
                var payPasswordReg =  new RegExp("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$");
                var resetPasswordContainer = $(".resetPassword-container");
                var oldPassword = resetPasswordContainer.find(".oldPassword").val();
                var newPassword = resetPasswordContainer.find(".newPassword").val();
                var confirmPassword = resetPasswordContainer.find(".confirmPassword").val();
                if(oldPassword==''||oldPassword==null){
                    layer.msg($.t("quickPay.oldPayPassword"));
                    return;
                }
                if(!payPasswordReg.test(newPassword)){
                    layer.msg($.t("quickPay.passwordLettersAndNum"));
                    return;
                }
                if(newPassword != confirmPassword ){
                    layer.msg($.t("quickPay.passwordsDiffer"));
                    return;
                }
                var dataPassword = {"oldPassword":oldPassword,"newPassword":newPassword}
                $.post("http://www.gagahi.com:80/MemberCredit/resetpayPassword",dataPassword,function(reg){
                    if(!reg.success){
                        layer.msg(reg.msg);
                    }else{
                        layer.msg(reg.msg);
                        layer.close(index);
                    }
                })
            }
        });
    })





    /*判断是否为空*/

    $(".modify-safe,.add-safe").click(function(e) {
        var flag = true;
        var reg = new RegExp("^[0-9]*$");
        var payPasswordReg =  new RegExp("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$");
        var payPassword = $("#payPassword").val();
        var mecrCardnumber = $("#mecrCardnumber").val();
        var mecrPhone = $("#mecrPhone").val();
        var mecrSafetycode = $("#mecrSafetycode").val();
        var tipErrorMsg = $("#tipErrorMsg");
        if($(".diy-name").val()==""){
            $(".no-name").css("display","block");
            tipErrorMsg.text("请输入您的持卡人姓名");
        }else if(!reg.test(mecrCardnumber)||mecrCardnumber==''){
            $(".no-name").css("display","block");
            tipErrorMsg.text("请输入正确的信用卡号码");
        }else if(!payPasswordReg.test(payPassword)){
            $(".no-name").css("display","block");
            tipErrorMsg.text($.t("quickPay.passwordLettersAndNum"));
        }else if(mecrSafetycode==''){
            $(".no-name").css("display","block");
            tipErrorMsg.text("请输入正确的安全码");
        }else if(!reg.test(mecrPhone)||mecrPhone==''){
            $(".no-name").css("display","block");
            tipErrorMsg.text("请输入正确的手机号码");
        }else if(!$("#agreement").attr('checked')){
            $(".no-name").css("display","block");
            tipErrorMsg.text($.t("quickPay.notAgreePayAgreement"));
        }else{
            $(".no-name").css("display","none");
            var mecrCardtype = "";
            var objs = $("[name='mecrCardtype']");
            for(var i = 0;i < objs.length; i++){
                if($(objs[i]).is(':checked')){
                    mecrCardtype =  $(objs[i]).val();
                }

            }
            var payPassword = $("#payPassword").val();
            var mecrCardname = $("#mecrCardname").val();
            var year = $("#addyear").text();
            var month = $("#addmonth").text();
            var mecrEnddate = year+"-"+month+"-01";//$("#mecrEnddate").val();
            var cardData = {cardName:mecrCardname,cardtype:mecrCardtype,cardNum:mecrCardnumber,phone:mecrPhone,safetycode:mecrSafetycode,endDate:mecrEnddate,cardpwd:payPassword};
            $.post("http://www.gagahi.com:80/MemberCredit/insertMembCredit",cardData,function(result){
                if(result.success){
                    window.location.href ="http://www.gagahi.com:80/Member/memberinformation"
                }else{
                    layer.msg($.t("quickPay.infoWrong"));
                }
            });
        }
    });
    function cancel(){

        $("#information1").css("display","none");
        $("#information2").css("display","block");
    }
    /*展示编辑切换*/
    $(document).ready(function(){
        $(".cancel").click(function(){
            $(this).closest(".set-dom").find(".set-dom-edit").trigger("click");
        });
        $(".set-dom-edit").toggle(function(){
                    $(this).parent().siblings().children(".set-hidden").css("display","block").siblings(".set-show").css("display","none");
                },
                function(){
                    $(this).parent().siblings().children (".set-hidden").css("display","none").siblings(".set-show").css("display","block");
                    location.reload();
                }
        );
        $(".set-safe").click(function(e) {
            var mecoIsopenperson = 2;
            var perobjs = $("[name='mecoIsopenperson']");
            for(var i = 0;i < perobjs.length; i++){
                if($(perobjs[i]).is(':checked')){
                    mecoIsopenperson =  $(perobjs[i]).val();
                }

            }
            var mecoIsonline = 2;
            var lineobjs = $("[name='mecoIsonline']");
            for(var i = 0;i < lineobjs.length; i++){
                if($(lineobjs[i]).is(':checked')){
                    mecoIsonline =  $(lineobjs[i]).val();
                }

            }
            var mecoIsallowaddfriend = 2;
            var friobjs = $("[name='mecoIsallowaddfriend']");
            for(var i = 0;i < friobjs.length; i++){
                if($(friobjs[i]).is(':checked')){
                    mecoIsallowaddfriend =  $(friobjs[i]).val();
                }

            }
            //var mecoIsletter = $("#mecoIsletter").val()=="on"?1:2;
            var mecoIsletter = $("#mecoIsletter").is(':checked')?1:2;
            var mecoIslike = $("#mecoIslike").is(':checked')?1:2;
            var mecoIsvisito = $("#mecoIsvisito").is(':checked')?1:2;
            var mecoIsaddfriend = $("#mecoIsaddfriend").is(':checked')?1:2;
            var mecoIsacceptgift = $("#mecoIsacceptgift").is(':checked')?1:2;
            var mecoIszone = $("#mecoIszone").is(':checked')?1:2;
            var mecoIsbuy = $("#mecoIsbuy").is(':checked')?1:2;
            var mecoIssound = $("#mecoIssound").is(':checked')?1:2;
            var mecoId = $("#mecoId").val();
            $.post("http://www.gagahi.com:80/Member/config/saveConfig",{
                mecoId:mecoId,
                mecoIsopenperson:mecoIsopenperson,
                mecoIsonline:mecoIsonline,
                mecoIsallowaddfriend:mecoIsallowaddfriend,
                mecoIsletter:mecoIsletter,
                mecoIslike:mecoIslike,
                mecoIsvisito:mecoIsvisito,
                mecoIsaddfriend:mecoIsaddfriend,
                mecoIsacceptgift:mecoIsacceptgift,
                mecoIszone:mecoIszone,
                mecoIsbuy:mecoIsbuy,
                mecoIssound:mecoIssound
            },function(result){
                if(result.success){
                    window.location.href ="http://www.gagahi.com:80/Member/memberinformation"
                }
            });
            /* $(this).parents(".set-hidden").css("display","none").siblings(".set-show").css("display","block");  */

        });
    });
    /*兴趣选择*/

    $(document).on("click",".interest-edit-select span",(function(e) {
        var _class=$(this).attr("class");
        _text=$(this).text()
        if($(".interest-edit-selected span").hasClass(_class)){
            $(".interest-edit-selected span."+_class).remove();
        }
        else{
            $(".interest-edit-selected").append("<span class="+_class+">"+_text+"</span>")
        }
    }));



    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>
<!--选择国家弹窗html开始-->
<div class="countrycon" style="display:none;">
    <div class="country-top"><span class="f16 country-chose" >A-G</span><span class="f16" >H-M</span><span class="f16">N-S</span><span class="f16">T-Z</span></div>
    <div class="country-bottom" id="countryjs">
        <ul class="a-g">
            <li>aaaaaa</li>
            <li>Botswana</li>
            <li>Central</li>
            <li>Ajibout</li>
            <li>Gambia</li>
            <li>libraue</li>
            <li>Algeria</li>
            <li>Botswana</li>
            <li>Central</li>
            <li>Ajibout</li>
            <li>Gambia</li>
            <li>libraue</li>
        </ul>
        <ul class="a-g" style="display:none;">
            <li>bbbbbbbb</li>
            <li>Botswana</li>
            <li>Central</li>
            <li>Ajibout</li>
            <li>Gambia</li>
            <li>libraue</li>
            <li>Algeria</li>
            <li>Botswana</li>
            <li>Central</li>
            <li>Ajibout</li>
            <li>Gambia</li>
            <li>libraue</li>
        </ul>
        <ul class="a-g" style="display:none;">
            <li>ccccccc</li>
            <li>Botswana</li>
            <li>Central</li>
            <li>Ajibout</li>
            <li>Gambia</li>
            <li>libraue</li>
            <li>Algeria</li>
            <li>Botswana</li>
            <li>Central</li>
            <li>Ajibout</li>
            <li>Gambia</li>
            <li>libraue</li>
        </ul>
        <ul class="a-g" style="display:none;">
            <li>dddddddd</li>
            <li>Botswana</li>
            <li>Central</li>
            <li>Ajibout</li>
            <li>Gambia</li>
            <li>libraue</li>
            <li>Algeria</li>
            <li>Botswana</li>
            <li>Central</li>
            <li>Ajibout</li>
            <li>Gambia</li>
            <li>libraue</li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
<!--选择国家弹窗html结束-->


<!--小白完善资料-->
<script type="text/javascript">
    $(function(){
        if('0'==1){
            $("#editAccount").trigger("click");
        }
    });
</script>
