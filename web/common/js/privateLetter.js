$.Letter.init();
/*-----刷新时向后台发请求------*/

$(".leftCon .initLoading").partialLoader();
$(".LetterchatContainer .rightCon").partialLoader();
$.IM.txtTipsFun("#chatConBottom .funBtnUl li:not('.sendBtn')");

var ContactsUl = $(".LetterchatContainer .leftCon .ContactsUl");
$("#allContactsGroup").mCustomScrollbar({});
$("#onlineContactsGroup").mCustomScrollbar({});
$("#searchResultGroup").mCustomScrollbar({});
$("#chatTop .more").mouseover(function() {
    $("#chatTop .LetterfunctionMore").show();
}).mouseout(function() {
    $("#chatTop .LetterfunctionMore").hide();
});
$("#chatTop .LetterfunctionMore").mouseover(function() {
    $(this).show();
}).mouseout(function() {
    $(this).hide();
});
/*---------切换选项卡---------*/
$(".tabCon .contacts").click(function() {
    var th = $(this);
    th.parent().children(".activeTitle").removeClass("activeTitle");
    th.addClass("activeTitle");
    if (th.hasClass("allContacts")) {
        $("#allContactsGroup").show();
        $("#onlineContactsGroup").hide();
    } else {
        $("#allContactsGroup").hide();
        $("#onlineContactsGroup").show();
    }
    $("#searchResultGroup").hide();
    $("#searchResultGroup .noContacts").hide();
    $("#searchResultGroup").find(".ContactsUl").html("");
    $("#searchResultGroup").find(".ContactsUl").hide();
    $("#cacheDiv").html("");
    $("#LettersearchInput").val($.t("im.searchContacts"));
    $("#searchBtn").show();
    $("#searchCloseBtn").hide();

});
/*------搜索框---搜索事件------*/
$("#LettersearchInput").focus(function() {
    $(this).val("");
}).blur(function() {
    if ($(this).val().trim() == "") {
        $(this).val($.t("im.searchContacts"));
    }
});
$("#searchBtn").click(function() {
    var searchTXT = $("#LettersearchInput").val().trim();
    if (searchTXT == "" || searchTXT == $.t("im.searchContacts")) {
        return;
    }
    $(this).hide();
    $("#searchCloseBtn").show();
    $("#allContactsGroup").hide();
    $("#onlineContactsGroup").hide();
    $("#searchResultGroup").show();

    if ($(".tabCon .allContacts").hasClass("activeTitle")) {
        $("#cacheDiv").html($("#allContactsGroup .allContactsUl").html());
    } else {
        $("#cacheDiv").html($("#onlineContactsGroup .onlineContactsUl").html());
    }

    $("#cacheDiv").children(".contactsPeopleContent").each(function() {
        var txt = $(this).attr("data-nickname");
        if (txt.indexOf(searchTXT) > -1) {
            txt = txt.replace(searchTXT, "<span class='c-FF8A00'>" + searchTXT + "</span>");
            $(this).find(".contactsNickName").html(txt);
            $("#searchResultGroup .searchResultUl").append($(this));
        }
    });
    if ($("#searchResultGroup .searchResultUl").html()) {
        $("#searchResultGroup .searchResultUl").show();
        $("#searchResultGroup").mCustomScrollbar("update");
        $("#searchResultGroup").mCustomScrollbar("scrollTo", "top");
    } else {
        $("#searchResultGroup .noContacts").show();
    }
});
$("#searchCloseBtn").click(function() {
    if ($("#searchResultGroup .ContactsUl .activeContacts").html()) {
        var gagaID = $("#searchResultGroup .ContactsUl .activeContacts").attr("data-gagaID");
        $("#allContactsGroup .ContactsUl").children("[data-gagaID=" + gagaID + "]").addClass("activeContacts");
    }


    $("#LettersearchInput").val($.t("im.searchContacts"));
    $(this).hide();
    $("#searchBtn").show();
    if ($(".tabCon .allContacts").hasClass("activeTitle")) {
        $("#allContactsGroup").show();
        $("#onlineContactsGroup").hide();
    } else {
        $("#allContactsGroup").hide();
        $("#onlineContactsGroup").show();
    }
    $("#searchResultGroup").hide();
    $("#searchResultGroup .noContacts").hide();
    $("#searchResultGroup .searchResultUl").hide();
    $("#searchResultGroup .searchResultUl").html("");
    $("#cacheDiv").html("");
});

/*---------------点击关闭----对应聊天人----------*/
ContactsUl.delegate(".LetterchatDelete", "click", function(e) {
    var th = $(this);
    var count = th.parent("li").index();
    var chatPeopleNum = th.parents(".ContactsUl").children(".contactsPeopleContent").length;
    var allContactsUl = $(".LetterchatContainer .leftCon .allContactsUl");
    var totalPeopleNum = $(".LetterchatContainer .leftCon .allContactsUl").children(".contactsPeopleContent").length;
    var DeletegagaID = th.parent("li").attr("data-gagaid");
    var chatMiddle = $("#chatMiddle");



    var contentTip = '<div class="textCenter marT5">' + $.t("Letter.deleteContacts") + '</div>';
    layer.open({
        title: false,
        content: contentTip,
        skin: 'noTitleTips',
        btn: [$.t("global.ok"), $.t("global.cancel")],
        yes: function(index, layero) {
            $.Letter.DeleteContacts(DeletegagaID, th, count, chatPeopleNum, chatPeopleNum, allContactsUl, totalPeopleNum, chatMiddle, ContactsUl);
            layer.close(index);
        },
        cancel: function(index) {
            layer.close(index);
        },
    });
    e.stopPropagation();

});
/*私信置顶*/
ContactsUl.delegate(".letterIsStick", "click", function(e) {
    var th = $(this);
    var $letterItem = $(th.closest('.contactsPeopleContent'));
    $.Letter.stickUser($letterItem);
    e.stopPropagation();
});
$(".LetterchatContainer .leftCon").delegate(".contactsPeopleContent", "click", function() {
	
    var th = $(this);
    var gagaID = th.attr("data-gagaid");
    var nickName = th.attr("data-nickname");
    var shield = th.attr("data-shield");
    var online = th.attr("data-online");
    var language = th.attr("data-language");
    var country = th.attr("data-country");
    var age = th.attr("data-age");
    var friend = th.attr("data-friend");
    var chatMiddle = $("#chatMiddle");
    var lastGagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
    ContactsUl.children(".contactsPeopleContent").removeClass("activeContacts");
    th.addClass("activeContacts");
    /*---- 判断新选择的聊天人是否在聊天列表中----------------*/

    if (chatMiddle.children("[data-gagaID = " + gagaID + "]").html()) {
        if (lastGagaID != gagaID) {
            chatMiddle.children("[data-gagaID = " + lastGagaID + "]").hide();
            chatMiddle.children("[data-gagaID = " + gagaID + "]").show();
            chatMiddle.children("[data-gagaID = " + gagaID + "]").find(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
        }
    } else {
    	
        chatMiddle.children("[data-gagaID = " + lastGagaID + "]").hide();
        $.Letter.createChatMiddle(th, chatMiddle);
        $.Letter.ajxaLateHistorical(gagaID);
    }
    $.Letter.postCurrentChatPeople(gagaID);
    $.Letter.clearUnreadNum(gagaID);
    /*-------------恢复默认状态--------------------*/
    $.Letter.switchChatTop(th, chatMiddle);
    $.Letter.resetchatConBottomStyles(language);

});
/*------------输入框---------------*/
$("#chatConBottom .sendContent").focus(function() {
    $("#chatConBottom .sendBtn").css({
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
    }

});
$.IM.wordCount("#sendContent", "#chatConBottom  .characterNum", "500");
/* -------------语言选择-------------------*/
$("#chatConBottom .langBtn").click(function(e) {
    $(this).parent().children(".languageUl").toggle();
    if ($(this).children(".Triangle").css("background-position-x") == "-273px") {
        $(this).children(".Triangle").css("background-position", "-240px -50px");
    } else {
        $(this).children(".Triangle").css("background-position", "-273px -50px");
    }
    e.stopPropagation();
    $(document).click(function() {
        $("#chatConBottom .languageUl").hide();
        $("#chatConBottom .langBtn .Triangle").css("background-position", "-240px -50px");
    });
});
$("#chatConBottom .langLi").click(function() {
    $(this).parent().hide();
    $(this).parents(".langOptions").find(".language").attr("langs-lang", $(this).attr("langs-lang")).text($(this).text());
    $(this).parents(".langOptions").find(".Triangle").css("background-position", "-240px -50px");
});
/*-------------qq表情------------------*/
$('#chatConBottom .qqFaceBtn').qqFace({
    id: 'facebox',
    assign: 'sendContent',
    path: staticCtx + 'img/qqFace/' //表情存放的路径
        /* clb:function(){
         	
         }*/
});
$("#chatConBottom .sendContent").keydown(function(e) {
    if (e.keyCode == "13" /*&& $.Letter.isSendComplate*/) { //keyCode=13是回车键
        $("#chatConBottom .sendBtn").click();
         e.preventDefault(); 
    }
});
$("#chatConBottom .sendBtn").click(function() {
    var th = $("#chatConBottom .sendContent");
    var sendContent = $("#chatConBottom .sendContent").val();
    var sendConPD = sendContent;
    var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
    var src = $("#chatMiddle ").children("[data-gagaID = " + gagaID + "]").find(".upLoadImg").attr("src");
    var imgING = $("#chatMiddle ").children("[data-gagaID = " + gagaID + "]").find(".upLoadImgState").hasClass("imgING");
    var date = new Date();
    var wordsId = date.getTime();
    var targetLan = "";
    var moneyNum = "";
    var MSGtype = "ordinaryMSG";
    if (((sendContent == $.t("im.enterKeySend") || sendContent.trim() == "") && (!src)) || imgING) {
        th.val($.t("im.enterKeySend")).css("color", "#999");
        layer.msg($.t("im.NoSendEmpty"), {
            time: 2000
        }, function() {});
    } else {
        if($.IM.deleteQQFace(sendContent).length > 500){
            layer.msg($.t("Letter.strUpLimit"), {time: 2000}, function () { });
            return false;
        }
        
        
        if ($.IM.deleteQQFace(sendContent).trim() == "") {
            targetLan = "";
        } else {
            targetLan = $("#chatConBottom .langBtn .language").attr("langs-lang");
        }
        if (sendContent == $.t("im.enterKeySend")) {
            sendContent = "";
        }
        if (targetLan) {
            $.Letter.deductMoney(th, sendContent, sendConPD, gagaID, src, targetLan, moneyNum, MSGtype);
        } else {
            $.Letter.SendMessage(th, sendContent, sendConPD, gagaID, src, targetLan, moneyNum, MSGtype);
        }
    }
});

$("#chatMiddle").delegate(".upLoadImgDelete", "click", function() {
    var upLoadImgContainer = $(this).parents(".upLoadImgContainer");
    upLoadImgContainer.hide();
    upLoadImgContainer.find(".upLoadImg").attr("src", "");
    upLoadImgContainer.children(".upLoadContnet").hide();
    upLoadImgContainer.find(".upLoadImgName").text("");
    $(this).hide();
    upLoadImgContainer.find(".upLoadImgState").show();
    upLoadImgContainer.find(".upLoadImging").css("background", "url(" + staticCtx + "img/upLoadImging.gif) no-repeat");
    $("#chatConBottom .sendBtn").css({
        "color": "#696969",
        "background-color": "#fff"
    });
});

/*---------打招呼-------------*/
$("#chatMiddle").delegate(".HelloBtn", "click", function(e) {
    var th = $(this);
    var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
    var sendContent = $.t("Letter.helloHello");
    var sendConPD = "";
    var imgUrl = "";
    var targetLan = "";
    var moneyNum = "";
    var MSGtype = "Hello";
    $.Letter.SendMessage(th, sendContent, sendConPD, gagaID, imgUrl, targetLan, moneyNum, MSGtype);
});
/*---------点赞------------*/
$("#chatMiddle").delegate(".clickLikeBtn", "click", function(e) {
    var th = $(this);
    var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
    var sendContent = $.t("Letter.headGreat");
    var sendConPD = "";
    var imgUrl = "";
    var targetLan = "";
    var moneyNum = "";
    var MSGtype = "clickLike";
    $.Letter.SendMessage(th, sendContent, sendConPD, gagaID, imgUrl, targetLan, moneyNum, MSGtype);
});
/*---------点赞------------*/
$("#chatMiddle").delegate(".dynamicBtn", "click", function(e) {
    var th = $(this);
    var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
    var sendContent = $.t("Letter.dynamicInteresting");
    var sendConPD = "";
    var imgUrl = "";
    var targetLan = "";
    var moneyNum = "";
    var MSGtype = "dynamic";
    $.Letter.SendMessage(th, sendContent, sendConPD, gagaID, imgUrl, targetLan, moneyNum, MSGtype);
});
/*---------发送后单条翻译----------*/
$("#chatMiddle").delegate(".translateBtn", "click", function(e) {
    $(".lanChoice").hide();
    
    var th = $(this);
    var parentL = th.parent().offset().left;
    var chatMiddleL = $("#chatMiddle").offset().left;
    var distance = parentL - chatMiddleL;
    // console.log(distance);
    if (th.next(".lanChoice").css("display") == "block") {
        th.next(".lanChoice").css("display", "none");
    } else {
        th.next(".lanChoice").css("display", "block");
    }
    if (th.parents(".LetterchatMessage").hasClass("receiveMessage")) {
        if (distance > 360) {
            th.parents(".LetterchatMessage").find(".lanUl").css("right", "-15px");
        }
    } else if (th.parents(".LetterchatMessage").hasClass("sendMessage") || th.parents(".LetterchatMessage").hasClass("sendRedEnvelope")) {
        if (distance > 250) {
            th.parents(".LetterchatMessage").find(".lanUl").css("right", "-20px");
        }
    }
    e.stopPropagation();
    $(document).click(function() {
        $("#chatMiddle .lanChoice").hide();
    });
});
$("#chatMiddle").delegate(".lanUl li", "click", function(e) {
    var th = $(this);
    var gagaID = th.parents(".chatCon").attr("data-gagaID");
    var id = th.parents(".LetterchatMessage").attr("data-ranid");
    var content = "";
    var language = $(this).attr("langs-lang");
    if (th.parents(".LetterchatMessage").hasClass("receiveRedEnvelope") || th.parents(".LetterchatMessage").hasClass("sendRedEnvelope")) {
        content = th.parents(".LetterchatMessage").attr("data-con");
    } else {
        content = th.parents(".LetterchatMessage").find(".Original").text();
    }
    th.parents(".LetterchatMessage").find(".lanChoice").hide();
    $.Letter.SendAfterTranslationDeductMoney(gagaID, id, content, language, th);
    e.stopPropagation();
});


/*----------------历史纪录-------------*/
$("#chatMiddle").delegate(".chatCon .moreNews", "click", function() {
    // $(this).hide();
    $("#chatConBottom .LetterHistoricalRecords").click();
});

$("#chatConBottom .LetterHistoricalRecords").click(function() {

    $(".LetterhistoryContainer .tcdPageCode").html("");
    var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
    var nickName = ContactsUl.children(".activeContacts").attr("data-nickname");
    var country = ContactsUl.children(".activeContacts").attr("data-country");
    var age = ContactsUl.children(".activeContacts").attr("data-age");
    $(".container .LetterhistoryContainer").show();

    var LetterhistoryContainer = $(".container .LetterhistoryContainer");
    LetterhistoryContainer.children(".chatPerson").children(".NickName").html(nickName);
    LetterhistoryContainer.children(".chatPerson").children(".country").html(country);
    if (age == 0) {
        LetterhistoryContainer.children(".chatPerson").children(".ageBefor").hide();
        LetterhistoryContainer.children(".chatPerson").children(".age").html(age).hide();
    } else {
        LetterhistoryContainer.children(".chatPerson").children(".ageBefor").show();
        LetterhistoryContainer.children(".chatPerson").children(".age").html(age).show();
    }


    LetterhistoryContainer.children(".historyCon").attr("data-gagaID", gagaID);

    $(".page").append('<div class="tcdPageCode"></div>');
    var currentpage = 1;
    var PagePD = "true";
    $.Letter.ajxaHistorical(gagaID, currentpage, LetterhistoryContainer, nickName, PagePD);

});
/*----------------清空历史纪录-------------*/
$(".LetterhistoryContainer .emptyHistory").click(function() {
    var gagaID = $(this).parents(".LetterhistoryContainer").find(".historyCon").attr("data-gagaid");
    $.Letter.historicalDeleteFun(gagaID);
});
/*----------------关闭历史纪录-------------*/
$(".LetterhistoryContainer .backBtn").click(function() {
    $(".LetterhistoryContainer").hide();
    $(".LetterhistoryContainer .page").html("");
    $(".container .LetterhistoryContainer").children(".historyCon").attr("data-gagaID", "");
});
/*----------------加好友-------------*/
$("#chatTop").delegate(".addFriend", "click", function() {
    if ($(this).attr("data-friend") == "0") {
        var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
        $.Letter.addFriendFun(gagaID);
    } /*else if ($(this).attr("data-friend") == "2") {
        layer.msg($.t("Letter.friendApplicationWaitThrough"), {
            time: 2000
        }, function() {});
    }*/
});
/*----------------举报-------------*/
$("#chatTop .funReport").click(function() {
    var ReportPopupDIV = '<ul class="ReportPopupUl"><li><label class="Reportchoiced"><i></i>' + $.t("global.junkAd") + '</label></li><li><label class="Reportchoiced"><i></i>' + $.t("global.obscene") + '</label></li><li><label class="Reportchoiced"><i></i>' + $.t("global.falseWin") + '</label></li><li><label class="Reportchoiced"><i></i>' + $.t("global.SensitiveInfor") + '</label></li><li><label class="Reportchoiced"><i></i>' + $.t("global.PersonalAttack") + '</label></li><li><label class="Reportchoiced"><i></i>' + $.t("global.HarassOthers") + '</label></li><div class="cleard"></div></ul>';
    var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
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
                layer.msg($.t("global.noReportContent"), {time: 2000}, function() {});
            } else {
                $.Letter.reportFun(gagaID, TXT);
                layer.close(index);
            }
        }
    });
});
/*----------------屏蔽-------------*/
$("#chatTop .funShieldState").click(function() {
    var th = $(this);
    var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
    var shield = th.attr("data-shield");
    $.Letter.ShieldFun(gagaID, shield, th);

});

/*----------------发红包-------------*/
$("#chatConBottom .redBtn").click(function() {
    $.IM.getMoneyNum();
    var RedEnvelopeTC = "";
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
            RedEnvelopeTC.find(".layui-layer-title .RemindIcon").hover(function(){
            	//$(this).next(".RemindContent").css({"z-index":"1","white-space":"normal","line-height":"22px","left":"95px","top":"0px","padding-top":"0px"})
            	$(this).next(".RemindContent").show();
            	
            },function(){
            	$(this).next(".RemindContent").hide();
            })


        },
        btn: [$.t("Letter.sendRedPackage")],
        yes: function(index, layero) {
            var content = ""
            var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
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

            $.Letter.sendRedEnvelopeFun(gagaID, moneyVal, content, "", "", "");

            layer.close(index);
        }
    });
});
/*-------------查看红包----------*/
$(".LetterhistoryContainer").delegate(".sendRedContainer", "click", function() {
    var th = $(this);
    $.Letter.checkRedEnvelopeClick(th);
});
$("#chatMiddle").delegate(".sendRedContainer", "click", function() {
    var th = $(this);
    $.Letter.checkRedEnvelopeClick(th);
});
/*---------打开红包-------*/
$(".LetterhistoryContainer").delegate(".receiveRedContainer", "click", function() {
    var th = $(this);
    $.Letter.openRedEnvelopeClick(th, ContactsUl, "historyCon");
});
$("#chatMiddle").delegate(".receiveRedContainer", "click", function() {
    var th = $(this);
    $.Letter.openRedEnvelopeClick(th, ContactsUl, "chatCon");
});

/*---------关闭打开的红包-------*/
$(".RedEnvelopeOpen .RedEnvelopeOpenCloseBtn").click(function() {
    var RedEnvelopeOpen = $(".RedEnvelopeOpen");

    RedEnvelopeOpen.find(".RedEnvelopeExplain").text("");
    RedEnvelopeOpen.find(".getRedEnvelopeBtn").show();
    RedEnvelopeOpen.hide();
});
/*-------------一键50人----------*/

$("#fiftyMale").bind("click", $.Letter.fiftyMaleClick);

/*-----------------礼物----------------*/
$("#LetterchatBox .btnContainer .giftBtn").click(function() {
    var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
    openGiftList(gagaID);
});
/*-----------------大图预览----------------------*/
$("#chatMiddle").delegate(".bigImgBtn img", "click", function() {
    $.Letter.bigImgPreview(this);
});
$(".LetterhistoryContainer .historyCon").delegate(".bigImgBtn img", "click", function() {
    $.Letter.bigImgPreview(this);
});
/*-----女性----邀请对方升级-------*/
$(".LetterhistoryContainer").delegate(".invitationUpgrade .Upgrade", "click", function() {
    var th = $(this);
    var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
    var wordsId = $(this).parents(".invitationUpgrade").attr("data-ranid");
    $.Letter.invitationUpgradeFun(th, gagaID, wordsId, "historyCon");
});
$("#chatMiddle").delegate(".invitationUpgrade .Upgrade", "click", function() {
    var th = $(this);
    var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
    var wordsId = $(this).parents(".invitationUpgrade").attr("data-ranid");
    $.Letter.invitationUpgradeFun(th, gagaID, wordsId, "chatCon");
});
/*-----男性购买条数-------*/
$(".LetterhistoryContainer").delegate(".maleUpgradeTips .buyNum", "click", function() {
    $.Letter.buyNumClick();
});
$("#chatMiddle").delegate(".maleUpgradeTips .buyNum", "click", function() {
    $.Letter.buyNumClick();
});