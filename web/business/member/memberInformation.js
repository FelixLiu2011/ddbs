
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
    initMemberInfo();
    //选中状态样式
    selectionStyle();
});

function initMemberInfo() {
    //初始化个人信息开始
    var job = $("#conJob").val();
    if(job != ""){
        $("#iConJob").html(memberInfo.job[job]);
        $("#membJob").html(memberInfo.job[job]);
    }

    var countryCode = $("#conCountryCode").val();
    if(countryCode != "") {
        var countryName = memberInfo.getCountryInfoByCode(countryCode).dicoName;
        $("#iConCountry").html(countryName);
        $("#countryshow").html(countryName);
    }

    var birth = $("#conBirth").val();
    if(birth != "") {
        var age = dateUtil.getAgeByBirthDay(birth);
        var birthArray = birth.split("-");
        $("#iAge").html(age);

        $("#reg_year").text(birthArray[0]);
        $("#reg_month").text(birthArray[1]);
        $("#reg_day").text(birthArray[2]);
    }

    var sex = $("#conSex").val();
    if(sex != "") {
        $("#iConSex").html(memberInfo.sex[sex]);
        $("#sex").html(memberInfo.sex[sex]);
    }else {
        $("#iConSex").html(memberInfo.sex[1]);//默认为男
        $("#sex").html(memberInfo.sex[1]);
    }


    var conLable = $("#conLable").val();
    if(conLable != "") {
        var labelsArray = conLable.split(",");
        var html = "";
        var htmlSpan = "";
        for(var i=0; i< labelsArray.length; i++) {
            var label = labelsArray[i].split("_");
            html += '<i>' + label[1] + '</i>';
            htmlSpan += '<span class =' + label[0] + '>' + label[1] + '</span>';
        }
        $("#iConLabel").html(html);
        $("#lableselected").html(htmlSpan);
    }

    //会员等级
    var conVipLevel = $("#conVipLevel").val();
    conVipLevel = (conVipLevel == "" ? 1 : conVipLevel);
    $("#iConVipLevel").html(memberInfo.vipLevel[conVipLevel] +  $("#iConVipLevel").html());

    //隐私设置和通知设置
    var conIsopenperson = $("#conIsopenperson").val();
    var conIsonline = $("#conIsonline").val();
    var conIsallowaddfriend = $("#conIsallowaddfriend").val();
    var conIsletter = $("#conIsletter").val();
    var conIslike = $("#conIslike").val();
    var conIsvisito = $("#conIsvisito").val();
    var conIsacceptgift = $("#conIsacceptgift").val();

    if(conIsopenperson != "") {
        if(conIsopenperson == "1") {//公开
            $("#e").attr("checked","checked");
        }else if (conIsopenperson == "2") {//好友可见
            $("#f").attr("checked","checked");
        }else if (conIsopenperson == "3") {//仅限自己
            $("#g").attr("checked","checked");
        }
        $("#iconIsopenperson").html(memberInfo.isopenperson[conIsopenperson]);
    }else{
        $("#e").attr("checked","checked");
        $("#iconIsopenperson").html(memberInfo.isopenperson[1]);
    }

    if(conIsonline != "") {
        if(conIsonline == "1") {//是
            $("#h").attr("checked","checked");
        }else if (conIsonline == "2") {//否
            $("#i").attr("checked","checked");
        }
        $("#iConIsonline").html(memberInfo.yesOrNot[conIsonline]);
    }else{
        $("#h").attr("checked","checked");
        $("#iConIsonline").html(memberInfo.yesOrNot[1]);
    }

    if(conIsallowaddfriend != "") {
        if(conIsallowaddfriend == "1") {//允许
            $("#j").attr("checked","checked");
        }else if (conIsallowaddfriend == "2") {//需要验证
            $("#k").attr("checked","checked");
        }
        $("#iConIsallowaddfriend").html(memberInfo.isallowaddfriend[conIsallowaddfriend]);
    }else{
        $("#j").attr("checked","checked");
        $("#iConIsallowaddfriend").html(memberInfo.isallowaddfriend[1]);
    }

    if(conIsallowaddfriend != "") {
        if(conIsallowaddfriend == "1") {//允许
            $("#j").attr("checked","checked");
        }else if (conIsallowaddfriend == "2") {//需要验证
            $("#k").attr("checked","checked");
        }
        $("#iConIsallowaddfriend").html(memberInfo.isallowaddfriend[conIsallowaddfriend]);
    }else{
        $("#j").attr("checked","checked");
        $("#iConIsallowaddfriend").html(memberInfo.isallowaddfriend[1]);
    }

    if(conIsletter == "2") {
        $("#mecoIsletter").attr("checked", false);
        $("#iconIsletter").html(memberInfo.yesOrNot[2]);
    }else {
        $("#mecoIsletter").attr("checked", true);
        $("#iconIsletter").html(memberInfo.yesOrNot[1]);
    }

    if(conIslike == "2") {
        $("#mecoIslike").attr("checked", false);
        $("#iconIslike").html(memberInfo.yesOrNot[2]);
    }else {
        $("#mecoIslike").attr("checked", true);
        $("#iconIslike").html(memberInfo.yesOrNot[1]);
    }

    if(conIsvisito == "2") {
        $("#mecoIsvisito").attr("checked", false);
        $("#iconIsvisito").html(memberInfo.yesOrNot[2]);
    }else {
        $("#mecoIsvisito").attr("checked", true);
        $("#iconIsvisito").html(memberInfo.yesOrNot[1]);
    }

    if(conIsacceptgift == "2") {
        $("#mecoIsacceptgift").attr("checked", false);
        $("#iconIsacceptgift").html(memberInfo.yesOrNot[2]);
    }else {
        $("#mecoIsacceptgift").attr("checked", true);
        $("#iconIsacceptgift").html(memberInfo.yesOrNot[1]);
    }

}

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
    Qfast.add('widgets', { path: path + "/common/js/terminator2.2.min.js", type: "js", requires: ['fx'] });
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


