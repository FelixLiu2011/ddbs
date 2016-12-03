var ctx =path;
var staticPath =path;
var staticCtx=path;
var qiniuImgUrl = path;
var myGagaId='';
Zoneyet.Global.language = (local?local.toLowerCase().replace("_","-"):local)||'en-us';//换成小写形式，后台返回为(zh_CN)
//判断是`mobile`还是`pc`
var language = Zoneyet.Global.language;
//语言映射文件
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
if ((navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i))) {
    Zoneyet.Global.device = 'mobile';
} else {
    Zoneyet.Global.device = 'pc';
}
$.i18n.init({
    lng: lan2fileLan[language] || "en",
    useCookie: false,
    fallbackLng: false,
    getAsync: false,
    //resStore:Zoneyet.Global.langresource,
    resGetPath: staticPath + '/common/js/lang/__lng__.json'
}, function (err, t) {
    $(function () {
        myGagaId = $('.head').attr('gagaid') || '';
        $("body").i18n();
        if (typeof i18nSucess == 'function') {
            i18nSucess();
        }
    });
});

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
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null)
        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}
/*读取cookies*/
function getCookie(name) {
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}
function closeSm(){

}

/*fixme*/
$(function(){
    var token = "db2ec157e2204e109c8342979ad0b1bc";
    if (token == "") {
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
        success: function (reg) {
        },
        error: function () {
        }
    });


    /*返回顶部*/
    $('.scroll_t').click(function () {
        $('html,body').animate({
            scrollTop: '0px'
        }, 800);
    });
    /**
     *清空队列
     */
    $.ajax({
        type: "post",
        url: "http://webim.gagahi.com/message/cleanQueue",
        async: false,
        data: {
            t: token,
            offset: 0,
            size: 500
        },
        dataType: "json",
        success: function (data) {
            if (data.code == "1") {//成功
            } else if (data.code == "6") {//Token 失效
            } else {
            }
        }
    });

    var url = "http://webim.gagahi.com/message/getMessage";
    IM.connection({
        token: token,
        url: url,
        onRead: function (msg) {
            if (msg.type == 9) {//系统消息
                var message = msg.message;//系统消息体
                if (message.type == 1) {
                    var souce = message.content['notiSouce'];
                    var content = message.content['notiContent']
                    var html = "<li class='f13'><span class='tx'><img src='<%=path%>/common/images/gg1.jpg'></span>";
                    html += "<p>2<span class='nm'>" + souce + "</span>" + content + "<br><span class='tim f12'>2:40</span></p></li>";
                    $("#myCustomScrollbar").append(html);

                } else if (message.type == 2) {
                    /* 	console.log("tognzhi:"+JSON.stringify(message));
                     console.log("tognzhi:"+message);*/
                    //已读未读状态
                    if (message.content.type == 1) {
                        $.Letter.modifyMSGState(message.content.rid);
                    } else {
                        $.IM.modifyMSGState(message.content.rid);
                    }

                } else if (message.type == 3) {//用户在其他地方登陆
                    layer.msg(message.content, {
                        //icon: 1,
                        time: 500 //2秒关闭（如果不配置，默认是3秒）
                    }, function () {
                        //alert("http://www.gagahi.com:80/");
                        window.location.href = "http://www.gagahi.com:80/Global/loginout?clearIMToken=2";
                    });

                } else if (message.type == 4) {
                    //发送后翻译译文推给对方
                    //console.log("发送后翻译译文推给对方:"+JSON.stringify(message));
                    //console.log("发送后翻译译文推给对方:"+message);
                    $.IM.SendAfterTranslationPush(message.content);


                } else if (message.type == 100) {
                    // 登录超时，提醒用户重新登录
                    //alert(message.content);
                    layer.msg(message.content, function () {
                        // 弹出登录窗体
                        $(".logn-con,.creditcon").css("display", "block");
                    });
                } else if (message.type == 5) {
                    //创建群通知
                    //console.log("创建群通知:"+JSON.stringify(message));
                    //console.log("创建群通知:"+message);
                    $.IM.createGroupNotice(message.content);

                } else if (message.type == 6) {
                    //退群通知别人
                    //console.log("退群通知别人:"+JSON.stringify(message));
                    //console.log("退群通知别人:"+message);
                    $.IM.backGroupNotice(message.content);

                } else if (message.type == 11) {//通知 默认
                    var obj = $("#rightNotice");
                    var count = $(obj).text();
                    if (null == count || $.trim(count).length <= 0) {
                        count = parseInt(message.content.count);
                        obj.addClass("gs newsNumSingle");
                    } else if (count == "99+") {
                        count = "99+";
                    } else {
                        count = parseInt(count) + parseInt(message.content.count);
                        if (count > 99) {
                            count = "99+";
                            obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                        } else {
                            obj.addClass("newsNumSingle");
                        }
                    }
                    $(obj).text(count);

                    //弹窗
                    RBTIPS(message.content);
                } else if (message.type == 12) {//通知 私信
                    var obj1 = $("#leftSixinNotice");
                    var count = $(obj1).text();
                    if (null == count || $.trim(count).length <= 0) {
                        count = parseInt(message.content.count);
                        obj1.addClass("newsNumSingle");
                    } else if (count == "99+") {
                        count = "99+";
                    } else {
                        count = parseInt(count) + parseInt(message.content.count);
                        if (count > 99) {
                            count = "99+";
                            obj1.removeClass("newsNumSingle").addClass("newsNumDouble");
                        } else {
                            obj1.addClass("newsNumSingle");
                        }
                    }
                    $(obj1).text(count);

                    //在私信页面不提醒
                    if (window.location.pathname.indexOf("/privateLetter") < 0) {
                        var obj = $("#rightNotice");
                        var count = $(obj).text();
                        if (null == count || $.trim(count).length <= 0) {
                            count = parseInt(message.content.count);
                            obj.addClass("gs newsNumSingle");
                        } else if (count == "99+") {
                            count = "99+";
                        } else {
                            count = parseInt(count) + parseInt(message.content.count);
                            if (count > 99) {
                                count = "99+";
                                obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                            } else {
                                obj.addClass("newsNumSingle");
                            }
                        }
                        $(obj).text(count);

                        //弹窗
                        RBTIPS(message.content);
                    }
                } else if (message.type == 7) {//通知 访客
                    var obj = $("#rightNotice");
                    var count = $(obj).text();
                    if (null == count || $.trim(count).length <= 0) {
                        count = parseInt(message.content.count);
                        obj.addClass("gs newsNumSingle");
                    } else if (count == "99+") {
                        count = "99+";
                    } else {
                        count = parseInt(count) + parseInt(message.content.count);
                        if (count > 99) {
                            count = "99+";
                            obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                        } else {
                            obj.addClass("newsNumSingle");
                        }
                    }
                    $(obj).text(count);


                    var obj2 = $("#leftVisitorNotice");
                    var count2 = $(obj2).text();
                    if (null == count2 || $.trim(count2).length <= 0) {
                        count2 = parseInt(message.content.count);
                        obj2.addClass("newsNumSingle");
                    } else if (count2 == "99+") {
                        count2 = "99+";
                    } else {
                        count2 = parseInt(count2) + parseInt(message.content.count);
                        if (count2 > 99) {
                            count2 = "99+";
                            obj2.removeClass("newsNumSingle").addClass("newsNumDouble");
                        } else {
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
                } else if (message.type == 8) {//通知 （赞）
                    var obj = $("#rightNotice");
                    var count = $(obj).text();
                    if (null == count || $.trim(count).length <= 0) {
                        count = parseInt(message.content.count);
                        obj.addClass("gs newsNumSingle");
                    } else if (count == "99+") {
                        count = "99+";
                    } else {
                        count = parseInt(count) + parseInt(message.content.count);
                        if (count > 99) {
                            count = "99+";
                            obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                        } else {
                            obj.addClass("newsNumSingle");
                        }
                    }
                    $(obj).text(count);

                    var obj2 = $("#leftLikeMeNotice");
                    var count2 = $(obj2).text();
                    if (null == count2 || $.trim(count2).length <= 0) {
                        count2 = parseInt(message.content.count);
                        obj2.addClass("newsNumSingle");
                    } else if (count2 == "99+") {
                        count2 = "99+";
                    } else {
                        count2 = parseInt(count2) + parseInt(message.content.count);
                        if (count2 > 99) {
                            count2 = "99+";
                            obj2.removeClass("newsNumSingle").addClass("newsNumDouble");
                        } else {
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
                } else if (message.type == 9) {//加好友
                    if (null == message.content.notice || message.content.notice != "nonotice") {
                        var obj = $("#rightNotice");
                        var count = $(obj).text();
                        if (null == count || $.trim(count).length <= 0) {
                            count = parseInt(message.content.count);
                            obj.addClass("gs newsNumSingle");
                        } else if (count == "99+") {
                            count = "99+";
                        } else {
                            count = parseInt(count) + parseInt(message.content.count);
                            if (count > 99) {
                                count = "99+";
                                obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                            } else {
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

                    if (null != message.content.isshow && message.content.isshow != "notshow") {
                        var obj = $("#rightApplyCount");
                        var count = $(obj).text();
                        if (null == count || $.trim(count).length <= 0) {
                            count = parseInt(message.content.count);
                            obj.addClass("newsNumSingle");
                        } else if (count == "99+") {
                            count = "99+";
                        } else {
                            count = parseInt(count) + parseInt(message.content.count);
                            if (count > 99) {
                                count = "99+";
                                obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                            } else {
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
                } else if (message.type == 13) {//私信人工翻译通知	邢冬阳
                    $.Letter.SendAfterTranslationPush(message.content);
                } else if (message.type == 14) {//私信红包打开通知	邢冬阳
                    //console.log("拆红包通知"+JSON.stringify(message));
                    //console.log("拆红包通知"+message);
                    $.Letter.getRedEnvelopeNotice(message.content);
                } else if (message.type == 15) {//私信加好友通知	邢冬阳
                    //console.log("加好友通知："+JSON.stringify(message));
                    //console.log("加好友通知："+message);
                    //message.content
                    $.IM.addFriendNoticeFun(message.content);

                } else if (message.type == 16) {//女性邀请联系失效通知	邢冬阳
                    //console.log("女性邀请联系失效通知："+JSON.stringify(message));
                    //console.log("女性邀请联系失效通知："+message);
                    $.Letter.invitationUpgradeOverTime(message.content);
                } else if (message.type == 17) {//动态实时翻译
                    $.zone.changeZoneTrans(message.content);
                } else if (message.type == 18) {//评论实时翻译
                    $.zone.changeCommentTrans(message.content);
                } else if (message.type == 20) {//实时更新被赠送人翻译包字节数  郭印
                    var num = $("#totalTranslate").text();
                    if (null == num || $.trim(num).length <= 0) {
                        num = 0;
                    }
                    $("#totalTranslate").text(parseInt(num) + parseInt(message.content.trpaCharcount));
                    //更新session
                    updateSession();
                } else if (message.type == 21) {//实时更新被升级会员 郭印
                    if (null != message.content && null != message.content.mfstRelevel) {
                        $(".lfttop").find(".ari:first").find("img").remove();//首先删除元素
                        if (message.content.mfstRelevel == "2") {//高级
                            $(".lfttop").find(".ari:first").append("<img src=\"<%=path%>/common/images/hg.jpg\">");
                        } else if (message.content.mfstRelevel == "3") {//vip
                            $(".lfttop").find(".ari:first").append("<img src=\"<%=path%>/common/images/vip-hg.jpg\">");
                        }

                        //更新session
                        updateSession();
                    }
                } else if (message.type == 22) {//实时更新金币 郭印
                    if (null != message.content && null != message.content.gold) {
                        var obj = $("#totalMoney");
                        var count = $(obj).text();
                        if (null != count && $.trim(count).length > 0) {
                            count = parseFloat(count) - parseFloat(message.content.gold);
                            if (parseFloat(count) <= 0) {
                                count = "0";
                            }
                            $(obj).text(count);
                            $(obj).parent().attr("data-explain", count);
                        }

                        //更新session
                        updateSession();
                    }
                }

            } else if (msg.type == "1") {//IM
                $.IM.receiveMessage(msg.message);
            } else if (msg.type == "2") {//私信
                $.Letter.ReceiveMessage(msg.message);
            } else if (msg.type == "10") {//用户下线通知
                if (msg.message.isOnline) {//上线
                    //console.log("上线用户"+msg.message.users);
                    $.IM.userOnline(msg.message.users);
                    $.Letter.userOnline(msg.message.users);
                } else {//下线
                    //console.log("下线用户"+msg.message.users);
                    $.IM.userOffline(msg.message.users);
                    $.Letter.userOffline(msg.message.users);
                }
            }
        },
        onError: function (msg) {
            if (msg == "6") {//Token 失效
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
