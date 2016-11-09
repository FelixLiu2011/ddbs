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
            if('encounterIndex'=='encounterIndex'){
                $("#encounterIndex").attr("class","on");
            }
            if('zoneIndex'=='encounterIndex'){
                $("#zoneIndex").attr("class","on");
            }
            if('gameIndex'=='encounterIndex'){
                $("#gameIndex").attr("class","on");
            }
            if('shopIndex'=='encounterIndex'){
                $("#shopIndex").attr("class","on");
            }

            //左侧导航
            if('leftSixinIndex'=='encounterIndex'){
                $("#leftSixinIndexImg").attr("class","on");
                $("#leftSixinIndexText").attr("class","on");
            }
            if('leftLikeMeIndex'=='encounterIndex'){
                $("#leftLikeMeIndexImg").attr("class","lkm on");
                $("#leftLikeMeIndexText").attr("class","on");
            }
            if('leftIlikeIndex'=='encounterIndex'){
                $("#leftIlikeIndexImg").attr("class","mlk on");
                $("#leftIlikeIndexText").attr("class","on");
            }
            if('leftFriendIndex'=='encounterIndex'){
                $("#leftFriendIndexImg").attr("class","each-lk on");
                $("#leftFriendIndexText").attr("class","on");
            }
            if('leftVisitorIndex'=='encounterIndex'){
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
<div class="head"  gagaid="2935498">
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
                        <!-- <li><span class="tx"><img src="<%=path%>/common/images/gg1.jpg"></span><span class="nm">Nita2009</span>
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
    var token="29b525b8905e49f3aa987b286a5e2789";
    var sendGender = "1";//1男2女
    var sendHeadImgUrl = "images/default/male.png";//小头像
    var myNickname = "正直的代言人";//自己昵称
    var myLanguage = "zh-cn";
    var myId = "2935498";//我的ID
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





<link href="<%=path%>/common/css/zfx.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/common/css/like.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/common/css/privateLetter.css" rel="stylesheet" type="text/css">
<script src="<%=path%>/common/js/jquery.range.js" type="text/javascript"></script>

<script src="<%=path%>/common/js/slide.js" type="text/javascript"></script>
<link href="<%=path%>/common/css/like.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/common/css/zone.css" rel="stylesheet" type="text/css">


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
                        <a class="ellipsis-name" href="<%=path%>/member/myInformation"  title="正直的代言人">正直的代言人</a>

                    </p>
                    <p class="ari hui f12" style="margin: 8px 0">GaGaID:30040277</p>

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
            <div class="rht" style="padding-right:0; width:836px;" >
                <input type="hidden" id="friGagaid" value=1102701>
                <span class="o-nickname hide">mengzai</span>
                <input type="hidden" id="friLevel" value=2>
                <div class="PersonalHomepage-top">
                    <div class="yhtx fl tx-con"><img src="http://images.gagahi.com//A-0b4bf8e468714ccaa2d001e2dc441bcf?imageMogr2/thumbnail/410x300/thumbnail/400x400/crop/!234x234a0a11"><!--根据是否有头像决定显示隐藏<div class="portrait-default"><img src="../images/tx-default.png" alt="上传头像"></div>-->

                    </div>



                    <div class="PersonalHomepage-top-r fl pt5 ml10" style="width:766px; border-bottom:1px dashed #ccc; padding-bottom:16px;">
                        <p class="ari f16 c-2d57a1 mb10" >


                            mengzai






                            <img src="<%=path%>/common/images/hg.jpg" class="ml10">

                        <p class="c-696969 mb10">

                            <span>女</span>,
                            <span>25</span>,
                            <span>美国</span>,

                            <span>GaGaID:mengzai</span>
                        </p>
                        <p class="c-696969 mb10">个性签名：<span class="c-033333">Do you want to go to plac</span></p>
                        <p class="hobby">

                            <span class="bdra15 pl10 pr10">宝马</span>

                            <span class="bdra15 pl10 pr10">跑步</span>

                            <span class="bdra15 pl10 pr10">单身</span>

                            <span class="bdra15 pl10 pr10">金融</span>

                            <span class="bdra15 pl10 pr10">奔驰</span>
                        </p>
                        <!--  <span class="bdra15 pl10 pr10">健身</span><span class="bdra15 pl10 pr10">唱歌</span><span class="bdra15 pl10 pr10">宅</span><span class="bdra15 pl10 pr10">宠物</span><span class="bdra15 pl10 pr10">骑行</span><span class="bdra15 pl10 pr10">IT</span></p> -->
                    </div>
                    <div class="clear"></div>
                    <div class="other-operation">
                        <div class="other-operationl fl"><a href="<%=path%>/pay/upgradeMember?forwhoid=1102701" class="upgradeforhim bdra15  h30 c-fff" >为Ta升级</a></div>
                        <div class=" fr like-topr pt20 mr15"><span  id="sendMsgBtn"  class="conversation"></span>
            <span class="friending">
            <div class="friend-tip f12 tc">加为好友</div></span>
                            <span class="i-like "></span><span class="gift"></span></div>
                        <div class="clear"></div>
                    </div>

                </div>
            </div>
            <div class="other-Private-information">
                <div class="fl">

                    <span class="mr15">职业：</span>
      	<span class="mr15 ml15" >语言：


							中文(简体)










      	</span>
                    <span class="mr15 ml15">身高：167cm </span>
      	<span class="mr15 ml15">体重： 43公斤
      	</span>
                </div>
                <div class="fr"><span class="c-2d57a1 curPor" id="inviteperfect"></span></div>
            </div>
            <div class="ladyScroll"> <a class="prev"  style="display: none" id="prevleft" href="javascript:void(0)"></a>
                <div class="scrollWrap">
                    <div  id="showPhotoTip" class="tc" style="height: 120px;line-height: 120px;display:none;background-color: #eeeeee;" data-i18n="home.noShowTip"></div>
                    <div class="dlList" id="dllist">

                    </div>
                </div>

                <a class="next" style="display: none" id="nextright" href="javascript:void(0)"></a>
            </div>
            <!-- <script type="text/javascript">
	jQuery(".ladyScroll").slide({ mainCell:".dlList", effect:"leftLoop",vis:6, autoPlay:false});
	</script> -->
            <div class="rht mt15 other-list" id="gerendongtai">
                <div class="dynamic">
                    <ul></ul>
                </div>
                <!--没有动态时候展示开始-->
                <div class="no-dynamic tc other" style="display:none;"><p></p></div>
                <!--没有动态时候展示开始-->
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id='zoneTemp' style="display: none;">
    <div class="dynamic-top">
        <div class="dynamic-topl fl"><img src="" field="memb_bigimg"></div>
        <div class="dynamic-topr fl ml10 pt5">
            <p><span field="memb_nickname"></span><span class="hui ml10" field="zone_datetime"></span></p>
            <p class="zone-text" field="zone_content"></p>
            <div class="translate mt10 zones" style="display:none;">
                <span class="translate_content" field="zoneTrans"></span>
                <div class="translate-little"></div>
            </div>
            <div class="zoneimgs mt10 clearfix" field="zone_img"></div>
            <div id="dynamic_f" class="f_detail">
                <div data-like="" islove="" class="inlineblock onlike"><i class="dt_icon_r dt_like_btn" field="isLove"></i><span field="zone_likecount"></span></div>
                <div data-reply="" class="inlineblock ml20 onreply zones"><i class="dt_icon_r dt_reply_btn"></i><span field="zone_commentcount"></span></div>
                <div data-lang="" class="inlineblock ml20 dt_tranS_box zones"><i class="dt_icon_r dt_tranS_btn "></i></div>
            </div>
            <div class="textinput other_zone">
                <div class="commont-content-box" style="display: none;"></div>
                <a href='javascript:void(0);' class="more-commont hide"></a>
                <a class="c_tx3 inlineblock" href="javascript:;"></a>
                <div class="reply_box" style="display:none;">
                    <!--    <div class="replyTextBox scorll-comment mCustomScrollbar">
                            <textarea placeholder="评论内容" name="" ></textarea>
                        </div> --><textarea class="js_Reply_txt" name="" style='padding:5px;border: 1px solid #cccccc;width:100%;-moz-border-radius: 9px;-webkit-border-radius: 9px;'></textarea>
                    <div class="reply_foot">
                        <span class="reply-lens">0/240</span>
                        <div class="reply_send send_btn pl15 pr15 pb5 fr"><i class="inlineblock mb-2 send_i dt_icon"></i></div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="z_dt_icon del-dynamic hide"></div>
            <div class="report-dynamic"></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="commontContentTemp" style="display: none;">
    <div class="commont-content-out">
        <div class="commont-content">
            <div class="commont-contentl fl"><img src="common/images/photo1.jpg" field="memb_bigimg"></div>
            <div class="commont-contentr fl ml10">
                <p><span field="memb_nickname"></span><span class="hui ml10" field="zoco_time"></span></p>
                <div class="commont-contentr-bottom">
                    <span field="zoco_content" class="comment_words"></span>
                    <div id="dynamic_f" class="f_detail" style="display: inline; padding:0; background:none">
                        <div data-reply="10" class="inlineblock ml20 onreply"><i class="dt_icon_r1"></i></div>
                        <div data-lang="" class="inlineblock ml5 dt_tranS_box"><i class="dt_tranS_btn1 "></i></div>
                        <div class="z_dt_icon del-zoco"></div>
                    </div>
                    <div class="translate mt10 coms" style="display:none; background:#fff;">
                        <span class="zoco_content-translate" field="zmtr_trans"></span>
                        <div class="translate-little translate-little1"></div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div id="replyTemp" style="display: none;">
    <div class="reply_box" style="display: block;">
        <textarea class="js_Reply_txt" placeholder="评论内容" id="" name="" ></textarea>
        <div class="reply_foot">
            <span class="reply-lens">0/240</span>
            <div class="reply_send send_btn pl15 pr15 pb5 fr"><i class="inlineblock mb-2 send_i dt_icon"></i></div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div id="transTypeTemp" style="display: none;">
    <div class="trans-type" style="display: none;">
        <span class="ul_bg"></span>
        <ul>
            <li data-type="en">English</li>
            <li data-type="zh">简体中文</li>
            <li data-type="cht">繁體中文</li>
            <li data-type="kor">한국어</li>
            <li data-type="ru">Pусский</li>
            <li data-type="de">Deutsch</li>
            <li data-type="spa">Español</li>
            <li data-type="jp">日本語</li>
        </ul>
    </div>
</div>
<!----------男性---购买条数-------------->
<div class="privatebuyNumCon" style=" display:none;">
    <div class="balance tc">您的金币余额：<span class="c-ff8a00 f25 mr5 myMoney">0</span><span class="money mt15"></span><span class="hui ml10">（服务费用1金币 / 10条私信）</span></div>
    <div class="recharge" style="margin:50px auto 45px;">
        <p class=" tc mb10">选择条数：
            <input class="min bdra15 h36 fb f20" name="" type="button" value="-">
            <b><input class="text_box f18 fb" name="" type="text" value="10"></b>
            <b><input class="add bdra15 h36 fb f18" name="" type="button" value="+"></b>
        </p>
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
            <div class="TipsContent">您今日私信条数已用完<!-- 您今日私信条数已用完 -->！</div>
            <div class="character"><span class="characterNum">0</span>/500</div>
            <textarea id="sendContent" class="sendContent mt10" style="height: 150px;width:450px;">##im.enterKeySend##</textarea>
            <div class="btnContainer bdra15">
                <div class="langOptions">
                    <span class="txt">翻译：</span>
                    <div class="langBtn">
                        <span class="language" langs-lang="">不翻译</span>
                        <i class="Triangle"></i>
                    </div>
                    <ul class="languageUl">
                        <li class="langLi" langs-lang="">不翻译</li>
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
                    <li id="sendBtn" class="sendBtn">发送<!-- 发送 --></li>
                </ul>
            </div>
        </div>
    </div>
</script>




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
                <a href="http://www.gagahi.com:80/Platform/inviteRegIndex?source=2&inviter=1102701&sysid=" class="fl c-2d57a1 f13">注册<!-- 注册 --></a>
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

        var token="29b525b8905e49f3aa987b286a5e2789";
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

<script src="<%=path%>/common/js/ScrollBar/minified/jquery.mousewheel.min.js"></script>
<script src="<%=path%>/common/js/global_plugin.js"></script>
<script type="text/javascript" src="<%=path%>/common/js/laytpl.js"></script>
<script type="text/javascript" src="<%=path%>/common/IM/js/jquery.qqFace.js"></script>
<script type="text/javascript" src="<%=path%>/common/js/popPrivateLetter.js"></script>
<script src="<%=path%>/common/js/zone/member_zonelist.js" type="text/javascript"></script>
<script>
    //获取兴趣列表
    /* function getLables(){
     var melaGagaid = $("#friGagaid").val();
     $.ajax({
     type : "post",
     url : "http://www.gagahi.com:80/MemberLable/lableList",
     dataType : "json",
     data : {
     "melaGagaid" : melaGagaid
     },
     success : function(data) {
     alert(data);
     data.forEach(function(item){
     var melaLablename = item.melaLablename;
     alert(melaLablename);
     });
     }
     });
     } */
    //发送私信事件
    $(function(){
        $("#sendMsgBtn").click(function(){
            var gettpl = Zoneyet.template($('#temp_home_popPrivate').html()).render({});

            layer.open({
                area: '600px',
                skin: 'giftCon1',
                title:$.t("Letter.sendPri"),
                content: gettpl,
                type: 1,
                //title: false,
                // btn: [],
                zIndex:19890305,
                success: function(layero, ix){
                    //console.log('zh-cn');
                    if(sendGender =="1"){
                        switch('zh-cn'){
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
                    var melaGagaid = $("#friGagaid").val();
                    var give_pv_to=$(".o-nickname").html();
                    if (!give_pv_to.match(/\<\s*script\s*\>/g)) {
                        give_pv_to = $.string.decodeHtml(give_pv_to);
                    }
                    $("#give_pv_to").text(give_pv_to);
                    $("#give_pv_to_id").val(melaGagaid);
                    //初始化弹出私信框
                    new popPrivate.pri();
                },
                yes: function (index, layero) {

                },
                cancel: function (index) {
                }
            });
        });
    });

    $("#inviteperfect").click(function(e) {
        var melaGagaid = $("#friGagaid").val();
        $.post("http://www.gagahi.com:80/Member/invitenotice",{othergagaid:melaGagaid,type:2},function(result){
            //$("span").html(result);
            if(result.success){
                layer.msg(result.msg);
            }
        });
    });
    $(".invitation-upload").click(function(e) {
        var melaGagaid = $("#friGagaid").val();
        $.post("http://www.gagahi.com:80/Member/invitenotice",{othergagaid:melaGagaid,type:1},function(result){
            //$("span").html(result);
            if(result.success){
                layer.msg(result.msg);
            }
        });
    });

    function walledList(){
        var melaGagaid = $("#friGagaid").val();
        var melLevel = $('#friLevel').val();
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Ihome/Photo/walledList",
            dataType : "json",
            data : {
                "gagaId" : melaGagaid
            },
            success : function(data) {
                var html="";
                var imgnum=0;
                if(data.obj.length>0){
                    $("#showPhotoTip").hide();
                }else{
                    $("#showPhotoTip").show();
                }
                data.obj.forEach(function(item){
                    imgnum+=1;
                    //alert("dfs");
                    var zoimImgurl = item.zoimImgurl;
                    var zoneId = item.zoimZoneid;
                    //html+="<dl><dt><a href='http://www.gagahi.com:80/Zone/detail/"+zoneId+"'><img src='http://images.gagahi.com//"+zoimImgurl+"'></a></dt></dl>";
                    html+="<dl><dt><a href='javascript:void(0)' zid='"+ zoneId +"' imgid='" + item.zoimId + "' zoimsort='"+ item.zoimSort +"' onclick='openImgDialog(this)'><img src='http://images.gagahi.com//"+zoimImgurl+"?imageView2/5/w/123/h/120'></a></dt></dl>";
                });
                $("#dllist").html(html);
                if ((melLevel == 1 && data.obj.length == 4) || (melLevel == 2 && data.obj.length == 6) || (melLevel == 3 && data.obj.length == 12)) {
                    jQuery(".ladyScroll").slide({ mainCell:".dlList", effect:"leftLoop",vis:7, autoPlay:false});
                    $('.ladyScroll .scrollWrap').addClass('full');
                } else {
                    jQuery(".ladyScroll").slide({ mainCell:".dlList", effect:"leftLoop",vis:6, autoPlay:false});
                }
                if(melLevel == 3 && imgnum>=6){
                    $("#prevleft,#nextright").show();
                }
            }
        });
    }
    /*加好友*/
    if( $(".friending").length >0){
        var addFriend = true;
        $(".friending").click(function(e) {
            if(addFriend){
                addFriend = false;
                var friGagaid = $("#friGagaid").val();
                //layer.msg('加好友申请发送成功');
                $._post("http://www.gagahi.com:80/Member/Friend/applyFriend",{friGagaid:friGagaid,source:4},function(result){
                    //$("span").html(result);
                    if(result.success){
                        if(result.obj==3){
                            layer.msg('对方已经是您的好友');
                        }else{
                            layer.msg('加好友申请发送成功');
                            $(".friending").css("display","none");
                        }
                    }
                },function(result){
                    addFriend = true;
                });
            }
        });


    }

    /*修改滚动轴初始化，照片墙数据载入*/
    $(window).load(function(){
        walledList();
        //loadFriendComment();
    });

    var zoneObj = new loadMyZone($("#friGagaid").val(), true);



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

    /*分页*/
    /*   $(".tcdPageCode").createPage({
     pageCount:15,//总页数
     current:1,//当前页
     backFn:function(p){
     console.log(p);
     }
     }); */

    /*点赞评论*/
    $("#dynamic_f .onlike").click(function(){
        var _this = $(this);
        var v = _this.attr("data-like");
        v = parseInt(v)+1;
        _this.find("span").text(v);
        _this.find("i").addClass("on");

    });
    /*点赞评论*/
    $(".i-like").click(function(){
        var _this = $(this);
        var friGagaid = $("#friGagaid").val();
        $.post("http://www.gagahi.com:80/Member/Like/iliketo",{mid:friGagaid},function(result){
            //$("span").html(result);
            if(result.success){
                if(_this.hasClass("on")){
                    _this.removeClass("on");
                }else{
                    _this.addClass("on");
                    $.zone.likeAct(_this,{left:"10px"});
                }
                //2016年4月15日11:33:17  产品要求去掉提示
                //layer.msg(result.msg);
            }
        });


    });
    /*点击输入评论*/
    $(".c_tx3").each(function(index, element) {
        $(this).click(function(e) {
            if("$(this).siblings('.commont-content-out').children('.reply_box').css('display','block')"){
                $(this).siblings(".commont-content-out").children(".reply_box").css("display","none");
                $(this).siblings(".reply_box").css("display","block");
                $(this).css("display","none");
            }


        });
    });
    $(".dt_icon_r1").each(function(index, element) {
        var _this = $(this);
        $(_this).click(function(e) {
            if($(_this).parents(".commont-content-out").siblings(".reply_box").css("display","block")){
                $(_this).parents(".commont-content-out").siblings(".reply_box").css("display","none")
                $(_this).parents(".commont-content").siblings(".reply_box").css("display"," block");
                $(_this).parents(".commont-content-out").siblings(".c_tx3").css("display","block")
            }


        });
    });

    /*显示翻译*/
    $(".dt_tranS_btn,.dt_tranS_btn1 ").click(function(e) {
        $(this).toggleClass("on");
        $(this).parents(".f_detail").siblings(".translate").toggle();
    });

    gvid = "";//选中的礼物id
    type = "";//礼物or翻译包
    /**选中礼物*/
    function selectedgift(obj,gid,types){
        //$(obj).siblings().children(".chosed").css("display","none");
        $(obj).closest(".giftcont").find(".giftcont1 li").children(".chosed").css("display","none");
        $(obj).children(".chosed").css("display","block");
        gvid = gid;
        type = types;
    }

    /*赠送礼物*/
    gpage = 0;//礼物分页
    tpage = 0;//翻译包分页
    $(".gift").click(function(e) {
        gpage = 0;//礼物分页
        tpage = 0;//翻译包分页
        $(this).addClass("on");
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
                        str += "<li onclick=\"selectedgift(this,"+data.obj[i].giviId+",1)\">"
                                +"<p><img src=\"http://images.gagahi.com/"+data.obj[i].giviDisplay+"?imageMogr2/thumbnail/100x100\" ></p>"
                                +"<p class=\"mt5\"><span class=\"c-ff8a00 f18 mr5\">"+data.obj[i].giviGold
                                +"</span><span class=\"money\"></span></p><div class=\"chosed\"></div></li>";
                    }
                    $(".giftcont").find(".gift1").html(str);
                }else{
                    alert(data.msg);
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
                        str += "<li onclick=\"selectedgift(this,"+data.obj[i].trpaId+",2)\">"
                                +"<p><img src=\"http://images.gagahi.com/"+data.obj[i].trpaImgurl+"?imageMogr2/thumbnail/100x78\" ></p>"
                                +"<p>"+data.obj[i].trpaCharcount+"字符</p>"
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
            title:'赠送礼物',
            content: $(".giftCon").html(),
            btn: '确认',
            yes: function (index, layero) {
                if(null == gvid || $.trim(gvid).length <= 0
                        ||null == type || $.trim(type).length <= 0){
                    layer.msg("请先选择礼物！");
                    return;
                }
                returnGive();
                layer.close(index)
                $(".gift").removeClass("on");
            },
            cancel: function (index) {
                $(".gift").removeClass("on");
            },
        });

        $(".giftCon1 .gift-top span").click(function(e) {
            $(this).addClass("gift-chose").siblings().removeClass("gift-chose");
            var $ulobj = $(this).parents(".layui-layer-content").find(".giftcont").find("ul");
            $ulobj.hide().eq($(this).index()).show();
        });
    });

    /**获取礼物*/
    function findgiftlist(obj){
        //alert(obj.scrollHeight+"--------"+obj.scrollTop + "------"+$(obj).height());
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
                        str += "<li onclick=\"selectedgift(this,"+data.obj[i].giviId+",1)\">"
                                +"<p><img src=\"http://images.gagahi.com/"+data.obj[i].giviDisplay+"?imageMogr2/thumbnail/100x100\" ></p>"
                                +"<p class=\"mt5\"><span class=\"c-ff8a00 f18 mr5\">"+data.obj[i].giviGold
                                +"</span><span class=\"money\"></span></p><div class=\"chosed\"></div></li>";
                    }
                    $(obj).append(str);
                }else{
                    alert(data.msg);
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
                        str += "<li onclick=\"selectedgift(this,"+data.obj[i].trpaId+",2)\">"
                                +"<p><img src=\"http://images.gagahi.com/"+data.obj[i].trpaImgurl+"?imageMogr2/thumbnail/100x78\" ></p>"
                                +"<p>"+data.obj[i].trpaCharcount+"字符</p>"
                                +"<p class=\"mt5\"><span class=\"c-ff8a00 f18 mr5\">"+data.obj[i].trpaGold
                                +"</span><span class=\"money\"></span></p><div class=\"chosed\"></div></li>";
                    }
                    $(obj).append(str);
                }else{
                    alert(data.msg);
                }
            }
        });
    }

    /**回赠*/
    function returnGive(){
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Member/givegift",
            contentType : "application/x-www-form-urlencoded",
            data: {"mid":'1102701',"gvid":gvid,"type":type},
            success: function(data){
                if(data.success){
                    layer.msg(data.msg);
                }else{
                    layer.msg(data.msg);
                }
            }
        });
    }

    ///////////////////////////////////////////////照片弹窗////////////////////////////////////////////////////
    //显示隐藏删除评论
    $(".comment_item").hover(function(){
        $(this).addClass("on")
    },function(){
        $(this).removeClass("on")
    });
    $(".layui-layer-content").css("overflow","hidden");
    $('.dynamic_detail').slide({
        mainCell:".bd",
    });
    $(".slide_item").mCustomScrollbar({
        scrollbar:false
    });
    $(".detail_box").mCustomScrollbar({
        scrollbar:false,
        callbacks:{ onTotalScrollOffset:140 }
    });

    /**打开照片弹窗*/
    function openImgDialog(obj){
        var zid = $(obj).attr("zid");//获取动态id
        var imglistindex = $(obj).attr("zoimSort");//设置展示下标
        var zoneArr = [];
        $('#dllist dl:not(.clone) a').each(function() {
            zoneArr.push({
                imgid: $(this).attr('imgid'),
                zoneid: $(this).attr('zid')
            });
        });
        //ajaxGetZone(zid,0,1,"a");//异步加载数据
        $.fn.zoneDetail(zid, imglistindex, undefined, {
            photoArr: zoneArr,
            curPhoto: {
                imgid: $(obj).attr('imgid'),
                zoneid: $(obj).attr('zid')
            }
        });

        //打开div
        /*
         layer.open({
         area: ['860px','630px'],
         type: 1,
         title: false,
         content: $("#zoneDatail").html(), //注意，如果str是object，那么需要字符拼接。
         success:function(){
         $(".detail_right").mCustomScrollbar();//滚动条
         $(".detail_box").find(".mCustomScrollBox").css("max-height","630px");  //弹窗样式
         }
         });*/
    }

    /**
     *	异步加载动态对象
     *	zid: 当前动态id；
     *	type:-1 上页；0 当前；1 下一页
     *	isindex:1不计算；2向前；3向后
     *	index:下标
     */
    var Zone = "";//动态对象
    function ajaxGetZone(zid,type,isindex,index){
        var gagaId = $("#friGagaid").val();//他人id
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Zone/oneInfo",
            contentType : "application/x-www-form-urlencoded",
            data: {"zoneId":zid,"type":type,"gagaId":gagaId},
            success: function(data){
                if(data.success){
                    if(null != data.obj && null != data.obj.zone){
                        Zone = data.obj;
                        pageNum = 1;//重置分页
                    }
                    if(null == Zone || null == Zone.zone || null == Zone.zone.zoneId
                            || null == data.obj || null == data.obj.zone){
                        if(index != "a"){
                            imglistindex = index;
                        }
                        layer.msg('已经没有了');
                        return;
                    }
                    if(isindex == 2){
                        imglistindex = Zone.imgList.length-1;//最后一个
                    }else if(isindex == 3){
                        imglistindex = 0;//第一个
                    }
                    setImgDialog();
                }else{
                    alert(data.msg);
                }
            }
        });
    }

    /**
     *	设置img弹框
     */
    var imglistindex = 0;//动态图片
    function setImgDialog(){
        var obj = $(".dynamic_detail");
        if(null != Zone.imgList && Zone.imgList.length > 0){
            $(obj).find(".js_img_border").find("img").attr('src',"http://images.gagahi.com//"+Zone.imgList[imglistindex].zoimImgurl);//左侧动态图片
        }
        var headImg = Zone.publishMem.membBigimg;//发布者头像
        if(null == headImg || $.trim(headImg).length <= 0){
            if(Zone.publishMem.membSex == 1){//男
                headImg = "<%=path%>/common/images/default-male.png";
            }else{
                headImg = "<%=path%>/common/images/default-female.png";
            }
        }else{
            headImg = "http://images.gagahi.com//"+headImg;
        }
        $(obj).find(".detail_box").find(".inlineblock.userInfo_pto").find("img").attr('src',headImg);//发布者头像
        $(obj).find(".detail_info").find(".inlineblock").find(".userInfo_home").text(Zone.publishMem.membNickname);//发布者名称
        $(obj).find(".detail_info").find(".inlineblock").find(".time").text(Zone.zone.zoneDatetime);//发布时间
        $(obj).find(".detail_info").find(".detail_txt").text(Zone.zone.zoneContent);//发布内容
        var zotrTranslat = "";//动态内容翻译结果
        if(null != Zone.zoneTran && $.trim(Zone.zoneTran).length > 0){//不为空  有翻译
            if(null != Zone.zoneTran.zotrTranslathigh && $.trim(Zone.zoneTran.zotrTranslathigh).length > 0){//高审更新不为空
                zotrTranslat = Zone.zoneTran.zotrTranslathigh;
            }else{
                zotrTranslat = Zone.zoneTran.zotrTranslat;//译文
            }

            if(null == zotrTranslat || $.trim(zotrTranslat).length <= 0){//有数据但是翻译未完成
                zotrTranslat = '翻译中...';
            }
        }
        if(null != zotrTranslat && $.trim(zotrTranslat).length > 0){
            $(obj).find(".detail_info").find(".detail_trans").find("span").text(zotrTranslat);//内容翻译
            $(obj).find(".detail_info").find(".detail_trans").show();
        }else{
            $(obj).find(".detail_info").find(".detail_trans").hide();
        }

        $(obj).find(".detail_info").find(".f_detail").find(".onlike").attr("data-like", Zone.zone.zoneLikecount);//点赞数
        $(obj).find(".detail_info").find(".f_detail").find(".onlike").find("span").text(Zone.zone.zoneLikecount);
        $(obj).find(".detail_info").find(".f_detail").attr("zid",Zone.zone.zoneId);//回复设置自定义属性动态id
        if(Zone.isLove == 1){//已经点过赞
            $(obj).find(".detail_info").find(".f_detail").find(".onlike").find("i").addClass("on");
        }else{
            $(obj).find(".detail_info").find(".f_detail").find(".onlike").find("i").removeClass("on");
        }

        $(obj).find(".detail_info").find(".f_detail").find(".onreply").attr("data-reply", Zone.zone.zoneCommentcount);//评论数
        $(obj).find(".detail_info").find(".f_detail").find(".onreply").find("span").text(Zone.zone.zoneCommentcount);
        $(obj).find(".detail_info").find(".f_detail").find(".onreply").attr("data-id",Zone.zone.zoneId);//回复设置自定义属性id

        $(obj).find(".detail_info").find(".f_detail").find(".dt_tranS").attr("data-lang", Zone.zone.zoneContent);//待翻译

        $(obj).find(".detail_comment").attr("data-zid",Zone.zone.zoneId);//设置动态id（评论）
        //评论
        $(obj).find(".detail_comment").find(".comment_item").empty();//清空评论div
        if(Zone.commList.length > 0){
            for(var i = 0;i < Zone.commList.length;i++){
                if(null == Zone && null == Zone.commList[i]){
                    continue;
                }
                var str = "";
                var otherHomeUrl = "#";//他人主页地址
                if(null != Zone.commList[i].zoco_gagaid){
                    otherHomeUrl = "http://www.gagahi.com:80/Member/otherHome?gagaid="+Zone.commList[i].zoco_gagaid;//他人主页地址
                }
                if(null != Zone.commList[i].zoco_parentid && $.trim(Zone.commList[i].zoco_parentid).length > 0){//回复 （无头像）
                    var otherHomeUrl2 = "";
                    var memb_nickname2 = "";
                    var commentdivobj = "";//评论div对象
                    var comments = $(obj).find(".detail_comment").find(".comment_item").find(".user_pto");

                    for(var z = 0;z < comments.length;z++){//搜索父级评论
                        if(null != $(comments[z]).attr("zoco_parentid") && $(comments[z]).attr("zoco_parentid") == Zone.commList[i].zoco_parentid){//找到了父级评论
                            otherHomeUrl2 = $(comments[z]).find("a").attr("href");//被回复人主页
                            memb_nickname2 = $(comments[z]).next().find("p:first").find("a").text();//被回复人名
                            commentdivobj = $(comments[z]).next();
                        }
                    }

                    if(null == commentdivobj || commentdivobj.length <= 0){//未找到评论div  查询回复p标签
                        var comments_p = $(obj).find(".detail_comment").find(".comment_item").find(".detail_reply");//所有回复p标签
                        for(var z = 0;z < comments_p.length;z++){//搜索父级回复
                            if(null != $(comments_p[z]).attr("zoco_parentid") && $(comments_p[z]).attr("zoco_parentid") == Zone.commList[i].zoco_parentid){//找到了父级回复
                                otherHomeUrl2 = $(comments_p[z]).find("a:first").attr("href");//被回复人主页
                                memb_nickname2 = $(comments_p[z]).find("a:first").text();//被回复人名
                                commentdivobj = $(comments_p[z]).parent();
                            }
                        }
                    }

                    str += "<p class=\"mt10 detail_reply\" zoco_parentid=\""+ Zone.commList[i].zoco_id +"\"><a href=\""
                            + otherHomeUrl +"\" class=\"user_home\" mid=\""+ Zone.commList[i].zoco_gagaid +"\">"
                            + Zone.commList[i].memb_nickname +"</a> 回复  <a href=\""+ otherHomeUrl2
                            +"\" class=\"user_home\">"+ memb_nickname2 +"</a>：<span>"+ Zone.commList[i].zoco_content
                            +"</span><i class=\"inlineblock z_dt_icon ml5 dt_tranS_btn2 mt-5\"></i>"
                            +"<i class=\"inlineblock z_dt_icon ml5 js_reply dt_reply_btn2\" data-id=\""
                            + Zone.commList[i].zoco_zoneid +"\" data-commentid=\"" + Zone.commList[i].zoco_id + "\"></i>"
                            +"<i class=\"del_comment z_dt_icon\" data-id=\"\"></i>"
                            +"</p>";
                    //回复翻译
                    var zmtr_translathigh = "";
                    if(null != Zone.commList[i].zmtr_translathigh && $.trim(Zone.commList[i].zmtr_translathigh).length > 0){
                        zmtr_translathigh = Zone.commList[i].zmtr_translathigh;
                    }else{
                        zmtr_translathigh = Zone.commList[i].zmtr_translat;
                    }
                    if(null == zmtr_translathigh || $.trim(zmtr_translathigh).length <= 0){
                        if(null==zmtr_translathigh||zmtr_translathigh==""){//翻译中...
                            zmtr_translathigh = '翻译中...';
                        }
                    }
                    if(null != zmtr_translathigh && $.trim(zmtr_translathigh).length > 0){//评论有翻译
                        str += "<p class=\"detail_trans bgwhite\"><i class=\"z_dt_icon triangle\"></i>"
                                +"<span class=\"text js_detail_trans\">"
                                +zmtr_translathigh+"</span></p>";
                    }
                    if(null != commentdivobj && $.trim(commentdivobj).length > 0){
                        commentdivobj.append(str);
                    }
                }else{//评论
                    var commHeadImg = "";//评论者头像
                    if( null != Zone.commList[i].memb_bigimg){
                        commHeadImg = Zone.commList[i].memb_bigimg;//评论者头像
                    }
                    if(null == commHeadImg || $.trim(commHeadImg).length <= 0){
                        if(null != Zone && null != Zone.commList[i] && Zone.commList[i].memb_sex == 1){//男
                            commHeadImg = "<%=path%>/common/images/default-male.png";
                        }else{
                            commHeadImg = "<%=path%>/common/images/default-female.png";
                        }
                    }else{
                        commHeadImg = "http://images.gagahi.com//" + commHeadImg;
                    }
                    str += "<div class=\"inlineblock user_pto\" zoco_parentid=\""+ Zone.commList[i].zoco_id +"\"><a href=\""+ otherHomeUrl
                            +"\"><img src=\""+ commHeadImg +"\" alt=\"\"></a></div>";

                    str += "<div class=\"inlineblock\">"
                            +"<p><a href=\""+ otherHomeUrl +"\" class=\"user_home\" mid=\""+ Zone.commList[i].zoco_gagaid +"\">"
                            + Zone.commList[i].memb_nickname +"</a>"
                            +"</p><p class=\"position_r comment_txt\"><span>"+ Zone.commList[i].zoco_content +"</span>"
                            +"<i class=\"inlineblock z_dt_icon ml5 dt_tranS_btn2 mt-5\"></i>"
                            +"<i class=\"inlineblock z_dt_icon ml5 js_reply dt_reply_btn2\" data-id=\""+ Zone.commList[i].zoco_zoneid
                            + "\" data-commentid=\"" + Zone.commList[i].zoco_id + "\"></i>"
                            +"<i class=\"del_comment z_dt_icon\" data-id=\"\"></i></p>";
                    //评论翻译
                    var zmtr_translathigh = "";
                    if(null != Zone.commList[i].zmtr_translathigh
                            && $.trim(Zone.commList[i].zmtr_translathigh).length > 0){//高审不为空
                        zmtr_translathigh = Zone.commList[i].zmtr_translathigh;
                    }
                    if(null == zmtr_translathigh || $.trim(zmtr_translathigh).length <= 0){
                        zmtr_translathigh = Zone.commList[i].zmtr_translat;
                    }
                    if(null == zmtr_translathigh || $.trim(zmtr_translathigh).length <= 0){//
                        if(null==zmtr_translathigh||zmtr_translathigh==""){//翻译中...
                            zmtr_translathigh = '翻译中...';
                        }
                    }
                    if(null != zmtr_translathigh && $.trim(zmtr_translathigh).length > 0){//评论有翻译
                        str += "<p class=\"detail_trans bgwhite\">"
                                +"<i class=\"z_dt_icon triangle\"></i>"
                                +"<span class=\"text js_detail_trans\">"
                                + zmtr_translathigh+"</span></p>";
                    }
                    str += "</div></div>";
                    $(obj).find(".detail_comment").find(".comment_item").append(str);//即时追加
                }
            }
        }
    }

    /**
     * 切换图片（-1上一个；1下一个）
     */
    function switchImg(obj,type){
        if(null == Zone || null == Zone.zone || null == Zone.zone.zoneId){
            layer.msg('已经没有了');
            return;
        }
        var index = imglistindex;
        imglistindex = parseInt(imglistindex) + parseInt(type);
        if(imglistindex < 0){//查上一个
            ajaxGetZone(Zone.zone.zoneId,-1,2,index);
        }else if(imglistindex >= Zone.imgList.length){//下一个
            ajaxGetZone(Zone.zone.zoneId,1,3,index);
        }else{
            //setImgDialog();
            var obj = $(".dynamic_detail");
            if(null != Zone.imgList && Zone.imgList.length > 0){
                $(obj).find(".js_img_border").find("img").attr('src',"http://images.gagahi.com//"+Zone.imgList[imglistindex].zoimImgurl);//左侧动态图片
            }
        }
    }

    /**
     * 点赞
     */
    function like(obj){
        var zoneId = $(obj).parents(".f_detail").attr("zid");
        var islove = "";
        if($(obj).find("i").hasClass("on")){//是否已经点赞
            islove = "cancelLove";//取消点赞
        }else{
            islove = "love";//点赞
        }
        var url = islove + "?zoneId="+zoneId;
        $.ajax({
            type : "post",
            url : "<%=path%>/zone/myZone/"+ url,
            contentType : "application/x-www-form-urlencoded",
            data: {"zoneId":zoneId},
            success: function(data){
                if(data.success){
                    if($(obj).find("i").hasClass("on")){//是否已经点赞
                        $(obj).find("i").removeClass("on");
                        $(obj).find("span").text(parseInt($(obj).attr("data-like"))-1);
                        $(obj).attr("data-like",parseInt($(obj).attr("data-like"))-1);
                    }else{
                        $(obj).find("i").addClass("on");
                        $(obj).find("span").text(parseInt($(obj).attr("data-like"))+1);
                        $(obj).attr("data-like",parseInt($(obj).attr("data-like"))+1);
                    }
                }else{
                    layer.msg(data.msg);
                }
            }
        });
    }

    //发布评论
    $(document).on("click",".js_ReplyPublish",function(){
        var zid = $(".detail_comment").attr("data-zid");//获取动态id
        var commentid = $(".detail_comment").find(".js_ReplyPublish").attr("data-commentid");//获取评论id
        var content = $(this).parent().prev().find(".js_Reply_txt").val();//评论内容
        var mid = $(".detail_comment").attr("mid");//获取当前用户id
        var mname = $(".detail_comment").attr("mname");//获取用户名
        var commHeadImg = $(".detail_comment").attr("mbigimg");//评论者头像
        var msex = $(".detail_comment").attr("msex");//评论者性别 ;

        var objdiv = $(this).parents(".detail_comment").find(".comment_item");//保存所在div
        var textobj = $(this).parent().prev().find(".js_Reply_txt");

        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/ZoneComment/publish",
            contentType : "application/x-www-form-urlencoded",
            data: {"zoneId":zid,"zocoParentid":commentid,"content":content},
            success: function(data){
                if(data.success){
                    textobj.val("");//清空
                    var str = "";
                    var otherHomeUrl = "http://www.gagahi.com:80/Member/otherHome?gagaid="+mid;//他人主页地址
                    var otherHomeUrl2 = "";
                    var memb_nickname2 = "";
                    var commentdivobj = "";//评论div对象
                    var comments = objdiv.find(".user_pto");

                    for(var z = 0;z < comments.length;z++){//搜索父级评论
                        if(null != $(comments[z]).attr("zoco_parentid") && $(comments[z]).attr("zoco_parentid") == commentid){//找到了父级评论
                            otherHomeUrl2 = $(comments[z]).find("a").attr("href");//被回复人主页
                            memb_nickname2 = $(comments[z]).next().find("p:first").find("a").text();//被回复人名
                            commentdivobj = $(comments[z]).next();
                        }
                    }

                    if(null == commentdivobj || commentdivobj.length <= 0){//未找到评论div  查询回复p标签
                        var comments_p = objdiv.find(".detail_reply");//所有回复p标签
                        for(var z = 0;z < comments_p.length;z++){//搜索父级回复
                            if(null != $(comments_p[z]).attr("zoco_parentid") && $(comments_p[z]).attr("zoco_parentid") == commentid){//找到了父级回复
                                otherHomeUrl2 = $(comments_p[z]).find("a:first").attr("href");//被回复人主页
                                memb_nickname2 = $(comments_p[z]).find("a:first").text();//被回复人名
                                commentdivobj = $(comments_p[z]).parent();
                            }
                        }
                    }

                    if(null == commentdivobj || commentdivobj.length <= 0){//直接评论
                        if( null == commHeadImg || $.trim(commHeadImg).length <= 0){//无头像
                            if(msex == 1){//男
                                commHeadImg = "<%=path%>/common/images/default-male.png";
                            }else{
                                commHeadImg = "<%=path%>/common/images/default-female.png";
                            }
                        }else{
                            commHeadImg = "http://images.gagahi.com//" + commHeadImg;
                        }
                        str += "<div class=\"inlineblock user_pto\" zoco_parentid=\""+ data.obj.zocoId +"\"><a href=\""+ otherHomeUrl
                                +"\"><img src=\""+ commHeadImg +"\" alt=\"\"></a></div>";

                        str += "<div class=\"inlineblock\">"
                                +"<p><a href=\""+ otherHomeUrl +"\" class=\"user_home\" mid=\""+ mid +"\">"
                                + mname +"</a>"
                                +"</p><p class=\"position_r comment_txt\"><span>"+ content +"</span>"
                                +"<i class=\"inlineblock z_dt_icon ml5 dt_tranS_btn2 mt-5\"></i>"
                                +"<i class=\"inlineblock z_dt_icon ml5 js_reply dt_reply_btn2\" data-id=\""+ zid
                                + "\" data-commentid=\"" + data.obj.zocoId + "\"></i>"
                                +"<i class=\"del_comment z_dt_icon\" data-id=\"\"></i></p>";
                        str += "</div></div>";
                        commentdivobj = objdiv;
                    }else{//回复
                        str += "<p class=\"mt10 detail_reply\" zoco_parentid=\""+ data.obj.zocoId +"\"><a href=\""+ otherHomeUrl
                                +"\" class=\"user_home\">"+ mname +"</a> 回复  <a href=\""+ otherHomeUrl2
                                +"\" class=\"user_home\">"+ memb_nickname2 +"</a>：<span>"+ content
                                +"</span><i class=\"inlineblock z_dt_icon ml5 dt_tranS_btn2 mt-5\"></i>"
                                +"<i class=\"inlineblock z_dt_icon ml5 js_reply dt_reply_btn2\" data-id=\""
                                + zid +"\" data-commentid=\"" + data.obj.zocoId + "\"></i>"
                                +"<i class=\"del_comment z_dt_icon\" data-id=\"\"></i>"
                                +"</p>";
                    }
                    commentdivobj.append(str);
                }else{
                    layer.msg(data.msg);
                }
            }
        });
    })

    /////////////////////////////////////////////////////////////////////////////////
    /**
     * 创建语言选择框
     */
    /*
     $('.dt_tranS,.dt_tranS_btn2').live('hover',function(){
     if(null != $(this).find(".language_obj") && $(this).find(".language_obj").length > 0){//移走时
     $(this).find(".language_obj").remove();
     return;
     }
     var language_obj = '<div class="language_obj" style="display: block;"><i class="lanI"></i><ul class="lanUl"><li langs-lang="en">English<li langs-lang="cn">简体中文<li langs-lang="tr">繁體中文<li langs-lang="ko">한국어 <li langs-lang="rs">Pусский<li langs-lang="gm">Deutsch<li langs-lang="sp">Español<li langs-lang="jp">日本語</ul><div class="clear"></div></div>';
     var _this = $(this);
     var dataid = $(".detail_comment").attr("data-zid");//获取动态id
     $(this).css("position","relative");
     $(this).append(language_obj);
     _this.find(".language_obj").attr("data-id",dataid);
     });
     */
    /**
     * 点击翻译
     取消该处事件
     $(document).off("click",".language_obj li").on("click",".language_obj li",function(){
	translate(this);
})
     */
    /**
     * 动态翻译
     * 需要弹出目标语言（未完成）
     */
    function translate(obj){
        var zoneId = $(obj).parents(".language_obj").attr("data-id");
        var translatType = $(obj).attr("langs-lang");

        var url = "";
        if($(obj).parent().hasClass("dt_tranS_btn2")){//评论
            url = "ZoneComment/translate?zocoId=" + zoneId + "&translatType=" + translatType;
        }else{//动态
            url = "Zone/translate?zoneId=" + zoneId +"&translatType=" + translatType;
        }
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/"+ url,
            contentType : "application/x-www-form-urlencoded",
            success: function(data){
                if(data.success){
                    if($(obj).parent().hasClass("dt_tranS_btn2")){//评论
                        var zmtr_translathigh = "";
                        if(null != data.obj.zmtrTranslathigh && $.trim(data.obj.zmtrTranslathigh).length > 0){//高审不为空
                            zmtr_translathigh = data.obj.zmtrTranslathigh;
                        }
                        if(null == zmtr_translathigh || $.trim(zmtr_translathigh).length <= 0){
                            zmtr_translathigh = data.obj.zmtrTranslat;
                        }
                        if(null == zmtr_translathigh || $.trim(zmtr_translathigh).length <= 0){//
                            if(null==zmtr_translathigh||zmtr_translathigh==""){//翻译中...
                                zmtr_translathigh = '翻译中...';
                            }
                        }
                        $(obj).parents(".comment_txt").next().find("span").text(zmtr_translathigh);
                    }else{//动态翻译
                        var zmtr_translathigh = "";
                        if(null != data.obj.zotrTranslathigh && $.trim(data.obj.zotrTranslathigh).length > 0){//高审不为空
                            zmtr_translathigh = data.obj.zotrTranslathigh;
                        }
                        if(null == zmtr_translathigh || $.trim(zmtr_translathigh).length <= 0){
                            zmtr_translathigh = data.obj.zotrTranslat;
                        }
                        if(null == zmtr_translathigh || $.trim(zmtr_translathigh).length <= 0){//
                            if(null==zmtr_translathigh||zmtr_translathigh==""){//翻译中...
                                zmtr_translathigh = '翻译中...';
                            }
                        }
                        $(obj).parents(".detail_info").find(".detail_trans").find("span").text(zmtr_translathigh);
                    }
                }else{
                    layer.msg(data.msg);
                }
            }
        });
    }

    /*取消该处事件*/
    /*举报*/
    /*
     $(document).on("click",".dt_report2",function(){
     var obj = $(this);
     var reporthtml = '<div class="jqss jqssn3" style="display:block"><p>'
     +'<input type="radio" checked="checked" class="radio" value="X" id="a1" name="jb">'
     +'<label class="radio" for="a1"> 垃圾广告</label></p><p>'
     +'<input type="radio" class="radio" value="y" id="b1" name="jb">'
     +'<label class="radio" for="b1"> 淫秽色情</label></p><p>'
     +'<input type="radio" class="radio" value="z" id="c1" name="jb">'
     +'<label class="radio" for="c1">虚假中奖</label></p><p>'
     +'<input type="radio" class="radio" value="w" id="d1" name="jb">'
     +'<label class="radio" for="d1"> 敏感信息</label></p><p>'
     +'<input type="radio" class="radio" value="X" id="f" name="jb">'
     +'<label class="radio" for="f"> 人身攻击</label></p><p>'
     +'<input type="radio" class="radio" value="y" id="g" name="jb">'
     +'<label class="radio" for="g">骚然他人</label></p><div class="clear"></div></div>'
     layer.open({
     area: ['482px','320px'],
     skin: 'demo-report',
     title: ['举报', 'font-size:18px;'],
     content:reporthtml,
     btn: '确认',
     yes: function (index, layero) {
     report(obj);
     layer.close(index)
     },
     cancel: function (index) {

     },
     });
     });
     */
    /**
     * 举报
     */
    function report(obj){
        var zoneId = $(obj).parents(".f_detail").attr("zid");
        var reason = "";
        var contents = $(".jqssn3").find(".radio");
        for(var i = 0;i < contents.length;i++){
            if($(contents[i]).is(':checked')){
                reason = $(contents[i]).next().html();
            }
        }
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Report/report",
            contentType : "application/x-www-form-urlencoded",
            data: {"id":zoneId,"type":"Z","reason":reason},
            success: function(data){
                if(data.success){
                    layer.msg(data.msg);
                }else{
                    layer.msg(data.msg);
                }
            }
        });
    }

    /**
     * 删除评论
     */
    /*
     $(document).on("click",".del_comment",function(){
     var obj = $(this);
     var zocoId = $(obj).prev().attr("data-commentid");//评论id
     $.ajax({
     type : "post",
     url : "http://www.gagahi.com:80/ZoneComment/delete",
     contentType : "application/x-www-form-urlencoded",
     data: {"zocoId":zocoId},
     success: function(data){
     if(data.success){
     if($(obj).parent().hasClass("detail_reply")){//回复  否  评论
     $(obj).parent().remove();//删除
     }else{
     $(obj).parent().parent().prev().remove();//删除
     $(obj).parent().parent().remove();//
     var count = parseInt($(obj).parents(".detail_comment").prev().find(".f_detail").find(".onreply").attr("data-reply"));
     $(obj).parents(".detail_comment").prev().find(".f_detail").find(".onreply").attr("data-reply",count-1);
     $(obj).parents(".detail_comment").prev().find(".f_detail").find(".onreply").find("span").text("data-reply",count-1);
     }
     }else{
     layer.msg(data.msg);
     }
     }
     });
     })*/

    /**
     * 显示删除按钮
     */
    /*
     $(document).on("mouseover",".inlineblock,.detail_reply",function(){
     var mid1 = $(".detail_comment").attr("mid");//获取当前用户id
     if($(this).is("div")){//评论
     var p = $(this).find("p");
     if(null != p){//评论   无评论 则为 头像
     var mid = $(this).find("p:first").find("a").attr("mid");
     if(mid1 == mid){//有权限
     $(this).find(".comment_txt").find(".del_comment").show();
     }
     }
     }else{//回复
     var mid = $(this).find("a:first").attr("mid");
     if(mid1 == mid){
     $(this).find(".del_comment").show();
     }
     }
     })*/

    /**
     * 隐藏删除按钮
     */
    /*
     $(document).on("mouseout",".inlineblock,.detail_reply",function(){
     if($(this).is("div")){//评论
     var p = $(this).find("p");
     if(null != p){//评论   无评论 则为 头像
     $(this).find(".comment_txt").find(".del_comment").hide();
     }
     }else{//回复
     $(this).find(".del_comment").hide();
     }
     }) */

    /**
     * 加载更多评论
     */
    var pageNum = 1;//分页
    $(document).on("click",".morecomment",function(){
        var zid = $(".detail_comment").attr("data-zid");//获取动态id
        var obj = $(this).parents(".detail_box");
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/ZoneComment/list",
            contentType : "application/x-www-form-urlencoded",
            data: {"zoneId":zid,"pageNum":++pageNum},
            success: function(data){
                if(null == data.obj || data.obj.length <= 0){
                    pageNum--;
                    layer.msg("已经没有了");
                    return;
                }
                if(data.success){
                    for(var i = 0;i < data.obj.length;i++){
                        if(null == data.obj && null == data.obj[i]){
                            continue;
                        }
                        var str = "";
                        var otherHomeUrl = "#";//他人主页地址
                        if(null != data.obj[i].zoco_gagaid){
                            otherHomeUrl = "http://www.gagahi.com:80/Member/otherHome?gagaid="+data.obj[i].zoco_gagaid;//他人主页地址
                        }
                        if(null != data.obj[i].zoco_parentid && $.trim(data.obj[i].zoco_parentid).length > 0){//回复 （无头像）
                            var commentdivobj = "";//评论div对象
                            var comments = $(obj).find(".detail_comment").find(".comment_item").find(".user_pto");
                            var otherHomeUrl2 = "";
                            var memb_nickname2 = "";

                            for(var z = 0;z < comments.length;z++){//搜索父级评论
                                if(null != $(comments[z]).attr("zoco_parentid") && $(comments[z]).attr("zoco_parentid") == data.obj[i].zoco_parentid){//找到了父级评论
                                    otherHomeUrl2 = $(comments[z]).find("a").attr("href");//被回复人主页
                                    memb_nickname2 = $(comments[z]).next().find("p:first").find("a").text();//被回复人名
                                    commentdivobj = $(comments[z]).next();
                                }
                            }

                            if(null == commentdivobj || commentdivobj.length <= 0){//未找到评论div  查询回复p标签
                                var comments_p = $(obj).find(".detail_comment").find(".comment_item").find(".detail_reply");//所有回复p标签
                                for(var z = 0;z < comments_p.length;z++){//搜索父级回复
                                    if(null != $(comments_p[z]).attr("zoco_parentid") && $(comments_p[z]).attr("zoco_parentid") == data.obj[i].zoco_parentid){//找到了父级回复
                                        otherHomeUrl2 = $(comments_p[z]).find("a:first").attr("href");//被回复人主页
                                        memb_nickname2 = $(comments_p[z]).find("a:first").text();//被回复人名
                                        commentdivobj = $(comments_p[z]).parent();
                                    }
                                }
                            }

                            str += "<p class=\"mt10 detail_reply\" zoco_parentid=\""+ data.obj[i].zoco_id +"\"><a href=\""
                                    + otherHomeUrl +"\" class=\"user_home\" mid=\""+ data.obj[i].zoco_gagaid +"\">"
                                    + data.obj[i].memb_nickname +"</a> 回复  <a href=\""+ otherHomeUrl2
                                    +"\" class=\"user_home\">"+ memb_nickname2 +"</a>：<span>"+ data.obj[i].zoco_content
                                    +"</span><i class=\"inlineblock z_dt_icon ml5 dt_tranS_btn2 mt-5\"></i>"
                                    +"<i class=\"inlineblock z_dt_icon ml5 js_reply dt_reply_btn2\" data-id=\""
                                    + data.obj[i].zoco_zoneid +"\" data-commentid=\"" + data.obj[i].zoco_id + "\"></i>"
                                    +"<i class=\"del_comment z_dt_icon\" data-id=\"\"></i>"
                                    +"</p>";
                            //回复翻译
                            var zmtr_translathigh = "";
                            if(null != data.obj[i].zmtr_translathigh && $.trim(data.obj[i].zmtr_translathigh).length > 0){
                                zmtr_translathigh = data.obj[i].zmtr_translathigh;
                            }else{
                                zmtr_translathigh = data.obj[i].zmtr_translat;
                            }
                            if(null == zmtr_translathigh || $.trim(zmtr_translathigh).length <= 0){
                                if(null==zmtr_translathigh||zmtr_translathigh==""){//翻译中...
                                    zmtr_translathigh = '翻译中...';
                                }
                            }
                            if(null != zmtr_translathigh && $.trim(zmtr_translathigh).length > 0){//评论有翻译
                                str += "<p class=\"detail_trans bgwhite\"><i class=\"z_dt_icon triangle\"></i>"
                                        +"<span class=\"text js_detail_trans\">"
                                        +zmtr_translathigh+"</span></p>";
                            }
                            if(null != commentdivobj && $.trim(commentdivobj).length > 0){
                                commentdivobj.append(str);
                            }
                        }else{//评论
                            var commHeadImg = "";//评论者头像
                            if( null != data.obj[i].memb_bigimg){
                                commHeadImg = data.obj[i].memb_bigimg;//评论者头像
                            }
                            if(null == commHeadImg || $.trim(commHeadImg).length <= 0){
                                if(null != data.obj[i] && data.obj[i].memb_sex == 1){//男
                                    commHeadImg = "<%=path%>/common/images/default-male.png";
                                }else{
                                    commHeadImg = "<%=path%>/common/images/default-female.png";
                                }
                            }else{
                                commHeadImg = "http://images.gagahi.com//" + commHeadImg;
                            }
                            str += "<div class=\"inlineblock user_pto\" zoco_parentid=\""+ data.obj[i].zoco_id +"\"><a href=\""+ otherHomeUrl
                                    +"\"><img src=\""+ commHeadImg +"\" alt=\"\"></a></div>";

                            str += "<div class=\"inlineblock\">"
                                    +"<p><a href=\""+ otherHomeUrl +"\" class=\"user_home\" mid=\""+ data.obj[i].zoco_gagaid +"\">"
                                    + data.obj[i].memb_nickname +"</a>"
                                    +"</p><p class=\"position_r comment_txt\"><span>"+ data.obj[i].zoco_content +"</span>"
                                    +"<i class=\"inlineblock z_dt_icon ml5 dt_tranS_btn2 mt-5\"></i>"
                                    +"<i class=\"inlineblock z_dt_icon ml5 js_reply dt_reply_btn2\" data-id=\""+ data.obj[i].zoco_zoneid
                                    + "\" data-commentid=\"" + data.obj[i].zoco_id + "\"></i>"
                                    +"<i class=\"del_comment z_dt_icon\" data-id=\"\"></i></p>";
                            //评论翻译
                            var zmtr_translathigh = "";
                            if(null != data.obj[i].zmtr_translathigh
                                    && $.trim(data.obj[i].zmtr_translathigh).length > 0){//高审不为空
                                zmtr_translathigh = data.obj[i].zmtr_translathigh;
                            }
                            if(null == zmtr_translathigh || $.trim(zmtr_translathigh).length <= 0){
                                zmtr_translathigh = data.obj[i].zmtr_translat;
                            }
                            if(null == zmtr_translathigh || $.trim(zmtr_translathigh).length <= 0){//
                                if(null==zmtr_translathigh||zmtr_translathigh==""){//翻译中...
                                    zmtr_translathigh = '翻译中...';
                                }
                            }
                            if(null != zmtr_translathigh && $.trim(zmtr_translathigh).length > 0){//评论有翻译
                                str += "<p class=\"detail_trans bgwhite\">"
                                        +"<i class=\"z_dt_icon triangle\"></i>"
                                        +"<span class=\"text js_detail_trans\">"
                                        + zmtr_translathigh+"</span></p>";
                            }
                            str += "</div></div>";
                            $(obj).find(".detail_comment").find(".comment_item").append(str);//即时追加
                        }
                    }
                }else{
                    layer.msg(data.msg);
                }
            }
        });
    })
</script>

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


<!-- 图片弹窗 -->
<div id="zoneDatail" style="display: none;">
    <div class="dynamic_detail">
        <!-- 弹窗左侧 -->
        <div class="fl slide_img" onselectstart="return false;" style="-moz-user-select: none;">
            <div class="prev_btn z_dt_icon" hidefocus="true" onclick="switchImg(this,-1)"></div>
            <div class="next_btn z_dt_icon" hidefocus="true" onclick="switchImg(this,1)"></div>
            <div class="bd slide_bd">
                <div class="slide_item">
                    <div class="js_img_border">
                        <img src="">
                    </div>
                </div>
            </div>
        </div>

        <div class="fr detail_right">
            <div class="detail_box">
                <div class="detail_info">
                    <!-- 发布者信息 -->
                    <div class="inlineblock userInfo_pto">
                        <a href="#">
                            <img src="" alt="">
                        </a>
                    </div>
                    <div class="inlineblock">
                        <p>
                            <a href="#" class="userInfo_home"></a>
                        </p>
                        <p class="time"></p>
                    </div>
                    <!-- 内容 -->
                    <div class="detail_txt"></div>
                    <!-- 翻译结果 -->
                    <div class="detail_trans">
                        <i class="z_dt_icon triangle"></i>
                        <span class="text js_detail_trans"></span>
                    </div>
                    <div class="f_detail" id="dynamic_f" zid="">
                        <!-- 喜欢 -->
                        <div class="inlineblock onlike" data-like="0" onclick="like(this)">
                            <i class="z_dt_icon_r dt_like_btn"></i>
                            <span>0</span>
                        </div>
                        <!-- 回复 -->
                        <div class="inlineblock ml20 onreply" data-reply="0">
                            <i class="z_dt_icon_r dt_reply_btn"></i>
                            <span>0</span>
                        </div>
                        <!-- 待翻译 -->
                        <div class="inlineblock ml20 dt_tranS" data-lang="">
                            <i class="z_dt_icon_r dt_tranS_btn"></i>
                        </div>
                        <!-- 举报 -->
                        <div class="fr" id="report" >
                            <a href="javascript:;" class="inlineblock z_dt_icon dt_report2" title="举报"></a>
                        </div>
                    </div>
                </div>

                <!-- 评论 -->
                <div class="detail_comment" mid="2935498"
                     mname="正直的代言人" mbigimg="images/default/male.png"
                     msex="1">
                    <div class="comment_item"></div>

                    <div class="morecomment">加载更多</div>

                    <div class="detail_comment_input">发表评论</div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(".layui-layer-content").css("overflow","hidden");
            //隐藏输入框
            $(document).on("blur",".js_Reply_txt",function(){
                var txt = $.trim($(this).val());
                if(txt.length==0){
                    $(this).closest(".detail_comment").attr("style",null).find(".detail_comment_input").show();
                    $(this).closest(".detail_comment").find(".reply_box").remove();
                }
            })
            //点击设置id
            $(document).on("click",".js_reply,.onreply",function(){
                var _this = $(this);
                var zocoParentid = _this.attr("data-id");
                $(".detail_comment_input").click();
                $(".detail_comment .js_ReplyPublish").attr("data-zocoParentid",zocoParentid);//动态id

                var commentid = _this.attr("data-commentid");
                if(null != commentid && $.trim(commentid).length > 0){
                    $(".detail_comment .js_ReplyPublish").attr("data-commentid",commentid);//评论id
                }
                return false;
            })

            var createReplyBox = function (){
                var html =
                        '<div class="reply_box">'+
                        '<div class="replyTextBox">'+
                        '<textarea name="" class="js_Reply_txt"  placeholder="评论内容"></textarea>'+
                        '</div>'+
                        '<div class="reply_foot">'+
                        '<div class="reply_send send_btn pl15 pr15 pb5 fr js_ReplyPublish"><i class="inlineblock mb-2 send_i z_dt_icon">'+
                        '</i></div></div></div>';
                return html;
            }
            //动态详情的评论框出现
            $(document).on("click",".detail_comment_input",function(){
                var _this = $(this);
                var _thisParent = _this.parent(".detail_comment");
                if(_this.css("display")!="none"){
                    var replyTextBox = _thisParent.append(createReplyBox);
                    _this.hide();
                    replyTextBox.css({"height":"120px"});
                    _thisParent.find(".replyTextBox").animate({"opacity":1});
                    _thisParent.find(".js_Reply_txt").focus();
                }
            });
            /*下拉菜单*/
            $(document).on("click",".xld",function (e) {
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

        </script>
    </div>
</div>
