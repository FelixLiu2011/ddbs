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
    <script  src="http://static.gagahi.com/js/core.js"    type="text/javascript"></script>
    <script  src="http://static.gagahi.com/js/i18next-1.11.2.min.js" type="text/javascript"></script>
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
    <script src="<%=path%>/common/js/layer/layer.js" type="text/javascript"></script>
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
            if('encounterIndex'=='leftSixinIndex'){
                $("#encounterIndex").attr("class","on");
            }
            if('zoneIndex'=='leftSixinIndex'){
                $("#zoneIndex").attr("class","on");
            }
            if('gameIndex'=='leftSixinIndex'){
                $("#gameIndex").attr("class","on");
            }
            if('shopIndex'=='leftSixinIndex'){
                $("#shopIndex").attr("class","on");
            }

            //左侧导航
            if('leftSixinIndex'=='leftSixinIndex'){
                $("#leftSixinIndexImg").attr("class","on");
                $("#leftSixinIndexText").attr("class","on");
            }
            if('leftLikeMeIndex'=='leftSixinIndex'){
                $("#leftLikeMeIndexImg").attr("class","lkm on");
                $("#leftLikeMeIndexText").attr("class","on");
            }
            if('leftIlikeIndex'=='leftSixinIndex'){
                $("#leftIlikeIndexImg").attr("class","mlk on");
                $("#leftIlikeIndexText").attr("class","on");
            }
            if('leftFriendIndex'=='leftSixinIndex'){
                $("#leftFriendIndexImg").attr("class","each-lk on");
                $("#leftFriendIndexText").attr("class","on");
            }
            if('leftVisitorIndex'=='leftSixinIndex'){
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
                    <a><img src="http://static.gagahi.com/images/zh-cn-xb01.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu1"></span>
                </div>

                <div class="fcon" style="display: none;">
                    <a><img src="http://static.gagahi.com/images/zh-cn-xb02.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu2"></span>
                </div>

                <div class="fcon" style="display: none;">
                    <a><img src="http://static.gagahi.com/images/zh-cn-xb03.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu3"></span>
                </div>

                <div class="fcon" style="display: none;">
                    <a><img src="http://static.gagahi.com/images/zh-cn-xb04.jpg" style="opacity: 1; "></a>
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
            <a href="<%=path%>/index/iHome" class="logo"><img src="http://static.gagahi.com/images/logo.png" alt="gagahi"/></a>
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
        Qfast.add('widgets', { path: "http://static.gagahi.com/js/terminator2.2.min.js", type: "js", requires: ['fx'] });
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




<link type="text/css" href="http://static.gagahi.com/IM/css/im.css" rel="stylesheet" />
<link type="text/css" href="http://static.gagahi.com/IM/css/qqFace.css"
      rel="stylesheet" />
<link type="text/css" href="http://static.gagahi.com/IM/css/webuploader.css"
      rel="stylesheet" />
<script type="text/javascript">
    var staticCtx="http://static.gagahi.com/IM/";
    var globalStaticCtx="http://static.gagahi.com/";
    var ctx="http://www.gagahi.com:80";
    var qiniuImgURL="http://images.gagahi.com/";
    var imUrl="http://webim.gagahi.com/";
    var token="961e84bdd1d54facb5d9b279c965eb8c";
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
                        <img class="headImg" src="http://static.gagahi.com/images/gagaService.png">
                        <img class="headLine" src="http://static.gagahi.com/IM/img/On-line.png" style="display:none">
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
                                <img class="headImg" src="http://static.gagahi.com/images/gagaService.png">
                                <img class="headLine" src="http://static.gagahi.com/IM/img/On-line.png" style="display:none">
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
                                <img class="headImg" src="http://static.gagahi.com/images/gagaService.png">
                                <img class="headLine" src="http://static.gagahi.com/IM/img/On-line.png" style="display:none">
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
        <img src="http://static.gagahi.com/IM/img/gagaService.png">
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
                                            src="http://static.gagahi.com/IM/img/head.png" />
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





<script type="text/javascript" src="http://static.gagahi.com/IM/js/ImUploadIMG.js"></script>
<script type="text/javascript" src="http://static.gagahi.com/IM/js/jquery.qqFace.js"></script>
<script type="text/javascript" src="http://static.gagahi.com/IM/js/IMAjax.js"></script>
<script type="text/javascript" src="http://static.gagahi.com/IM/js/chatBox.js"></script>




<script src="http://static.gagahi.com/js/slides-1.1.1-min.js" type="text/javascript"></script>
<script src="http://static.gagahi.com/js/slide.js" type="text/javascript"></script>
<script src="http://static.gagahi.com/js/imgupload.js"></script>
<script src="http://static.gagahi.com/js/platform/platformCountryElementMap.js"></script>
<link href="http://static.gagahi.com/css/zfx.css" rel="stylesheet" type="text/css">
<link href="http://static.gagahi.com/css/like.css" rel="stylesheet" type="text/css">
<link href="http://static.gagahi.com/css/zone.css" rel="stylesheet" type="text/css">
<style type="text/css">
    #gerendongtai .zoneimgs img { cursor: pointer; }
</style>










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
            <div class="rht">
                <div class="PersonalHomepage-top">
                    <div class="yhtx fl tx-con">
                        <img src="http://images.gagahi.com//images/default/male.png">
                        <!--根据是否有头像决定显示隐藏<div class="portrait-default"><img src="../images/tx-default.png" alt="上传头像"></div>-->
                        <div class="portrait-edit">
                            <img src="http://images.gagahi.com//images/default/male.png" alt="编辑头像">
                        </div>
                    </div>
                    <div class="PersonalHomepage-top-r fl pt5 ml10">
                        <input type="hidden" id="gagaid" value="2935185">
                        <input type="hidden" id="gagalevel" value="1">
                        <p class="ari f16 c-2d57a1"><span class="nic" id="nic">Quintion</span>





                            <!-- <input id="upnickname" type="text" class="edit-nic" maxlength="20" value="Richard"/> -->
                            <a href="<%=path%>/member/memberInformation?type=1"><span class="edit" id="edit" data-explain="编辑资料" ></span></a></p>
                        <p>
							<span>
							男

							</span>,
                            <span>0</span>,


                            <span>GaGaID:30039931</span>
                        </p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="ladyScroll">
                <a class="prev"id="prevleft" style="display: none" href="javascript:void(0)"></a>
                <div class="scrollWrap">
                    <div  id="showPhotoTip" class="tc" style="height: 120px;line-height: 120px;display:none;background-color: #eeeeee;" data-i18n="home.showTip"></div>
                    <div class="dlList" id="dlList"></div>
                </div>
                <div class="upload" >
                    <div class="tips" id="upload" data-explain="上传照片"></div>
                </div>
                <div class="open-close" id="openAlbum" data-explain="打开相册"></div>
                <a class="next" id="nextright" style="display: none" href="javascript:void(0)"></a>

                <!--我的照片全部展示开始-->
                <div class="photo-all ">
                    <div class="photo-all-top">
                        <div class="fl">
                            我的照片<span class="hui">(<span id="imgcount">0</span>)</span>
                        </div>
                        <div class=" fr">

                            <a  class="h30 tc w100 bgc-2d57a1 c-fff bdra15 ml10" href="<%=path%>/pay/upgradeMember">升级会员</a>
                        </div>
                        <div class=" clear"></div>
                    </div>
                    <div class="rht hasborder" style="min-height: 575px;">
                        <div class="photo-control">
                            <button class="h30 tc w100 bdra15 ml10 img-up">上传照片</button>
                            <button class="h30 tc w100  bdra15 ml10 photo-control-all photobj">批量管理</button>
                            <button class="h30 tc w100  bdra15 ml10 photo-control-first" id="batchshow">展示到首页</button>
                            <button class="h30 tc w100  bdra15 ml10 photo-control-delete" id="batchdel">删除</button>
                        </div>
                        <div class="photo-show mt20">
                            <ul class="photo-bottom" id="photoul">

                            </ul>
                            <div class="no-photo-tip tc mt100"  data-i18n="home.noPhoto">您的相册空空如也</div>
                            <div class="page">
                                <div class="tcdPageCode" id="photoPageComponent"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--我的照片全部展示结束-->
                <!--我的礼物全部展示开始-->
                <div class="gift-all">
                    <div class="gift-all-top">
                        <div class="fl">
                            <div class="sel-i">虚拟礼物<span class="hui mygiftcount">(0)</span></div>
                            <div class="sel-i">真实礼物<span id='realgiftCount' class="hui mygiftcount"></span></div>
                        </div>
                        <div class="fr">
                            <div class="open-close1"></div>
                        </div>
                    </div>
                    <div class="rht virtualgiftbox" >
                        <i class="gift-triangle"></i>
                        <ul class="gift-bottom">



                        </ul>
                        <div class="page">
                            <div class="tcdPageCode2" id="giftPageComponent"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!---->
                    <div class="rht realgiftbox hide" >
                        <i class="gift-triangle"></i>
                        <ul class="gift-bottom1"></ul>
                        <div class="page">
                            <div class="tcdPageCode" id="giftPageComponent1"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <!--我的礼物全部展示结束-->
                <!--我的好友全部展示开始-->
                <div class="head-portrait-all">
                    <div class="head-portrait-all-top">
                        <div class="fl">
                            我的好友<span class="hui">(<span id="fricount">0</span>)</span>
                        </div>
                        <div class="fr">
                            <div class="open-close2"></div>
                        </div>
                    </div>
                    <div class="rht" style="min-height: 595px;">
                        <div class="head-portrait-all-bottom">
                            <ul class="portrait-bottom">

                            </ul>
                            <div class="clear"></div>
                        </div>
                        <div class="page">
                            <div class="tcdPageCode1" id="friendsPageComponent"></div>
                        </div>
                    </div>
                </div>
                <!--我的好友全部展示结束-->
            </div>
            <script type="text/javascript">

            </script>
            <div class="rht mt15">
                <div class="dynamic_item fl">
                    <div class="dynamicTextBox1">
                        <textarea name="zone_text" id="zone_text" placeholder="想和大家分享什么~ "></textarea>
                        <div class="textCode position_r">
                            <div class="textCode_bg">
                                <span id="textNum">0/</span>500
                            </div>
                        </div>
                        <div class="dynamic_foot">
                            <div class="EmotAndPic fl">
                                <i class="z_dt_icon inlineblock dt_emo mr15"></i><i
                                    class="z_dt_icon inlineblock dt_picUp" id="picUp"></i>
                            </div>
                            <div class="send_btn pl15 pr15 fr" id="js_publish">发送</div>
                        </div>
                        <div id="upLoad_box" style="display:none"></div>
                    </div>
                </div>

                <!-- 我的礼物最近6个 start -->
                <div class="dynamic_item fl" style="margin: 0 12px;">
                    <div class="received-gift">
                        <div class="received-gift-top">
                            礼物(<span id="giftCount">0</span>)

                        </div>
                        <div class="received-gift-bottom">

                            <!--有礼物开始-->

                            <!--有礼物结束-->

                            <!--没有礼物开始-->

                            <div class="no-received-gift tc" style="display:block">还未收到礼物</div>

                            <!--没有礼物结束-->
                        </div>
                    </div>
                </div>
                <!-- 我的好友最近6个 end -->

                <div class="dynamic_item fl">
                    <div class="head-portrait-top" id="appdiv">
                        好友(<span id="newfricount">0</span>)

                    </div>
                    <div class="head-portrait-bottom" id="newfriends">

                        <!--没有好友开始-->

                        <div class="no-head-portrait tc" style="display:block">还没有好友</div>

                        <!--没有好友结束-->
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="rht mt15" id="gerendongtai">
                <div class="dynamic" style="">
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
<div class="creditcon1" ></div>
<div class="img-upload" >

</div>
<script type="x-templete" id="pop_upload_content">
<div class="diy-layer-top">上传照片<span class="diy-close3"></span></div>
  <div class="img-upload-bottom" id="pop_upLoad_box" data-key="" data-upToken="">
  <div id="uploader" class="wu-example">
    <div class="queueList">
        <div id="dndArea" class="placeholder" >
            <div id="filePicker" class="img-upload-up"></div>
            <p style='margin-top: 10px;'>或将照片拖到这里，单次最多可选9张

			</p>
        </div>
       <div id="filePicker2"></div>
    </div>
    <div class="clear"></div>
    <div class="statusBar" style="display:none;">
        <div class="progress">
            <span class="text">0%</span>
            <span class="percentage"></span>
        </div><div class="info"></div>
        <div class="btns">
            <div class="uploadBtn">一键上传</div>
        </div>
    </div></div></div>
</script>
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
            <div class="z_dt_icon del-dynamic"></div>
            <div class="report-dynamic hide"></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="commontContentTemp" style="display: none;">
    <div class="commont-content-out">
        <div class="commont-content">
            <div class="commont-contentl fl"><img src="http://static.gagahi.com/images/photo1.jpg" field="memb_bigimg"></div>
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

<script src="http://static.gagahi.com/js/jquery.page.js"></script>
<script src="http://static.gagahi.com/js/zone/member_zonelist.js" type="text/javascript"></script>
<script>
    /*----鼠标滑过提示-----*/
    $.IM.txtTipsFun($("#edit"));
    $.IM.txtTipsFun($("#upload"));
    $.IM.txtTipsFun($("#openAlbum"));




    var level = '1';
    /* if(level==3){
     fileNumLimitset=12;
     }else if(level==2){
     fileNumLimitset=6;
     }else{
     fileNumLimitset=4;
     } */
    /*编辑昵称*/
    $(document).on("click",".friends-edit",function(){
        $(this).css("display","none");
        $(this).next().css("display","inline-block").focus().val();
    });
    /* 	$(".friends-edit").click(function(e) {
     $(this).css("display","none");
     $(this).next().css("display","inline-block").focus().val();
     }); */
    $(document).on("click",".nicknamelink",function(event){
        event.stopPropagation();
    });
    /* $(".friends-edit .nicknamelink").click(function(event){
     event.stopPropagation();
     }); */
    $(document).on("blur",".friends-edit-inp",function(){
        $(this).prev().css("display","inline-block").text();
        $(this).css("display","none");
        var nickname = $(this).attr("value");
        var friGagaid = $(this).prev().find(".nicknamelink").attr("id");
        // if(nickname!=""){
        $.post("http://www.gagahi.com:80/Member/Friend/updateFriendName",{nickname:nickname,friGagaid:friGagaid},function(result){
            if(result.success){
                if(nickname!=""){
                    $("#"+friGagaid).text(nickname);
                    $("#"+friGagaid).attr("title",nickname);
                }else{
                    $("#"+friGagaid).text($("#frinickname"+friGagaid).val());
                    $("#"+friGagaid).attr("title",$("#frinickname"+friGagaid).val());
                }
            }
        });
        // }
    });
    /* 	$(".friends-edit-inp").blur(function(e) {
     $(this).prev().css("display","inline-block").text();
     $(this).css("display","none");
     var nickname = $(this).attr("value");
     var friGagaid = $(this).prev().find(".nicknamelink").attr("id");
     // if(nickname!=""){
     $.post("http://www.gagahi.com:80/Member/Friend/updateFriendName",{nickname:nickname,friGagaid:friGagaid},function(result){
     if(result.success){
     if(nickname!=""){
     $("#"+friGagaid).text(nickname);
     $("#"+friGagaid).attr("title",nickname);
     }else{
     $("#"+friGagaid).text($("#frinickname"+friGagaid).val());
     $("#"+friGagaid).attr("title",$("#frinickname"+friGagaid).val());
     }
     }
     });
     // }
     }); */
    /* $(".edit").click(function(){
     $(this).css("display","none");
     $(".nic").css("display","none");
     $(".edit-nic").css("display","block").focus().val($(".nic").text());
     }) */
    $(".edit-nic").blur(function(e) {
        $(".edit").css("display","inline-block");
        $(".nic").css("display","inline-block").text($(".edit-nic").val());
        $(".edit-nic").css("display","none");
        var nickname = $("#upnickname").val();
        if(nickname!=""){
            $.post("http://www.gagahi.com:80/Member/updatenickname",{nickname:nickname},function(result){
                if(result.success){
                    $("#nic").text(nickname);
                }
            });
        }
    });

    $(".img-upload").css("left",($(window).width()-$(".img-upload").width())/2+'px');
    $(".img-up,.upload").click(function() {
        if ($('#upLoad_box').is(':visible')) {
            $('#upLoad_box .dt_upCancel').click();
        }
        $(".img-upload").html('').html($("#pop_upload_content").html());
        Zoneyet.nms.myInfor.imgupload();
        $(".creditcon1,.img-upload").css("visibility","visible");
        $(".diy-close3").click(function(e) {
            $(".creditcon1,.img-upload").css("visibility","hidden")
        });
    });
    /*修改滚动轴*/
    $(window).load(function(){
        walledList();
    });
    /*下拉菜单*/
    $(".xld").each(function(index, element) {
        $(this).click(function (e) {
            $(this).next("ul").css("display","block");
            $(this).css("background-image","url(http://static.gagahi.com/images/xld1.png)");
            $(".xld-select>li").each(function (e) {
                var _selt = $(this);
                $(this).hover(function (){
                    $(this).addClass("default").siblings().removeClass("default");
                })
                $(this).click(function (e) {
                    $(_selt.parent(".xld-select").siblings("span")).text(_selt.children("a").text()).css("background-image","url(http://static.gagahi.com/images/xld.png)");
                    _selt.parent(".xld-select").css("display", "none");
                });
            });
        })
    });

    //最新六个好友
    function newfriends(){
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Member/newfriends",
            dataType : "json",
            /* data : {
             "gagaId" : gagaid
             }, */
            success : function(data) {
                if(data.success){
                    console.log(data.obj)
                    var count = data.obj.count;
                    var friends = data.obj.friends;
                    if(count>0){

                        var counthtml = '好友(<span id="newfricount">'+count+'</span>)<div class="open-close2" style="display: block;"></div>';
                        $("#appdiv").html(counthtml);
                        $("#newfricount").text(count);
                        var html='<ul class="head-portrait-full">';
                        $.each(friends,function(index,item) {
                            html+='<li><a href="http://www.gagahi.com:80/Member/otherHome/'+item.member.membGagaid+'"><img src="http://images.gagahi.com/'+item.member.membBigimg+'"><div class="hy-name">';
                            if(item.frieNickname==''||item.frieNickname==null){
                                html+=item.member.membNickname;
                            }else{
                                html+=item.frieNickname;
                            }
                            html+='</div></a></li>';
                        });
                        /* friends.forEach(function(item, index) {
                         html+='<li><a href="http://www.gagahi.com:80/Member/otherHome/'+item.member.membGagaid+'"><img src="http://images.gagahi.com/'+item.member.membBigimg+'"><div class="hy-name">';
                         if(item.frieNickname==''||item.frieNickname==null){
                         html+=item.member.membNickname;
                         }else{
                         html+=item.frieNickname;
                         }
                         html+='</div></a></li>';
                         }) */
                        html+='<div class="clear"></div>';
                        $("#newfriends").html(html);
                    }else{
                        var counthtml = '好友(<span id="newfricount">'+count+'</span>)';
                        $("#appdiv").html(counthtml);
                        $("#newfriends").html('<div class="no-head-portrait tc" style="display:block">还没有好友</div>');
                    }
                }
            }
        })
    }
    //-------------
    function walledList(){
        var gagaid = $("#gagaid").val();
        var gagalevel = $("#gagalevel").val();
        var num=4
        if(gagalevel==2){
            num=6;
        }
        if(gagalevel==3){
            num=12;
        }
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Ihome/Photo/walledList",
            dataType : "json",
            /* data : {
             "gagaId" : gagaid
             }, */
            success : function(data) {
                var html="";
                var imgnum=0;
                if(data.obj.length>0){
                    $("#showPhotoTip").hide();
                }else{
                    $("#showPhotoTip").show();
                }
                $.each(data.obj,function(index,item){
                    //layer.msg("dfs");
                    imgnum+=1;
                    if(imgnum<=num){
                        var zoimImgurl = item.zoimImgurl;
                        var zoneId = item.zoimZoneid;
                        //http://www.gagahi.com:80/Zone/detail/"+zoneId+"
                        html+="<dl><dt><a href='javascript:void(0)'>"
                                +"<img src='http://images.gagahi.com//"+zoimImgurl+"?imageView2/5/w/123/h/120' imgId='"+ item.zoimId +"' zid='"+ zoneId +"' zoimSort='"+ item.zoimSort +"' zimg-count='" + item.zoneimgcount + "' onclick='openImgDialog1(this)'></a></dt><div class='photowall-control'><div class='arrow'></div><div class='dels' title='" + $.t('zone.delimg') + "'><i></i>" + $.string.encodeFormatMore($.t('zone.delimg'), 16) + "</div><div class='cancel-wall' title='" + $.t('zone.cancelwall') + "'><i></i>" + $.string.encodeFormatMore($.t('zone.cancelwall'), 16) + "</div></div></dl>";
                    }
                });

                $("#dlList").removeAttr('style').html(html);
                jQuery(".ladyScroll").slide({ mainCell:".dlList", effect:"leftLoop",vis:6, autoPlay:false});
                if(imgnum>=6){
                    $("#prevleft,#nextright").show();
                } else {
                    $("#prevleft,#nextright").hide();
                }
            }
        });

        var $wallBox = $('#dlList');
        $wallBox.undelegate('.dels', 'click').delegate('.dels', 'click', function(event) {
            var $thisDl = $(this).closest('dl');
            var imgId = $thisDl.find('img').attr('imgid');
            var imgCount = Number($thisDl.find('img').attr('zimg-count'));
            if (imgId) {
                layer.confirm((imgCount > 1 ? '与这张照片同时发布的一组照片都会被删除！' : $.t('zone.realydel')), {
                    btn:[$.t("global.ok"), $.t("global.cancel")],
                    title:$.t("Letter.prompt")
                }, function(index){
                    $._post('http://www.gagahi.com:80/Ihome/Photo/batchDel', {
                        zoimId: [imgId]
                    }, function(data) {
                        layer.close(index);
                        if (data.success) {
                            Zoneyet.nms.myInfor.photoPage('0',1);
                            walledList();
                            zoneObj.reFresh(undefined, true);
                        }
                    }, function() {
                        layer.close(index);
                    });
                });
            }
        });
        $wallBox.undelegate('.cancel-wall', 'click').delegate('.cancel-wall', 'click', function(event) {
            var $thisDl = $(this).closest('dl');
            var imgId = $thisDl.find('img').attr('imgid');
            $._post('http://www.gagahi.com:80/Ihome/Photo/batchCancelWall', {
                zoimId: [imgId]
            }, function(data) {
                if (data.success) {
                    walledList();
                }
            });
        });
    }
    //--------------
    //

    var zoneObj = new loadMyZone('2935185');
    var imgWebPaht = qiniuImgURL;


    /*批量删除*/
    $('#batchdel').click(function(){
        var obj = $("#photoul .on");
        var arr=new Array();
        var isarr = false;
        if(obj.length==0){
            layer.msg("未选择照片");
        }else{
            var zidarr = new Array();
            var delimgcount = 0;
            var imgcount = $("#imgcount").text();
            for(var i=0;i<obj.length;i++){
                var zid =$(obj[i]).siblings().attr("zid");
                zidarr[i] = zid;
                arr[i]=$(obj[i]).attr("zoimid");
                var imcount = $(obj[i]).attr("imcount");
                if(imcount>1){
                    isarr=true;
                }
            }
            var msg = '确定要删除吗？ ';
            if(isarr){
                msg = '与这张照片同时发布的一组照片都会被删除！';//"与这张照片同时发布的一组照片都会被删除！";
            }
            layer.confirm(msg, {
                        btn:[$.t("global.ok"), $.t("global.cancel")],
                        title:$.t("Letter.prompt")},
                    function(index){
                        $.post("http://www.gagahi.com:80/Ihome/Photo/batchDel",{zoimId:arr},function(result){
                            //$("span").html(result);
                            if(result.success){
                                /* for(var i=0;i<obj.length;i++){
                                 obj.parent().remove();
                                 } */
                                layer.close(index);
                                //刷新相册内容
                                $.ajax({
                                    type : "post",
                                    url:"http://www.gagahi.com:80/Member/imgcount",
                                    success: function(data){
                                        if(data.success){
                                            $("#imgcount").text(data.obj.imgcount);
                                            Zoneyet.nms.myInfor.photoPage(data.obj.pageNum,1);
                                        }
                                    }
                                });
                                //增量操作了
                                $(".photo-control-all").data("upflag",true);
                            }
                        });
                    }
            );
        }

    });
    /*批量展示首页*/
    $('#batchshow').click(function(){
        var obj = $("#photoul .on");
        var recommPhotoObj = $('#dlList > dl > dt > a > img');
        var recommPhotoLength = recommPhotoObj.length;
        var recommPhotoArray = new Array();
        recommPhotoObj.each(function(index){
            recommPhotoArray[index] = $(this).attr('imgId');
        });

        var arr=new Array();
        if(obj.length==0){
            layer.msg("未选择照片");
        }else{
            var hasNum = 0;
            for(var i=0;i<obj.length;i++){
                photoImgId = $(obj[i]).attr("zoimid");

                arr[i]= photoImgId;
                if(recommPhotoArray.indexOf(photoImgId) != -1){
                    hasNum++;
                }
            }
            // 计算会员等级并计算出可上传张数
            var memberLevel ='1';
            var memberPhotoNum = 4;
            var hy="普通会员";
            if(memberLevel == 2){
                hy ="高级会员"
                memberPhotoNum = 6;
            }else if(memberLevel == 3){
                hy ="VIP 会员"
                memberPhotoNum = 12;
            }else{
                hy ="普通会员"
                memberPhotoNum = 4;
            }
            var allownum = arr.length-hasNum+(recommPhotoLength>6?(recommPhotoLength-1)/2:recommPhotoLength);
            //var maxmsg = '您当前是普通会员,最多可展示到首页4张,去升级';
            if(parseInt(allownum)>parseInt(memberPhotoNum)){
                if(memberPhotoNum==12){
                    layer.msg('<div class="tc f16">'+$.t("home.maxuUpInfo",{'type':'普通会员','max':'4'})+'</div>');
                }else{
                    layer.open({
                        area: '300px',
                        title: $.t('Letter.prompt'),
                        content:'<div class="tc f16">'+$.t("home.maxuUpInfo",{'type':'普通会员','max':'4'})+'</div>',
                        btn: $.t("home.update"),
                        yes: function(index, layero) {
                            layer.close(index);
                            window.location.href="<%=path%>/pay/upgradeMember";
                        },
                        cancel: function(index) {},
                    });
                }
                //	layer.msg(maxmsg);
            }else{
                $.post("http://www.gagahi.com:80/Ihome/Photo/batchWall",{zoimId:arr},function(result){
                    layer.msg(result.msg);
                    walledList();
                });
            }
            $(".photo-all .photo-Administration").removeClass("on");
        }
    });


    /*照片分页初始化方法
     * tc总页数
     * cur 当前页数
     */
    Zoneyet.define("Zoneyet.nms.myInfor.photoPage",function(tc,cur){
        if(tc){
            $(".no-photo-tip").hide();
            $("#photoPageComponent").createPage({
                pageCount:tc||parseInt('0'),//总页数
                current:cur||parseInt('0')+1,//当前页
                initTrig:true,
                backFn:function(p){
                    $.ajax({
                        type : "post",
                        url : "http://www.gagahi.com:80/Ihome/Photo/list",
                        contentType : "application/x-www-form-urlencoded",
                        data: {"pageNum":p||1},
                        success: function(data){
                            if(data.success){
                                var obj = $(".photo-all").find(".photo-bottom");
                                $(obj).find("li").remove();//清空ul
                                $("#imgclear").remove();
                                var str = "";
                                $.each(data.obj,function(index,item){

                                    str+="<li><img src='http://images.gagahi.com/"+item.zoim_imgurl+"' zoimid=" + item.zoim_id + " zid="+item.zoim_zoneid+" zoimSort="+item.zoim_sort+" onclick='openImgDialog(this)'>"
                                    str+="<div class='photo-delete'>"
                                    str+="<span class='fl'>"+formatDate(new Date(item.zoim_time),"yyyy-MM-dd")+"</span><span class='fr do-delete inlineblock' onclick='delpho("+item.zoim_id+","+item.zone_imgcount+",this)'></span>"
                                    str+="</div>"
                                    str+="<div class='photo-Administration' zoimid="+item.zoim_id+" imcount="+item.zone_imgcount+"></div>"
                                    str+="</li>";
                                });
                                /* data.obj.forEach(function(item){

                                 str+="<li><img src='http://images.gagahi.com/"+item.zoim_imgurl+"' zid="+item.zoim_zoneid+" zoimSort="+item.zoim_sort+" onclick='openImgDialog(this)'>"
                                 str+="<div class='photo-delete'>"
                                 str+="<span class='fl'>"+formatDate(new Date(item.zoim_time),"yyyy-MM-dd")+"</span><span class='fr do-delete inlineblock' onclick='delpho("+item.zoim_id+","+item.zone_imgcount+",this)'></span>"
                                 str+="</div>"
                                 str+="<div class='photo-Administration' zoimid="+item.zoim_id+" imcount="+item.zone_imgcount+"></div>"
                                 str+="</li>";
                                 }) */
                                //str+="<div class='clear'></div>"
                                $(obj).append(str).append("<div class='clear'></div>");
                                $(".photo-control-all").addClass("photobj");
                                $(".photo-control-all").parent().siblings().find(".photo-Administration").css("display","none");
                                $(".photo-control-all").text("批量管理");
                                $(".photo-control-first").css("display","none");
                                $(".photo-control-delete").css("display","none");
                                //调整容器高度,保证底部版本信息位置
                                if($(".ladyScroll").hasClass("photo-do")){
                                    $(".ladyScroll").height($(".photo-all").height()-320);
                                }
                            }else{
                                layer.msg(data.msg);
                            }
                        }
                    });
                }
            });
        }else{
            $("#photoul,#photoPageComponent").empty();
            $(".no-photo-tip").show();
        }
    },true);
    $(function(){
        //执行照片分页
        Zoneyet.nms.myInfor.photoPage('0',1);
        //执行好友分页方法
        Zoneyet.nms.myInfor.friends('0',1);
        //执行礼物分页方法
        Zoneyet.nms.myInfor.gifts('0',1);
    });

    //日期转换格式转换----函数
    function formatDate(date,format) {
        var o = {
            "M+" : date.getMonth()+1, //month
            "d+" : date.getDate(),    //day
            "h+" : date.getHours(),   //hour
            "m+" : date.getMinutes(), //minute
            "s+" : date.getSeconds(), //second
            "q+" : Math.floor((date.getMonth()+3)/3),  //quarter
            "S" : date.getMilliseconds() //millisecond
        }
        if(/(y+)/.test(format)) format=format.replace(RegExp.$1,(date.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o) if(new RegExp("("+ k +")").test(format))
            format = format.replace(RegExp.$1,
                    RegExp.$1.length==1 ? o[k] :("00"+ o[k]).substr((""+ o[k]).length));
        return format;
    }
    /*好友分页*/
    Zoneyet.define("Zoneyet.nms.myInfor.friends",function(tc,cur){
        $("#friendsPageComponent").createPage({
            initTrig:true,
            pageCount:tc||'0',//总页数
            current:cur||parseInt('')+1,//当前页
            backFn:function(p){
                $.ajax({
                    type : "post",
                    url : "http://www.gagahi.com:80/Member/Friend/findFriendPageList",
                    contentType : "application/x-www-form-urlencoded",
                    data: {"fripage":p},
                    success: function(data){

                        if(data.success){
                            var obj = $(".head-portrait-all").find(".portrait-bottom");
                            $(obj).find("li").remove();//清空ul
                            var str = "";
                            $.each(data.obj,function(index,item){
                                var nickname = item.frieNickname;
                                if(nickname==''||nickname==null){
                                    nickname = item.member['membNickname'];
                                }
                                str+="<li class='head-portrait-all-bottom-list'>";
                                str+="<p class='tc'><a href='http://www.gagahi.com:80/Member/otherHome/"+item.member['membGagaid']+"'><img src='http://images.gagahi.com/"+item.member['membBigimg']+"'></a></p>";
                                str+="<p class='ari tc mt10'><span class='c-2d57a1 friends-edit curPor' ><a title='"+nickname+"' id='"+item.member['membGagaid']+"' class='nicknamelink'  href='http://www.gagahi.com:80/Member/otherHome/"+item.member['membGagaid']+"'>";
                                str+=nickname;
                                str+="</a></span><input type='text' style='width:140px' maxlength='20' class='friends-edit-inp'/><br>";
                                str+=getMemberCountryInfo('zh-cn',item.member['membCountry'])+"</p>";
                                str+="<p class='head-portrait-all-delete' onclick='delfri("+item.frieFriendgagaid+",this)'></p>";
                            });
                            /* data.obj.forEach(function(item){
                             var nickname = item.frieNickname;
                             if(nickname==''||nickname==null){
                             nickname = item.member['membNickname'];
                             }
                             str+="<li class='head-portrait-all-bottom-list'>";
                             str+="<p class='tc'><a href='http://www.gagahi.com:80/Member/otherHome/"+item.member['membGagaid']+"'><img src='http://images.gagahi.com/"+item.member['membBigimg']+"'></a></p>";
                             str+="<p class='ari tc mt10'><span class='c-2d57a1 friends-edit curPor' ><a title='"+nickname+"' id='"+item.member['membGagaid']+"' class='nicknamelink'  href='http://www.gagahi.com:80/Member/otherHome/"+item.member['membGagaid']+"'>";
                             str+=nickname;
                             str+="</a></span><input type='text' style='width:140px' maxlength='20' class='friends-edit-inp'/><br>";
                             str+=getMemberCountryInfo('zh-cn',item.member['membCountry'])+"</p>";
                             str+="<p class='head-portrait-all-delete' onclick='delfri("+item.frieFriendgagaid+",this)'></p>";
                             }) */
                            /* for(var i = 0;i < data.obj.length;i++){
                             str+="<li class='head-portrait-all-bottom-list'>";
                             str+="<p class='tc'><a href='http://www.gagahi.com:80/Member/otherHome?gagaid='><img src='http://images.gagahi.com/'></a></p>";
                             str+="<p class='ari tc mt10'><span class='c-2d57a1'></span><br>";
                             str+="</p>";
                             str+="<p class='zx bdra15'></p>";
                             str+="<p class='head-portrait-all-delete' onclick='delfri(,this)'></p>";
                             } */
                            $(obj).append(str);
                            //调整高度，保证底部版本信息
                            if($(".ladyScroll").hasClass("haoyou-do")){
                                $(".ladyScroll").height($(".head-portrait-all").height()-320);
                            }
                        }else{
                            layer.msg(data.msg);
                        }
                    }
                });
            }
        });
    },true);


    /*礼物分页*/
    Zoneyet.define("Zoneyet.nms.myInfor.gifts",function(tc,cur){
        $("#giftPageComponent").createPage({
            initTrig:true,
            pageCount:tc||parseInt('0'),//总页数
            current:cur||parseInt('0')+1,//当前页
            backFn:function(p){
                $.ajax({
                    type : "post",
                    url : "http://www.gagahi.com:80/Member/mygiftlist",
                    contentType : "application/x-www-form-urlencoded",
                    data: {"page":p},
                    success: function(data){
                        if(data.success){
                            var obj = $(".gift-all").find(".gift-bottom");
                            $(obj).find("li").remove();//清空ul
                            var str = "";
                            var _lis = '';
                            for(var i = 0;i < data.obj.length;i++){
                                str += "<li><div class=\"gift-object fl\"><img src=\"http://images.gagahi.com/"+ data.obj[i].memberFrom.membBigimg +"\">"
                                        +"<a class=\"c-2d57a1 ml5\" href=\"http://www.gagahi.com:80/Member/otherHome/"+data.obj[i].gvreGagaid+"\">"
                                        +data.obj[i].memberFrom.membNickname+"</a>送您礼物"
                                        +"</div><div class=\"gift-information fl\"><div class=\"fl mr5\">"
                                        +"<img src=\"http://images.gagahi.com/"+data.obj[i].gvreGifturl+"?imageMogr2/thumbnail/70x70\"></div>"
                                        +"<div class=\"fl pt15\"><p>名称："+data.obj[i].gvreGiftname+"</p>"
                                        +"<p>时间："+$.fn.returnTime(data.obj[i].gvreTime,'full','YYYY-MM-DD hh:mm:ss')+"</p></div>"
                                        +"</div><div class=\"gift-operation fr pt20\">"
                                        +"<button class=\" h30 w80 bdra15 c-fff gift-Rebate mr15\" onclick=\"openDialog1("+data.obj[i].gvreGagaid+")\">回赠</button>"
                                        +"<button class=\" h30 w80 bdra15 gift-delete\" onclick=\"delgive("+data.obj[i].gvreId+",this)\">删除</button>"
                                        +"</div><div class=\"clear\"></div></li>";
                                if (i <= 2) {
                                    _lis += '<li class="v-page-lis" metaId="' + data.obj[i].gvreId +'"><img src="http://images.gagahi.com/' + data.obj[i].gvreGifturl + '?imageMogr2/thumbnail/80x80"></li>';
                                }
                            }
                            $(obj).append(str);
                            if (p == 1) {
                                $('.received-gift-full .v-page-lis').remove();
                                $('.received-gift-full').append(_lis);
                            }
                            //调整高度，保证底部版本信息
                            if($(".ladyScroll").hasClass("gift-do")){
                                $(".ladyScroll").height($(".gift-all").height()-320);
                            }
                        }else{
                            layer.msg(data.msg);
                        }
                    }
                });
            }
        });
    },true);



    //真实礼物列表功能 开始
    $._post(ctx + "/Member/mytruegiftlist", {"page": 1},function(data){
        if(data.success){
            realList(data);
            if (data.obj.length > 0 && $('.received-gift-top .open-close1').length == 0) {
                $('.received-gift-top').append('<div class="open-close1"></div>');
            }
            if (data.obj.length > 0 && $('.no-received-gift').length > 0) {
                $('.no-received-gift').remove();
            }
            $("#giftPageComponent1").createPage({
                current: 1,
                pageCount: data.attributes.countPage,
                backFn:function(page){
                    $._post( ctx + "/Member/mytruegiftlist", {
                                "page": page
                            },
                            function(_data){
                                if(_data.success){
                                    realList(_data);
                                }else{
                                    layer.msg(_data.msg);
                                }
                            });
                }
            });

            var _pageLis = '';
            $.each(data.obj, function(index, el) {
                if (index <= 2) {
                    _pageLis += '<li metaId="' + el.grreId +'"><img src="http://images.gagahi.com/' + el.grrePreview + '?imageMogr2/thumbnail/80x80"></li>';
                }
            });
            if (data.obj.length > 0 && $('.received-gift-full').length == 0) {
                $('.received-gift-bottom').append('<ul class="received-gift-full"></ul>');
            }
            $('.received-gift-full').append(_pageLis);
            $('#giftCount').html(Number($('#giftCount').html())+Number(data.attributes.count));
            $('#realgiftCount').html('('+Number(data.attributes.count)+')');
        } else {
            layer.msg(data.msg);
        }
    });
    function realList(data) {
        //真实礼物列表
        var $box = $('.realgiftbox');
        var $dataBox = $box.find('.gift-bottom1');
        var $pageBox = $box.find('#giftPageComponent1');
        var _lis = '';

        $dataBox.html('');
        if (data.obj && data.obj.length) {
            $.each(data.obj, function(index, el) {
                _lis += '<li class="clearfix" giftid="' + el.grreId + '">'+
                        '<div class="gift-object fl"><img src="' + qiniuImgURL + el.purchasemember.membBigimg + '"><a class="c-2d57a1 ml5" href="' + ctx + '/Member/otherHome/' + el.purchasemember.membGagaid + '">'+el.purchasemember.membNickname+'</a>送您礼物</div>'+
                        '<div class="gift-information fl">' + '<div class="fl mr5"><img src="' + qiniuImgURL + el.grrePreview + '?imageMogr2/thumbnail/70x70"></div><div class="fl pt15"><p>名称：' + el.grreName + '</p><p>时间：' + $.fn.returnTime(el.grreBuytime) + '</p></div></div>'+
                        '<div class="gift-operation fr pt20"><button class="h30 w80 bdra15 c-fff gift-Rebate mr15" onclick="goShop()">回赠</button><button class=" h30 w80 bdra15 gift-delete" onclick="delrealgift('+el.grreId+',this)">删除</button></div></li>';
            });
        }
        $dataBox.append(_lis);

        //调整高度，保证底部版本信息
        if($(".ladyScroll").hasClass("gift-do")){
            $(".ladyScroll").height($(".gift-all").height()-320);
        }
    };
    function goShop() {
        window.location.href = ctx + '/mall/giftReal/shophome';
    }
    function delrealgift(id) {
        $._post(ctx + '/Member/deltruegift', {
            'grreId': id
        }, function(data) {
            if (data.success) {
                $('.received-gift-full').find('li[metaid="' + id + '"]').remove();
                $('.realgiftbox').find('li[giftid="' + id + '"]').remove();
                var oldNum;
                if ($('#realgiftCount').html()) {
                    oldNum = $('#realgiftCount').html().match(/\d+/g);
                    oldNum = Number(oldNum);
                }
                $('#realgiftCount').html('('+(oldNum-1)+')');
                $('#giftCount').html(Number($('#giftCount').html())-1);
                if(parseInt($("#giftCount").text())===0){
                    $(".dynamic_item .open-close1,#giftPageComponent, .received-gift-full").remove();
                    var _strs = "还未收到礼物";
                    $('.received-gift-bottom').append('<div class="no-received-gift tc" style="display:block">'+_strs+'</div>');
                }
            } else {
                layer.msg(data.msg);
            }
        });
    }
    //真实礼物列表功能 结束


    var createReplyBox = function (){
        var html =
                '<div class="reply_box">'+
                '<div class="replyTextBox">'+
                '<textarea name="" class="js_Reply_txt"  placeholder="评论内容"></textarea>'+
                '</div>'+
                '<div class="reply_foot">'+

                /*'<div class="EmotAndPic fl">翻译：<div class="inlineblock all_select mb5 bdra15"><span class="xld inlineblock">中文</span>'+
                 '<ul class="xld-select" style="display:none;">'+
                 '<li><a href="javascript:;">中文</a></li>'+
                 '<li><a href="javascript:;">英文</a></li>'+
                 '<li><a href="javascript:;">日语</a></li>'+
                 '<li><a href="javascript:;">韩语</a></li>'+
                 '</ul>'+
                 '</div></div>'+*/

                '<div class="reply_send send_btn pl15 pr15 pb5 fr js_ReplyPublish"><i class="inlineblock mb-2 send_i z_dt_icon"></i></div>'+
                '</div>'+
                '</div>';
        return html;
    }

    /*照片全部展示*/
    $(".open-close").each(function(index, element) {
        $(this).click(function(e) {
            $(".ladyScroll").toggleClass("photo-do");
            if($(".ladyScroll").hasClass("photo-do")){
                $(".photo-do").find(".photo-all").show().stop().animate({"top":"0","opacity":"1"},100,function(){
                    $(".ladyScroll").height($(".photo-all").height()-320);
                });
                $("#gerendongtai").hide();
            }else{
                $(".photo-all").stop().animate({"top":"2000px"},100,function(){
                    $(".photo-all").hide();
                    if(!$(".photo-control-all").hasClass("photobj")){
                        $(".photo-control-all").click();
                    }
                });
                $(".ladyScroll").height(120);
                $("#gerendongtai").show();
                $("#gerendongtai").css({"height":"auto","overflow":"auto"});
                if($(".photo-control-all").data("upflag")){
                    //更新删除上墙照片
                    walledList();
                    zoneObj.reFresh(undefined, true);
                    $(".photo-control-all").data("upflag",false);
                }
            }
        });
        $(".photo-control-all").click(function(e) {
            if($(this).hasClass("photobj")){
                $(this).parent().siblings().find(".photo-Administration").removeClass("on").css("display","block");
                $(this).text("取消批量管理");
                $(this).removeClass("photobj");
                $(".photo-control-first").css("display","inline-block");
                $(".photo-control-delete").css("display","inline-block");
            }
            else{
                $(this).addClass("photobj");
                $(this).parent().siblings().find(".photo-Administration").css("display","none");
                $(this).text("批量管理");
                $(".photo-control-first").css("display","none");
                $(".photo-control-delete").css("display","none");
            }
        });

        $(document).on('click','.photo-Administration',function(){
            //$(".photo-Administration").click(function(e) {
            $(this).toggleClass("on")
        });
    });
    /*礼物全部展示*/
    $('.mid').delegate('.open-close1','click', function() {
        $(".ladyScroll").toggleClass("gift-do");
        //$("#gerendongtai").css({"height":"500px","overflow":"hidden"});
        if($(".ladyScroll").hasClass("gift-do")){
            $(".gift-do").find(".gift-all").show().stop().animate({"top":"0","opacity":"1"},100,function(){
                $(".ladyScroll").height($(".gift-all").height()-320);
            });
            $("#gerendongtai").hide();
            // $("#gerendongtai").css({"height":"416px","overflow":"hidden"});
        }else{
            $(".gift-all").stop().animate({"top":"2000px"},100,function(){
                $(".gift-all").hide();
            });
            $(".ladyScroll").height(120);
            $("#gerendongtai").show();
            //$("#gerendongtai").css({"height":"auto","overflow":"auto"});
        }
    });
    $('.gift-all-top .sel-i').click(function() {
        var _index = $(this).index();
        if (_index == 0) {
            $('.gift-all .virtualgiftbox').removeClass('hide');
            $('.gift-all .realgiftbox').addClass('hide');
        } else {
            $('.gift-all .virtualgiftbox').addClass('hide');
            $('.gift-all .realgiftbox').removeClass('hide');
        }
        //console.log(_index);
    });
    /*好友全部展示*/
    $(".open-close2").each(function(index, element) {
        if($(".no-head-portrait").css("display")=="block"){
            $(this).css("display","none");
        }else{
            $(this).css("display","block");
        }
    });
    $(document).on("click",".open-close2",function(e) {
        $(".ladyScroll").toggleClass("haoyou-do");
        //$("#gerendongtai").css({"height":"500px","overflow":"hidden"});
        if($(".ladyScroll").hasClass("haoyou-do")){
            $(".haoyou-do").find(".head-portrait-all").show().stop().animate({"top":"0","opacity":"1"},100)
            $(".ladyScroll").height($(".head-portrait-all").height()-320);
            $("#gerendongtai").hide();
            //	$("#gerendongtai").css({"height":"299px","overflow":"hidden"});
        }else{
            $(".head-portrait-all").stop().animate({"top":"2000px"},100,function(){
                $(".head-portrait-all").hide();
            });
            $(".ladyScroll").height(120);
            $("#gerendongtai").show();
            //$("#gerendongtai").css({"height":"auto","overflow":"auto"});
        }
    });

    /*点赞*/
    $("#dynamic_f .onlike").click(function(){
        var _this = $(this);
        var v = _this.attr("data-like");
        v = parseInt(v)+1;
        _this.find("span").text(v);
        _this.find("i").addClass("on");

    });
    /*点击输入评论*/
    $(".c_tx3").each(function(index, element) {
        $(this).click(function(e) {
            if("$(this).siblings('.commont-content-out').children('.reply_box').css('display','block')"){
                $(this).siblings(".commont-content-out").children(".reply_box").css("display","none");
                $(this).siblings(".reply_box").css("display","block");
                $(this).css("display","none");
            }
        });;
    });
    $(".z_dt_icon_r1").each(function(index, element) {
        var _this = $(this);
        $(_this).click(function(e) {
            if($(_this).parents(".commont-content-out").siblings(".reply_box").css("display","block")){
                $(_this).parents(".commont-content-out").siblings(".reply_box").css("display","none")
                $(_this).parents(".commont-content").siblings(".reply_box").css("display"," block");
                $(_this).parents(".commont-content-out").siblings(".c_tx3").css("display","block")
            }
        });;
    });

    /*显示翻译*/
    $(".dt_tranS_btn,.dt_tranS_btn1 ").click(function(e) {
        $(this).toggleClass("on");
        $(this).parents(".f_detail").siblings(".translate").toggle();
    });
    /*删除好友 */
    function delfri(id,obj){
        var fricount = $("#fricount").text();
        var msg = '确定要删除好友吗';
        layer.confirm(msg, {
                    btn:[$.t("global.ok"), $.t("global.cancel")],
                    title:$.t("Letter.prompt")},
                function(index){
                    $.post("http://www.gagahi.com:80/Member/Friend/delFriend",{friGagaid:id},function(result){
                        //$("span").html(result);
                        if(result.success){
                            $(obj).parent().remove();
                            $("#fricount").text(fricount-1);
                            $("#newfricount").text(fricount-1);
                            layer.close(index);
                            if( $(".chatBoxLower .lowerLeft").children("[data-gagaID = " + id + "]").html()){
                                var th = $(".chatBoxLower .lowerLeft").children("[data-gagaID = " + id + "]").find(".chatDelete");
                                $.IM.deleteFriends(id, th);
                            }else{
                                $.IM.deleteFriends(id, "");
                            }
                            newfriends();
                            $(".ladyScroll").height($(".head-portrait-all").height()-320);
                            //刷新分页
                            $.ajax({
                                type : "post",
                                url:"http://www.gagahi.com:80/Member/Friend/friendcount",
                                success: function(data){
                                    if(data.success){
                                        Zoneyet.nms.myInfor.friends(data.obj.pageNum,1);
                                    }
                                }
                            });
                        }
                    });

                }
        );
    }
    /*删除照片 */
    function delpho(id,imcount,obj){
        var msg = '确定要删除吗？ ';
        if(imcount>1){
            msg = '与这张照片同时发布的一组照片都会被删除！';//"与这张照片同时发布的一组照片都会被删除！";
        }
        var imgcount = $("#imgcount").text();
        var delimgcount = 0;
        var zid = $(obj).parent().siblings().attr("zid");
        var img = $("#photoul > li").children("img");

        layer.confirm(msg,{
                    btn:[$.t("global.ok"), $.t("global.cancel")],
                    title:$.t("Letter.prompt")},
                function(index){
                    $.post("http://www.gagahi.com:80/Ihome/Photo/batchDel",{zoimId:[id]},function(result){
                        //$("span").html(result);
                        if(result.success){
                            //$(obj).parent().parent().remove();
                            //刷新相册内容
                            $.ajax({
                                type : "post",
                                url:"http://www.gagahi.com:80/Member/imgcount",
                                success: function(data){
                                    if(data.success){
                                        $("#imgcount").text(data.obj.imgcount);
                                        Zoneyet.nms.myInfor.photoPage(data.obj.pageNum,1);
                                    }
                                }
                            });
                            //删除上墙照片
                            /* walledList();
                             zoneObj.reFresh(undefined, true); */
                            //增量操作了
                            $(".photo-control-all").data("upflag",true);
                        }
                    });
                    layer.close(index);
                });
    }

    mid = ""; //赠送人id
    gvid = "";//选中的礼物id
    type = "";//礼物or翻译包
    /**打开礼物列表*/
    function openDialog1(gvreGagaid){
        layer.open({
            area: '700px',
            type:1,//防止提示框冲掉弹窗
            skin: 'giftCon1',
            title:'赠送礼物',
            content: $(".giftCon-re").html(),
            btn: '确认',
            yes: function (index, layero) {
                if(null == mid || $.trim(mid).length <= 0
                        ||null == gvid || $.trim(gvid).length <= 0
                        ||null == type || $.trim(type).length <= 0){
                    layer.msg("请先选择礼物！");
                    return;
                }
                returnGive();
                layer.close(index);
            },
            cancel: function (index) {
            },
        });
        mid = gvreGagaid;
        //$(".giftcont1").mCustomScrollbar();
        $(".giftCon1 .gift-top span").click(function(e) {
            $(this).addClass("gift-chose").siblings().removeClass("gift-chose");
            var $ulobj = $(this).parents(".layui-layer-content").find(".giftcont").find("ul");
            $ulobj.hide().eq($(this).index()).show();
        });
    }

    /**选中礼物*/
    function selectedgift(obj,gid,types){
        //$(obj).siblings().children(".chosed").css("display","none");
        $(obj).closest(".giftcont").find(".giftcont1 li").children(".chosed").css("display","none");
        $(obj).children(".chosed").css("display","block");
        gvid = gid;
        type = types;
    }


    /**获取礼物*/
    gpage = 1;//礼物分页
    function findgiftlist(obj){
        //layer.msg(obj.scrollHeight+"--------"+obj.scrollTop + "------"+$(obj).height());
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
                    //$("#mCSB_5").find(".mCSB_container").find("li").remove();//清空div
                    var str = "";
                    for(var i = 0;i < data.obj.length;i++){
                        str += "<li onclick=\"selectedgift(this,"+data.obj[i].giviId+",1)\">"
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
    tpage = 1;//翻译包分页
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
                    //$("#mCSB_6").find(".mCSB_container").find("li").remove();//清空div
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
                    layer.msg(data.msg);
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
            data: {"mid":mid,"gvid":gvid,"type":type},
            success: function(data){
                if(data.success){
                    layer.msg(data.msg);
                }else{
                    layer.msg(data.msg);
                }
            }
        });
    }

    /**删除赠送记录*/
    function delgive(gvrid,obj){
        if(null == gvrid){
            layer.msg("异常");
            return;
        }
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Member/delgift",
            contentType : "application/x-www-form-urlencoded",
            data: {"gvid":gvrid},
            success: function(data){
                if(data.success){
                    $(obj).parent().parent().remove();
                    //更新顶部数量
                    var countstr = $(".gift-all-top").find(".mygiftcount:first").text();
                    countstr = countstr.replace("(","").replace(")","");
                    if(null == countstr || $.trim(countstr).length <= 0 || parseInt(countstr) < 0){
                        countstr = 0;
                    }
                    $(".gift-all-top").find(".mygiftcount:first").text("(" + (parseInt(countstr)-1) + ")");
                    //更新响应高度
                    $(".ladyScroll").height($(".gift-all").height()-320);
                    //更新主页数量
                    $("#giftCount").text(parseInt($("#giftCount").text())-1);
                    if(parseInt($("#giftCount").text())===0){
                        $(".dynamic_item .open-close1,#giftPageComponent, .received-gift-full").remove();
                        var _strs1 = "还未收到礼物";
                        $('.received-gift-bottom').append('<div class="no-received-gift tc" style="display:block">'+_strs1+'</div>');
                    }
                    //删除礼物
                    $("li[metaId='"+gvrid+"']",".received-gift-full").remove();
                    //提示
                    layer.msg($.t('zone.delGiftSucc'));
                    //刷新分页
                    $.ajax({
                        type : "post",
                        url:"http://www.gagahi.com:80/Member/giftcount",
                        success: function(data){
                            if(data.success){
                                Zoneyet.nms.myInfor.gifts(data.obj.pageNum,1);
                            }
                        }
                    });

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
    $(".layui-layer-content").css("overflow","hidden")
    $('.dynamic_detail').slide({
        mainCell:".bd",
        //prevCell:".prev_btn",
        //nextCell:".next_btn"
    });
    $(".slide_item").mCustomScrollbar({
        scrollbar:false
    });
    $(".detail_box").mCustomScrollbar({
        scrollbar:false,
        callbacks:{ onTotalScrollOffset:140 }
    });

    function openImgDialog(obj) {
        var zid = $(obj).attr("zid");//获取动态id
        var _imglistindex = $(obj).attr("zoimSort");//设置展示下标
        $.fn.zoneDetail(zid, _imglistindex, undefined, {
            isAcross: true,
            isReverse: true
        });
    }

    /**打开照片弹窗*/
    function openImgDialog1(obj){
        var zid = $(obj).attr("zid");//获取动态id
        var _imglistindex = $(obj).attr("zoimSort");//设置展示下标
        var zoneArr = [];
        $('#dlList dl:not(.clone) img').each(function() {
            zoneArr.push({
                imgid: $(this).attr('imgid'),
                zoneid: $(this).attr('zid')
            });
        });
        $.fn.zoneDetail(zid, _imglistindex, undefined, {
            photoArr: zoneArr,
            curPhoto: {
                imgid: $(obj).attr('imgid'),
                zoneid: $(obj).attr('zid')
            }
        });

        //ajaxGetZone(zid,0,1,"a");//异步加载数据

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
     *	zid 当前动态id；
     *	type：-1 上页；0 当前；1 下一页
     *	isindex:1不计算；2向前；3向后
     */
    var Zone = "";//动态对象
    function ajaxGetZone(zid,type,isindex,index){
        $.ajax({
            type : "post",
            url : "http://www.gagahi.com:80/Zone/oneInfo",
            contentType : "application/x-www-form-urlencoded",
            data: {"zoneId":zid,"type":type},
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
                    layer.msg(data.msg);
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
                headImg = "http://static.gagahi.com/images/default-male.png";
            }else{
                headImg = "http://static.gagahi.com/images/default-female.png";
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

        $(obj).find(".detail_comment").attr("data-zid",Zone.zone.zoneId);//设置动态id(评论)
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
                    otherHomeUrl = "http://www.gagahi.com:80/Member/otherHome/"+Zone.commList[i].zoco_gagaid;//他人主页地址
                }
                if(null != Zone.commList[i].zoco_parentid && $.trim(Zone.commList[i].zoco_parentid).length > 0){//回复 (无头像)
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
                        if(null != Zone.commList[i].zmtr_submitime && $.trim(Zone.commList[i].zmtr_submitime).length > 0){//翻译中...
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
                            commHeadImg = "http://static.gagahi.com/images/default-male.png";
                        }else{
                            commHeadImg = "http://static.gagahi.com/images/default-female.png";
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
                        if(null != Zone.commList[i].zmtr_submitime && $.trim(Zone.commList[i].zmtr_submitime).length > 0){//翻译中...
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
     * 切换图片(-1上一个；1下一个)
     */
    /*
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
     //setImgDialog();//只是切换当前动态图片(最新评论动态回丢失)
     var obj = $(".dynamic_detail");
     if(null != Zone.imgList && Zone.imgList.length > 0){
     $(obj).find(".js_img_border").find("img").attr('src',"http://images.gagahi.com//"+Zone.imgList[imglistindex].zoimImgurl);//左侧动态图片
     }
     }
     } */

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


    //***************************************************评论相关********************************************
    //表情包
    var faceObj = $('.dynamicTextBox1 .dt_emo').facePackage('zone_text');
    //发布图片动态
    $("#picUp").click(function() {
        if ($('#upLoad_box').is(':visible')) {
            return;
        }
        $("#upLoad_box").show();
        if ($("#upLoad_box").html() == '') {
            $("#upLoad_box").append('<div class="upLoad_main"><i class="triangle"></i><span class="fr"><i class="z_dt_icon inlineblock dt_upCancel mr10"></i></span><span class="inlineblock mb10">本地上传</span><div id="uploader"class="wu-example"><div class="info inlineblock mb10"></div><div class="queueList"><div id="dndArea"class="placeholder p0"><div id="filePicker"></div></div><div id="filePicker2"></div></div><div class="btns"><div class="uploadBtn">开始上传</div></div></div></div>');
        }
        $('#js_publish').addClass('on');
        //上传插件
        $.fn.uploadImg(function() {
            $("#upLoad_box").css('left', '0');
            $("#upLoad_box").hide();
            $("#upLoad_box").empty();
            zoneObj.reFresh(undefined, true, function() {
                //刷新相册内容
                $.ajax({
                    type : "post",
                    url:"http://www.gagahi.com:80/Member/imgcount",
                    success: function(data){
                        if(data.success){
                            $("#imgcount").text(data.obj.imgcount);
                            Zoneyet.nms.myInfor.photoPage(data.obj.pageNum,1);
                            walledList();
                        }
                    }
                });
            });
        });
    });

    $('#upLoad_box').delegate('.dt_upCancel', 'click', function() {
        $("#upLoad_box").hide();
        $("#upLoad_box").empty();
        $('#js_publish').removeClass('on');
    });

    $('#zone_text').keyup(function() {
        var val = $.trim($(this).val());
        if (val) {
            $(this).next().next().find('.send_btn').addClass('on');
            if ($(this).val().length > 500) {
                var str = $(this).val();
                $(this).val(str.substring(0, 500));
            }
            $('#textNum').text($(this).val().length + '/');
        } else {
            $(this).val('');
            $('#textNum').text('0/');
            $(this).next().next().find('.send_btn').removeClass('on');
        }
    }).change(function() {
        var texts = $.trim($("#zone_text").val());
        if (texts) {
            $(this).next().next().find('.send_btn').addClass('on');
        } else {
            $(this).next().next().find('.send_btn').removeClass('on');
        }
    });

    $('body').delegate('#facebox', 'click', function() {
        $('#js_publish').addClass('on');
    });

    //用户发布的新动态
    // 发布动态
    var isPushComplate = true;
    var errorNum = 0;
    $("#js_publish").click(function(){
        var content = $.trim($("#zone_text").val()),
                imgNum = $(".dynamicTextBox1 #uploader").find("li").size(),
                img;
        content = faceObj.convertData(content);
        var t_img;
        var isLoad = true;
        // 有内容没图

        if(content!="" && imgNum == 0 && isPushComplate){
            isPushComplate = false;

            $.post("http://www.gagahi.com:80/Zone/publish",{"content":content},function(f){
                isPushComplate = true;
                if(f.success){
                    $("#zone_text").val("");
                    $('#textNum').html('0/');
                    $("#upLoad_box").hide();
                    $("#upLoad_box").empty();
                    //refresh_list(undefined, 'refresh');
                    var newZone = {};
                    newZone.zone_commentcount = f.obj.zoneCommentcount;
                    newZone.zone_content = f.obj.zoneContent;
                    newZone.zone_datetime = f.obj.zoneDatetime || ((new Date()).getTime());
                    newZone.zone_gagaid = f.obj.zoneGagaid;
                    newZone.zone_id = f.obj.zoneId;
                    newZone.zone_imgcount = f.obj.zoneImgcount;
                    newZone.zone_istrueimg = f.obj.zoneIstrueimg;
                    newZone.zone_likecount = f.obj.zoneLikecount;
                    newZone.zone_state = f.obj.zoneState;
                    newZone.isLove = 0;
                    newZone.memb_bigimg = $('.yhtx a img').attr('src').split('//')[2];
                    newZone.memb_nickname = $('.yhxx .ari a').html();
                    newZone.commList = [];
                    newZone.img = [];
                    //zoneObj.zoneArr.push(new zoneObj.addZone(newZone, imgWebPaht, 'new'));
                    zoneObj.reFresh(undefined, true);
                    return;
                } else { // $.t('global.zoneApiError')
                    layer.msg(f.msg, {
                        time: 1000
                    });
                }
            })
        }
        // 有图 有没有内容均可
        else if(imgNum > 0 && isPushComplate){
            isPushComplate = false;
            //请求toKen
            $.post("http://www.gagahi.com:80/Image/uploadInit",{"type":"Z","imgNum":imgNum},function(z){
                img = z.obj.img;
                // console.log(img);
                if(z.success){
                    // console.log(z.obj.upToken);
                    $("#upLoad_box").attr({"data-upToken":z.obj.upToken,"data-key":img});
                    //发布
                    $.post("http://www.gagahi.com:80/Zone/publish",{"content":content,"img":img},function(f){
                        isPushComplate = true;
                        if(f.success){
                            $(".uploadBtn").click();
                            $("#zone_text").val("");
                            $('#textNum').html('0/');
                            $("#upLoad_box").css('left', '-99999px');
                            //refresh_list(undefined, 'refresh');
                            var newZone = {};
                            newZone.zone_commentcount = f.obj.zoneCommentcount;
                            newZone.zone_content = f.obj.zoneContent;
                            newZone.zone_datetime = f.obj.zoneDatetime || ((new Date()).getTime());
                            newZone.zone_gagaid = f.obj.zoneGagaid;
                            newZone.zone_id = f.obj.zoneId;
                            newZone.zone_imgcount = f.obj.zoneImgcount;
                            newZone.zone_istrueimg = f.obj.zoneIstrueimg;
                            newZone.zone_likecount = f.obj.zoneLikecount;
                            newZone.zone_state = f.obj.zoneState;
                            newZone.isLove = 0;
                            newZone.memb_bigimg = $('.yhtx a img').attr('src').split('//')[2];
                            newZone.memb_nickname = $('.yhxx .ari a').html();
                            newZone.commList = [];
                            /*  newZone.img = img.map(function(item) {
                             return {zoimImgurl: item};
                             }); */
                            newZone.img = $.map(img,function(index,item) {
                                return {zoimImgurl: item};
                            });
                            return false;
                        } else { // $.t('global.zoneApiError')
                            layer.msg(f.msg, {
                                time: 1000
                            });
                        }
                    })
                }
            });
        }


    });

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

        if (content!='') {
            $.ajax({
                type : "post",
                url : "http://www.gagahi.com:80/ZoneComment/publish",
                contentType : "application/x-www-form-urlencoded",
                data: {"zoneId":zid,"zocoParentid":commentid,"content":content},
                success: function(data){
                    if(data.success){
                        textobj.val("");//清空
                        var str = "";
                        var otherHomeUrl = "http://www.gagahi.com:80/Member/otherHome/"+mid;//他人主页地址
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
                                    commHeadImg = "http://static.gagahi.com/images/default-male.png";
                                }else{
                                    commHeadImg = "http://static.gagahi.com/images/default-female.png";
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
                    } else {
                        layer.msg(data.msg, {
                            time: 1000
                        });
                    }
                }
            });
        }
    });

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
     });*/

    /**
     * 点击翻译
     */
    $(document).off("click",".language_obj li").on("click",".language_obj li",function(){
        /* var _this = $(this),value,
         _thisParent = _this.closest(".dt_tranS"),
         zocoId = _thisParent.attr("data-id"),  //评论id
         zoneId = _this.closest(".detail_comment").attr("data-zoneid"),  //动态id
         url,
         translatType = _this.attr("langs-lang");
         if(zocoId==zoneId){
         value = {"zoneId":zoneId,"translatType":translatType};  //动态id = 评论id  说明是评论翻译
         url = "http://www.gagahi.com:80/Zone/translate";
         }else{
         value = {"zocoId":zocoId,"translatType":translatType};
         url = "http://www.gagahi.com:80/ZoneComment/translate";
         }
         if(zocoId!="" && url!=""){
         $.post(url,value,function(data){
         if(data.success){
         layer.msg(data.msg);
         $.get('http://www.gagahi.com:80/Zone/detail/' + zoneId, function(str){
         _this.closest(".layui-layer-content").html(str);
         return false;
         });
         }else{
         layer.msg(data.msg);
         }
         });
         }
         return false; */
        //translate(this);
    })

    ////////////////////////////////////////////////////////////////////////////////////
    /**
     * 动态翻译
     * 需要弹出目标语言(未完成)
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
            //data: {"zoneId":zoneId,"translatType":translatType},
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
                            if(null != data.obj.zmtrSubmitime && $.trim(data.obj.zmtrSubmitime).length > 0){//翻译中...
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
                            if(null != data.obj.zotrSubmitime && $.trim(data.obj.zotrSubmitime).length > 0){//翻译中...
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

    /*举报
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
     })
     */
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
     })
     */
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
                            otherHomeUrl = "http://www.gagahi.com:80/Member/otherHome/"+data.obj[i].zoco_gagaid;//他人主页地址
                        }
                        if(null != data.obj[i].zoco_parentid && $.trim(data.obj[i].zoco_parentid).length > 0){//回复 (无头像)
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
                                    + data.obj[i].memb_nickname +"</a> 回复 <a href=\""+ otherHomeUrl2
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
                                if(null != data.obj[i].zmtr_submitime && $.trim(data.obj[i].zmtr_submitime).length > 0){//翻译中...
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
                                    commHeadImg = "http://static.gagahi.com/images/default-male.png";
                                }else{
                                    commHeadImg = "http://static.gagahi.com/images/default-female.png";
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
                                if(null != data.obj[i].zmtr_submitime && $.trim(data.obj[i].zmtr_submitime).length > 0){//翻译中...
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
<div class="giftCon-re" style="display: none;">
    <div class="gift-top">
        <div class="fl">
            <span class="mr15 f16 gift-chose pb5" id="gift">虚拟礼物</span>

        </div>
        <div class="fr"><a href="<%=path%>/mall/giftReal/shopHome" class="c-2d57a1 pb5">去商城逛逛</a></div>
        <div class="clear"></div>
    </div>
    <div class="giftcont" >

        <ul class="gift1 giftcont1" onscroll="findgiftlist(this)" >

            <li onclick="selectedgift(this,3979,1)">
                <p><img src="http://images.gagahi.com/V-c3796bd49d81d33459ecf6051209077d?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3967,1)">
                <p><img src="http://images.gagahi.com/V-b1730683ec5eca4dc6b8e5b57c3b93a6?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3961,1)">
                <p><img src="http://images.gagahi.com/V-fe0568af32a206ffb3087d549e01c5cc?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3957,1)">
                <p><img src="http://images.gagahi.com/V-c446ab649c3c45dd1d05272ca232ee1e?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3953,1)">
                <p><img src="http://images.gagahi.com/V-835af0f7830530b9032e07e81cad6bed?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3949,1)">
                <p><img src="http://images.gagahi.com/V-72dea6987635207a4a72fa5caf60a930?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3945,1)">
                <p><img src="http://images.gagahi.com/V-6174ea00a0ec5efad39e2af915aeb09c?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3943,1)">
                <p><img src="http://images.gagahi.com/V-681324bb6de88b9624fadeb035de6357?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3921,1)">
                <p><img src="http://images.gagahi.com/V-cc172d55b02b5cc20f1505a4f991d4f1?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3915,1)">
                <p><img src="http://images.gagahi.com/V-3309962d5f24a0a67f7571de8e11a735?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3911,1)">
                <p><img src="http://images.gagahi.com/V-d68b3d9bff1dd062c1a8823b05f119ea?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3907,1)">
                <p><img src="http://images.gagahi.com/V-a9a61def21108b42a3c73ef01d93bd04?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3887,1)">
                <p><img src="http://images.gagahi.com/V-516a60258e93a519584cca7b56b76093?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3881,1)">
                <p><img src="http://images.gagahi.com/V-d4da8a5d82e1812f2aff9afbf2a30906?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3879,1)">
                <p><img src="http://images.gagahi.com/V-7ce29027dfcd99aef1353b3dff046e47?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3875,1)">
                <p><img src="http://images.gagahi.com/V-4c59eda5d847418b28291f2009f81db5?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3873,1)">
                <p><img src="http://images.gagahi.com/V-ccbf1c8cff5c46b57c6ab77a36f26678?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3871,1)">
                <p><img src="http://images.gagahi.com/V-56abecea15af43eb1c24c1a8a5c19ad7?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3869,1)">
                <p><img src="http://images.gagahi.com/V-b2533a8eaa09737feac896576c143453?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3867,1)">
                <p><img src="http://images.gagahi.com/V-ac9f3ee97ef95c5f38ceb2183ebc83c3?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3865,1)">
                <p><img src="http://images.gagahi.com/V-1180b618d0df5b7d569244c2dbf41d26?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3863,1)">
                <p><img src="http://images.gagahi.com/V-541c86656a8b0ba5fd2ecc63c96f1495?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3857,1)">
                <p><img src="http://images.gagahi.com/V-9a45affd71feea8be7facc10905f34d8?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3861,1)">
                <p><img src="http://images.gagahi.com/V-4fe4ce41f74bd09a6e165aca7951f9ce?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3855,1)">
                <p><img src="http://images.gagahi.com/V-3834a76765a3617d6e3082f85733e8df?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3853,1)">
                <p><img src="http://images.gagahi.com/V-f64fea6697e9213da860b55f55687259?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3849,1)">
                <p><img src="http://images.gagahi.com/V-cde9637e663886e9c725a57199078f4d?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3847,1)">
                <p><img src="http://images.gagahi.com/V-89dfd4a8ec329d7d77e7be4622156065?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3839,1)">
                <p><img src="http://images.gagahi.com/V-d99cbeba4e0cd32174764ac10679a69c?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3831,1)">
                <p><img src="http://images.gagahi.com/V-7a84efe65a85659e2004ca0d9df6c8e9?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3807,1)">
                <p><img src="http://images.gagahi.com/V-fa530ca7e196e6ea8bb80ee96205359a?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3763,1)">
                <p><img src="http://images.gagahi.com/V-d35e44bca7cce3fbb66c04b95006d343?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">3</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3757,1)">
                <p><img src="http://images.gagahi.com/V-8b3fcab0aee4a14df04ea1a1af048610?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,3751,1)">
                <p><img src="http://images.gagahi.com/V-b118b35244fcf8de953b527691bf061d?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,5027,1)">
                <p><img src="http://images.gagahi.com/V-8a7c30066a8506da831787d0934db5b7?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,5089,1)">
                <p><img src="http://images.gagahi.com/V-4049855689a9bca9d4ad9c988665838e?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">0</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,5025,1)">
                <p><img src="http://images.gagahi.com/V-b5fc9d2005bb33e435e3aa839a4fcb3c?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,5087,1)">
                <p><img src="http://images.gagahi.com/V-63a8b2246ad295cc1934412b7ef033a5?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">0</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,5023,1)">
                <p><img src="http://images.gagahi.com/V-05a0e70668902eb39b51ca50f6f6d0f3?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">5</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,5085,1)">
                <p><img src="http://images.gagahi.com/V-245ef0ceb3638daa33023f34393e80b7?imageMogr2/thumbnail/100x100" ></p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">0</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <div class="clear"></div>
        </ul>

        <ul class="trans1 giftcont1" style="display:none" onscroll="findTranspackage(this)">

            <li onclick="selectedgift(this,3,2)">
                <p><img src="http://images.gagahi.com/T-1?imageMogr2/thumbnail/100x78" ></p>
                <p>100000字符</p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">99.90</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,19,2)">
                <p><img src="http://images.gagahi.com/T-1?imageMogr2/thumbnail/100x78" ></p>
                <p>8000字符</p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">19.90</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,35,2)">
                <p><img src="http://images.gagahi.com/T-1?imageMogr2/thumbnail/100x78" ></p>
                <p>30000字符</p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">49.90</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

            <li onclick="selectedgift(this,51,2)">
                <p><img src="http://images.gagahi.com/T-1?imageMogr2/thumbnail/100x78" ></p>
                <p>3000字符</p>
                <p class="mt5"><span class="c-ff8a00 f18 mr5">9.90</span><span class="money"></span></p>
                <div class="chosed"></div>
            </li>

        </ul>
    </div>
</div>

<!-- 图片弹窗 -->
<div id="zoneDatail" style="display: none;">
    <div class="dynamic_detail" >
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
                        <!-- <div class="inlineblock ml20 dt_tranS" data-lang="这几天天气很好" onclick="translate(this)">-->
                        <div class="inlineblock ml20 dt_tranS" data-lang="" >
                            <i class="z_dt_icon_r dt_tranS_btn"></i>
                        </div>
                        <!-- 举报 -->
                        <div class="fr" id="report" >
                            <a href="javascript:;" class="inlineblock z_dt_icon dt_report2" title="举报"></a>
                        </div>
                    </div>
                </div>

                <!-- 评论 -->
                <div class="detail_comment" mid="2935185"
                     mname="Quintion" mbigimg="images/default/male.png"
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
                $(this).css("background-image","url(http://static.gagahi.com/images/xld1.png)");
                $(".xld-select>li").each(function (e) {
                    var _selt = $(this);
                    $(this).hover(function (){
                        $(this).addClass("default").siblings().removeClass("default");
                    })
                    $(this).click(function (e) {
                        $(_selt.parent(".xld-select").siblings("span")).text(_selt.children("a").text()).css("background-image","url(http://static.gagahi.com/images/xld.png)");
                        _selt.parent(".xld-select").css("display", "none");
                    });
                });
            })

        </script>
    </div>
</div>


<!-- 评论者信息  备份
<div class="inlineblock user_pto">
	<a href="#"><img src="../images/portrait1.jpg" alt=""></a>
</div>
<div class="inlineblock">
	<p>
		<a href="#" class="user_home">Nita2009</a>
	</p>
	<p class="position_r comment_txt">
		<span>能不能红 是看规则能不能红 是看规则</span>
		<i class="inlineblock z_dt_icon ml5 dt_tranS_btn2 mt-5"></i>
		<i class="inlineblock z_dt_icon ml5 dt_reply_btn2"></i>
		<i class="del_comment z_dt_icon" data-id=""></i>
	</p>
	<!-- 翻译后结果
<p class="detail_trans bgwhite">
	<i class="z_dt_icon triangle"></i>
	<span class="text js_detail_trans">
		Helpless people said the
		helpless words. Folk look at temperament Folk look at
		temperament
	</span>
</p>
<!-- 回复
<p class="mt10 detail_reply">
	<a href="#" class="user_home">Nita2009</a> 回复
	<a href="#" class="user_home">Nita2009</a>：
	<span>无奈的人说的无奈的。</span>
	<i class="inlineblock z_dt_icon ml5 dt_tranS_btn2 mt-5"></i>
	<i class="inlineblock z_dt_icon ml5 dt_reply_btn2"></i>
</p>
<!-- 回复翻译
	<p class="detail_trans bgwhite">
		<i class="z_dt_icon triangle"></i>
		<span class="text js_detail_trans">Helpless people said the helpless
		words. Folk look at temperament Folk look at temperament
		</span>
	</p>
</div>-->






<!--登录弹出框开始-->
<link href="http://static.gagahi.com/css/login-layer.css" rel="stylesheet" type="text/css"/>

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
                <img src="http://static.gagahi.com/images/xs.png">
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
<script src="http://static.gagahi.com/IM/js/IM.js" type="text/javascript"></script>
<script type="text/javascript" src="http://static.gagahi.com/js/laytpl.js"  ></script>
<script type="text/javascript">
    $(function(){

        var token="961e84bdd1d54facb5d9b279c965eb8c";
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
                        var html = "<li class='f13'><span class='tx'><img src='http://static.gagahi.com/images/gg1.jpg'></span>";
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
                                $(".lfttop").find(".ari:first").append("<img src=\"http://static.gagahi.com/images/hg.jpg\">");
                            }else if(message.content.mfstRelevel == "3"){//vip
                                $(".lfttop").find(".ari:first").append("<img src=\"http://static.gagahi.com/images/vip-hg.jpg\">");
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

