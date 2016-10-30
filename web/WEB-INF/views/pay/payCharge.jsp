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
            if('encounterIndex'=='shopIndex'){
                $("#encounterIndex").attr("class","on");
            }
            if('zoneIndex'=='shopIndex'){
                $("#zoneIndex").attr("class","on");
            }
            if('gameIndex'=='shopIndex'){
                $("#gameIndex").attr("class","on");
            }
            if('shopIndex'=='shopIndex'){
                $("#shopIndex").attr("class","on");
            }

            //左侧导航
            if('leftSixinIndex'=='shopIndex'){
                $("#leftSixinIndexImg").attr("class","on");
                $("#leftSixinIndexText").attr("class","on");
            }
            if('leftLikeMeIndex'=='shopIndex'){
                $("#leftLikeMeIndexImg").attr("class","lkm on");
                $("#leftLikeMeIndexText").attr("class","on");
            }
            if('leftIlikeIndex'=='shopIndex'){
                $("#leftIlikeIndexImg").attr("class","mlk on");
                $("#leftIlikeIndexText").attr("class","on");
            }
            if('leftFriendIndex'=='shopIndex'){
                $("#leftFriendIndexImg").attr("class","each-lk on");
                $("#leftFriendIndexText").attr("class","on");
            }
            if('leftVisitorIndex'=='shopIndex'){
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
            <a class="vip" href="http://www.gagahi.com:80/pay/recharge" >充值</a>
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
                        <li><a href="http://www.gagahi.com:80/Member/memberinformation">个人资料</a></li>
                        <li><a href="http://www.gagahi.com:80/Member/memberinformation#showinfo">账号设置</a></li>
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
                        <a href="http://www.gagahi.com:80/pay/upgradeMember"><span class="upgradeTipsBtn">点击升级<!-- 点击升级 --></span></a>
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
            <div class="moneyDiv cleard">账户可用金币<!-- 账户可用金币 -->： <i class="money"></i><span class="moneyNum"> 0.00 </span><br/><a class="toRecharge" href="http://www.gagahi.com:80/pay/recharge">去充值<!-- 去充值 --></a></div>
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





<link href="<%=path%>/common/css/vipService.css" rel="stylesheet" type="text/css">
<script src="<%=path%>/common/js/jquery.page.js"></script>

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
                        <a class="ellipsis-name" href="http://www.gagahi.com:80/Member/myinformation"  title="正直的代言人">正直的代言人</a>

                    </p>
                    <p class="ari hui f12" style="margin: 8px 0">GaGaID:30040277</p>

                    <p class="jd"><span class="jdt"><span class="jdts f12">0%</span></span></p>
                </div>
                <div class="clear"></div>
            </div>

            <p class="wsw">








                <a href="http://www.gagahi.com:80/Member/memberinformation"><span class="ws"></span>请上传您的靓照</a><br>



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


        <div class="fr w860">
            <div class="top">
                <img class="block" src="<%=path%>/common/images/vipTop.jpg" />


                <ul class="nav">
                    <a href="http://www.gagahi.com:80/pay/upgradeMember"><li id="upgradeMember">升级会员</li></a>
                    <a href="http://www.gagahi.com:80/pay/recharge"><li id="recharge">充值金币</li></a>

                    <a href="http://www.gagahi.com:80/pay/transactionRecord"><li id="transactionRecord">充值记录</li></a>
                    <a href="http://www.gagahi.com:80/pay/privilegeNote" id="powerItem"><li id="privilegeNote">特权说明</li></a>

                    <a href="http://www.gagahi.com:80/pay/help"><li class="help current" id="help">帮助</li></a>
                </ul>
                <script type="text/javascript">

                    searchifcommissiongirl();
                    function searchifcommissiongirl() {
                        //  $("#powerItem").after("<a href='http://www.gagahi.com:80/pay/myMoney'><li id='myMoney'>我的金币</li></a>'");
                        if('1' == 2)
                            $.post("http://www.gagahi.com:80/commission/ifcommissiongirl",{},
                                    function(data,textStatus){
                                        if(data.obj>0){

                                            $("#powerItem").after("<a href='http://www.gagahi.com:80/pay/myMoney'><li id='myMoney'>我的金币</li></a>'");
                                        };
                                        selectionStyle();
                                    })

                    }

                    //选中状态样式
                    function  selectionStyle(){
                        clearnSelectionStyle();
                        if('upgradeMember'=='recharge'){
                            $("#upgradeMember").attr("class","current");
                        }
                        if('translationPack'=='recharge'){
                            $("#translationPack").attr("class","current");
                        }
                        if('transactionRecord'=='recharge'){
                            $("#transactionRecord").attr("class","current");
                        }
                        if('recharge'=='recharge'){
                            $("#recharge").attr("class","current");
                        }
                        if('privilegeNote'=='recharge'){
                            $("#privilegeNote").attr("class","current");
                        }
                        if('myMoney'=='recharge'){
                            $("#myMoney").attr("class","current");
                        }
                        if('help'=='recharge'){
                            $("#help").attr("class","help current");
                        }

                    }

                    function clearnSelectionStyle(){
                        $("#upgradeMember").attr("class","");
                        $("#translationPack").attr("class","");
                        $("#transactionRecord").attr("class","");
                        $("#recharge").attr("class","");
                        $("#privilegeNote").attr("class","");
                        $("#myMoney").attr("class","");
                        $("#help").attr("class","help");
                    }
                </script>
            </div>
            <div class="content1 mt15">
                <div class="vip-cont">
                    <div class="recharge-con">
                        <div class="Gold-volume p10 mb20">
                            您账户可用金币数：<span class="c-ff8a00 f18" id="rechargeTotalMoney">0</span>
                            <span class="money ml5" style="vertical-align: text-top;"></span>
                        </div>
                        <div class="recharge-mid recharge-mid1">
                            <ul class="recharge-type-list">
                                <li data-dollar="20">
                                    <p class="mt20">
                                        <span class="c-ff8a00 f25 mr5">20</span>
                                        <span class="money"></span>
                                    </p>
                                    <p class=" mt5">
                                        <span class="fb">$20</span> /￥<span class="fb">120</span>
                                    </p>
                                    <div class="chosed"></div>
                                </li>
                                <li data-dollar="50">
                                    <p class="mt20">
                                        <span class="c-ff8a00 f25 mr5">50</span>
                                        <span class="money"></span>
                                    </p>
                                    <p class=" mt5">
                                        <span class="fb">$50</span> /￥<span class="fb">300</span>
                                    </p>
                                    <div class="chosed"></div>
                                </li>
                                <li data-dollar="100" style="background: #fff3d9; border: 1px solid #fabc3f;">
                                    <p class="mt20">
                                        <span class="c-ff8a00 f25 mr5">100</span>
                                        <span class="money"></span>
                                    </p>
                                    <p class=" mt5">
                                        <span class="fb">$100</span> /￥<span class="fb">600</span>
                                    </p>
                                    <div class="chosed" style="display: block;"></div>
                                </li>
                                <li data-dollar="200">
                                    <p class="mt20">
                                        <span class="c-ff8a00 f25 mr5">200</span>
                                        <span class="money"></span>
                                    </p>
                                    <p class=" mt5">
                                        <span class="fb">$200</span> /￥<span class="fb">1200</span>
                                    </p>
                                    <div class="chosed"></div>
                                </li>
                                <li data-dollar="500">
                                    <p class="mt20">
                                        <span class="c-ff8a00 f25 mr5">500</span>
                                        <span class="money"></span>
                                    </p>
                                    <p class=" mt5">
                                        <span class="fb">$500</span> /￥<span class="fb">3000</span>
                                    </p>
                                    <div class="chosed"></div>
                                </li>
                                <li data-dollar="1000">
                                    <p class="mt20">
                                        <span class="c-ff8a00 f25 mr5">1000</span>
                                        <span class="money"></span>
                                    </p>
                                    <p class=" mt5">
                                        <span class="fb">$1000</span> /￥<span class="fb">6000</span>
                                    </p>
                                    <div class="chosed"></div>
                                </li>
                                <li class="recharge-diy" data-dollar="">
                                    <p class="mt20">
                                        <span class="c-666 mr5">其他金额:</span>
                                        <input type="text" class="recharge-sr mr5" autocomplete="off" id="diy-daller"/>
                                        <span class="money" style="vertical-align: text-top;"></span>
                                    </p>
                                    <p class=" c-333 ml50 f12">需支付
                                        <span class="diy-vsb">0</span>
                                        美元 (RMB ¥<span class="diy-rmb">0</span>)
                                    </p>
                                    <div class="chosed"></div>
                                </li>
                            </ul>
                            <div class="clear"></div>
                            <h3 class="mb10 mt20">
                                选择支付方式:
                                <span style="color:#f8ab62">（温馨提示：1金币仅需1美元）</span>
                            </h3>
                            <div class="zf">
                                <a data-tple="ali">
                                    <img src="<%=path%>/common/images/zfb.png">
                                    <div class="chosed1"></div>
                                </a>
                                <a data-tple="paypal">
                                    <img src="<%=path%>/common/images/paypal.png">
                                    <div class="chosed1"></div>
                                </a>
                                <a data-tple="visa">
                                    <img src="<%=path%>/common/images/visa.png">
                                    <div class="chosed1"></div>
                                </a>
                                <a data-tple="master">
                                    <img src="<%=path%>/common/images/master.png">
                                    <div class="chosed1"></div>
                                </a>
                                <a data-tple="kuaijie" class="kuaijie">
                                    <img src="<%=path%>/common/images/kuaijie.png">
                                    <div class="chosed1"></div>
                                </a>
                            </div>

                            <div class="vip-Credit-con">
                                <p class="mb10">信用卡：</p>
                                <div><div class=" bdra15 vip-Credit inlineblock" style="z-index:3;">
									<span id="creditCardSelection" class=" inlineblock" data-tongyong="" data-cardnum="">
										<span class="mr10 ml10"></span>
										<span class="mr10">---------------------</span>
										请选择   ---------------------
									</span>
                                    <ul style="display: none;" class="xld-select"  id="creditCardList">
                                        <!-- <li data-chuandi = "VISA信用卡1">VISA信用卡1
                                        <span class="mr10 ml10">石头</span>
                                        <span class="mr10">尾号**5656</span>
                                        04/20</li> -->
                                    </ul>
                                </div><span class="c-2d57a1 vip-add">
									<b class=" f20 ml5">+</b>
									添加新信用卡</span><br />
                                    <a class="c-2d57a1 pt10 inlineblock" href="http://www.gagahi.com:80/Member/memberinformation#membercard">
                                        管理信用卡
                                    </a>
                                </div>
                            </div>

                            <div class="credit-detail mt20">
                                <p>
                                    请输入您的信用卡信息：
                                </p>
                                <div class="vip-tsk"></div>
                                <p><span class="credit-detail-title">发卡机构类型：</span>
								  <span class="credit-detail-con">
								    <input type="radio" name="credit" id="mas" value="MASTER" autocomplete="off" /> <label for="mas" class="mr50">masterCard</label>
								  	<input type="radio" name="credit" id="vis" value="VISA" autocomplete="off"/> <label for="vis" class="mr50">VISA</label>
								    <input type="radio" name="credit" id="jbc" value="JCB" autocomplete="off"/><label for="jbc">JBC</label></span></p>

                                <p><span class="credit-detail-title">持卡人姓名：</span>
                                    <input type="text" id="cardHolderName" name="cardHolderName" class="vip-Credit-sr credit-nam" placeholder='持卡人姓名' autocomplete="off"/></p>
                                <p><span class="credit-detail-title">信用卡号码：</span>
                                    <input type="text" id="cardNumber" name="cardNumber" class="vip-Credit-sr credit-num" placeholder='信用卡号码'  autocomplete="off"/></p>
                                <div class=" mb20">
                                    <span class="credit-detail-title">信用卡有效期：</span>
                                    <div class="inlineblock credit-time vip-Credit mr15">
                                        <span class=" inlineblock"  id="cardExpirationMonth" data-tongyong="01">01</span>
                                        <ul style="display: none;" class="xld-select">
                                            <li data-chuandi = "01">01</li>
                                            <li data-chuandi = "02">02</li>
                                            <li data-chuandi = "03">03</li>
                                            <li data-chuandi = "04">04</li>
                                            <li data-chuandi = "05">05</li>
                                            <li data-chuandi = "06">06</li>
                                            <li data-chuandi = "07">07</li>
                                            <li data-chuandi = "08">08</li>
                                            <li data-chuandi = "08">09</li>
                                            <li data-chuandi = "10">10</li>
                                            <li data-chuandi = "11">11</li>
                                            <li data-chuandi = "12">12</li>
                                        </ul>
                                    </div>
                                    <div class="inlineblock credit-time vip-Credit">
                                        <span class=" inlineblock" id="cardExpirationYear" data-tongyong="2016">2016</span>
                                        <ul style="display: none;" class="xld-select">
                                            <li data-chuandi = "2016">2016</li>
                                            <li data-chuandi = "2017">2017</li>
                                            <li data-chuandi = "2018">2018</li>
                                            <li data-chuandi = "2019">2019</li>
                                            <li data-chuandi = "2020">2020</li>
                                            <li data-chuandi = "2021">2021</li>
                                            <li data-chuandi = "2022">2022</li>
                                            <li data-chuandi = "2023">2023</li>

                                        </ul>
                                    </div>
                                </div>
                                <p>
								   	<span class="credit-detail-title">
								   	安全码：</span>
                                    <input type="text" id="securityCode" name="securityCode" class="vip-Credit-sr credit-safe" placeholder='安全码' autocomplete="off"/></p>
                                <p>
                                    <span class="credit-detail-title">手机号码：</span><input type="text" id="phoneNum" name="phoneNum" class="vip-Credit-sr credit-tel" placeholder='手机号码' autocomplete="off"/>
                                </p>
                                <P><span class="credit-detail-title"></span><input id="agreement" class="vm" type="checkbox" > <a class="c-2d57a1 f12 vm" href="http://www.gagahi.com:80/Platform/QuickAgreement" >我已阅读并同意《快捷支付服务协议》</a></P>
                                <p class="addBankBtn"><span class="credit-detail-title"></span><button class="bdra15 c-fff bgc-2d57a1 h30 pl10 pr10 credit-add">添加</button></p>
                            </div>


                            <div class="recharge-up tc mt50 mb45">
                                <button class="bdra30 bgc-2d57a1 c-fff recharge-up-btn f16"  onclick="recharge()">立即充值</button><br />
                                <!-- <a class="c-2d57a1">《条款和条件》</a> -->
                            </div>
                            <div class="recharge-adv">
                                <div class="recharge-present">
                                    <i></i><br /> 给您喜欢的人赠送
                                    <br /> 一份完美礼物
                                </div>
                                <div class="recharge-coins">
                                    <i></i><br /> 使用金币购买翻译字符
                                    <br /> 让您和ta无障碍嗨聊
                                </div>
                                <div class="recharge-favrite">
                                    <i></i><br /> 获得更多帅哥
                                    <br /> 美女的关注
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <a id="openpay_a" style="display:none;" target="_blank"></a>
        <div id="redirectDiv"></div>
    </div>
</div>

<script type="text/javascript">
    //绑定银行卡个数
    var cardLength=0;
    /*本次支付订单*/
    var redirectOrderId;
    //获取金币数
    $(function(){
        updateSession();
        $.ajax({
            url:"http://www.gagahi.com:80/im/getMemberGold",
            type: 'get',
            cache: false,
            async:true,
            dataType: 'json',
            success: function (reg) {
                if(reg.success){
                    var myMoneyNum = reg.obj;
                    $("#rechargeTotalMoney").text(myMoneyNum);
                }else{}
            },
            error: function () {}
        });
        //金币输入控制
        $("#diy-daller").on("keyup",function(){
            var val=$(this).val();
            val=val.replace(/[^\d]/g,'');
            if(val==0){
                val="";
            }
            $(this).val(val);
        });
    });

    function checkXiaoBai(){
        //验证小白登录
        if(''.length<=0 ||''.length<=0){
            layer.open({
                area: ['364px',''],
                title: $.t('global.guestOutTitle'),
                content: "<p class='tc'>  " + $.t('global.guestOutWords') + "</p>",
                btn: $.t('global.guestOutBtn'),
                yes: function (index, layero) {
                    layer.close(index)
                    window.location.href = 'http://www.gagahi.com:80/Member/memberinformation?srcurl=xiaobai#showinfo';
                },
                cancel: function (index) {},
            });
            return 0;
        }else{
            return 1;
        }
    }


    //支付完成跳转弹窗
    function openFinishWinodow(){
        layer.open({
            type: 1,
            area: '424px',
            title: false,
            content: '<p class="p15"><span class="f16 fb inlineblock mb10">'+$.t("home.payNewlyPage")+'</span><br>'+$.t("home.notClosePayPopup")+'<a href="#" id="reselectpayaction" onclick="reselectpay()" class="c-2d57a1 ml15">'+$.t("home.reselectPayType")+'</a></p>',
            btn: [$.t("home.completePay"),$.t("home.payProblem")],
            success:function (layero, index) {
                $("#reselectpayaction").click(function(){
                    layer.close(index);
                })
            },
            yes: function(index, layero) {
                recordUserAction(1,redirectOrderId);
                window.location.reload();
            },
            cancel: function(index) {
                recordUserAction(2,redirectOrderId);
                window.location.href="http://www.gagahi.com:80/pay/help";
            }

        });

    }

    //计入用户行为
    function recordUserAction(actionCode,orderId){
        //alert(actionCode);
        //alert(orderId);
        $.ajax({
            url:"http://www.gagahi.com:80/recharge/recordUserAction",
            type: 'get',
            data: { "actionCode": actionCode,"orderId":orderId},
            cache: false,
            async:true,
            dataType: 'json',
            success: function (reg) {},
            error: function () {}
        });
    }

    //添加信用卡
    function addCreditCards(payPassword){
        var loadIndex = layer.load(0, {shade: 0.1});
        var creditType;
        var temp = document.getElementsByName("credit");
        for(var i=0;i<temp.length;i++)
        {
            if(temp[i].checked)
                creditType = temp[i].value;
            //alert(creditType);
        }
        var cardExpirationMonth=$("#cardExpirationMonth").attr("data-tongyong").length>1?$("#cardExpirationMonth").attr("data-tongyong"):"0"+$("#cardExpirationMonth").attr("data-tongyong");
        var endDate=$("#cardExpirationYear").attr("data-tongyong")+"-"+cardExpirationMonth+"-01";
        var ckeckInfoData={"cardName":$("#cardHolderName").val(),"cardNum":$("#cardNumber").val(),"endDate":endDate,"safetycode":$("#securityCode").val(),"cardtype":creditType,"phone":$("#phoneNum").val()};
        var StockData = {"cardName":$("#cardHolderName").val(),"cardNum":$("#cardNumber").val(),"endDate":endDate,"safetycode":$("#securityCode").val(),"cardtype":creditType,"phone":$("#phoneNum").val(),"cardpwd":payPassword};

        $.post("http://www.gagahi.com:80/payMasa/payApiAgreementSign",ckeckInfoData,function(data,textStatus){
            if(data.success){
                $.post("http://www.gagahi.com:80/MemberCredit/insertMembCredit",StockData,function(data,textStatus){
                    layer.close(loadIndex);
                    if(data.success){
                        // var strTemp="MASTERcredit1<span class='mr10 ml10'>郭凯歌</span><span class='mr10'>tail numbers******1118</span>01/2016</span>";
                        $("#cardHolderName").val('');
                        $("#cardNumber").val('');
                        $("#securityCode").val('');
                        $("#phoneNum").val('');
                        $('#cardExpirationMonth').html('01');
                        $('#cardExpirationYear').html('2016');
                        $('.vip-tsk').hide();
                        getCreditCards(data.obj);
                    }else{
                        if(data.obj =="1"){
                            layer.msg($.t("quickPay.payPasswordErr"));
                        }
                    }
                })
            }else{
                layer.close(loadIndex);
                layer.msg($.t("quickPay.infoWrong"));
            }
        })

    }


    //判断是否绑定信用卡  ///查询信用卡列表
    function getCreditCards(cardId){
        $.post("http://www.gagahi.com:80/MemberCredit/MembCreditListJson",{},function(data,textStatus){
            cardLength=data.attributes.data.length;
            parseList(data.attributes.data,cardId);
        })
    }

    //填充列表数据
    function parseList(list,cardId){
        var dataChargeStr="";
        for(var i=0;i<list.length;i++){
            var dataStr="<li data-chuandi ="+list[i].mecrCardtype+" \"信用卡 \"  data-cardnum='"+list[i].mecrId+"'>  "  +list[i].mecrCardtype+"  信用卡<span class='mr10 ml10'>"+list[i].mecrCardname+"</span><span class='mr10'>尾号"+cardNoMi(list[i].mecrCardnumber)+"</span>"+list[i].showEnddate+"</li>";
            dataChargeStr=dataChargeStr+dataStr;
            if(list[i].mecrId==cardId){
                var strSpan=list[i].mecrCardtype+" 信用卡<span class='mr10 ml10'>"+list[i].mecrCardname+"</span><span class='mr10'>尾号"+cardNoMi(list[i].mecrCardnumber)+"</span>"+list[i].showEnddate+"</span>";
                $("#creditCardSelection").attr("data-cardnum",cardId);
                $("#creditCardSelection").html(strSpan);
            }
        }
        $("#creditCardList").html(dataChargeStr);

        $(".credit-detail").css("display","none");
        $(".vip-Credit-con").css("display","block");
    }
    //card号加密//5111111111111118
    function cardNoMi(cardNo){
        return "******"+cardNo.substring(12);
    }

</script>




<script type="text/javascript">
    var money = "100";//支付类型
    var zftype = "";//支付类型

    /**充值*/
    function recharge(){
        var v = $("#diy-daller").val();
        if(null != v && v.length > 0){
            if($("#diy-daller").parent().parent().find(".chosed").css('display') != 'none'){
                money = v;
            }
        }
        if(null == money || $.trim(money).length <= 0){
            layer.msg('请选择充值金币数！');
            return;
        }
        if(null == zftype || $.trim(zftype).length <= 0){
            layer.msg('选择支付方式！');
            return;
        }

        var url = "";
        var data;
        if(zftype == "ali"){//支付宝
            url = "http://www.gagahi.com:80/pay/subalipay";
            data = {"subject": money + "金币","total_fee":money,"paid":money,"money":money*6};
        }else if(zftype == "paypal"){//paypal
            url = "http://www.gagahi.com:80/pay/subpaypal";
            data = {"item_name": money + "金币","amount":money,"paid":money,"money":money};
        }else if(zftype == "visa"){
            if(checkXiaoBai()==1){
                $.ajax({
                    type : "post",
                    url : "http://www.gagahi.com:80/payMasa/payRedirectIndex",
                    contentType : "application/x-www-form-urlencoded",
                    data: { "subject": money + "金币","total_fee":money,"amount":money,"paid":money,"money":money,"femaleid":$("#femaleid").val(),"payMethod":"masapay"},
                    async: false,//注意这里同步设置
                    success:function(data,textStatus){
                        if(data.success){
                            redirectOrderId=data.obj;
                            openFinishWinodow();
                            $("#redirectDiv").html(data.msg);
                        }else{
                            layer.msg(data.msg);
                        }
                    }
                });
            }
            return;
        }else if(zftype == "master"){
            if(checkXiaoBai()==1){
                /* 		$.post("http://www.gagahi.com:80/payMasa/payRedirectIndex",{ "subject": money + "金币","total_fee":money,"amount":money,"paid":money,"money":money,"femaleid":$("#femaleid").val(),"payMethod":"MASTER"},
                 function(data,textStatus){
                 if(data.success){
                 openFinishWinodow();
                 $("#redirectDiv").html(data.msg);
                 }else{
                 layer.msg(data.msg);
                 }
                 }) */
                $.ajax({
                    type : "post",
                    url : "http://www.gagahi.com:80/payMasa/payRedirectIndex",
                    contentType : "application/x-www-form-urlencoded",
                    data: { "subject": money + "金币","total_fee":money,"amount":money,"paid":money,"money":money,"femaleid":$("#femaleid").val(),"payMethod":"masapay"},
                    async: false,//注意这里同步设置
                    success:function(data,textStatus){
                        if(data.success){
                            redirectOrderId=data.obj;
                            openFinishWinodow();
                            $("#redirectDiv").html(data.msg);
                        }else{
                            layer.msg(data.msg);
                        }
                    }
                });
            }
            return;
        }else if(zftype == "kuaijie"){
            if(!$("#creditCardSelection").attr("data-cardnum")){
                layer.msg($.t("quickPay.selectBankCard"));
                return;
            }
            $.post("http://www.gagahi.com:80/MemberCredit/getMemCardPassword","",function(reg){
                //console.log("支付密码:"+JSON.stringify(reg));
                if(reg.success){
                    layer.open({
                        type: 1,
                        skin:"paymentLayer",
                        area: 'auto',
                        maxWidth:"440px",
                        title:$.t("quickPay.payPassword"),
                        content: $.t("quickPay.payPassword")+' :<input id="PasswordInput" class="marL5 h30 pl15 bdra15  " type="password" placeholder="'+$.t("quickPay.enterPayPassword")+'"/>' ,
                        btn: $.t("global.submit"),
                        yes:function (index,layero){
                            var  payPasswordReg =  new RegExp("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$");
                            var  payPassword = $("#PasswordInput").val();
                            if(!payPasswordReg.test(payPassword)){
                                layer.msg($.t("quickPay.passwordLettersAndNum"));
                                return;
                            }
                            QuickPayFun(money,payPassword);
                            layer.close(index);
                        }
                    });
                    return;
                }else{
                    layer.open({
                        type: 1,
                        title:$.t("quickPay.setPayPassword"),
                        skin:"paymentLayer",
                        area: 'auto',
                        maxWidth:"440px",
                        content: $.t("quickPay.setPayPassword")+' :<input id="setPasswordInput" class="marL5 h30 pl15 bdra15  " type="password" placeholder="'+$.t("quickPay.setPayPassword")+'"/><p class="mt20 c-fe2525">'+$.t("quickPay.passwordsAddCreditCheckTips")+'</p>' ,
                        btn: [$.t("global.submit"),$.t("global.cancel")],
                        yes:function (index,layero){
                            var payPassword = $("#setPasswordInput").val();
                            var payPasswordReg =  new RegExp("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$");
                            if(!payPasswordReg.test(payPassword)){
                                layer.msg($.t("quickPay.passwordLettersAndNum"));
                            }else{
                                $.post("http://www.gagahi.com:80/MemberCredit/setpaypwd",{"password":payPassword},function(reg){
                                    if(reg.success){
                                        QuickPayFun(money,payPassword);
                                        //layer.msg($.t("global.zoneApiSucc"));
                                    }else{
                                        layer.msg($.t("global.zoneApiError"));
                                    }

                                })
                            }

                            layer.close(index);
                        },
                        cancel:function(index){}
                    })
                }
            })




            return;
        }
        //验证小白登录
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
            return;
        }

        openFinishWinodow();
        $.ajax({//虚拟礼物
            type : "post",
            url : url,
            contentType : "application/x-www-form-urlencoded",
            data: data,
            async: false,//注意这里同步设置
            success: function(data){
                if(data.success){
                    redirectOrderId=data.obj.rechId;

                    if(data.msg != "-1" && data.msg != "-2"){
                        //$("#openpay_a").attr("href",data.msg);
                        $("#openpay_a").click(function(){
                            window.open(data.msg,"_target");
                        });
                        $("#openpay_a").click();
                    }
                }else{
                    layer.msg(data.msg);

                }
            }
        });
    }
    //快捷支付 --- 支付请求
    function QuickPayFun(money,payPassword){
        if(checkXiaoBai()==1){
            if(null == $("#creditCardSelection").attr("data-cardnum") || $("#creditCardSelection").attr("data-cardnum").length <= 0){
                layer.msg("请选择信用卡！");
                return;
            }
            layer.load(0, {shade: 0.1});
            var femaleid = $("#femaleid").val();
            var creditCardSelection = $("#creditCardSelection").attr("data-cardnum");
            var data = {"subject": money + "金币","total_fee":money,"amount":money,"paid":money,"money":money,"femaleid":femaleid,"payMethod":"quickpayment",
                "cardNumber":creditCardSelection,"mecrPaypass":payPassword}
            $.post("http://www.gagahi.com:80/payMasa/payApiAgreement",data,function(data,textStatus){
                if(data.success){
                    layer.closeAll('loading');
                    layer.msg("您已成功提交付款请求");
                    //alert(data.msg);
                    // updateSession();
                    setTimeout(function(){
                        //window.location.reload();
                        window.location.href="http://www.gagahi.com:80/pay/transactionRecord";
                    },3000);
                }else{
                    layer.closeAll('loading');
                    layer.msg(data.msg);
                }
            })
        }


    }
    /*修改滚动轴*/
    $(window).load(function() {
        $(".yts,.yts1").mCustomScrollbar();

        /*添加信用卡*/
        $(".vip-add").click(function  () {
            $('.credit-detail').toggle();
        })
        /*信用卡信息是否为空判断*/
        $(".credit-add").click(function  () {
            $(".vip-tsk").css("display","none").text("");
            var  payPasswordReg =  new RegExp("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$");
            var  payPassword = $("#payPassword").val();

            if($(".credit-detail-con input:checked").length==0){
                $(".vip-tsk").css("display","block").text("请选择发卡机构类型")	;
                return;
            };
            if($(".credit-nam").val()==""){
                $(".vip-tsk").css("display","block").text("请输入您的持卡人姓名")	;
                return;
            };
            if($(".credit-num").val()==""){
                $(".vip-tsk").css("display","block").text("请输入您的信用卡号码")	;
                return;
            };
            /*if(!payPasswordReg.test(payPassword)){
             $(".vip-tsk").css("display","block").text($.t("quickPay.passwordLettersAndNum"))	;
             return;
             }*/
            if($(".credit-safe").val()==""){
                $(".vip-tsk").css("display","block").text("请输入您的安全码")	;
                return;
            };
            if($(".credit-tel").val()==""){
                $(".vip-tsk").css("display","block").text("请输入您的手机号码")	;
                return;
            };
            if(!$("#agreement").attr('checked')){
                $(".vip-tsk").css("display","block").text($.t("quickPay.notAgreePayAgreement"))	;
                return;
            }
            layer.open({
                type: 1,
                title:$.t("quickPay.payPassword"),
                skin:"paymentLayer",
                area: 'auto',
                maxWidth:"440px",
                content: $.t("quickPay.payPassword")+' :<input id="addCreditPassword" class="marL5 h30 pl15 bdra15  " type="password" placeholder="'+$.t("quickPay.payPassword")+'"/><p class="mt20 c-fe2525">'+$.t("quickPay.passwordsAddCreditCheckTips")+'</p>' ,
                btn: [$.t("global.submit"),$.t("global.cancel")],
                yes:function (index,layero){
                    var payPassword = $("#addCreditPassword").val();
                    var payPasswordReg =  new RegExp("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$");
                    if(!payPasswordReg.test(payPassword)){
                        layer.msg($.t("quickPay.passwordLettersAndNum"));
                    }else{
                        //添加信用卡
                        addCreditCards(payPassword);

                        layer.close(index);
                    }
                },
                cancel:function(index){}
            })
        })


        /*输入金额*/
        $("#diy-daller").on('input propertychange',function  () {
            var z= /^[0-9]*$/;
            if(z.test($(this).val())){
                $(".diy-vsb").text($(this).val())
                var obj = $(this).val();
                if(null == obj || $.trim(obj).length <= 0){
                    obj = 0;
                }
                $(".diy-rmb").text(obj * 6);
            }
        })



        /*下拉菜单*/
        $(".vip-Credit").each(function(index, element) {
            $(this).hover(function (e) {
                        $(this).children("ul").css("display","block");
                        $(this).children("span").css("background-image","url(<%=path%>/common/images/xld1.png)");
                        $(".xld-select>li",$(this)).each(function (e) {
                            var _selt = $(this);
                            $(this).hover(function (){
                                $(this).addClass("default").siblings().removeClass("default");
                            })
                            $(this).off("click");
                            $(this).on("click",function (e) {
                                _selt.parent(".xld-select").siblings("span").html(_selt.html()).css("background-image","url(<%=path%>/common/images/xld.png)");
                                _selt.parent(".xld-select").siblings("span").attr("data-tongyong",$(_selt).data("chuandi"));
                                //传递卡号
                                _selt.parent(".xld-select").siblings("span").attr("data-cardnum",$(_selt).data("cardnum"));
                                _selt.parent(".xld-select").css("display", "none");
                            });
                        });
                    },
                    function() {
                        $(this).children("ul").css("display","none");
                        $(this).children("span").css("background-image","url(<%=path%>/common/images/xld.png)");
                    })
        });

        /*分页
         $(".tcdPageCode,.tcdPageCode1,.tcdPageCode2,.tcdPageCode3").createPage({
         pageCount: 15, //总页数
         current: 1, //当前页
         backFn: function(p) {
         console.log(p);
         }
         });*/

        /*返回顶部*/
        $('.scroll_t').click(function() {
            $('html,body').animate({
                scrollTop: '0px'
            }, 800);
        });

        /*充值选择*/
        $(".recharge-mid .recharge-type-list li").click(function(e) {
            var obj = $(this).find(".c-ff8a00");
            if(null == obj || obj.length <= 0){
                obj = $(this).find("#diy-daller");
                money = obj.val();
            }else{
                money = obj.text();
            }
            $(this).css({
                "background": "#fff3d9",
                "border": "1px solid #fabc3f"
            }).siblings().css({
                "background": "#fff",
                "border": "1px solid #ccc"
            });
            $(this).children(".chosed").css("display", "block");
            $(this).siblings().children(".chosed").css("display", "none");
        });

        //点击展示信用卡 还是添加信用卡
        $(".zf a").click(function () {
            $(".credit-detail").css("display","none");
            $(".vip-Credit-con").css("display","none");
        })

        //点击展示信用卡 还是添加信用卡
        $(".zf .kuaijie").click(function () {
            $.post("http://www.gagahi.com:80/MemberCredit/MembCreditListJson", {},
                    function(data,textStatus){
                        cardLength=data.attributes.data.length;
                        if(cardLength > 0){

                            $(".credit-detail").css("display","none");
                            $(".vip-Credit-con").css("display","block");
                            parseList(data.attributes.data);
                        }else{
                            $('.credit-detail').show();
                        }
                    })
        });


        /**支付选择*/
        $(".zf a").click(function(e) {
            payTypeChange($(this));
        });
        function payTypeChange(obj) {
            zftype = $(obj).attr("data-tple");
            $(obj).css({
                "background": "#fff3d9",
                "border": "1px solid #fabc3f"
            }).siblings().css({
                "background": "#fff",
                "border": "1px solid #ccc"
            });
            $(obj).children(".chosed1").css("display", "block");
            $(obj).siblings().children(".chosed1").css("display", "none");
        }

        function defaultPayType() {
            if (Zoneyet.Global.language == 'zh-cn') {
                payTypeChange($('[data-tple="ali"]'));
            } else {
                payTypeChange($('[data-tple="paypal"]'));
            }
        }

        defaultPayType();
    });

    function i18nSucess() {
        var kuaijieUrl = 'http://static.gagahi.com/images/' + (Zoneyet.Global.language == 'zh-cn'? 'kuaijie.png':'kuaijie_en.png');
        $('a.kuaijie img').attr('src', kuaijieUrl);
    }
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
                <a href="http://www.gagahi.com:80/Platform/inviteRegIndex?source=2&inviter=2935498&sysid=" class="fl c-2d57a1 f13">注册<!-- 注册 --></a>
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