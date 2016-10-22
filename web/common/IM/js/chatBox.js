//var staticCtx="";//静态资源路径
/*var shieldArr=[];
var timeArr = {};
var createGroupsMember=[];*/
/*	var sendGender="<%=member.getMembSex()%>";//1男2女
	var sendHeadImgUrl="<%=member.getMembSmallimg()%>";//小头像*/
$.IM.init();
/*-----刷新时向后台发请求------*/
$.IM.postCurrentChatPeople("closed");
/*--------折叠----右侧高度---start--55 56*/
$.IM.winH = $(window).height();
$.IM.winW = $(window).width();
$("#js-hiddenScrollBar").height($.IM.winH - 80 - 92 - 12);
$("#hiddenLeftline").height($.IM.winH - 90 - 55);
$("#showIM").height($.IM.winH - 90 - 56);
$("#js-contactsScrollBar").height($.IM.winH - 90 - 55 - 110 - 15);
$("#js-groupScrollBar").height($.IM.winH - 90 - 55 - 110 - 40);
$("#js-searchResultsGroup").height($.IM.winH - 55 - 110 - 40);
if ($.cookie('ser_closed') == undefined || $.cookie('ser_closed') == 0) {
    $("#IMgagaService").css({"left":$.IM.winW-298,"display":"block"});
}
$(window).resize(function() {
    $.IM.winH = $(window).height();
    $.IM.winW = $(window).width();
    $("#js-hiddenScrollBar").height($.IM.winH - 80 - 92 - 12);
    $("#hiddenLeftline").height($.IM.winH - 90 - 55);
    $("#showIM").height($.IM.winH - 90 - 55);
    $("#js-contactsScrollBar").height($.IM.winH - 90 - 55 - 110 - 15);
    $("#js-groupScrollBar").height($.IM.winH - 90 - 55 - 110 - 40);
    $("#js-searchResultsGroup").height($.IM.winH - 55 - 110 - 40);
    $("#chatBox").css({
        "left": ($.IM.winW - 730) / 2,
        "top": ($.IM.winH - 600) / 2
    });
    if ($.cookie('ser_closed') == undefined || $.cookie('ser_closed') == 0) {
        $("#IMgagaService").css({"left":$.IM.winW-298,"display":"block"});
    }
});

/*-------------------右侧隐藏-----start-----------------------------*/
/* --------折叠-----人物添加滚动条----*/
$("#js-hiddenScrollBar").mCustomScrollbar({
    callbacks: {
        onScrollStart: function() {
            $(".mouse").remove();
            $(".mosueCurrent").css("opacity", "1");
        }
    }
});
/*--------折叠----点击展开---start--*/
$("#js-showBtn").click(function() {
    $("#hiddenIM").css("display", "none");
    $("#showIM").css("display", "block");
});
$("#hiddenIM").delegate("#js-newsArrive", "click", function() {
    $("#hiddenIM").css("display", "none");
    $("#showIM").css("display", "block");
});
/*  --------折叠---鼠标滑过人物样式-------start-------*/
$("#hiddenIM").delegate(".content", "mouseenter", function() {
    var th = $(this);
    var H = th.offset().top - $("#hiddenIM").offset().top;
    var gagaID = th.attr("data-gagaID");
    var headImg = th.find(".headImg").attr("src");
    var headLine = th.find(".headLine").attr("src");
    var RemarkName = th.attr("data-RemarkName");
    var display = th.find(".headLine").css("display");
    var div = "<div class='content mouse' data-gagaID='" + gagaID + "'>" +
        "<div class='headDiv' style='margin-right:5px'>" +
        "<img class='headImg' src=" + headImg + ">" +
        "<img class='headLine' src=" + headLine + " style='display:" + display + "'>" +
        "</div>" +
        "<div class='headExplain'>" +
        "<span class='RemarkName'>" + RemarkName + "</span>" +
        "</div></div>";
    $(div).appendTo("#hiddenIM").css({
        "position": "absolute",
        "top": H,
        "right": "9px",
        "z-index": "-1"
    });
    th.css("opacity", "0");
    th.addClass("mosueCurrent");

});
$("#hiddenIM").delegate(".content", "mouseleave", function() {
    $(this).css("opacity", "1");
    $(this).removeClass("mosueCurrent");
    $(".mouse").remove();
});
/*  --------折叠---点击人物-------start-------*/
$("#hiddenIM").delegate(".content", "click", function() {
    IMclickPeople(this);
});
$("#IMgagaService img").mousedown(function() {
    event.stopPropagation();
    $.IM.isClick =true;
})
$("#IMgagaService img").mouseup(function() {
    if( $.IM.isClick){
         $("#hiddenIM").find("[data-gagaID=-1]").click();
    }
})
$('#IMgagaService .close-gagaservice').mouseup(function () {
    $.cookie('ser_closed','1', {path: '/'});
    if ($('#hiddenIM').is(':visible')) {
        var $service = $('#hiddenIM .hiddenContactsCon li:first');       
        $('#IMgagaService').animate({
            'top': 40
        }, 500 ,function() {
            $('#IMgagaService').animate({
                'left': $(document).width() - 65,
                'height': 60,
                'width': 60
            }, 500 ,function() {
                $('#IMgagaService').hide();
            });            
        });
    } else if ($('#friendGroup').is(':visible')) {
        var $service = $('#friendGroup .friendContainer li:first');      
        $('#IMgagaService').animate({
            'top': 60
        }, 500 ,function() {
            $('#IMgagaService').animate({
                'left': $(document).width() - 65,
                'height': 60,
                'width': 60
            }, 500 ,function() {
                $('#IMgagaService').hide();
            });            
        });
    } else {
        $('#IMgagaService').hide(); 
    } 
});
    /* --------------------右侧隐藏---end---------------------------------*/



/* --------------------右侧显示---start---------------------------------*/
/* ------右侧隐藏-----*/
$("#js-hideBtn").click(function() {
    $("#hiddenIM").css("display", "block");
    $("#showIM").css("display", "none");
    /*--------关闭--hiddenIM--中新消息提醒----------*/
    $.IM.closedHideMSGTip();

});

/*------搜索框---搜索事件------*/
$("#js-searchInput").focus(function() {
    $(this).val("");
}).blur(function() {
    var th = $(this);
    if (th.val() == $.t("im.searchContacts") || th.val().trim() == "") {
        th.val($.t("im.searchContacts")).css("color", "#999");
    };
});
$("#js-searchBtn").click(function() {
    var searchTXT = $("#js-searchInput").val().trim();
    if (searchTXT == "") {
        return;
    };
    $("#js-searchBtn").hide();
    $("#js-SearchCloseBtn").show();
    $(".showTab").hide();
    $("#groupGroup").hide();
    $("#js-contactsScrollBar").hide();
    $("#js-searchResultsGroup").show();

    $("#searchrecentlyGroup").hide();
    $("#searchrecentlyGroup .FoldContainer").html("");

    $("#searchFriendGroup").hide();
    $("#searchFriendGroup .FoldContainer").html("");

    $("#searchgroupGroup").hide();
    $("#searchgroupGroup .FoldContainer").html("");
    $(".searchResultNothing").hide();

    $("#cacheDiv").html($("#js-contactsScrollBar .contactsCon").html());
    $("#cacheDiv").append($("#groupGroup .groupCon").html());

    $("#cacheDiv .showContent").each(function() {
        var th = $(this);
        th.children(".newsNum").hide();
        var txt = $(this).children(".showRemarkName").text();
        if (txt.indexOf(searchTXT) > -1) {
            txt = txt.replace(searchTXT, "<span class='c-FF8A00'>" + searchTXT + "</span>");
            th.children(".showRemarkName").html(txt);

            if (th.parent().hasClass("recentlyContainer")) {
                $("#searchrecentlyGroup").children(".FoldContainer").append(th);
                $("#searchrecentlyGroup").show();
            };
            if (th.parent().hasClass("friendContainer")) {
                $("#searchFriendGroup").children(".FoldContainer").append(th);
                $("#searchFriendGroup").show();
            };
            if (th.parent().hasClass("groupContainer")) {
                $("#searchgroupGroup").children(".FoldContainer").append(th);
                $("#searchgroupGroup").show();
            };

        }
    });
    if (!$("#searchrecentlyGroup .FoldContainer").html() && !$("#searchFriendGroup .FoldContainer").html() && !$("#searchgroupGroup .FoldContainer").html()) {
        $(".searchResultNothing").show();
    };
    $("#js-searchResultsGroup").mCustomScrollbar("update");
    $("#js-searchResultsGroup").mCustomScrollbar("scrollTo", "top");
});
$("#js-SearchCloseBtn").click(function() {
    $("#js-searchInput").val($.t("im.searchContacts"));
    $(".showTab").show();
    if ($.IM.showTab == "contacts") {
        $("#js-contactsScrollBar").show();
    } else {
        $("#groupGroup").show();
    }
    $("#js-searchBtn").show();
    $("#js-SearchCloseBtn").hide();
    $("#js-searchResultsGroup").hide();
    $("#cacheDiv").html("");
});
/*  --------展开---点击人物-------start-------*/
$("#showIM").delegate(".showContent", "click", function() {
    IMclickPeople(this);
});


/* --------组折叠------start------*/
$("#showIM").delegate(".FoldTitle", "click", function() {
    var th = $(this);
    if (th.hasClass("openTitle")) {
        th.removeClass("openTitle");
        th.children(".foldingBtn").css("background-position", "-342px -50px");
        th.parent().children(".FoldContainer").css("display", "none");
    } else {
        th.addClass("openTitle");
        th.children(".foldingBtn").css("background-position", "-308px -50px");
        th.parent().children(".FoldContainer").css("display", "block");
    }
});
$(".js-contacts").click(function() {
    $(this).css("border-bottom", "2px solid #2D57A1");
    $(".js-group").css("border-bottom", "2px solid #F6F6F7");
    $("#js-contactsScrollBar").css("display", "block");
    $("#groupGroup").css("display", "none");
    $.IM.showTab = "contacts";
});
$(".js-group").click(function() {
    $(this).css("border-bottom", "2px solid #2D57A1");
    $(".js-contacts").css("border-bottom", "2px solid #F6F6F7");
    $("#js-contactsScrollBar").css("display", "none");
    $("#groupGroup").css("display", "block");
    $.IM.showTab = "group";
});
/*--------------滚动条-----------------*/
$("#js-contactsScrollBar").mCustomScrollbar({});
$("#js-groupScrollBar").mCustomScrollbar({
    /*            autoHideScrollbar:true,
                scrollButtons:{enable:true}*/
});
$("#GroupMembScrollBar").mCustomScrollbar({});
/*-----------------------------右侧显示------end---------------------------------*/


/*-----点击人物-------公用函数-----------*/
function IMclickPeople(th) {
    var th = $(th);
    var signID = th.attr("data-signID");
    var remarkname = th.attr("data-remarkname");
    var nickName = th.attr("data-nickName");
    var gagaID = th.attr("data-gagaID");
    var shield = th.attr("data-shield");
    var onLine = th.attr("data-onLine");
    var Language = th.attr("data-language");
    var headSrc = th.find(".headImg").attr("src")
    var chatPeopleUl = $(".chatBoxLower .lowerLeft");
    var chatPeopleNum = chatPeopleUl.children("li").length;
    if(!$.IM.timeArr[gagaID]){
        $.IM.timeArr[gagaID] = "";
    }
    /*--------关闭--showIM---hiddenIM---中对应gagaID的人的新消息提醒----------*/
    $.IM.closedShowMSGTip(gagaID);
    $.IM.closedHideMSGTip();
    /*---- 判断新选择的聊天人是否在弹窗列表中--------修改聊天窗口正在聊天人------------*/
    if (chatPeopleUl.find("[data-gagaID = " + gagaID + "]").html()) {
        if (chatPeopleUl.children(".chatPeopleChoiced").attr("data-gagaID") != gagaID) {
            var gagaIDing = chatPeopleUl.children(".chatPeopleChoiced").attr("data-gagaID");
            $(".lowerRight").children("[data-gagaID=" + gagaIDing + "]").hide();
            /* ---聊天弹窗中正在聊天人的状态改为不是正在聊天状态---*/
            chatPeopleUl.children("li").attr("class", "chatPeopleContent");
            chatPeopleUl.find("[data-gagaID = " + gagaID + "]").attr("class", "chatPeopleChoiced");
            if(chatPeopleUl.find("[data-gagaID = " + gagaID + "]").children(".newsNum").hasClass("newsNumDouble")){
                chatPeopleUl.find("[data-gagaID = " + gagaID + "]").children(".newsNum").removeClass("newsNumDouble").addClass("newsNumSingle");
            }
            chatPeopleUl.find("[data-gagaID = " + gagaID + "]").children(".newsNum").hide().text("0");
            $("#chatBox .lowerRight").children("[data-gagaID=" + gagaID + "]").show();
            $("#chatBox .lowerRight").children("[data-gagaID=" + gagaID + "]").children(".chatContent").mCustomScrollbar("scrollTo", "bottom");
        }
    } else {
        if (chatPeopleUl.children("li").hasClass("chatPeopleChoiced")) {
            var gagaIDing = chatPeopleUl.children(".chatPeopleChoiced").attr("data-gagaID");
            $(".lowerRight").children("[data-gagaID=" + gagaIDing + "]").hide();
            /* ---聊天弹窗中聊天人的状态改为不是正在聊天状态---*/
            chatPeopleUl.children("li").attr("class", "chatPeopleContent");
        }
        if (chatPeopleNum > 9) {
            var firstgagaID = chatPeopleUl.children("li:first").attr("data-gagaID");
            chatPeopleUl.children("li:first").remove();
            $("#chatBox .lowerRight").children("[data-gagaID=" + firstgagaID + "]").remove();

        } else {
            var peopleNum = $("#peopleNum").text();
            peopleNum++;
            $("#peopleNum").text(peopleNum);
        }
        var chatPeopleLi = "<li class='chatPeopleChoiced' data-signID='" + signID + "' data-gagaID='" + gagaID + "' data-remarkname='" + remarkname + "' data-nickName='" + nickName + "'  data-shield='" + shield + "' data-onLine='" + onLine + "' data-Language='" + Language + "'>" +
            "<div class='chatHeadDiv'>" +
            "<img class='headImg' src='" + headSrc + "' />";
        if (signID == "people") {
            if (shield == 1) {
                chatPeopleLi += "<img class='headLine' src='" + staticCtx + "img/shield.png' style='display:block' /></div>";
            } else {
                if (onLine == 1) {
                    chatPeopleLi += "<img class='headLine' src='" + staticCtx + "img/On-line.png' style='display:block' /></div>";
                } else {
                    chatPeopleLi += "<img class='headLine' src='" + staticCtx + "img/On-line.png' style='display:none' /></div>";
                }

            }
        } else {
            if (shield == 1) {
                chatPeopleLi += "<img class='headLine' src='" + staticCtx + "img/shield.png' style='display:block' /></div>";
            } else {
                chatPeopleLi += "<img class='headLine' src='" + staticCtx + "img/On-line.png' style='display:none' /></div>";
            }
        }
        chatPeopleLi += "<span class='chatRemarkName'>" + remarkname + "</span>" +
            "<i class='chatDelete'></i>" +
            "<span class='newsNum newsNumSingle' style='display:none'>0</span>" +
            "</li>";
        chatPeopleUl.append(chatPeopleLi);
        var chatContainerDiv = '<div class="chatContainer" data-gagaID=' + gagaID + '>' +
            '<div class="chatContent">' +
            '<p class="moreNews" style="display:none">' + $.t("im.moreNews") + '</p>' +
            '<div class="chatCon">' +
            /*'<p class="chatTime"><span class="monthDay">'+'06-29'+'</span><span>'+'12:51'+'</span></p>'+
            '<div class="likeEachOther"><span class="likeEachOtherSpan">我们是彼此喜欢的人哦~</span></div>'+*/
            '</div></div>' +
            '<div class="safetyTips"><p><a href="'+ctx+'/Platform/friendssafe" target="_blank">' + $.t("im.safetyTips") + '</a>' + $.t("im.systemSafetyTips") + '</p></div>' +
            '<div class="upLoadImgContainer">' +
            '<div class="upLoadContnet">' +
            '<i class="upLoadImgHorn"></i><span class="bigImgBtn"><img class="upLoadImg" src="" /></span>' +
            '</div>' +
            '<div class="upLoadExplain">' +
            '<span class="upLoadImgName"></span>' +
            '<span class="fr"><span class="upLoadImgDelete"></span><span class="upLoadImgState"></span><i class="upLoadImging"></i></span>' +
            '</div></div></div>';
        $("#chatBox .lowerRightBottom").before(chatContainerDiv);
        $("#chatBox .lowerRight").children("[data-gagaID = " + gagaID + "]").children(".chatContent").mCustomScrollbar();
        /* -----获取最近10条历史纪录-----*/
        var receiveHeadimg = th.find(".headImg").attr("src");
        $.IM.ajxaLateHistorical(gagaID, receiveHeadimg);
    }
    /*------向后台发送当前联系人-------*/
    $.IM.postCurrentChatPeople(gagaID);
    //$.IM.ajxaLateHistorical(); .wrap('<a href="#" class="im-goto"></a>')
    $("#chatBox .chatHeadHeadIng").attr("src", headSrc);
    $("#chatBox .chatRemarkNameIng").attr("data-nickName", nickName).text(remarkname);
    /**/
    if ($("#chatBox .chatHeadHeadIng").parent('.im-goto').length==0) {
        if (signID=="people" && gagaID!=-1) {
            $("#chatBox .chatHeadHeadIng").wrap('<a href="'+ctx+'/Member/otherHome/'+gagaID+'" class="im-goto"></a>');
            $("#chatBox .chatRemarkNameIng").wrap('<a href="'+ctx+'/Member/otherHome/'+gagaID+'" class="im-goto"></a>');
        }     
    } else {
        if (signID=="people" && gagaID!=-1) {
            $("#chatBox .im-goto").attr('href', (ctx+'/Member/otherHome/'+gagaID));
        } else {
            $("#chatBox .im-goto").attr('href', 'javascript:void(0);');
        }
    }
    $("#chatBox .modifyRemarkName").val(remarkname);

    $('#chatBoxUpper').find('.im-lel').remove();
    if (gagaID != -1 && signID == 'people') {
        $._post(ctx+'/Member/getMemberLevelById',{gagaid: gagaID}, function(res) {
            if (res.success && res.obj) {
                //console.log('用户等级', res.obj.mefiLevel);
                var levelImg = '';
                if (res.obj.mefiLevel==2) {
                    levelImg = '/images/hg.jpg';
                } else if (res.obj.mefiLevel==3) {
                    levelImg = '/images/vip-hg.jpg';
                }
                if (levelImg) {
                    $('#chatBoxUpper .upperRight').append('<img src="'+staticPath+levelImg+'" class="im-lel" />');
                }                
            }
        });
    }        


    /*-------是否已经屏蔽-----*/
    $.IM.shieldState(shield);
    /* -----------判断是人还是组--------------*/
    $.IM.clickedPeopleORgroup(signID, gagaID);
    $("#chatBox").show();
    /*-------------恢复默认状态--------------------*/
    $.IM.resetChatBoxStyles(signID,Language);
    $("#chatBox").css({
        "top": (($.IM.winH - $("#chatBox").height()) / 2),
        "left": ($.IM.winW - $("#chatBox").width()) / 2
    });

    if (gagaID == -1) {
        $("#chatBox .lowerRightBottom .normal").addClass('hide');
        $("#chatBox .lowerRightBottom .service").removeClass('hide');
    } else {
        $("#chatBox .lowerRightBottom .normal").removeClass('hide');
        $("#chatBox .lowerRightBottom .service").addClass('hide');
    }  
}

/*--------关闭-----会话框-------  */
$("#js-closedChatBox").click(function() {
    $("#chatBox").hide();
    $("#chatBox .lowerLeft").html("");
    $("#chatBox .chatContainer").remove();
    $("#peopleNum").text("0");
    $.IM.postCurrentChatPeople("closed");
});
/*------------点击-----弹窗中的人物--------*/
$(".chatBoxLower").delegate(".chatPeopleContent", "click", function() {
    var th = $(this);
    var signID = th.attr("data-signID");
    var remarkname = th.attr("data-remarkname");
    var nickName = th.attr("data-nickName");
    var gagaID = th.attr("data-gagaID");
    var shield = th.attr("data-shield");
    var Language = th.attr("data-language");
    var nickName = th.attr("data-nickName");
    var chatPeopleUl = $(".chatBoxLower .lowerLeft");

    /*--------关闭--showIM---hiddenIM---中对应gagaID的人的新消息提醒----------*/
    $.IM.closedShowMSGTip(gagaID);
    $.IM.closedHideMSGTip();
    /*---聊天弹窗中所有人都改为不是正在聊天状态---*/
    chatPeopleUl.children("li").attr("class", "chatPeopleContent");
    th.attr("class", "chatPeopleChoiced");
    if(th.children(".newsNum").hasClass("newsNumDouble")){
        th.children(".newsNum").removeClass("newsNumDouble").addClass("newsNumSingle");
    }
    th.children(".newsNum").hide().text("0");
    /* --------------聊天框顶部--修改为正在聊天人---------------*/
    $("#chatBox .chatHeadHeadIng").attr("src", th.find(".headImg").attr("src"));
    $("#chatBox .chatRemarkNameIng").attr("data-nickName", nickName).text(remarkname);
    $("#chatBox .modifyRemarkName").val(remarkname);
    if ($("#chatBox .chatHeadHeadIng").parent('.im-goto').length==0) {
        if (signID=="people" && gagaID!=-1) {
            $("#chatBox .chatHeadHeadIng").wrap('<a href="'+ctx+'/Member/otherHome/'+gagaID+'" class="im-goto"></a>');
            $("#chatBox .chatRemarkNameIng").wrap('<a href="'+ctx+'/Member/otherHome/'+gagaID+'" class="im-goto"></a>');
        }     
    } else {
        if (signID=="people" && gagaID!=-1) {
            $("#chatBox .im-goto").attr('href', (ctx+'/Member/otherHome/'+gagaID));
        } else {
            $("#chatBox .im-goto").attr('href', 'javascript:void(0);');
        }
    }


    $("#chatBox .lowerRight").children(".chatContainer").hide();
    $("#chatBox .lowerRight").children("[data-gagaID = " + gagaID + "]").show();
    $("#chatBox .lowerRight").children("[data-gagaID=" + gagaID + "]").children(".chatContent").mCustomScrollbar("scrollTo", "bottom");
    /*-------是否已经屏蔽-----*/
    $.IM.shieldState(shield);
    /*------向后台发送当前联系人-------*/
    $.IM.postCurrentChatPeople(gagaID);
    /* -----------判断是人还是组--------------*/
    $.IM.clickedPeopleORgroup(signID, gagaID);
    $("#chatBox").show();
    /*-------------恢复默认状态--------------------*/
    $.IM.resetChatBoxStyles(signID,Language);

    if (gagaID == -1) {
        $("#chatBox .lowerRightBottom .normal").addClass('hide');
        $("#chatBox .lowerRightBottom .service").removeClass('hide');
    } else {
        $("#chatBox .lowerRightBottom .normal").removeClass('hide');
        $("#chatBox .lowerRightBottom .service").addClass('hide');
    }

    $('#chatBoxUpper').find('.im-lel').remove();
    if (gagaID != -1 && signID == 'people') {
        $._post(ctx+'/Member/getMemberLevelById',{gagaid: gagaID}, function(res) {
            if (res.success && res.obj) {
                //console.log('用户等级', res.obj.mefiLevel);
                var levelImg = '';
                if (res.obj.mefiLevel==2) {
                    levelImg = '/images/hg.jpg';
                } else if (res.obj.mefiLevel==3) {
                    levelImg = '/images/vip-hg.jpg';
                }
                if (levelImg) {
                    $('#chatBoxUpper .upperRight').append('<img src="'+staticPath+levelImg+'" class="im-lel" />');
                }                
            }
        });
    }    

});
/*---------------点击关闭----对应聊天人----------*/
$(".chatBoxLower").delegate(".chatDelete", "click", function(e) {
    var th = $(this);
    $.IM.closedChatPeople(th);
    e.stopPropagation();

});
/*------------修改备注----------------*/
$(".chatBoxUpper .js-modifyBtn").click(function() {
    var th = $(this);
    th.parent().hide();
    th.prev().attr("data-remarkName", th.prev().text());
    th.parent().next().css("display", "inline-block");
    var remarkname = th.prev().attr("data-remarkname");
    th.parent().next().find(".modifyRemarkName").val(remarkname);
    $(".chatBoxUpper .modifyRemarkName").focus();
});
$(".chatBoxUpper .modifyOK").click(function() {
    var th = $(this);
    var gagaID = $(".chatBoxLower .lowerLeft").children(".chatPeopleChoiced").attr("data-gagaid");
    var RemarkName = th.parent().children(".modifyRemarkName").val();
    if(RemarkName.length < 3){
        layer.msg($.t("im.remarkNameIsTooShort"), { time: 1000}, function() {});
        return false;
    }
    $.IM.modifyRemarkName(th, gagaID, RemarkName,$.IM.isReduction);
});
/*------------输入框---------------*/
$(".chatBoxUpper .modifyRemarkName").focus(function() {
    $(this).val("");
    $.IM.isReduction="";
}).blur(function() {
    var th = $(this);
    if (th.val().trim() == "") {
        var RemarkName = th.parents(".upperRight").find(".chatRemarkNameIng").attr("data-nickname");
        th.val(RemarkName);
    }
    var signID = $(".lowerLeft .chatPeopleChoiced").attr("data-signID");
    if(signID =="group"){
        $.IM.isReduction ="true";
    }
    
});
$.IM.wordCount(".chatBoxUpper .modifyRemarkName", "", "20");
/*---------历史纪录----显示隐藏-----*/
$(".chatBoxLower").delegate(".moreNews", "click", function() {
    $(".chatBoxLower .HistoricalRecords").click();
});
$(".chatBoxLower .HistoricalRecords").click(function() {
    var signID = $(".lowerLeft .chatPeopleChoiced").attr("data-signID");
    var remarkName = $(".lowerLeft .chatPeopleChoiced").attr("data-remarkName");
    if (signID == "people") {
        $(".upperRight").width(990);
        $("#chatBox").width(1110).show();
    } else {
        $(".upperRight").width(1110);
        $("#chatBox").width(1230).show();
    }
    $(".chatBoxLower .chatHistorical").show();
    $(".chatBoxLower .HistoricalRecords").css("display","none");;
    $(".chatBoxLower .HistoricalRecordsClosed").css("display","block");

    var gagaID = $(".lowerLeft").children(".chatPeopleChoiced").attr("data-gagaID");
    $.IM.signID = signID;
    $.IM.remarkName = remarkName;
    $.IM.ajxaHistorical(gagaID, $.IM.currentpage);
});
$(".chatBoxLower .HistoricalRecordsClosed").click(function() {
    $.IM.currentpage = 1;
    $.IM.PageCount = 0;
    var signID = $(".lowerLeft .chatPeopleChoiced").attr("data-signID");
    if (signID == "people") {
        $(".upperRight").width(608);
        $("#chatBox").width(730).show();
    } else {
        $(".upperRight").width(729);
        $("#chatBox").width(850).show();
    }
    $(".chatBoxLower .chatHistorical").hide();
    $(".chatBoxLower .HistoricalRecordsClosed").css("display","none");
    $(".chatBoxLower .HistoricalRecords").css("display","block");

});
$(".chatHistorical .historicalClosed").click(function() {
    $(".chatBoxLower .HistoricalRecordsClosed").click();
});

/*----------------历史纪录翻页------------------*/
$(".historicalFun .firstPage").click(function() {
    $.IM.currentpage = $.IM.PageCount;
    var gagaID = $(".lowerLeft").children(".chatPeopleChoiced").attr("data-gagaID");
    $.IM.ajxaHistorical(gagaID, $.IM.currentpage);
});
$(".historicalFun .previousPage").click(function() {
    if ($.IM.currentpage < $.IM.PageCount) {
        $.IM.currentpage++;
    } else {
        $.IM.currentpage = $.IM.PageCount;
    }
    var gagaID = $(".lowerLeft").children(".chatPeopleChoiced").attr("data-gagaID");
    $.IM.ajxaHistorical(gagaID, $.IM.currentpage);
});
$(".historicalFun .nextPage").click(function() {
    if ($.IM.currentpage > 1) {
        $.IM.currentpage--;
    } else {
        $.IM.currentpage = 1;
    };
    var gagaID = $(".lowerLeft").children(".chatPeopleChoiced").attr("data-gagaID");
    $.IM.ajxaHistorical(gagaID, $.IM.currentpage);
});
$(".historicalFun .lastPage").click(function() {
    $.IM.currentpage = 1;
    var gagaID = $(".lowerLeft").children(".chatPeopleChoiced").attr("data-gagaID");
    $.IM.ajxaHistorical(gagaID, $.IM.currentpage);
});

/*-------------清除历史纪录--------------*/
$(".chatHistorical .historicalDelete").click(function() {
    var contentTip = '<div class="textCenter marT5">' + $.t("im.sureClear") + '</div>';
    layer.open({
        type: 0,
        title: false,
        content: contentTip,
        btn: [$.t("global.ok"), $.t("global.cancel")],
        yes: function(index, layero) {
            var gagaID = $(".lowerLeft").children(".chatPeopleChoiced").attr("data-gagaID");
            $.IM.historicalDeleteFun(gagaID);
            layer.close(index);
        },
        cancel: function(index) {

        }
    });
});


/*------------输入框---------------*/
$(".chatBoxLower .inputBox").focus(function() {
    $(".FunBtncontainer .sendBtn").css({
        "color": "#fff",
        "background-color": "#2D57A1"
    });
    var th = $(this);
    th.css("color", "#333");
    if (th.val() == $.t("im.enterKeySend")) {
        th.val("");
    }
}).blur(function() {
    var th = $(this);
    if (th.val() == $.t("im.enterKeySend") || th.val().trim() == "") {
        th.val($.t("im.enterKeySend")).css("color", "#999");
        $(".FunBtncontainer .sendBtn").css({
            "color": "#696969",
            "background-color": "#fff"
        });
    }
});
/* -------------语言选择-------------------*/
$(".FunBtncontainer .languageSpan").click(function(e) {
    $(this).parent().children(".languageUl").toggle();
    if ($(this).find(".Triangle").css("background-position-x") == "-273px") {
        $(this).find(".Triangle").css("background-position", "-240px -50px");
    } else {
        $(this).find(".Triangle").css("background-position", "-273px -50px");
    }
    e.stopPropagation();
    $(document).click(function() {
        $(".FunBtncontainer .languageUl").hide();
        $(".FunBtncontainer .languageSpan .Triangle").css("background-position", "-240px -50px");
    });
});
$(".FunBtncontainer .langLi").click(function() {
    $(this).parent().hide();
    $(this).parents(".languageOptions").find(".language").attr("langs-lang", $(this).attr("langs-lang")).text($(this).text());
    $(this).parents(".languageOptions").find(".Triangle").css("background-position", "-240px -50px");
});
/*-------------qq表情------------------*/
$('.normal .FunBtncontainer .qqFaceBtn').qqFace({
    id: 'facebox',
    assign: 'inputBox',
    path: staticCtx + 'img/qqFace/' //表情存放的路径
});
$('.service .FunBtncontainer .qqFaceBtn').qqFace({
    id: 'facebox',
    assign: 'inputBox1',
    path: staticCtx + 'img/qqFace/' //表情存放的路径
});

$(".lowerRightBottom .inputBox").keydown(function(e) {
    var $thisP = $(this).parent('.sendContentCon');
    if (e.keyCode == "13" /*&& $.IM.isSendComplate*/) { //keyCode=13是回车键 
        sendFun($thisP.next(".FunBtncontainer").find('.sendBtn'));
        e.preventDefault();
    }
});
$(".FunBtncontainer .sendBtn").click(function() {
    sendFun($(this));
});
$('.normal .FunBtncontainer .giftBtn').click(function() {
    var gagaID = $('#chatBox .lowerLeft .chatPeopleChoiced').attr("data-gagaid");
    openGiftList(gagaID);
});

function sendFun(obj) {
    var thFun = $(obj).closest('.FunBtncontainer');
    var th = $(obj).closest('.FunBtncontainer').prev().find('.inputBox');
    var inputBoxVal = th.val();
    var inputBoxContent = inputBoxVal;
    var gagaID = $(".lowerLeft .chatPeopleChoiced").attr("data-gagaid");
    var signId = $(".lowerLeft .chatPeopleChoiced").attr("data-signid");
    var imgUrl = $(".lowerRight ").children("[data-gagaID = " + gagaID + "]").find(".upLoadImg").attr("src");
    var imgING = $(".lowerRight ").children("[data-gagaID = " + gagaID + "]").find(".upLoadImgState").hasClass("imgING");
    var date = new Date();
    var wordsId = date.getTime();
    var targetLan = "";
    if (((inputBoxVal == $.t("im.enterKeySend") || inputBoxVal.trim() == "") && (!imgUrl)) || imgING) {
        th.val($.t("im.enterKeySend")).css("color", "#999");
        layer.msg($.t("im.NoSendEmpty"), {
            time: 2000
        }, function() {});
    } else {
        if($.IM.deleteQQFace(inputBoxVal).length > 5000){
            layer.msg($.t("im.strUpLimit"), {time: 2000}, function () { });
            return false;
        }
        if (inputBoxVal == $.t("im.enterKeySend") || $.IM.deleteQQFace(inputBoxVal).trim() == "") {
            targetLan = "";
        } else {
            targetLan = thFun.find(".js-receiveOptions .language").attr("langs-lang");
        }
        if (inputBoxVal == $.t("im.enterKeySend")) {
            inputBoxVal = "";
        }
        if (targetLan) {
            $.IM.deductMoney(gagaID, inputBoxVal, inputBoxContent, imgUrl, targetLan, signId);
        } else {
            $.IM.SendMessage(gagaID, inputBoxVal, inputBoxContent, imgUrl, targetLan, signId);
        }



    }
}



/*---------点击翻译按钮-----------*/
$(".lowerRight").delegate(".translateBtn", "click", function(e) {
    $(".lanChoice").hide();
    
    var th = $(this);
    if (th.next(".lanChoice").css("display") == "block") {
        th.next(".lanChoice").css("display", "none");
    } else {
        th.next(".lanChoice").css("display", "block");
    }
    var $msgContent = th.parents(".msgContent");
    var TXTwidth = $msgContent.width();
    if (th.parents(".msgContent").hasClass("sendContainer")) {
        if (TXTwidth > 250) {
            $msgContent.find(".lanUl").css("left", "-7px");
        } else {
            $msgContent.find(".lanUl").css("right", "-15px");
        };
    } else {
        if (TXTwidth > 250) {
            $msgContent.find(".lanUl").css("right", "-15px");
        } else {
            $msgContent.find(".lanUl").css("left", "-7px");
        };
    }
    e.stopPropagation();
    $(document).click(function() {
        $("#chatBox .lanChoice").hide();
    });
});
$(".lowerRight").delegate(".chatContainer .lanUl li", "click", function() {
    var th = $(this);
    th.parents(".lanChoice").hide();
    var gagaID = th.parents(".chatContainer").attr("data-gagaid");
    var MSGsendID = th.parents("[data-MSGsendID]").attr("data-MSGsendID");
    var ranID = th.parents("[data-ranid]").attr("data-ranid");
    var language = th.attr("langs-lang");
    var content = '';
    if (th.parents(".msgContent").find('.redPacket-main').length > 0) {
        content = th.parents(".msgContent").children(".redPacket-main").attr('data-msg') || '';
    } else {
        content = th.parents(".msgContent").children(".originalLan").text();
    }    
    var signID = $(".lowerLeft .chatPeopleChoiced").attr("data-signID");
    if(signID =="people"){
        MSGsendID ="";
    }
    
    $.IM.SendAfterTranslationDeductMoney(gagaID,MSGsendID, ranID, content, language, th);
});



/*------------------群-加好友---------------------*/
$(".chatUpperBtn .inviteFriends").click(function() {
    //$(".createGroupBtn").click();
    $("#PopupCreateGroup").attr("data-CreateGroup", "false");
    $("#PopupCreateGroup .CreateGroupTitle").html($.t("im.inviteFriends"));
    $("#PopupCreateGroup .CreateGroupRight span").hide();
    $.IM.originalGroupsMember = [];
    $("#GroupMembScrollBar .GroupMembContainer .GroupMembContent").each(function() {
        var gagaID = $(this).attr("data-gagaID");
        $.IM.originalGroupsMember.push("" + gagaID);
    });

    $.IM.createGroupAndaddFriends();
});

/*------------------点击建群----------------------*/
$("#js-createGroup").click(function() {
    $("#PopupCreateGroup").attr("data-CreateGroup", "true");
    $("#PopupCreateGroup .CreateGroupTitle").html($.t("im.createGroup"));
    $("#PopupCreateGroup .CreateGroupRight span").show();
    $.IM.originalGroupsMember = [];
    $.IM.createGroupAndaddFriends();
});
$(".createGroupBtn").click(function() {
    $("#PopupCreateGroup").attr("data-CreateGroup", "true");
    $("#PopupCreateGroup .CreateGroupTitle").html($.t("im.createGroup"));
    $("#PopupCreateGroup .CreateGroupRight span").show();
    $.IM.originalGroupsMember = [];
    $.IM.createGroupAndaddFriends();
});


$(".CreateGroupLeftScrollBar").delegate(".FoldTitle", "click", function() {
    var th = $(this);
    if (th.hasClass("openTitle")) {
        th.removeClass("openTitle");
        th.children(".CreateGroupFoldingBtn").css("background-position", "-342px -50px");
        th.parent().children(".FoldContainer").css("display", "none");
    } else {
        th.addClass("openTitle");
        th.children(".CreateGroupFoldingBtn").css("background-position", "-308px -50px");
        th.parent().children(".FoldContainer").css("display", "block");
    };
});
$("#CreateGroupSearchResults").delegate(".FoldTitle", "click", function() {
    var th = $(this);
    if (th.hasClass("openTitle")) {
        th.removeClass("openTitle");
        th.children(".js-foldingBtn").css("background-position", "-342px -50px");
        th.parent().children(".FoldContainer").css("display", "none");
    } else {
        th.addClass("openTitle");
        th.children(".js-foldingBtn").css("background-position", "-308px -50px");
        th.parent().children(".FoldContainer").css("display", "block");
    }
});

/*------搜索框---搜索事件------*/
$("#PopupCreateGroup .searchInput").focus(function() {
    $(this).val("");
}).blur(function() {
    var th = $(this);
    if (th.val() == $.t("im.searchContacts") || th.val().trim() == "") {
        th.val($.t("im.searchContacts")).css("color", "#999");
    };
});
$("#PopupCreateGroup .searchBtn").click(function() {
    var searchTXT = $("#PopupCreateGroup .searchInput").val().trim();
    if (searchTXT == "") {
        return;
    }

    $("#PopupCreateGroup .SearchBtn").hide();
    $("#PopupCreateGroup .searchCloseBtn").show();
    $(".CreateGroupLeftScrollBar").hide();
    $("#CreateGroupSearchResults").show();
    $("#CreateGroupRecentlySearch").hide();
    $("#CreateGroupRecentlySearch .FoldContainer").html("");
    $("#CreateGroupFriendSearch").hide();
    $("#CreateGroupFriendSearch .FoldContainer").html("");
    $("#CreateGroupSearchResults .searchResultNothing").hide();

    $("#cacheDiv").html("");

    $("#cacheDiv").html($("#PopupCreateGroup .CreateGroupLeftCon").html());
    $("#cacheDiv .CreateGroupContent").each(function() {
        var th = $(this);
        var txt = th.children(".CreateGroupRemarkName").text();
        if (txt.indexOf(searchTXT) > -1) {
            /*reg=reg.replace(/个/g,"人数");*/
            txt = txt.replace(searchTXT, "<span class='c-FF8A00'>" + searchTXT + "</span>");
            th.children(".CreateGroupRemarkName").html(txt);

            if (th.parent().hasClass("CreateGroupRecentlyContainer")) {
                $("#CreateGroupRecentlySearch").children(".FoldContainer").append(th);
                $("#CreateGroupRecentlySearch").show();
            } else if (th.parent().hasClass("CreateGroupFriendContainer")) {
                $("#CreateGroupFriendSearch").children(".FoldContainer").append(th);
                $("#CreateGroupFriendSearch").show();
            }
        }
    });
    if (!$("#CreateGroupRecentlySearch .FoldContainer").html() && !$("#CreateGroupFriendSearch .FoldContainer").html()) {
        $("#CreateGroupSearchResults .searchResultNothing").show();
    }
    $("#CreateGroupSearchResults").mCustomScrollbar("update");
    $("#CreateGroupSearchResults").mCustomScrollbar("scrollTo", "top");
});
$("#PopupCreateGroup .searchCloseBtn").click(function() {
    $("#PopupCreateGroup .searchInput").val($.t("im.searchContacts"));
    $("#PopupCreateGroup .searchBtn").show();
    $("#PopupCreateGroup .searchCloseBtn").hide();
    $(".CreateGroupLeftScrollBar").show();
    $("#CreateGroupSearchResults").hide();
    $("#cacheDiv").html("");
});
/*---------向组添加成员---------*/
$(".CreateGroupLeft").delegate(".CreateGroupContent", "click", function() {
    var th = $(this);
    var gagaID = th.attr("data-gagaID");
    var remarkname = th.attr("data-remarkname");
    var PeopleNum = $(".CreateGroupRight .PeopleNum").text();
    var creategroup = th.parents("#PopupCreateGroup").attr("data-createGroup");
    if (gagaID == "-1") {
        return false;
    }



    if (creategroup == "false") {
        if ($.IM.originalGroupsMember.length + $.IM.inviteFriendsMember.length < 50) {
            if (($.inArray(gagaID, $.IM.originalGroupsMember) == -1) && ($.inArray(gagaID, $.IM.inviteFriendsMember) == -1)) {
                var Li = '<li class="CreateGroupContent"  data-gagaID="' + gagaID + '" data-remarkname="' + remarkname + '">' +
                    '<div class="CreateGroupHead">' +
                    '<img class="CreateGroupHeadImg" src="' + th.find(".CreateGroupHeadImg").attr("src") + '">' +
                    '<img class="CreateGroupHeadLine" style="display:' + th.find(".CreateGroupHeadLine").css("display") + '" src="' + staticCtx+ 'img/On-line.png"></div>' +
                    '<span class="CreateGroupRemarkName">' + remarkname + '</span><i class="SelectedPeopleDelete"></i></li>';
                $(".CreateGroupRight .SelectedPeople").append(Li);
                $.IM.inviteFriendsMember.push("" + gagaID);
            }

        } else {
            layer.msg($.t("im.memberReachUpLimit"), {
                time: 2000
            }, function() {});
        }
    } else {
        if (PeopleNum < 50) {
            if ($.inArray(gagaID, $.IM.createGroupsMember) == -1) {
                PeopleNum++;
                $(".CreateGroupRight .PeopleNum").text(PeopleNum);
                var Li = '<li class="CreateGroupContent"  data-gagaID="' + gagaID + '" data-remarkname="' + remarkname + '">' +
                    '<div class="CreateGroupHead">' +
                    '<img class="CreateGroupHeadImg" src="' + th.find(".CreateGroupHeadImg").attr("src") + '">' +
                    '<img class="CreateGroupHeadLine" style="display:' + th.find(".CreateGroupHeadLine").css("display") + '" src="' + th.find(".CreateGroupHeadLine").attr("src") + '"></div>' +
                    '<span class="CreateGroupRemarkName">' + remarkname + '</span><i class="SelectedPeopleDelete"></i></li>';
                $(".CreateGroupRight .SelectedPeople").append(Li);
                $.IM.createGroupsMember.push("" + gagaID);
            }
        } else {
            layer.msg($.t("im.memberReachUpLimit"), {
                time: 2000
            }, function() {});
        }
    }
});
$(".CreateGroupRight").delegate(".SelectedPeopleDelete", "click", function() {
    var gagaID = $(this).parent().attr("data-gagaid");
    var remarkname = $(this).parent().attr("data-remarkname");

    var PeopleNum = $(".CreateGroupRight .PeopleNum").text();
    PeopleNum--;
    $(".CreateGroupRight .PeopleNum").text(PeopleNum);

    var creategroup = $(this).parents("#PopupCreateGroup").attr("data-creategroup");
    if (creategroup == "true") {
        $.IM.createGroupsMember.splice($.inArray(gagaID, $.IM.createGroupsMember), 1);
    } else {
        $.IM.inviteFriendsMember.splice($.inArray(gagaID, $.IM.inviteFriendsMember), 1);
    }
    $(this).parent().remove();
});
$("#PopupCreateGroup .CreateGroupCncel").click(function() {
    var PopupCreateGroup = $("#PopupCreateGroup");
    PopupCreateGroup.hide();
    $.IM.RestoreDefaultsCreateGroup();
    $.IM.createGroupsMember = [];
    $.IM.inviteFriendsMember = [];
    $.IM.originalGroupsMember = [];

});
$("#PopupCreateGroup .CreateGroupOK").click(function() {
    var PopupCreateGroup = $("#PopupCreateGroup");
    var GroupsMemberNames = "";
    PopupCreateGroup.hide();
    $.IM.RestoreDefaultsCreateGroup();

    var creategroup = $(this).parents("#PopupCreateGroup").attr("data-createGroup");
    if (creategroup == "false") {
        GroupsMemberNames = $.IM.inviteFriendsMember.join(",");
        var gagaID = $(".lowerLeft").children(".chatPeopleChoiced").attr("data-gagaid");
        $.IM.invitationFriends(gagaID, GroupsMemberNames);
    } else {
        GroupsMemberNames = $.IM.createGroupsMember.join(",");
        $.IM.createGrounp(GroupsMemberNames, function() {
            IMclickPeople($('#js-groupScrollBar .showContent:last'));
        });        
    }
    $.IM.inviteFriendsMember = [];
    $.IM.originalGroupsMember = [];
    $.IM.createGroupsMember = [];

});



/*--------------------滚动条---------------------*/
$(".chatContent").mCustomScrollbar({});
$(".historicalContainer").mCustomScrollbar({});
$(".CreateGroupLeftScrollBar").mCustomScrollbar({});
$(".CreateGroupRightScrollBar").mCustomScrollbar({});
$("#js-searchResultsGroup").mCustomScrollbar({});
$("#CreateGroupSearchResults").mCustomScrollbar({});



/*--------------删除好友----------------*/
$("#chatBox .functionRelationState").click(function() {
    var th = $(".chatBoxLower .lowerLeft").children(".chatPeopleChoiced").find(".chatDelete");
    var gagaID = $(".chatBoxLower .lowerLeft").children(".chatPeopleChoiced").attr("data-gagaid");
    layer.open({
        title: $.t("im.deleteFriends"),
        maxWidth: 650,
        content: "<div class='textCenter marT5'>" + $.t("im.sureDeleteFriends") + "</div>",
        /*skin: 'noTitleTips',*/
        success: function(layero, index) {},
        btn: [$.t("global.ok"), $.t("global.cancel")],
        yes: function(index, layero) {
            $.IM.deleteFriends(gagaID, th);
            layer.close(index);
        },
        cancel: function(index) {
            layer.close(index);
        }
    });
});
/*-------------屏蔽--------------*/
$("#chatBox .functionShieldState").click(function() {
    var th = $(this);
    var gagaID = $(".chatBoxLower .lowerLeft").children(".chatPeopleChoiced").attr("data-gagaid");
    var shield = $(this).attr("data-shield");
    $.IM.ShieldFun(gagaID, shield, th);
});

//------------退群-------------------------
$("#chatBox .functionBack").click(function() {
    var th = $(".chatBoxLower .lowerLeft").children(".chatPeopleChoiced").find(".chatDelete");
    var gagaID = $(".chatBoxLower .lowerLeft").children(".chatPeopleChoiced").attr("data-gagaid");
    var remarkName = $(".chatBoxLower .lowerLeft").children(".chatPeopleChoiced").attr("data-remarkname");

    layer.open({
        title: $.t("im.backGroup"),
        maxWidth: 650,
        content: "<div class='textCenter marT5'>" + $.t("im.surebackGroup") + "</div>",
        /*skin: 'noTitleTips',*/
        success: function(layero, index) {},
        btn: [$.t("global.ok"), $.t("global.cancel")],
        yes: function(index, layero) {
            $.IM.backGroup(gagaID, th, remarkName);
            layer.close(index);
        },
        cancel: function(index) {
            layer.close(index);
        }
    });
});


/*----------------举报-------------*/
$(".chatBoxUpper .functionReport").click(function() {
    var ReportPopupDIV = '<ul class="ReportPopupUl"><li><label class="Reportchoiced"><i></i>' + $.t("global.junkAd") + '</label></li><li><label class="Reportchoiced"><i></i>' + $.t("global.obscene") + '</label></li><li><label class="Reportchoiced"><i></i>' + $.t("global.falseWin") + '</label></li><li><label class="Reportchoiced"><i></i>' + $.t("global.SensitiveInfor") + '</label></li><li><label class="Reportchoiced"><i></i>' + $.t("global.PersonalAttack") + '</label></li><li><label class="Reportchoiced"><i></i>' + $.t("global.HarassOthers") + '</label></li><div class="cleard"></div></ul>';
    var gagaID = $(".chatBoxLower .lowerLeft").children(".chatPeopleChoiced").attr("data-gagaid");
    var signID = $(".chatBoxLower .lowerLeft").children(".chatPeopleChoiced").attr("data-signID");

    var TXT = "";
    layer.open({
        title: $.t("global.report"),
        maxWidth: 650,
        type:1,
        content: ReportPopupDIV,
        skin: 'ReportPopup',
        success: function(layero, index) {
            $(".ReportPopup .Reportchoiced").click(function() {
                $(".ReportPopup .Reportchoiced").each(function() {
                    $(this).children("i").css("background-position", "-407px -81px");
                });
                TXT = $(this).text();
                $(this).children("i").css("background-position", "-373px -81px");
            });
        },
        btn: [$.t("global.submit")],
        yes: function(index, layero) {

            if (TXT == "") {
                layer.msg($.t("global.noReportContent"), {
                    time: 2000
                }, function() {});
            } else {
                $.IM.reportFun(gagaID, TXT, signID);
                layer.close(index);
            }



        }
    });
});
/*-------------------删除图片-------------------------------*/
$("#chatBox .lowerRight").delegate(".upLoadImgDelete", "click", function() {
    var th = $(this);
    th.parents(".upLoadImgContainer").hide();
    th.parents(".upLoadImgContainer").children(".upLoadContnet");
    th.parents(".upLoadImgContainer").find(".upLoadImg").attr("src", "");
});


/*------------------对话框拖动--------------------*/
if (Zoneyet.Global.device === "mobile") {
    $.IM.mobileDragEvent("chatBoxUpper", "chatBox");
    $.IM.mobileDragEvent("CreateGroupTitle", "PopupCreateGroup");
} else {
    $.IM.dragEvent(".chatBoxUpper", "#chatBox");
    $.IM.dragEvent(".CreateGroupTitle", "#PopupCreateGroup");
    $.IM.dragEvent("#IMgagaService", "#IMgagaService");
    
    
}
/*-----------------大图预览----------------------*/
$(".lowerRight").delegate(".bigImgBtn img", "click", function() {
    $.IM.bigImgPreview(this);
});
$(".historicalCon").delegate(".bigImgBtn img", "click", function() {
    $.IM.bigImgPreview(this);
});
$.IM.txtTipsFun($("#chatBox .FunBtnUl li:not('.sendBtn')"));

/*----------------发红包-------------*/
$("#chatBox .redBtn").click(function() {
    $.IM.getMoneyNum();
    var RedEnvelopeTC;
    layer.open({
        title: $.t("Letter.redPackage")+$("#RedExplain").html(),
        area: '475px',
        content: $("#RedEnvelopeTCCon").html(),
        skin: 'RedEnvelopeTC',
        success: function(layero, index) {
            RedEnvelopeTC = $(".RedEnvelopeTC");
            RedEnvelopeTC.find(".moneyNum").text($.IM.myMoneyNum);
            $.IM.wordCount(".RedEnvelopeTC .textMSG", ".RedEnvelopeTC  .wordsNum", "500");
            $(".RedEnvelopeTC .moneyTXT").focus(function() {
                var th = $(this);
                th.css({
                    "color": "#333",
                    "border-color": "#999"
                });
                $(".RedEnvelopeTC").find(".tips").css("visibility", "hidden");

                if (th.val() == $.t("Letter.inputGold1TO200")) {
                    th.val("");
                }
            }).blur(function() {
                var th = $(this);
                if (th.val() == $.t("Letter.inputGold1TO200") || th.val().trim() == "") {
                    th.val($.t("Letter.inputGold1TO200")).css("color", "#999");
                }
            });
            $(".RedEnvelopeTC .textMSG").focus(function() {
                var th = $(this);
                th.css("color", "#333");
                if (th.val() == $.t("Letter.blessWord")) {
                    th.val("");
                }
            }).blur(function() {
                var th = $(this);
                if (th.val() == $.t("Letter.blessWord") || th.val().trim() == "") {
                    th.val($.t("Letter.blessWord")).css("color", "#999");
                }
            });
            /*---------红包说明---------*/
            $(".RedEnvelopeTC .layui-layer-title .RemindIcon").hover(function(){
                //$(this).next(".RemindContent").css({"z-index":"1","white-space":"normal","line-height":"22px","left":"95px","top":"0px","padding-top":"0px"})
                $(this).next(".RemindContent").show();
                
            },function(){
                $(this).next(".RemindContent").hide();
            })


        },
        btn: [$.t("Letter.sendRedPackage")],
        yes: function(index, layero) {
            var RedEnvelopeTC = $(".RedEnvelopeTC");
            var content = ""
            var gagaID = $('#chatBox .lowerLeft .chatPeopleChoiced').attr("data-gagaid");
            var moneyVal = RedEnvelopeTC.find(".moneyTXT").val();
            var textMSG = RedEnvelopeTC.find(".textMSG").val();
            if (textMSG == $.t("Letter.blessWord")) {
                content = "";
            } else {
                content = textMSG;
            }
            if (moneyVal < 1 || moneyVal == $.t("Letter.inputGold1TO200")) {
                $(".RedEnvelopeTC .tips").text($.t("Letter.inputGoldNum")).css("visibility", "visible");
                $(".RedEnvelopeTC .moneyTXT").css("border-color", "#f47726");
                return false;
            } else if (moneyVal > 200) {
                $(".RedEnvelopeTC .tips").text($.t("Letter.inputGold1TO200")).css("visibility", "visible");
                $(".RedEnvelopeTC .moneyTXT").css("border-color", "#f47726");
                return false;
            } else if (moneyVal > $.IM.myMoneyNum) {
                $(".RedEnvelopeTC .tips").text($.t("Letter.redGoldLackRechargeSend")).css("visibility", "visible");
                $(".RedEnvelopeTC .moneyTXT").css("border-color", "#f47726");
                return false;
            }

            $.IM.SendRedPackets(gagaID, moneyVal, content, "", "", "");

            layer.close(index);
        }
    });
});
/*-------------查看红包----------*/
$(".chatHistorical").delegate(".historicalRedPocket.send", "click", function() {
    var th = $(this);
    $.IM.checkRedEnvelopeClick(th);
});
$(".lowerRight").delegate(".sendMessage .redPacket-main", "click", function() {
    var th = $(this);
    $.IM.checkRedEnvelopeClick(th);
});
/*---------打开红包-------*/
$(".chatHistorical").delegate(".historicalRedPocket.receive", "click", function() {
    var th = $(this);
    var ContactsUl = $('.lowerLeft .chatPeopleChoiced');
    $.IM.openRedEnvelopeClick(th, ContactsUl, "historyCon");
});
$(".lowerRight").delegate(".receiveMessage .redPacket-main", "click", function() {
    var th = $(this);
    var ContactsUl = $('.lowerLeft .chatPeopleChoiced');
    $.IM.openRedEnvelopeClick(th, ContactsUl, "chatCon");
});

/*---------关闭打开的红包-------*/
$(".RedEnvelopeOpen .RedEnvelopeOpenCloseBtn").click(function() {
    var RedEnvelopeOpen = $(".RedEnvelopeOpen");

    RedEnvelopeOpen.find(".RedEnvelopeExplain").text("");
    RedEnvelopeOpen.find(".getRedEnvelopeBtn").show();
    RedEnvelopeOpen.hide();
});

