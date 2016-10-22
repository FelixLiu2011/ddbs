$.Letter = {
    ShieldArr: [],
    TimeArr: {},
    isSendComplate: true,
    init: function() {
        var that = this;
        var getContactsDate = new Date();
        $.ajax({
            type: "get",
            url: ctx + "/pm/getContacts?"+getContactsDate.getTime(),
            // data:{},
            async: true,
            dataType: "json",
            success: function(reg) {
                //console.log("私信联系人请求:"+JSON.stringify(reg));
                //console.log("私信联系人请求:"+reg);
              
                if (reg.success) {
                     var nowTime = $.fn.returnTime(reg.attributes.currDate, "full", "YYYY-MM-DD hh:mm");
                     var getDate = null;
                     var tm = null;
                     var contactsLi = null;
                     var stickLi = '';
            
                    if (reg.obj.length > 0) {
                        var allContactsLi = "";
                        var onlineContactsLi = "";
                        var onlineNum = 0;
                        for (var i = 0; i < reg.obj.length; i++) {

                            //var getDate = jsonDateFormatReceive(new Date(reg.obj[i].ut).Format("yyyy-MM-dd hh:mm"));
                            getDate = $.fn.returnTime(reg.obj[i].ut, "full", "YYYY-MM-DD hh:mm");
                            tm = TimeDifference2(getDate, "",nowTime);
            
                            that.TimeArr[reg.obj[i].frid] = "";

                            contactsLi = "";
                            contactsLi += '<li class="contactsPeopleContent '+(reg.obj[i].pb == 1?'pbleter':'')+(reg.obj[i].isStick == 1?' onStick':'')+'" data-gagaid="' + reg.obj[i].frid + '" data-nickname="' + reg.obj[i].membNickname + '" data-shield="' + reg.obj[i].pb + '" data-online="' + reg.obj[i].online + '" data-language="' + reg.obj[i].membLanguage + '" ';
                            contactsLi += 'data-country="' + getMemberCountryInfo(myLanguage, reg.obj[i].membCountry) + '" data-age="' + reg.obj[i].age + '" data-friend="' + reg.obj[i].isFriend + '">';

                            contactsLi += '<div class="contactsHeadDiv"><img class="headImg" src="' + qiniuImgURL + reg.obj[i].membBigimg + '" />';
                            if (reg.obj[i].pb == 1) {
                                that.ShieldArr.push("" + reg.obj[i].frid);
                                contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/shield.png">';
                            } else {
                                if (reg.obj[i].online == 1) {
                                    contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/On-line.png">';
                                } else {
                                    contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/On-line.png" style="display:none">';
                                }
                            }
                            contactsLi += '</div><div class="fl contactsTXT"><span class="contactsNickName overHidTXT">' + reg.obj[i].membNickname + '</span>';
                            if (reg.obj[i].pb == 0) {
                                if( reg.obj[i].nm > 99){
                                    contactsLi += '<span class="newsNum newsNumDouble">99+</span>';
                                }else if(reg.obj[i].nm > 0 && reg.obj[i].nm <100){
                                    contactsLi += '<span class="newsNum newsNumSingle">' + reg.obj[i].nm + '</span>';
                                }else{
                                    contactsLi += '<span class="newsNum newsNumSingle" style="display:none">0</span>';
                                }
                                
                            } else {
                                contactsLi += '<span class="newsNum newsNumSingle" style="display:none">0</span>';
                            }

                            contactsLi += '<p class="contactsTime overHidTXT">' + tm + '</p></div><i class="LetterchatDelete"></i><i class="letterIsStick" title="'+(reg.obj[i].isStick == 1?$.t('Letter.canceltop'):$.t('Letter.gotop'))+'"></i></li>';                            
                            if (reg.obj[i].online == 1) {
                                onlineContactsLi += contactsLi;
                                onlineNum++;
                            }
                            if (reg.obj[i].isStick == 1) {
                                stickLi += contactsLi;
                            } else {
                                allContactsLi += contactsLi;
                            }                            
                        }
                        //console.log('置顶',stickLi);
                        var initHtmlP =  stickLi + allContactsLi;                     
                        $("#allContactsGroup .ContactsUl").html(initHtmlP);
                        $("#allContactsGroup .ContactsUl li.pbleter").remove();
                        $("#onlineContactsGroup .ContactsUl").html(onlineContactsLi);
                        var newPMsgNum = $("#allContactsGroup .ContactsUl li.contactsPeopleContent").length;
                        $(".LetterchatContainer .tabCon .peopleNum").text(newPMsgNum);
                        if (newPMsgNum == 0) {
                            $("#allContactsGroup .noContacts").show();
                            $("#allContactsGroup .ContactsUl").hide();
                            $("#onlineContactsGroup .noContacts").show();
                            $("#onlineContactsGroup .ContactsUl").hide();
                            $(".LetterchatContainer .tabCon .peopleNum").text("0");
                            $(".LetterchatContainer .noContactsContaner").show();
                            
                            $(".leftCon .initLoading").partialLoader("close");
                            $(".LetterchatContainer .rightCon").partialLoader("close");
                            return;
                        }

                        //f:1正常启动，isConta：0没有在联系人中
                        if (f == "1") {
                            var $initItem = $("#allContactsGroup .ContactsUl .contactsPeopleContent:first");
                            var initID = $initItem.attr('data-gagaid');
                            $initItem.addClass("activeContacts");
                            $("#chatMiddle .chatCon").attr("data-gagaID", initID);
                            $("#chatMiddle").children("[data-gagaID =" + initID + "]").children(".chatConDiv").mCustomScrollbar({});

                            that.switchChatTop($("#allContactsGroup .ContactsUl .contactsPeopleContent:first"))
                            that.clearUnreadNum(initID);
                            that.ajxaLateHistorical(initID);
                            $("#LetterchatBox").show();
                            $.Letter.postCurrentChatPeople(initID);
                            $.Letter.resetchatConBottomStyles($initItem.attr('data-language'));

                        } else {
                            if (isConta == "0") {
                                var allContactsLi = "";
                                var onlineContactsLi = "";
                                that.TimeArr[f.frid] = "";
                                // var getDate = jsonDateFormatReceive(new Date(f.ut).Format("yyyy-MM-dd hh:mm"));
                                if (f.pb == 1) {
                                    return;
                                }
                                var getDate = $.fn.returnTime(f.ut, "full", "YYYY-MM-DD hh:mm");
                                var contactsLi = "";
                                contactsLi += '<li class="contactsPeopleContent'+(f.pb == 1?' pbleter':'')+(f.isStick == 1?' onStick':'')+'" data-gagaid="' + f.frid + '" data-nickname="' + f.membNickname + '" data-shield="' + f.pb + '" data-online="' + f.online + '" data-language="' + f.membLanguage + '" ';
                                contactsLi += 'data-country="' + getMemberCountryInfo(myLanguage, f.membCountry) + '" data-age="' + f.age + '" data-friend="' + f.isFriend + '">';
                                contactsLi += '<div class="contactsHeadDiv"><img class="headImg" src="' + qiniuImgURL + f.membBigimg + '" />';
                                if (f.pb == 1) {
                                    that.ShieldArr.push("" + f.pb);
                                    contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/shield.png">';
                                } else {
                                    if (f.online == 1) {
                                        onlineNum++;
                                        contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/On-line.png">';
                                    } else {
                                        contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/On-line.png" style="display:none">';
                                    };
                                }
                                contactsLi += '</div><div class="fl contactsTXT"><span class="contactsNickName overHidTXT">' + f.membNickname + '</span>';
                                contactsLi += '<span class="newsNum newsNumSingle" style="display:none">0</span>';
                                contactsLi += '<p class="contactsTime overHidTXT">' + getDate + '</p></div><i class="LetterchatDelete"></i><i class="letterIsStick" title="'+(f.isStick == 1?$.t('Letter.canceltop'):$.t('Letter.gotop'))+'"></i></li>';
                                if (f.online == 1) {
                                    onlineContactsLi = contactsLi;
                                    $("#onlineContactsGroup .ContactsUl").prepend(onlineContactsLi);
                                }
                                allContactsLi = contactsLi;
                                if (f.isStick == 1) {
                                    $("#allContactsGroup .ContactsUl").prepend(allContactsLi);
                                } else {
                                    if ($("#allContactsGroup .ContactsUl li.onStick").length > 0) {
                                        $("#allContactsGroup .ContactsUl li.onStick:last").after(allContactsLi);
                                    } else {
                                        $("#allContactsGroup .ContactsUl").prepend(allContactsLi);
                                    }
                                }                                
                                var peopleNum = $(".LetterchatContainer .tabCon .peopleNum").text();
                                peopleNum++;
                                $(".LetterchatContainer .tabCon .peopleNum").text(peopleNum);
                            }
                            $("#allContactsGroup .ContactsUl").children("[data-gagaID =" + f.frid + "]").addClass("activeContacts");
                            $("#chatMiddle .chatCon").attr("data-gagaID", f.frid);
                            $("#chatMiddle").children("[data-gagaID =" + f.frid + "]").children(".chatConDiv").mCustomScrollbar({});

                            that.switchChatTop($("#allContactsGroup .ContactsUl").children("[data-gagaID =" + f.frid + "]"));
                            that.clearUnreadNum(f.frid);
                            that.ajxaLateHistorical(f.frid, qiniuImgURL + f.membBigimg);
                            $("#LetterchatBox").show();
                            $.Letter.postCurrentChatPeople(f.frid);
                            $.Letter.resetchatConBottomStyles(f.membNickname);
                        }
                        if (onlineNum == 0) {
                            $("#onlineContactsGroup .noContacts").show();
                            $("#onlineContactsGroup .ContactsUl").hide();
                        }

                    } else {

                        if (f == "1") {
                            $("#allContactsGroup .noContacts").show();
                            $("#allContactsGroup .ContactsUl").hide();
                            $("#onlineContactsGroup .noContacts").show();
                            $("#onlineContactsGroup .ContactsUl").hide();
                            $(".LetterchatContainer .tabCon .peopleNum").text("0");
                            $(".LetterchatContainer .noContactsContaner").show();
                        } else {
                            if (isConta == "0") {
                                var allContactsLi = "";
                                var onlineContactsLi = "";
                                that.TimeArr[f.frid] = "";
                                //var getDate = jsonDateFormatReceive(new Date(f.ut).Format("yyyy-MM-dd hh:mm"));
                                var getDate = $.fn.returnTime(f.ut, "full", "YYYY-MM-DD hh:mm");

                                if (f.pb == 1) {
                                    return;
                                }
                                var contactsLi = "";
                                contactsLi += '<li class="contactsPeopleContent'+(f.pb == 1?' pbleter':'')+(f.isStick == 1?' onStick':'')+'" data-gagaid="' + f.frid + '" data-nickname="' + f.membNickname + '" data-shield="' + f.pb + '" data-online="' + f.online + '" data-language="' + f.membLanguage + '" ';
                                contactsLi += 'data-country="' + getMemberCountryInfo(myLanguage, f.membCountry) + '" data-age="' + f.age + '" data-friend="' + f.isFriend + '">';
                                contactsLi += '<div class="contactsHeadDiv"><img class="headImg" src="' + qiniuImgURL + f.membBigimg + '" />';
                                if (f.pb == 1) {
                                    that.ShieldArr.push("" + f.pb);
                                    contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/shield.png">';
                                } else {
                                    if (f.online == 1) {
                                        contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/On-line.png">';
                                    } else {
                                        contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/On-line.png" style="display:none">';
                                    };
                                }
                                contactsLi += '</div><div class="fl contactsTXT"><span class="contactsNickName overHidTXT">' + f.membNickname + '</span>';
                                contactsLi += '<span class="newsNum newsNumSingle" style="display:none">0</span>';
                                contactsLi += '<p class="contactsTime overHidTXT">' + getDate + '</p></div><i class="LetterchatDelete"></i><i class="letterIsStick" title="'+(f.isStick == 1?$.t('Letter.canceltop'):$.t('Letter.gotop'))+'"></i></li>';
                                if (f.online == 1) {
                                    onlineContactsLi = contactsLi;
                                    $("#onlineContactsGroup .ContactsUl").prepend(onlineContactsLi);
                                }
                                allContactsLi = contactsLi;
                                if (f.isStick == 1) {
                                    $("#allContactsGroup .ContactsUl").prepend(allContactsLi);
                                } else {
                                    if ($("#allContactsGroup .ContactsUl li.onStick").length > 0) {
                                        $("#allContactsGroup .ContactsUl li.onStick:last").after(allContactsLi);
                                    } else {
                                        $("#allContactsGroup .ContactsUl").prepend(allContactsLi);
                                    }
                                } 
                                var peopleNum = $(".LetterchatContainer .tabCon .peopleNum").text();
                                peopleNum++;
                                $(".LetterchatContainer .tabCon .peopleNum").text(peopleNum);
                            }
                            $("#allContactsGroup .ContactsUl").children("[data-gagaID =" + f.frid + "]").addClass("activeContacts");
                            $("#chatMiddle .chatCon").attr("data-gagaID", f.frid);
                            $("#chatMiddle").children("[data-gagaID =" + f.frid + "]").children(".chatConDiv").mCustomScrollbar({});

                            that.switchChatTop($("#allContactsGroup .ContactsUl").children("[data-gagaID =" + f.frid + "]"));
                            that.ajxaLateHistorical(f.frid, qiniuImgURL + f.membBigimg);
                            $("#LetterchatBox").show();
                            $.Letter.postCurrentChatPeople(f.frid);
                            $.Letter.resetchatConBottomStyles(f.membNickname);
                        }
                    }

                } else {}
                /*---关闭加载初始化-----*/
                $(".leftCon .initLoading").partialLoader("close");
                $(".LetterchatContainer .rightCon").partialLoader("close");
            },
            error: function() {}
        });
    },
    /*------发送消息---------------*/

    SendMessage: function(th, sendContent, sendConPD, gagaID, imgUrl, targetLan, moneyNum, MSGtype) {
        var that = this;        
        //mn红包数
        var data = {
            toid: gagaID,
            to: targetLan,
            msg: sendContent,
            image: imgUrl,
            mn: moneyNum,
            uuid: "123"
        };
        if ($.Letter.isSendComplate) {
            $.Letter.isSendComplate = false;

            $.ajax({
                type: "post",
                url: ctx + "/pm/sendMsg",
                data: data,
                async: true,
                dataType: "json",
                success: function(reg) {
                    //console.log("SendMessage:" + JSON.stringify(reg));
                    //console.log("SendMessage:" + reg);
                    if (reg.success) {
                        /*------------获取钱数和字符数------------*/
                        if (targetLan) {
                            $.IM.getMoneyNum();
                            $.IM.getTranslationCharacterNum();
                        }
                        var wordsId = reg.obj.newsModel.id;
                        var read = reg.obj.isRead;
                        var sendState = reg.success;
                        var TranslationContent = "";
                        var getSendTime = $.fn.returnTime(reg.obj.newsModel.ct, "full", "YYYY-MM-DD hh:mm");
                        var tranStatus ="";
                        var LastMsg = reg.attributes.isLastMsg;
                       // if (reg.attributes.tranStatus == 1 && reg.obj.newsModel.cot.tl.tr != "" && reg.obj.newsModel.cot.tl.tr != null) {
                        if (reg.attributes.tranStatus == 1 && reg.obj.newsModel.cot.tl && reg.obj.newsModel.cot.tl.tr != null) {
                            TranslationContent = reg.obj.newsModel.cot.tl.tr;
                        }
                        if(reg.obj.newsModel.cot.tl){
                            tranStatus = "true";
                        }
                        if (MSGtype == "ordinaryMSG") {
                            that.addSendMessage(th, sendContent, sendConPD, gagaID, imgUrl, tranStatus, getSendTime, wordsId, sendState, TranslationContent, read);
                           if(targetLan && !tranStatus){
                                layer.msg($.t("im.translationFailed"), {time: 2000 }, function() {});
                           } 
                        } else if (MSGtype == "Hello") {
                            that.addHelloFunMsg(gagaID, getSendTime, wordsId, sendState, read);
                        } else if (MSGtype == "clickLike") {
                            that.addClickLikeFunMsg(gagaID, getSendTime, wordsId, sendState, read);
                        } else if (MSGtype == "dynamic") {
                            that.addDynamicFunMsg(gagaID, getSendTime, wordsId, sendState, read);
                        }
                       /* $.Letter.isSendComplate = true;*/

                        if (LastMsg) {
                            $.post(ctx + "/pm/sendLastMsg", {toid: gagaID }, function() {});
                        }
                        
                        /*------------恢复默认设置------------*/
                        th.val("");  
                        $("#chatConBottom .sendBtn").css({
                            "color": "#696969",
                            "background-color": "#fff"
                        });
                        $("#chatConBottom .characterNum").text("0");
                        $(".upLoadImgContainer").hide();
                        $(".upLoadImgContainer .upLoadImg").attr("src", "");
                        $(".upLoadImgContainer .upLoadContnet").hide();
                        $(".upLoadImgContainer .upLoadImging").css("background", "url(../img/upLoadImging.gif) no-repeat;").show();
                        $(".upLoadImgContainer .upLoadImgState").text("").css("color", "#333").show();
                        $(".upLoadImgContainer .upLoadImgDelete").hide();
                    } else {
                       /* $.Letter.isSendComplate = true;*/
                        if (reg.msg == "1") {
                            $("#chatConBottom").children(".TipsContent").show();
                            var chatConBottomW = $("#chatConBottom").outerWidth();
                            var TipsContentW = $("#chatConBottom .TipsContent").outerWidth();
                            $("#chatConBottom").children(".TipsContent").css("left",(chatConBottomW - TipsContentW)/2)                            
                             var OvertimeHide = setTimeout(function() {
                                $("#chatConBottom").children(".TipsContent").hide();
                                clearTimeout(OvertimeHide);
                            }, 2000);

                        }else if(reg.msg == "3"){
                        	 layer.msg($.t("im.SensitiveWordsTips"), { time: 2000}, function() {});
                        }else {
                            layer.msg($.t("global.zoneApiError"), {
                                time: 2000
                            }, function() {});
                        }
                    }
                    $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("update");
                    $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
                },
                error: function() {
                    layer.msg($.t("global.zoneApiError"), {time: 2000 }, function() {});
                }
            })
            .always(function() {
                $.Letter.isSendComplate = true;
            });
        
        }      
        
    },
    /*------拼接----发送消息---------------*/
    addSendMessage: function(th, sendContent, sendConPD, gagaID, imgUrl,tranStatus, getSendTime, wordsId, sendState, TranslationContent, read) {
        var that = this;
        var sendTime = TimeDifference2(getSendTime, $.Letter.TimeArr[gagaID]);
        var sendMessageDiv = "";
        if (sendTime != "") {
            $.Letter.TimeArr[gagaID] = getSendTime;
            sendMessageDiv += '<p class="chatTime">' + getSendTime.substr(11, 5) + '</p>';
        }
        sendContent = $.IM.replace_em(sendContent);
        sendMessageDiv += ' <div class="sendMessage LetterchatMessage fr cleard" data-ranid="' + wordsId + '">' +
            '<div><div class="sendNickName NickName fr">' + myNickname + '</div>';


        if (sendState) {
            if (read == 0) {
                sendMessageDiv += '<span class="newsState read fr" style="color:#999">' + $.t("im.noRead") + '</span> <i class="readHorn fr" style="display:none"></i></div>';
            } else if (read == 1) {
                sendMessageDiv += '<span class="newsState read fr" style="color:#97a7c3">' + $.t("im.read") + '</span> <i class="readHorn fr" style="display:block"></i></div>';
            } else if (read == -1) {
                sendMessageDiv += '<span class="newsState read fr" style="display:none;"></span> <i class="readHorn fr" style="display:none"></i></div>';
            }
        }
        sendMessageDiv += '<div class="sendContainer msgContent fr cleard">';
        if (sendContent && sendContent != $.t("im.enterKeySend")) {
            sendMessageDiv += '<div class="OriginalCon"><span class="sendOriginal Original">' + sendContent + '</span>';
        } else {
            sendMessageDiv += '<div class="OriginalCon" style="display:none"><span class="sendOriginal Original">' + sendContent + '</span>';
        }
        //if (targetLan == "" && $.IM.deleteQQFace(sendConPD).trim() != "" && sendContent && sendContent != $.t("im.enterKeySend")) {
        if (!tranStatus && $.IM.deleteQQFace(sendConPD).trim() != "" && sendContent && sendContent != $.t("im.enterKeySend")) {
            sendMessageDiv += '<div class="TranslateBtnConainer"><i class="sendTranslateBtn translateBtn"></i><div class="sendlanChoice lanChoice"><i class="lanI"></i>' + $.IM.languageListStr + '<div class="clear"></div></div></div>';
        } else if (tranStatus && !TranslationContent) {
            sendMessageDiv += '<div class="TranslateBtnConainer"><i class="sendTranslateBtn receiveTranslateIng"></i></div>';
        }

        sendMessageDiv += '</div>';

        //if (targetLan != "" && sendContent && sendContent != $.t("im.enterKeySend")) {
        /*if (targetLan != "" && sendContent && sendContent != $.t("im.enterKeySend")) {*/
            if (TranslationContent) {
                sendMessageDiv += '<div class="receiveTranslationContainer fr"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation">' + $.IM.replace_em(TranslationContent) + '</p></div>';
            } else {
                /* sendMessageDiv += '<div class="receiveTranslationContainer fr"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation">'+$.t("im.translating")+'</p></div>';*/
                sendMessageDiv += '<div class="receiveTranslationContainer fr" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation"></p></div>';
            }


        /*} else {
            sendMessageDiv += '<div class="receiveTranslationContainer fr" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation"></p></div>';

        }*/

        if (imgUrl) {
            sendMessageDiv += '<div class="bigImgBtn cleard fr"><img class="receiveImg" src="' + imgUrl + '"></div>';
        }
        sendMessageDiv += '</div>';
        if (!sendState) {
            sendMessageDiv += ' <div class="sendFailTip" sytle="background:url(' + staticCtx + 'mg/IMicon.png) 0 -170px no-repeat"></div>';
        }
        sendMessageDiv += '<div class="clear"></div></div><div class="clear"></div>';

        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").find(".LetterchatContent").append(sendMessageDiv);
        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("update");
        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");

        /*-----------提到第一位-----------------*/
        var allContactsLi = $("#allContactsGroup .ContactsUl").children("[data-gagaID =" + gagaID + "]");
        var online = allContactsLi.attr("data-online");
        if (online == 1) {
            var onlineContactsLi = $("#onlineContactsGroup .ContactsUl").children("[data-gagaID =" + gagaID + "]");
            if (sendTime != "") {
                onlineContactsLi.find(".contactsTime").text(getSendTime.substr(11, 5));
            }
            onlineContactsLi.prependTo(onlineContactsLi.parent());
        }
        if (sendTime != "") {
            allContactsLi.find(".contactsTime").text(getSendTime.substr(11, 5));
        }
        if (allContactsLi.hasClass('onStick')) {
            allContactsLi.prependTo(allContactsLi.parent());
        } else {
            if ($("#allContactsGroup .ContactsUl li.onStick").length>0) {
                $("#allContactsGroup .ContactsUl li.onStick:last").after(allContactsLi);
            } else {
                allContactsLi.prependTo(allContactsLi.parent());
            }
        }        
        $(".LetterchatContainer .leftCon .ContactsUl").children("[data-gagaID =" + gagaID + "]").show();



        /*------------恢复默认设置------------*/
        //th.val("");
        $("#chatConBottom .sendBtn").css({
            "color": "#696969",
            "background-color": "#fff"
        });
        $("#chatConBottom .characterNum").text("0");
        $(".upLoadImgContainer").hide();
        $(".upLoadImgContainer .upLoadImg").attr("src", "");
        $(".upLoadImgContainer .upLoadContnet").hide();
        $(".upLoadImgContainer .upLoadImging").css("background", "url(../img/upLoadImging.gif) no-repeat;").show();
        $(".upLoadImgContainer .upLoadImgState").text("").css("color", "#333").show();
        $(".upLoadImgContainer .upLoadImgDelete").hide();
        return;
    },
    /*------拼接----打招呼消息---------------*/
    addHelloFunMsg: function(gagaID, getSendTime, wordsId, sendState, read) {
        var sendMessageDiv = "";
        var sendTime = TimeDifference2(getSendTime, $.Letter.TimeArr[gagaID]);
        if (sendTime != "") {
            $.Letter.TimeArr[gagaID] = getSendTime;
            sendMessageDiv += '<p class="chatTime">' + getSendTime.substr(11, 5) + '</p>';
        }
        sendMessageDiv += '<div class="firstHello fr cleard LetterchatMessage sendMessage" data-ranid="' + wordsId + '"><div><div class="sendNickName NickName fr">' + myNickname + '</div>';
        if (read == 0) {
            sendMessageDiv += '<span class="newsState read fr" style="color:#999">' + $.t("im.noRead") + '</span><i class="readHorn fr" style="display:none"></i>';
        } else if (read == 1) {
            sendMessageDiv += '<span class="newsState read fr" style="color:#97a7c3">' + $.t("im.read") + '</span><i class="readHorn fr" style="display:block"></i>';
        } else if (read == -1) {
            sendMessageDiv += '<span class="newsState read fr" style="display:none"></span><i class="readHorn fr" style="display:none"></i>';
        }


        sendMessageDiv += '</div><div class="sendContainer msgContent fr cleard"><div class="OriginalCon"><span class="sendOriginal Original">' + $.t("Letter.helloHello") + ' </span><div class="TranslateBtnConainer"><i class="sendTranslateBtn translateBtn"></i><div class="sendlanChoice lanChoice"><i class="lanI"></i>' + $.IM.languageListStr + '<div class="clear"></div></div></div></div><div class="receiveTranslationContainer fr" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation "></p></div></div><div class="sendFailTip" style="display:none"></div></div><div class="clear"></div>';
        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").find(".LetterchatContent").append(sendMessageDiv);
        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("update");
        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
        /*-----------提到第一位-----------------*/
        var allContactsLi = $("#allContactsGroup .ContactsUl").children("[data-gagaID =" + gagaID + "]");
        var online = allContactsLi.attr("data-online");
        if (online == 1) {
            var onlineContactsLi = $("#onlineContactsGroup .ContactsUl").children("[data-gagaID =" + gagaID + "]");
            if (sendTime != "") {
                onlineContactsLi.find(".contactsTime").text(getSendTime.substr(11, 5));
            }
            onlineContactsLi.prependTo(onlineContactsLi.parent());
        }
        if (sendTime != "") {
            allContactsLi.find(".contactsTime").text(getSendTime.substr(11, 5));
        }
        if (allContactsLi.hasClass('onStick')) {
            allContactsLi.prependTo(allContactsLi.parent());
        } else {
            if ($("#allContactsGroup .ContactsUl li.onStick").length>0) {
                $("#allContactsGroup .ContactsUl li.onStick:last").after(allContactsLi);
            } else {
                allContactsLi.prependTo(allContactsLi.parent());
            }
        }
        $(".LetterchatContainer .leftCon .ContactsUl").children("[data-gagaID =" + gagaID + "]").show();
    },
    /*------拼接----点赞消息---------------*/

    addClickLikeFunMsg: function(gagaID, getSendTime, wordsId, sendState, read) {
        var sendMessageDiv = "";
        var sendTime = TimeDifference2(getSendTime, $.Letter.TimeArr[gagaID]);
        if (sendTime != "") {
            $.Letter.TimeArr[gagaID] = getSendTime;
            sendMessageDiv += '<p class="chatTime">' + getSendTime.substr(11, 5) + '</p>';
        }
        sendMessageDiv += '<div class="clickLike fr cleard LetterchatMessage sendMessage" data-ranid="' + wordsId + '"><div><div class="sendNickName NickName fr">' + myNickname + '</div>';

        if (read == 0) {
            sendMessageDiv += '<span class="newsState read fr" style="color:#999">' + $.t("im.noRead") + '</span><i class="readHorn fr" style="display:none"></i>';
        } else if (read == 1) {
            sendMessageDiv += '<span class="newsState read fr" style="color:#97a7c3">' + $.t("im.read") + '</span><i class="readHorn fr" style="display:block"></i>';
        } else if (read == -1) {
            sendMessageDiv += '<span class="newsState read fr" style="display:none"></span><i class="readHorn fr" style="display:none"></i>';
        }

        sendMessageDiv += '</div><div class="sendContainer msgContent fr cleard"><div class="OriginalCon"><span class="sendOriginal Original">' + $.t("Letter.headGreat") + '</span><div class="TranslateBtnConainer"><i class="sendTranslateBtn translateBtn"></i><div class="sendlanChoice lanChoice"><i class="lanI"></i>' + $.IM.languageListStr + '<div class="clear"></div></div></div></div>     <div class="receiveTranslationContainer fr" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation "></p></div></div><div class="sendFailTip" style="display:none"></div></div><div class="clear"></div>';

        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").find(".LetterchatContent").append(sendMessageDiv);
        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("update");
        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
        /*-----------提到第一位-----------------*/
        var allContactsLi = $("#allContactsGroup .ContactsUl").children("[data-gagaID =" + gagaID + "]");
        var online = allContactsLi.attr("data-online");
        if (online == 1) {
            var onlineContactsLi = $("#onlineContactsGroup .ContactsUl").children("[data-gagaID =" + gagaID + "]");
            if (sendTime != "") {
                onlineContactsLi.find(".contactsTime").text(getSendTime.substr(11, 5));
            }
            onlineContactsLi.prependTo(onlineContactsLi.parent());
        }
        if (sendTime != "") {
            allContactsLi.find(".contactsTime").text(getSendTime.substr(11, 5));
        }
        if (allContactsLi.hasClass('onStick')) {
            allContactsLi.prependTo(allContactsLi.parent());
        } else {
            if ($("#allContactsGroup .ContactsUl li.onStick").length>0) {
                $("#allContactsGroup .ContactsUl li.onStick:last").after(allContactsLi);
            } else {
                allContactsLi.prependTo(allContactsLi.parent());
            }
        } 
        $(".LetterchatContainer .leftCon .ContactsUl").children("[data-gagaID =" + gagaID + "]").show();
    },
    addDynamicFunMsg: function(gagaID, getSendTime, wordsId, sendState, read) {
        var sendMessageDiv = "";
        var sendTime = TimeDifference2(getSendTime, $.Letter.TimeArr[gagaID]);
        if (sendTime != "") {
            $.Letter.TimeArr[gagaID] = getSendTime;
            sendMessageDiv += '<p class="chatTime">' + getSendTime.substr(11, 5) + '</p>';
        }
        sendMessageDiv += '<div class="clickLike fr cleard LetterchatMessage sendMessage" data-ranid="' + wordsId + '"><div><div class="sendNickName NickName fr">' + myNickname + '</div>';

        if (read == 0) {
            sendMessageDiv += '<span class="newsState read fr" style="color:#999">' + $.t("im.noRead") + '</span><i class="readHorn fr" style="display:none"></i>';
        } else if (read == 1) {
            sendMessageDiv += '<span class="newsState read fr" style="color:#97a7c3">' + $.t("im.read") + '</span><i class="readHorn fr" style="display:block"></i>';
        } else if (read == -1) {
            sendMessageDiv += '<span class="newsState read fr" style="display:none"></span><i class="readHorn fr" style="display:none"></i>';
        }
        sendMessageDiv += '</div><div class="sendContainer msgContent fr cleard"><div class="OriginalCon"><span class="sendOriginal Original">' + $.t("Letter.dynamicInteresting") + '</span><div class="TranslateBtnConainer"><i class="sendTranslateBtn translateBtn"></i><div class="sendlanChoice lanChoice"><i class="lanI"></i>' + $.IM.languageListStr + '<div class="clear"></div></div></div></div>     <div class="receiveTranslationContainer fr" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation "></p></div></div><div class="sendFailTip" style="display:none"></div></div><div class="clear"></div>';

        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").find(".LetterchatContent").append(sendMessageDiv);
        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("update");
        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
        /*-----------提到第一位-----------------*/
        var allContactsLi = $("#allContactsGroup .ContactsUl").children("[data-gagaID =" + gagaID + "]");
        var online = allContactsLi.attr("data-online");
        if (online == 1) {
            var onlineContactsLi = $("#onlineContactsGroup .ContactsUl").children("[data-gagaID =" + gagaID + "]");
            if (sendTime != "") {
                onlineContactsLi.find(".contactsTime").text(getSendTime.substr(11, 5));
            }
            onlineContactsLi.prependTo(onlineContactsLi.parent());
        }
        if (sendTime != "") {
            allContactsLi.find(".contactsTime").text(getSendTime.substr(11, 5));
        }
        if (allContactsLi.hasClass('onStick')) {
            allContactsLi.prependTo(allContactsLi.parent());
        } else {
            if ($("#allContactsGroup .ContactsUl li.onStick").length>0) {
                $("#allContactsGroup .ContactsUl li.onStick:last").after(allContactsLi);
            } else {
                allContactsLi.prependTo(allContactsLi.parent());
            }
        }
        $(".LetterchatContainer .leftCon .ContactsUl").children("[data-gagaID =" + gagaID + "]").show();
    },

    /*-------接收消息时---获取不再联系人列表中的联系人信息--------------*/
    getNewContactsInformation: function(gagaID) {
        var Bool = "";
        if ($("#allContactsGroup .ContactsUl").children(".contactsPeopleContent").html()) {
            Bool = "true";
        } else {
            Bool = "false";
        }
        var that = this;
        var data = {
            fid: gagaID
        };
        $.ajax({
            type: "post",
            url: ctx + "/pm/getContactsByFid",
            data: data,
            async: true,
            dataType: "json",
            success: function(reg) {

                //console.log("根据消息获得不在列表的联系人:" + JSON.stringify(reg));
                //console.log("根据消息获得不在列表的联系人:" + reg);
                var allContactsLi = "";
                var onlineContactsLi = "";
                if (reg.success) {
                    //var getDate = jsonDateFormatReceive(new Date(reg.obj.ut).Format("yyyy-MM-dd hh:mm"));
                    var getDate = $.fn.returnTime(reg.obj.ut, "full", "YYYY-MM-DD hh:mm");
                    that.TimeArr[reg.obj.frid] = "";
                    if (reg.obj.pb == 1) {
                        return;
                    }
                    var contactsLi = "";
                    contactsLi += '<li class="contactsPeopleContent'+(reg.obj.pb == 1?' pbleter':'')+(reg.obj.isStick == 1?' onStick':'')+'" data-gagaid="' + reg.obj.frid + '" data-nickname="' + reg.obj.membNickname + '" data-shield="' + reg.obj.pb + '" data-online="' + reg.obj.online + '" data-language="' + reg.obj.membLanguage + '" ';
                    contactsLi += 'data-country="' + getMemberCountryInfo(myLanguage, reg.obj.membCountry) + '" data-age="' + reg.obj.age + '" data-friend="' + reg.obj.isFriend + '">';
                    contactsLi += '<div class="contactsHeadDiv"><img class="headImg" src="' + qiniuImgURL + reg.obj.membBigimg + '" />';
                    if (reg.obj.pb == 1) {
                        that.ShieldArr.push("" + reg.obj.pb);
                        contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/shield.png">';
                    } else {
                        if (reg.obj.online == 1) {
                            contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/On-line.png">';
                        } else {
                            contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/On-line.png" style="display:none">';
                        }
                    }
                    contactsLi += '</div><div class="fl contactsTXT"><span class="contactsNickName overHidTXT">' + reg.obj.membNickname + '</span>';

                    if (Bool == "false") {
                        contactsLi += '<span class="newsNum newsNumSingle" style="display:none">0</span>';
                    } else {
                        if (reg.obj.pb == 0) {
                            contactsLi += '<span class="newsNum newsNumSingle">1</span>';
                        } else {
                            contactsLi += '<span class="newsNum newsNumSingle" style="display:none">0</span>';
                        }
                    }


                    contactsLi += '<p class="contactsTime overHidTXT">' + getDate + '</p></div><i class="LetterchatDelete"></i><i class="letterIsStick" title="'+(reg.obj.isStick == 1?$.t('Letter.canceltop'):$.t('Letter.gotop'))+'"></i></li>';
                    allContactsLi = contactsLi;
                    if (reg.obj.isStick == 1) {
                        $("#allContactsGroup .ContactsUl").prepend(allContactsLi);
                    } else {
                        if ($("#allContactsGroup .ContactsUl li.onStick").length > 0) {
                            $("#allContactsGroup .ContactsUl li.onStick:last").after(allContactsLi);
                        } else {
                            $("#allContactsGroup .ContactsUl").prepend(allContactsLi);
                        }
                    } 
                    var peopleNum = $(".LetterchatContainer .tabCon .peopleNum").text();
                    peopleNum++;
                    $(".LetterchatContainer .tabCon .peopleNum").text(peopleNum);

                    if (reg.obj.online == 1) {
                        onlineContactsLi = contactsLi;
                        $("#onlineContactsGroup .ContactsUl").prepend(onlineContactsLi);

                        $("#onlineContactsGroup .noContacts").hide();
                        $("#onlineContactsGroup .ContactsUl").show();
                    }
                    /*---------判断是不是无联系人---------*/
                    var ContactsUl = $(".LetterchatContainer .leftCon .ContactsUl");
                    if (Bool == "false") {
                        $("#searchResultGroup").hide();
                        $("#searchCloseBtn").hide();
                        $("#searchBtn").hide();
                        ContactsUl.find(".noContacts").hide();
                        if ($(".LetterchatContainer .tabCon .onlineContacts").hasClass("activeTitle")) {
                            $(".LetterchatContainer .tabCon .onlineContacts").removeClass("activeTitle");
                            $(".LetterchatContainer .tabCon .allContacts ").addClass("activeTitle");
                        }
                        $("#allContactsGroup .ContactsUl .contactsPeopleContent:first").addClass("activeContacts");
                        $("#allContactsGroup").find(".noContacts").hide();
                        $("#allContactsGroup").find(".allContactsUl").show();

                        $(".LetterchatContainer .rightCon .noContactsContaner").hide();
                        $("#chatTop").attr("data-gagaID", gagaID);
                        $("#chatTop .HeadImg").attr("src", qiniuImgURL + reg.obj.membBigimg);
                        $("#chatTop .NickName").text(reg.obj.membNickname);
                        $("#chatTop .country").text(getMemberCountryInfo(myLanguage, reg.obj.membCountry));
                        $("#chatTop .age").text(reg.obj.age);
                        $("#chatTop .addFriend").attr("data-friend", reg.obj.isFriend);
                        $("#chatMiddle .chatCon").attr("data-gagaID", gagaID);
                        $("#chatMiddle").children("[data-gagaID =" + gagaID + "]").children(".chatConDiv").mCustomScrollbar({});
                        if (reg.obj.isFriend == 0) {
                            $("#chatTop .addFriend").css("display", "inline-block");
                        }
                        if (reg.obj.pb == 1) {
                            $("#chatTop .funShieldState").attr("data-shield", 0).text($.t("im.cancelShield"));
                        } else {
                            $("#chatTop .funShieldState").attr("data-shield", 1).text($.t("im.Shield"));
                        }
                        that.ajxaLateHistorical(gagaID);
                        // $("#chatConBottom [langs-lang=" + reg.obj.membLanguage + "]").click();
                        $("#LetterchatBox").show();
                        $.Letter.postCurrentChatPeople(gagaID);
                        $("#LetterchatBox").show();

                    }



                } else {}
            },
            error: function() {}

        });
    },
    /*------接受消息---------------*/
    ReceiveMessage: function(msg) {
        var that = this;
        //console.log("receiveMessage:" + JSON.stringify(msg));
        //console.log("receiveMessage:" + msg);
        //isPl 0：普通消息 1：打招呼 2.更新头像 3.发布动态 
        //hb红包

        var ContactsUl = $(".LetterchatContainer .leftCon .ContactsUl");

        if (ContactsUl.children("[data-gagaID = " + msg.sid + "]").html()) {
            //0:正常消息,1:打招呼，2.刚刚更新头像，3.刚刚发布动态的
            /**
             * 是否为漂流瓶
             * 0	不是
             * 1	新注册的
             * 2	刚刚更新头像的
             * 3	刚刚发布动态的
             * 4	一键50人
             * 5	男性用户,条数不够,推送给女方的提示
             * 6	女方5分钟没有点击链接,推送给男方的提示
             * 7	女方点击链接,推送给男方的提示
             * 8	男方充值后,给女方的提示
             * 9	屏蔽对方提示
             * 10	取消屏蔽对方提示
             * 11	退出群提示
             * 12	邀请好友进入群提示
             */
        	//包含敏感信息跳出
            if(msg.cot.status ==1){
               return;
            }



            var getDate = $.fn.returnTime(msg.ct, "full", "YYYY-MM-DD hh:mm");
            var NickName = ContactsUl.children("[data-gagaID =" + msg.sid + "]").attr("data-nickname");
            var receiveMessageDiv = "";
            //var getDate = jsonDateFormatReceive(new Date(msg.ct).Format("yyyy-MM-dd hh:mm"));
            var tm = TimeDifference2(getDate, that.TimeArr[msg.sid]);
            if (tm != "") {
                   that.TimeArr[msg.sid] = getDate;
                }
            if ($("#chatMiddle").children("[data-gagaID = " + msg.sid + "]").html()) {
                if (tm != "") {
                    receiveMessageDiv += '<p class="chatTime">' + getDate.substr(11, 5) + '</p>';
                }
                if (msg.cot.hb) {
                    receiveMessageDiv += '<div class="receiveRedEnvelope LetterchatMessage" data-ranid="' + msg.id + '" data-money="' + msg.cot.hb.mn + '" data-Open="' + msg.cot.hb.isop + '" data-con="' + msg.cot.hb.msg + '">' +
                        '<div><div class="receiveNickName NickName">' + NickName + '</div></div>' +
                        '<div class="receiveRedContainer"><span class="RedEnvelopeImg"></span>';
                    if (msg.cot.hb.isop == 0) {
                        receiveMessageDiv += '<span class="RedEnvelopeWord">' + $.t("Letter.nowOpenRed") + '</span>';
                    }
                    if (msg.cot.hb.msg) {
                        receiveMessageDiv += '<div class="TranslateBtnConainer"><i class="receiveTranslateBtn translateBtn"></i><div class="receivelanChoice lanChoice"><i class="lanI"></i>' + $.IM.languageListStr + '<div class="clear"></div></div></div>';
                    }
                    receiveMessageDiv += '</div>';
                    if (msg.cot.hb.msg) {
                        receiveMessageDiv += '<div><div class="RedEnvelopeTranslationCon receiveTranslationContainer" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="RedEnvelopeTranslation receiveTranslation "></p></div></div>';
                    }
                    receiveMessageDiv += '</div><div class="cleard"></div>';
                } else {
                    if (msg.cot.isPl == 0 || msg.cot.isPl == 4) {                       
                        
                        receiveMessageDiv += '<div class="receiveMessage LetterchatMessage" data-ranid="' + msg.id + '"> <div class="receiveNickName NickName">' + NickName + '</div><div class="receiveContainer msgContent fl">';
                        if (msg.cot.msg.content) {
                           if(msg.cot.msg.iscs){
                               var  content =  $.IM.replace_em(msg.cot.msg.content)
                                    content = content.replace(/&lt;/g, '<');
                                    content = content.replace(/&gt;/g, '>');
                               receiveMessageDiv += '<div class="OriginalCon"><span class="receiveOriginal Original">' + content+ '</span>';    
                           }else{
                              receiveMessageDiv += '<div class="OriginalCon"><span class="receiveOriginal Original">' + $.IM.replace_em(msg.cot.msg.content) + '</span>';    
                           } 
                            
                            
                              
                            if(msg.cot.tl && $.IM.deleteQQFace(msg.cot.msg.content).trim()){
                                if(!msg.cot.tl.tr){
                                     receiveMessageDiv += '<div class="TranslateBtnConainer"><i class="receiveTranslateBtn receiveTranslateIng"></i></div>';
                                }
                            }else{
                                if($.IM.deleteQQFace(msg.cot.msg.content).trim()){
                                     if(!msg.cot.msg.iscs){
                                         receiveMessageDiv += '<div class="TranslateBtnConainer"><i class="receiveTranslateBtn translateBtn"></i><div class="receivelanChoice lanChoice"><i class="lanI"></i>' + $.IM.languageListStr + '<div class="clear"></div></div></div>';
                                     } 
                                }
                            } 
                        }
                        receiveMessageDiv += '</div>';

                        if (msg.cot.tl && msg.cot.tl.tr) {
                            receiveMessageDiv += '<div class="receiveTranslationContainer"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation">' + msg.cot.tl.tr + '</p></div>';
                        } else if (msg.cot.tl && !msg.cot.tl.tr) {
                            receiveMessageDiv += '<div class="receiveTranslationContainer" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation"></p></div>';
                        }
                        if (!msg.cot.tl) {
                            receiveMessageDiv += '<div class="receiveTranslationContainer" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation"></p></div>';
                        }
                        if (msg.cot.msg.img) {
                            receiveMessageDiv += '<div class="bigImgBtn"><img class="receiveImg" src="' + msg.cot.msg.img + '"></div>';
                        }
                        receiveMessageDiv += '</div><div class="clear"></div></div><div class="cleard"></div>';

                    } else if (msg.cot.isPl == 1) {
                        receiveMessageDiv += '<div class="firstLogin LetterchatMessage" data-ranid="' + msg.id + '"><div class="receiveNickName NickName">' + NickName + '</div><div class="receiveOriginal Original">' + $.t("Letter.firstCome") + '</div><div class="HelloBtn">' + $.t("Letter.hello") + ' </div></div><div class="cleard"></div>';
                    } else if (msg.cot.isPl == 2) {
                        receiveMessageDiv += '<div class="goClickLike LetterchatMessage" data-ranid="' + msg.id + '"><div class="receiveNickName NickName">' + NickName + '</div><div class="receiveOriginal Original">' + $.t("Letter.updateHead") + '</div><div class="clickLikeBtn">' + $.t("Letter.clickLike") + '</div></div><div class="cleard"></div>';
                    } else if (msg.cot.isPl == 3) {
                        receiveMessageDiv += '<div class="receiveDynamicMood LetterchatMessage" data-ranid="' + msg.id + '"><div class="receiveNickName NickName">' + NickName + '</div>';
                        receiveMessageDiv += '<div><div class="DynamicMoodTXT">' + $.IM.replace_em(msg.cot.msg.content) + '</div></div>';
                        /* if(msg.cot.msg.img){
                            receiveMessageDiv +='<div class="bigImgBtn"><img class="receiveImg" src="'+msg.cot.msg.img+'"> </div>'; 
                         }*/

                        receiveMessageDiv += '<div class="dynamicBtn">' + $.t("Letter.clickLike") + '</div></div><div class="cleard"></div>';
                    } else if (msg.cot.isPl == 5) {
                        receiveMessageDiv += '<div class="invitationUpgrade tips cleard" data-ranid="' + msg.id + '"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.otherPartyLetterOver") + '<a class="Upgrade cursor">' + $.t("Letter.clickHere") + '</a>' + $.t("Letter.nviteEachOtherToUpgradeServices") + '<p >' + $.t("Letter.otherPartyUpgradeGetReward") + '</p></span></div>';
                    } else if (msg.cot.isPl == 6) {
                        receiveMessageDiv += '<div class="maleUpgradeTips tips cleard" data-ranid="' + msg.id + '" data-systemTip="true"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.youLetterOver") + $.t("Letter.chatWithHer") + '<a href="' + ctx + '/pay/upgradeMember">' + $.t("Letter.clickUpgrade") + '</a> ' + $.t("Letter.or") + ' <a class="buyNum" href="javascript:void(0);" >' + $.t("Letter.payLetterNum") + '</a></span></div>';
                    } else if (msg.cot.isPl == 7) {
                        receiveMessageDiv += '<div class="maleUpgradeTips tips cleard" data-ranid="' + msg.id + '" data-systemTip="false"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.youLetterOver") + $.t("Letter.inviteYou") + '<a href="' + ctx + '/pay/upgradeMember?femaleid=' + msg.sid + '">' + $.t("Letter.upgradeMember") + '</a> ' + $.t("Letter.or") + ' <a class="buyNum" href="javascript:void(0);">' + $.t("Letter.payLetterNum") + '</a>' + $.t("Letter.chatWithHer") + '</span></div>';
                    } else if (msg.cot.isPl == 8) {
                        receiveMessageDiv += '<div class="shieldTips tips cleard" data-ranid="' + msg.id + '"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.otherPartySuccessfullyUpgraded") + $.t("Letter.systemPresentedToYou") + '<span class="moneyNum">' + msg.cot.msg.content + '</span>' + $.t("Letter.Gold") + '<a href="' + ctx + '/pay/myMoney">' + $.t("Letter.clickView") + '</a>。</span></div>';
                         $.IM.getMoneyNum();
                    } else if (msg.cot.isPl == 9) {
                        receiveMessageDiv += '<div class="femaleGetMoneyTips tips cleard" data-ranid="' + msg.id + '"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.shieldEachOtherLetter") + '</span></div>';
                    }
                    /*else if(msg.cot.isPl ==10){
                                                    receiveMessageDiv +='<div class="femaleGetMoneyTips tips cleard" data-ranid="' + msg.id + '"><span class="TipsCon"><span class="fw800">'+$.t("Letter.systemTips")+'</span>'+$.t("Letter.cancelShieldEachOtherLetter")+'</span></div>';
                                                }*/

                }

                $("#chatMiddle").children("[data-gagaID =" + msg.sid + "]").find(".LetterchatContent").append(receiveMessageDiv);
                $("#chatMiddle").children("[data-gagaID =" + msg.sid + "]").children(".chatConDiv").mCustomScrollbar("update");
                $("#chatMiddle").children("[data-gagaID =" + msg.sid + "]").children(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
            }
            if ($.inArray(msg.sid, that.ShieldArr) == -1) {
                var allContactsLi = $("#allContactsGroup .ContactsUl").children("[data-gagaID =" + msg.sid + "]");
                var online = allContactsLi.attr("data-online");
                if (ContactsUl.children(".activeContacts").attr("data-gagaID") != msg.sid) {
                    var num = allContactsLi.find(".newsNum").text();
                    if (num == "99+") {
                        num = "99+";
                    } else {
                        num++;
                        if(num == 100){
                             num = "99+";
                            
                            allContactsLi.find(".newsNum").removeClass("newsNumSingle").addClass("newsNumDouble");
                            if (online == 1) {
                               $("#onlineContactsGroup .ContactsUl").children("[data-gagaID =" + msg.sid + "]").find(".newsNum").removeClass("newsNumSingle").addClass("newsNumDouble");
                            }
                            if($("#searchResultGroup .ContactsUl").children("[data-gagaID=" + msg.sid + "]").html()){
                               $("#searchResultGroup .ContactsUl").children("[data-gagaID=" + msg.sid + "]").find(".newsNum").removeClass("newsNumSingle").addClass("newsNumDouble");
                            }
                        }else if(num > 100){
                            num = "99+";
                        }
                    }
                    allContactsLi.find(".newsNum").show().text(num);
                    if (online == 1) {
                        $("#onlineContactsGroup .ContactsUl").children("[data-gagaID =" + msg.sid + "]").find(".newsNum").show().text(num);
                    }
                    if($("#searchResultGroup .ContactsUl").children("[data-gagaID=" + msg.sid + "]").html()){
                        $("#searchResultGroup .ContactsUl").children("[data-gagaID=" + msg.sid + "]").find(".newsNum").show().text(num);
                    }

                }
                allContactsLi.hide();
                if (online == 1) {
                    if (tm != "") {
                        $("#onlineContactsGroup .ContactsUl").children("[data-gagaID =" + msg.sid + "]").find(".contactsTime").text(getDate.substr(11, 5));
                    }
                    var onlineContactsLi = $("#onlineContactsGroup .ContactsUl").children("[data-gagaID =" + msg.sid + "]");
                    $("#onlineContactsGroup .ContactsUl").children("[data-gagaID =" + msg.sid + "]").hide();
                    $("#onlineContactsGroup .ContactsUl").prepend(onlineContactsLi);
                    $("#onlineContactsGroup .ContactsUl").children("[data-gagaID =" + msg.sid + "]").show();
                    $("#onlineContactsGroup .noContacts").hide();
                    $("#onlineContactsGroup .ContactsUl").show();
                }
                if (tm != "") {
                    allContactsLi.find(".contactsTime").text(getDate.substr(11, 5));
                }
                if (allContactsLi.hasClass('onStick')) {
                    $("#allContactsGroup .ContactsUl").prepend(allContactsLi);
                } else {
                    $("#allContactsGroup .ContactsUl li.onStick:last").after(allContactsLi);
                }                
                $("#allContactsGroup .ContactsUl").children("[data-gagaID =" + msg.sid + "]").show();
                
                /*----搜索时来消息-------*/
                
            }
        } else {
            that.getNewContactsInformation(msg.sid);
        }



    },
    /*---------发送后单条翻译---收费提示 -------*/
    SendAfterTranslationDeductMoney: function(gagaID, id, content, language, th) {
        var that = this;
        var msgMoney = content;
        var data = {
            msg: msgMoney
        };
        $.ajax({
            type: "post",
            url: ctx + "/pm/getTranGold",
            data: data,
            async: false,
            dataType: "json",
            success: function(reg) {
                // console.log("发送后单条翻译扣金币："+JSON.stringify(reg));
                // console.log("发送后单条翻译扣金币："+reg);
                //1:扣费1员，0：不扣费；-1：余额不足；3：需要提示；4：不需要提示
                if (reg.success) {
                    if (reg.obj == 0 || reg.obj == 4) {
                        that.SendAfterTranslation(gagaID, id, content, language, th);
                    } else if (reg.obj == -1) {
                        var contentTip = '<div class="textCenter marT5">' + $.t("im.goldLack")  + '</div>';
                        layer.open({
                            title: false,
                            content: contentTip,
                            skin: 'noTitleTips',
                            btn: [$.t("im.ToRecharge")],
                            yes: function(index, layero) {
                                window.location.href = ctx + "/pay/recharge";
                                layer.close(index);
                            }
                        });
                    }else if(reg.obj == 3){
                         var contentTip = '<div class="textCenter marT5"><div class="deductMoneyTXT">' + $.t("im.translationNeeds") + $.t("im.goldContinue") + '</div></div>';
                        layer.open({
                            title: false,
                            content: contentTip,
                            skin: 'noTitleTips',
                            btn: [$.t("global.ok"), $.t("global.cancel")],
                            yes: function(index, layero) {
                                $.post(ctx + "/pm/okTransTip",function(msg){})
                                that.SendAfterTranslation(gagaID, id, content, language, th);
                                layer.close(index);
                            },
                            cancel: function(index) {
                                layer.close(index);
                            },
                        });
                    
                    }

                } else {}



            },
            error: function() {}
        });
    },
    /*---------发送后单条翻译----------*/
    SendAfterTranslation: function(gagaID, id, content, language, th) {
        var that = this;
        var data = {
            rid: gagaID,
            msgId: id,
            msg: content,
            to: language
        };
        //console.log("发送后单条翻译内容:"+data);
        $.ajax({
            url: ctx + "/pm/translate",
            data: data,
            type: 'post',
            cache: false,
            dataType: 'json',
            success: function(reg) {
                 //console.log("发送后单条翻译" + JSON.stringify(reg));
                 //console.log("发送后单条翻译" + reg);
                if (reg.success) {
                    $.IM.getMoneyNum();
                    $.IM.getTranslationCharacterNum();
                    if (reg.obj.result == "") {
                        if (th.parents(".LetterchatMessage").hasClass("receiveRedEnvelope")) {
                            th.parents(".LetterchatMessage").find(".TranslateBtnConainer").css("right", "-25px");
                        } else if (th.parents(".LetterchatMessage").hasClass("sendRedEnvelope")) {
                            th.parents(".LetterchatMessage").find(".TranslateBtnConainer").css("right", "-25px");
                            th.parents(".LetterchatMessage").find(".sendRedContainer").css("margin-right", "15px");
                        }
                        th.parents(".LetterchatMessage").find(".translateBtn").addClass("receiveTranslateIng").removeClass("translateBtn");
                    } else {
                        th.parents(".LetterchatMessage").find(".translateBtn").hide();
                        th.parents(".LetterchatMessage").find(".receiveTranslationContainer").show();
                        th.parents(".LetterchatMessage").find(".receiveTranslation").html($.IM.replace_em(reg.obj.result)).css("color", "#333").show();

                    }
                } else {
                    layer.msg($.t("im.translationFailed"), {time: 2000 }, function() {});
                }
            },
            error: function() {}
        });
    },
    /*---------发送后单条翻译-----接受对方推的译文----------*/
    SendAfterTranslationPush: function(msg) {
        var that = this;
        var div = $("#chatMiddle").children("[data-gagaID = " + msg.rid + "]").find("[data-ranid=" + msg.msgid + "]");

        if (msg.result == "") {
            if (div.hasClass("receiveRedEnvelope")) {
                div.find(".TranslateBtnConainer").css("right", "-25px");
            } else if (div.hasClass("sendRedEnvelope")) {
                div.find(".TranslateBtnConainer").css("right", "-25px");
                div.find(".sendRedContainer").css("margin-right", "15px");
            }

            div.find(".translateBtn").addClass("receiveTranslateIng").removeClass("translateBtn");
            //div.find(".receiveTranslation").text( $.t("im.translating")).show;
        } else {
            
            div.find(".TranslateBtnConainer").children("i").hide();    
            div.find(".receiveTranslationContainer").show();
            div.find(".receiveTranslation").text($.IM.replace_em(msg.result)).show();
        }
    },
    /*------------请求最近10条消息--------------*/
    ajxaLateHistorical: function(gagaID) {
    	$("#chatMiddle").partialLoader();
        var that = this;
        // console.log("10条消息");
        var ContactsUl = $(".LetterchatContainer .leftCon .ContactsUl");
        var nickname = ContactsUl.children("[data-gagaID =" + gagaID + "]").attr("data-nickname");
        var data = {
            rid: gagaID
        };
        $.ajax({
            type: "post",
            url: ctx + "/pm/getChatTop10",
            data: data,
            async: true,
            dataType: "json",
            success: function(reg) {
                //console.log("最近10条:" + JSON.stringify(reg));
                //console.log("最近10条:" + reg);
                /**
                 * 0	正常消息
                 * 1	新注册的(打招呼)
                 * 2	刚刚更新头像的
                 * 3	刚刚发布动态的
                 * 4	一键50人
                 * 5	男性用户,条数不够,推送给女方的提示
                 * 6	女方5分钟没有点击链接,推送给男方的提示
                 * 7	女方点击链接,推送给男方的提示
                 * 8	男方充值后,给女方的提示
                 * 9	屏蔽对方提示
                 * 10	取消屏蔽对方提示
                 * 11	退出群提示
                 * 12	邀请好友进入群提示
                 * 13   男性用户,条数不够,推送给女方的提示(过期)
                 */
                var noReadNum = reg.obj? reg.obj.fwds : 0;
                var dataMSG = reg.obj? reg.obj.news : '';
                var nowTime = $.fn.returnTime(reg.attributes.currDate, "full", "YYYY-MM-DD hh:mm");
            
            
            
            
                if (dataMSG.length > 9) {
                    $("#chatMiddle").children("[data-gagaID =" + gagaID + "]").find(".moreNews").show();
                }
                for (var i = 0; i < dataMSG.length; i++) {
                	//敏感信息跳出
                   /* if(dataMSG[i].cot.status =="1"){
                       continue;
                    }*/
                	
                    var chatContentDiv = '';
                    //var getDate = new Date(dataMSG[i].ct).Format("yyyy-MM-dd hh:mm");
                    var getDate = $.fn.returnTime(dataMSG[i].ct, "full", "YYYY-MM-DD hh:mm");
                    //console.log(that.TimeArr[gagaID]);
                    var tm = TimeDifference2(getDate, that.TimeArr[gagaID],nowTime);
                    if (tm != "") {
                        if (dataMSG[i].cot.isPl == 1 || dataMSG[i].cot.isPl == 2 || dataMSG[i].cot.isPl == 3 || dataMSG[i].cot.isPl == 5 || dataMSG[i].cot.isPl == 6 || dataMSG[i].cot.isPl == 7 || dataMSG[i].cot.isPl == 8 || dataMSG[i].cot.isPl == 9 || dataMSG[i].cot.isPl == 10 || dataMSG[i].cot.isPl == 13) {
                            if (dataMSG[i].sid != myId && dataMSG[i].cot.status =="0") {
                                that.TimeArr[gagaID] = getDate;
                                chatContentDiv += '<p class="chatTime cleard">' + tm + '</p>';
                            }
                        } else {
                            that.TimeArr[gagaID] = getDate;
                            chatContentDiv += '<p class="chatTime cleard">' + tm + '</p>';
                        }
                    }

                    if (dataMSG[i].sid == myId) {                        
                        if (dataMSG[i].cot.hb) {
                            chatContentDiv += '<div class="sendRedEnvelope LetterchatMessage fr cleard" data-ranid="' + dataMSG[i].id + '"  data-money="' + dataMSG[i].cot.hb.mn + '" data-Open="' + dataMSG[i].cot.hb.isop + '" data-con="' + dataMSG[i].cot.hb.msg + '"><div><div class="sendNickName NickName fr">' + myNickname + '</div>';

                            if (myMemberGrade == "3") {
                                if (noReadNum > 0) {
                                    chatContentDiv += '<span class="newsState read fr" style="display:block">' + $.t("im.noRead") + '</span><i class="readHorn fr" style="display:none"></i>';
                                    noReadNum--;
                                } else {
                                    chatContentDiv += '<span class="newsState read fr" style="display:block;color:#97a7c3">' + $.t("im.read") + '</span><i class="readHorn fr" style="display:block"></i>';
                                }
                            } else {
                                chatContentDiv += '<span class="newsState read fr" style="display:none;"></span><i class="readHorn fr" style="display:none"></i>';
                            }
                            chatContentDiv += '</div>';

                            if (dataMSG[i].cot.hb.msg && dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                chatContentDiv += '<div class="sendRedContainer fr cleard" style="margin-right: 15px;">';
                            } else {
                                chatContentDiv += '<div class="sendRedContainer fr cleard">';
                            }
                            chatContentDiv += '<span class="RedEnvelopeImg"></span><span class="RedEnvelopeWord">' + $.t("Letter.checkred") + '</span>';
                            if (dataMSG[i].cot.hb.msg && dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                chatContentDiv += '<div class="TranslateBtnConainer" style="right:-25px;"><i class="sendTranslateBtn receiveTranslateIng"></i></div>';
                            }
                            if (dataMSG[i].cot.hb.msg && !dataMSG[i].cot.tl) {
                                chatContentDiv += '<div class="TranslateBtnConainer"><i class="sendTranslateBtn translateBtn"></i><div class="sendlanChoice lanChoice"><i class="lanI"></i>' + $.IM.languageListStr + '<div class="clear"></div></div></div>';
                            }
                            chatContentDiv += '</div>';
                            chatContentDiv += '<div class="sendFailTip" style="display:none"></div>';
                            if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr) {
                                chatContentDiv += '<div><div class="RedEnvelopeTranslationCon fr receiveTranslationContainer"><i class="receiveTranslationContainerHorn"></i><p class="RedEnvelopeTranslation receiveTranslation">' + $.IM.replace_em(dataMSG[i].cot.tl.tr) + '</p></div></div>';
                            } else if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                chatContentDiv += '<div><div class="RedEnvelopeTranslationCon fr receiveTranslationContainer" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="RedEnvelopeTranslation receiveTranslation"></p></div></div>';
                            } else if (dataMSG[i].cot.hb.msg && !dataMSG[i].cot.tl) {
                                chatContentDiv += '<div><div class="RedEnvelopeTranslationCon fr receiveTranslationContainer" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="RedEnvelopeTranslation receiveTranslation"></p></div></div>';
                            }
                            chatContentDiv += '</div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 0 || dataMSG[i].cot.isPl == 4) {
                            chatContentDiv += '<div class="sendMessage LetterchatMessage fr cleard" data-ranid="' + dataMSG[i].id + '"><div><div class="sendNickName NickName fr">' + myNickname + '</div>';

                            if (myMemberGrade == "3") {
                                if((dataMSG.length - i )<= noReadNum){
                                //if (noReadNum > 0) {
                                    chatContentDiv += '<span class="newsState read fr" style="display:block">' + $.t("im.noRead") + '</span><i class="readHorn fr" style="display:none"></i>';
                                   // noReadNum--;
                                } else {
                                    chatContentDiv += '<span class="newsState read fr" style="display:block;color:#97a7c3">' + $.t("im.read") + '</span><i class="readHorn fr" style="display:block"></i>';
                                }
                            } else {
                                chatContentDiv += '<span class="newsState read fr" style="display:none;"></span><i class="readHorn fr" style="display:none"></i>';
                            }
                            chatContentDiv += '</div>';
                            chatContentDiv += '<div class="sendContainer msgContent fr cleard">';
                            if (dataMSG[i].cot.msg.content) {
                                chatContentDiv += ' <div class="OriginalCon"><span class="sendOriginal Original">' + $.IM.replace_em(dataMSG[i].cot.msg.content) + '</span>';
                                chatContentDiv += '<div class="TranslateBtnConainer">';
                                if (dataMSG[i].cot.tl) {
                                    if (dataMSG[i].cot.tl.tr) {
                                        chatContentDiv += '<i class="sendTranslateBtn translatBtn" style="display:none"></i>';
                                    } else {
                                        chatContentDiv += '<i class="sendTranslateBtn receiveTranslateIng"></i>';
                                    }

                                } else {
                                    if (dataMSG[i].cot.msg.content && $.IM.deleteQQFace(dataMSG[i].cot.msg.content).trim() != "") {
                                        chatContentDiv += '<i class="sendTranslateBtn translateBtn"></i>';
                                    }
                                }
                                chatContentDiv += ' <div class="sendlanChoice lanChoice" style="display:none"><i class="lanI"></i>' + $.IM.languageListStr + '<div class="clear"></div></div></div></div>';
                                if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr) {
                                    chatContentDiv += '<div class="receiveTranslationContainer fr"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation">' + $.IM.replace_em(dataMSG[i].cot.tl.tr) + '</p></div>';
                                } else if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                    /*chatContentDiv += '<div class="receiveTranslationContainer fr"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation">' + $.t("im.translating") + '</p></div>';*/
                                    chatContentDiv += '<div class="receiveTranslationContainer fr" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation"></p></div>';
                                } else if (!dataMSG[i].cot.tl) {
                                    chatContentDiv += '<div class="receiveTranslationContainer fr" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation"></p></div>';
                                }
                            }
                            if (dataMSG[i].cot.msg.img) {
                                chatContentDiv += '<div class="bigImgBtn cleard fr"><img class="receiveImg" src="' + dataMSG[i].cot.msg.img + '"></div>';
                            }
                            chatContentDiv += '</div><div class="sendFailTip" style="display:none"></div><div class="clear"></div></div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 1) {
                            /*chatContentDiv += '<div class="firstHello LetterchatMessage fr cleard" data-ranid="' + dataMSG[i].id + '"><div><div class="sendNickName NickName fr">' + myNickname + '</div>';
                            if(myMemberGrade=="3"){
                                if (noReadNum > 0) {
                                   chatContentDiv += '<span class="newsState read fr" style="display:block">'+$.t("im.noRead")+'</span><i class="readHorn fr" style="display:none"></i>';
                                    noReadNum--;
                                } else {
                                    chatContentDiv += '<span class="newsState read fr" style="display:block;color:#97a7c3">'+$.t("im.read")+'</span><i class="readHorn fr" style="display:block"></i>';
                                }
                            }else{
                                chatContentDiv += '<span class="newsState read fr" style="display:none;"></span><i class="readHorn fr" style="display:none"></i>'; 
                            }
                            chatContentDiv += '</div>    <div class="sendContainer msgContent fr cleard"><div class="OriginalCon"><span class="sendOriginal Original">'+dataMSG[i].cot.msg.content+'</span></div></div><div class="sendFailTip" style="display:none"></div></div><div class="cleard"></div>';*/
                        } else if (dataMSG[i].cot.isPl == 2) {
                            /* chatContentDiv += '<div class="clickLike LetterchatMessage fr cleard" data-ranid="' + dataMSG[i].id + '"><div><div class="sendNickName NickName fr">' + myNickname + '</div>';
                             if(myMemberGrade=="3"){
                                 if (noReadNum > 0) {
                                    chatContentDiv += '<span class="newsState read fr" style="display:block">'+$.t("im.noRead")+'</span><i class="readHorn fr" style="display:none"></i>';
                                     noReadNum--;
                                 } else {
                                     chatContentDiv += '<span class="newsState read fr" style="display:block;color:#97a7c3">'+$.t("im.read")+'</span><i class="readHorn fr" style="display:block"></i>';
                                 }
                             }else{
                                 chatContentDiv += '<span class="newsState read fr" style="display:none;"></span><i class="readHorn fr" style="display:none"></i>'; 
                             }
                             
                             chatContentDiv += '</div><div class="sendContainer msgContent fr"><div class="OriginalCon"><span class="sendOriginal Original">'+dataMSG[i].cot.msg.content+'</span></div></div><div class="sendFailTip" style="display:none"></div></div><div class="cleard"></div>';*/
                        } else if (dataMSG[i].cot.isPl == 3) {
                            /*chatContentDiv += '<div class="sendMessage LetterchatMessage fr cleard" data-ranid="' + dataMSG[i].id + '"><div><div class="sendNickName NickName fr">' + myNickname + '</div>';
                            if(myMemberGrade=="3"){
                                if (noReadNum > 0) {
                                   chatContentDiv += '<span class="newsState read fr cleard" style="display:block">'+$.t("im.noRead")+'</span><i class="readHorn fr" style="display:none"></i>';
                                    noReadNum--;
                                } else {
                                    chatContentDiv += '<span class="newsState read fr cleard" style="display:block;color:#97a7c3">'+$.t("im.read")+'</span><i class="readHorn fr" style="display:block"></i>';
                                }
                            }else{
                                chatContentDiv += '<span class="newsState read fr" style="display:none;"></span><i class="readHorn fr" style="display:none"></i>'; 
                            }
                   
                            chatContentDiv += '</div>';
                            chatContentDiv += '<div class="sendContainer msgContent fr cleard">';
                                chatContentDiv += ' <div class="OriginalCon"><span class="sendOriginal Original DynamicMoodTXT">' + $.IM.replace_em(dataMSG[i].cot.msg.content) + '</span>';
                            chatContentDiv += '</div><div class="sendFailTip" style="display:none"></div><div class="clear"></div></div><div class="cleard"></div>';  */
                        }


                        // $("#chatMiddle").children("[data-gagaID =" + dataMSG[i].sid + "]").find(".LetterchatContent").append(chatContentDiv);
                    } else {
                        //敏感信息跳出
                         if(dataMSG[i].cot.status =="1"){
                            continue;
                         }
                        
                        
                        if (dataMSG[i].cot.hb) {
                            chatContentDiv += '<div class="receiveRedEnvelope LetterchatMessage cleard" data-ranid="' + dataMSG[i].id + '" data-money="' + dataMSG[i].cot.hb.mn + '" data-Open="' + dataMSG[i].cot.hb.isop + '" data-con="' + dataMSG[i].cot.hb.msg + '"><div><div class="receiveNickName NickName">' + nickname + '</div></div><div class="receiveRedContainer"><span class="RedEnvelopeImg"></span>';
                            if (dataMSG[i].cot.hb.isop == 1) {
                                chatContentDiv += '<span class="RedEnvelopeWord">' + $.t("Letter.redPacketsReceive") + '</span>';
                            } else {
                                chatContentDiv += '<span class="RedEnvelopeWord">' + $.t("Letter.nowOpenRed") + '</span>';
                            }
                            if (dataMSG[i].cot.hb.msg && !dataMSG[i].cot.tl) {
                                chatContentDiv += '<div class="TranslateBtnConainer"><i class="receiveTranslateBtn translateBtn"></i><div class="receivelanChoice lanChoice" style="display:none"><i class="lanI"></i>' + $.IM.languageListStr + '<div class="clear"></div></div></div>';
                            }
                            if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                chatContentDiv += '<div class="TranslateBtnConainer" style="right:-25px" ><i class="receiveTranslateBtn receiveTranslateIng"></i></div>';
                            }
                            chatContentDiv += '</div>';

                            if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr) {
                                chatContentDiv += '<div><div class="RedEnvelopeTranslationCon receiveTranslationContainer"><i class="receiveTranslationContainerHorn"></i><p class="RedEnvelopeTranslation receiveTranslation">' + $.IM.replace_em(dataMSG[i].cot.tl.tr) + '</p></div></div>';
                            } else if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                /* chatContentDiv += '<div><div class="RedEnvelopeTranslationCon fr receiveTranslationContainer"><i class="receiveTranslationContainerHorn"></i><p class="RedEnvelopeTranslation receiveTranslation ">' + $.t("im.translating") + '</p></div></div>';*/
                                chatContentDiv += '<div><div class="RedEnvelopeTranslationCon fl receiveTranslationContainer" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="RedEnvelopeTranslation receiveTranslation"></p></div></div>';
                            } else if (!dataMSG[i].cot.tl) {
                                chatContentDiv += '<div><div class="RedEnvelopeTranslationCon fl receiveTranslationContainer" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="RedEnvelopeTranslation receiveTranslation"></p></div></div>';
                            }
                            chatContentDiv += '</div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 0 || dataMSG[i].cot.isPl == 4) {
                            chatContentDiv += '<div class="receiveMessage LetterchatMessage cleard" data-ranid="' + dataMSG[i].id + '"><div class="receiveNickName NickName">' + nickname + '</div><div class="receiveContainer msgContent fl">';
                            if (dataMSG[i].cot.msg.content) {
                                if(dataMSG[i].cot.msg.iscs){
                                    var  content =  $.IM.replace_em(dataMSG[i].cot.msg.content);
                                    content = content.replace(/&lt;/g, '<');
                                    content = content.replace(/&gt;/g, '>');
                                    chatContentDiv += '<div class="OriginalCon"><span class="receiveOriginal Original">' +content + '</span>';
                                }else{
                                   chatContentDiv += '<div class="OriginalCon"><span class="receiveOriginal Original">' + $.IM.replace_em(dataMSG[i].cot.msg.content) + '</span>';
                                }
                                chatContentDiv += '<div class="TranslateBtnConainer">';
                                if (dataMSG[i].cot.tl) {
                                    if (dataMSG[i].cot.tl.tr) {
                                        chatContentDiv += '<i class="receiveTranslateBtn translateBtn" style="display:none"></i>';
                                    } else {
                                        chatContentDiv += '<i class="receiveTranslateBtn receiveTranslateIng"></i>';
                                    }

                                } else {
                                    if (dataMSG[i].cot.msg.content && $.IM.deleteQQFace(dataMSG[i].cot.msg.content).trim() != "" && !dataMSG[i].cot.msg.iscs) {
                                        chatContentDiv += '<i class="receiveTranslateBtn translateBtn"></i>';
                                    }
                                }
                                chatContentDiv += '<div class="receivelanChoice lanChoice" style="display:none"><i class="lanI"></i>' + $.IM.languageListStr + '<div class="clear"></div></div></div></div>';

                                if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr) {
                                    if(dataMSG[i].cot.msg.iscs){
                                        
                                         var  content = $.IM.replace_em(dataMSG[i].cot.tl.tr)
                                         content = content.replace(/&lt;/g, '<');
                                         content = content.replace(/&gt;/g, '>');
                                        chatContentDiv += ' <div class="receiveTranslationContainer"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation">' + content + '</p></div>';
                                    }else{
                                        chatContentDiv += ' <div class="receiveTranslationContainer"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation">' + $.IM.replace_em(dataMSG[i].cot.tl.tr) + '</p></div>';
                                    }
                                    
                                    
                                    

                                } else if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                    /*chatContentDiv += ' <div class="receiveTranslationContainer"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation">' + $.t("im.translating") + '</p></div>';*/
                                    chatContentDiv += ' <div class="receiveTranslationContainer" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation"></p></div>';

                                } else if (!dataMSG[i].cot.tl) {
                                    chatContentDiv += ' <div class="receiveTranslationContainer" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation"></p></div>';
                                }
                            }
                            if (dataMSG[i].cot.msg.img) {
                                chatContentDiv += '<div class="bigImgBtn"><img class="receiveImg" src="' + dataMSG[i].cot.msg.img + '"></div>';
                            }
                            chatContentDiv += '</div><div class="clear"></div></div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 1) {
                            chatContentDiv += '<div class="firstLogin LetterchatMessage cleard"  data-ranid="' + dataMSG[i].id + '"><div class="receiveNickName NickName">' + nickname + '</div><div class="receiveOriginal Original">' + $.t("Letter.firstCome") + ' </div><div class="HelloBtn">'+$.t("Letter.hello")+' </div></div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 2) {
                            chatContentDiv += '<div class="goClickLike LetterchatMessage cleard" data-ranid="' + dataMSG[i].id + '"><div class="receiveNickName NickName">' + nickname + '</div><div class="receiveOriginal Original">' + $.t("Letter.updateHead") + '  </div><div class="clickLikeBtn">' + $.t("Letter.clickLike") + '</div></div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 3) {
                            chatContentDiv += '<div class="receiveDynamicMood LetterchatMessage" data-ranid="' + dataMSG[i].id + '"><div class="receiveNickName NickName">' + nickname + '</div>';
                            chatContentDiv += '<div><span class="DynamicMoodTXT">' + $.IM.replace_em(dataMSG[i].cot.msg.content) + '</span></div>';
                            /* if(dataMSG[i].cot.msg.img){
                                 chatContentDiv += '<div class="bigImgBtn"><img class="receiveImg" src="' + dataMSG[i].cot.msg.img + '"></div>';
                             }*/
                            chatContentDiv += '<div class="dynamicBtn">' + $.t("Letter.clickLike") + '</div></div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 5) {
                            chatContentDiv += '<div class="invitationUpgrade tips cleard" data-ranid="' + dataMSG[i].id + '"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.otherPartyLetterOver") + '<a class="Upgrade cursor">' + $.t("Letter.clickHere") + '</a>' + $.t("Letter.nviteEachOtherToUpgradeServices") + '<p>' + $.t("Letter.otherPartyUpgradeGetReward") + '</p></span></div>';
                        } else if (dataMSG[i].cot.isPl == 6) {
                            chatContentDiv += '<div class="maleUpgradeTips tips cleard" data-systemTip="false" data-ranid="' + dataMSG[i].id + '"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.youLetterOver") + $.t("Letter.chatWithHer") + '<a href="' + ctx + '/pay/upgradeMember">' + $.t("Letter.clickUpgrade") + '</a> ' + $.t("Letter.or") + ' <a class="buyNum" href="javascript:void(0);"  >' + $.t("Letter.payLetterNum") + '</a></span></div>';
                        } else if (dataMSG[i].cot.isPl == 7) { /*HistoricalTips*/
                            chatContentDiv += '<div class="maleUpgradeTips tips  cleard" data-systemTip="true" data-ranid="' + dataMSG[i].id + '"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.youLetterOver") + $.t("Letter.inviteYou") + '<a href="' + ctx + '/pay/upgradeMember?femaleid=' + dataMSG[i].sid + '">' + $.t("Letter.upgradeMember") + '</a> ' + $.t("Letter.or") + ' <a class="buyNum" href="javascript:void(0);"  >' + $.t("Letter.payLetterNum") + '</a>' + $.t("Letter.chatWithHer") + '</span></div>';
                        } else if (dataMSG[i].cot.isPl == 8) {
                            chatContentDiv += '<div class="shieldTips tips HistoricalTips cleard" data-ranid="' + dataMSG[i].id + '"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.otherPartySuccessfullyUpgraded") + $.t("Letter.systemPresentedToYou") + '<span class="moneyNum">'+dataMSG[i].cot.msg.content+'</span>' + $.t("Letter.Gold") + '<a href="' + ctx + '/pay/myMoney">' + $.t("Letter.clickView") + '</a>。</span></div>';
                        } else if (dataMSG[i].cot.isPl == 9) {
                            chatContentDiv += '<div class="femaleGetMoneyTips tips  cleard" data-ranid="' + dataMSG[i].id + '"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.shieldEachOtherLetter") + '</span></div>';
                        } else if (dataMSG[i].cot.isPl == 10) {
                            chatContentDiv += '<div class="femaleGetMoneyTips tips  cleard" data-ranid="' + dataMSG[i].id + '"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.cancelShieldEachOtherLetter") + '</span></div>';
                        } else if (dataMSG[i].cot.isPl == 13) {
                            chatContentDiv += '<div class="invitationUpgradeOverTime tips HistoricalTips cleard" data-ranid="' + dataMSG[i].id + '"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.otherPartyLetterOver") + '<a class="Upgrade">' + $.t("Letter.clickHere") + '</a>' + $.t("Letter.nviteEachOtherToUpgradeServices") + '<p>' + $.t("Letter.otherPartyUpgradeGetReward") + '</p></span></div>';
                        }

                    }
                    $("#chatMiddle").children("[data-gagaID =" + gagaID + "]").find(".LetterchatContent").append(chatContentDiv);
                }
                $("#chatMiddle").children("[data-gagaID =" + gagaID + "]").children(".chatConDiv").mCustomScrollbar("update");
                $("#chatMiddle").children("[data-gagaID =" + gagaID + "]").children(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
                $("#chatMiddle").partialLoader("close");
            },
            error: function() {
                $("#chatMiddle").partialLoader("close");
                layer.msg($.t("im.requestFailure"), {
                    time: 2000
                }, function() {});
            }
        });
    },
    ajxaHistorical: function(gagaID, currentpage, LetterhistoryContainer, nickName, PagePD) {
        var that = this;
        LetterhistoryContainer.children(".historyCon").html("");
        LetterhistoryContainer.children(".LetternoChat").hide();
        var data = {
            rid: gagaID,
            offset: currentpage,
            size: "10"
        };
        $.ajax({
            type: "post",
            url: ctx + "/pm/getChat",
            data: data,
            async: true,
            dataType: "json",
            success: function(reg) {
                // console.log("历史纪录:" + JSON.stringify(reg));
                // console.log("历史纪录:" + reg);
                if (reg.obj.news.length > 0) {
                    if (PagePD == "true") {
                        $(".tcdPageCode").createPage({
                            pageCount: reg.obj.totalPage, //总页数
                            current: 1, //当前页
                            backFn: function(currentpage) {
                                console.log("当前页：" + currentpage);
                                PagePD = "false";
                                that.ajxaHistorical(gagaID, currentpage, LetterhistoryContainer, nickName, PagePD);
                            }
                        });
                    }
                } else {
                    LetterhistoryContainer.children(".LetternoChat").show();
                }
                //0:正常消息,1:打招呼，2.刚刚更新头像，3.刚刚发布动态的
                /**
                 * 0	正常消息
                 * 1	新注册的(打招呼)
                 * 2	刚刚更新头像的
                 * 3	刚刚发布动态的
                 * 4	一键50人
                 * 5	男性用户,条数不够,推送给女方的提示
                 * 6	女方5分钟没有点击链接,推送给男方的提示
                 * 7	女方点击链接,推送给男方的提示
                 * 8	男方充值后,给女方的提示
                 * 9	屏蔽对方提示
                 * 10	取消屏蔽对方提示
                 * 11	退出群提示
                 * 12	邀请好友进入群提示
                 * 13   男性用户,条数不够,推送给女方的提示(过期)
                 */
                var dataMSG = reg.obj.news;
                for (var i = 0; i < dataMSG.length; i++) {
                	
                	
                	
                    var chatContentDiv = '';
                    //var getDate = new Date(dataMSG[i].ct).Format("yyyy-MM-dd hh:mm");
                    var getDate = $.fn.returnTime(dataMSG[i].ct, "full", "YYYY-MM-DD hh:mm");

                    if (dataMSG[i].sid == myId) {
                        if (dataMSG[i].cot.hb) {
                            chatContentDiv += '<div class="messageContainer sendMSGContainer LetterchatMessage" data-ranid="' + dataMSG[i].id + '" data-money="' + dataMSG[i].cot.hb.mn + '" data-open="' + dataMSG[i].cot.hb.isop + '" data-con="' + dataMSG[i].cot.hb.msg + '">';
                            chatContentDiv += '<div class="nameTime"><span class="NickName sendNickName">' + myNickname + '</span><span class="Time">' + getDate + '</span></div>';
                            chatContentDiv += '<div class="RedEnvelope sendRedContainer"><span class="RedEnvelopeImg"></span><span class="RedEnvelopeWord">' + $.t("Letter.checkred") + '</span>';
                            if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                chatContentDiv += '<div class="TranslateBtnConainer" style="right:-25px;"><i class="sendTranslateBtn receiveTranslateIng"></i></div>';
                            }
                            chatContentDiv += '</div>';
                            if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr) {
                                chatContentDiv += '<div class="translateCon"><i class="translationHorn"></i><p>' + dataMSG[i].cot.tl.tr + '</p></div>';

                            }
                            /* else if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                                            chatContentDiv += '<div class="translateCon"><i class="translationHorn"></i><p>'+$.t("im.translating")+'</p></div>';
                                                        }*/
                            chatContentDiv += '</div><div class="cleard"></div>';

                        } else if (dataMSG[i].cot.isPl == 0 || dataMSG[i].cot.isPl == 4) {
                            chatContentDiv += '<div class="messageContainer sendMSGContainer LetterchatMessage" data-ranid="' + dataMSG[i].id + '"><div class="nameTime"><span class="NickName sendNickName">' + myNickname + '</span><span class="Time">' + getDate + '</span></div>';

                            if (dataMSG[i].cot.msg.content) {
                                chatContentDiv += '<div class="Original">' + $.IM.replace_em(dataMSG[i].cot.msg.content);
                                if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                    chatContentDiv += '<i class="receiveTranslateIng"></i>';
                                }
                                chatContentDiv += '</div>';
                                if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr) {
                                    chatContentDiv += '<div class="translateCon"><i class="translationHorn"></i><p>' + $.IM.replace_em(dataMSG[i].cot.tl.tr) + '</p></div>';
                                }
                                /*else if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                                                   chatContentDiv += '<div class="translateCon"><i class="translationHorn"></i><p>'+$.t("im.translating")+'</p></div>';
                                                               }*/
                            }
                            if (dataMSG[i].cot.msg.img) {
                                chatContentDiv += '<span class="bigImgBtn"><img class="historicalImg" src="' + dataMSG[i].cot.msg.img + '"></span>';
                            }
                            chatContentDiv += '</div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 1) {
                            /*chatContentDiv += '<div class="messageContainer sendMSGContainer LetterchatMessage" data-ranid="' + dataMSG[i].id + '"><div class="nameTime"><span class="NickName sendNickName">' + myNickname + '</span><span class="Time">' + getDate + '</span></div><div class="Original">'+dataMSG[i].cot.msg.content+'</div></div><div class="cleard"></div>';*/
                        } else if (dataMSG[i].cot.isPl == 2) {
                            /*chatContentDiv += '<div class="messageContainer sendMSGContainer LetterchatMessage" data-ranid="' + dataMSG[i].id + '"><div class="nameTime"><span class="NickName sendNickName">' + myNickname + '</span><span class="Time">' + getDate + '</span></div><div class="Original">'+dataMSG[i].cot.msg.content+'</div></div><div class="cleard"></div>';*/
                        }

                    } else {
                         //敏感信息跳出
                         if(dataMSG[i].cot.status =="1"){
                            continue;
                         }
                        
                        
                        if (dataMSG[i].cot.hb) {
                            chatContentDiv += '<div class="messageContainer receiveMSGContainer LetterchatMessage" data-ranid="' + dataMSG[i].id + '" data-money="' + dataMSG[i].cot.hb.mn + '" data-open="' + dataMSG[i].cot.hb.isop + '" data-con="' + dataMSG[i].cot.hb.msg + '">';
                            chatContentDiv += '<div class="nameTime"><span class="NickName receiveNickName">' + nickName + '</span><span class="Time">' + getDate + '</span></div>';
                            chatContentDiv += '<div class="RedEnvelope receiveRedContainer"><span class="RedEnvelopeImg"></span>';
                            if (dataMSG[i].cot.hb.isop == 1) {
                                chatContentDiv += '<span class="RedEnvelopeWord">' + $.t("Letter.redPacketsReceive") + '</span>';
                            } else {
                                chatContentDiv += '<span class="RedEnvelopeWord">' + $.t("Letter.nowOpenRed") + '</span>';
                            }
                            if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                chatContentDiv += '<div class="TranslateBtnConainer" style="right:-25px;"><i class="sendTranslateBtn receiveTranslateIng"></i></div>';
                            }
                            chatContentDiv += '</div>';
                            if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr) {
                                chatContentDiv += '<div class="translateCon"><i class="translationHorn"></i><p>' + dataMSG[i].cot.tl.tr + '</p></div>';
                            }
                            /*else if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                                           chatContentDiv += '<div class="translateCon"><i class="translationHorn"></i><p>'+$.t("im.translating")+'</p></div>';
                                                       }*/
                            chatContentDiv += '</div><div class="cleard"></div>';

                        } else if (dataMSG[i].cot.isPl == 0 || dataMSG[i].cot.isPl == 3 || dataMSG[i].cot.isPl == 4) {
                            chatContentDiv += '<div class="messageContainer receiveMSGContainer LetterchatMessage" data-ranid="' + dataMSG[i].id + '">';
                            chatContentDiv += '<div class="nameTime"><span class="NickName receiveNickName">' + nickName + '</span><span class="Time">' + getDate + '</span></div>';
                            if (dataMSG[i].cot.msg.content) {
                                
                                
                                if(dataMSG[i].cot.msg.iscs){
                                    var  content =  $.IM.replace_em(dataMSG[i].cot.msg.content);
                                    content = content.replace(/&lt;/g, '<');
                                    content = content.replace(/&gt;/g, '>');
                                    chatContentDiv += '<div class="Original">' + content;
                                }else{
                                    chatContentDiv += '<div class="Original">' + $.IM.replace_em(dataMSG[i].cot.msg.content);
                                }                                
                                if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                    chatContentDiv += '<i class="receiveTranslateIng"></i>';
                                }
                                chatContentDiv += '</div>';
                                if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr) {
                                    chatContentDiv += '<div class="translateCon"><i class="translationHorn"></i><p>' + $.IM.replace_em(dataMSG[i].cot.tl.tr) + '</p></div>';
                                }
                                /*else if (dataMSG[i].cot.tl && dataMSG[i].cot.tl.tr == "") {
                                                                   chatContentDiv += '<div class="translateCon"><i class="translationHorn"></i><p>'+$.t("im.translating")+'</p></div>';
                                                               }*/
                            }
                            if (dataMSG[i].cot.msg.img) {
                                chatContentDiv += '<span class="bigImgBtn"><img class="historicalImg" src="' + dataMSG[i].cot.msg.img + '"></span>';
                            }
                            chatContentDiv += '</div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 1) {
                            chatContentDiv += '<div class="messageContainer sendMSGContainer LetterchatMessage" data-ranid="' + dataMSG[i].id + '"><div class="nameTime"><span class="NickName sendNickName">' + nickName + '</span><span class="Time">' + getDate + '</span></div><div class="Original">' + $.t("Letter.firstCome") + '</div></div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 2) {
                            chatContentDiv += '<div class="messageContainer sendMSGContainer LetterchatMessage" data-ranid="' + dataMSG[i].id + '"><div class="nameTime"><span class="NickName sendNickName">' + nickName + '</span><span class="Time">' + getDate + '</span></div><div class="Original">' + $.t("Letter.updateHead") + '</div></div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 3) {
                            chatContentDiv += '<div class="messageContainer sendMSGContainer LetterchatMessage" data-ranid="' + dataMSG[i].id + '"><div class="nameTime"><span class="NickName sendNickName">' + nickName + '</span><span class="Time">' + getDate + '</span></div><div class="Original">' + $.IM.replace_em(dataMSG[i].cot.msg.content) + '</div></div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 5) {
                            chatContentDiv += '<div class="messageContainer receiveMSGContainer LetterchatMessage invitationUpgrade " data-ranid="' + dataMSG[i].id + '">';
                            chatContentDiv += '<div class="nameTime"><span class="NickName receiveNickName">' + $.t("Letter.systemTips") + '</span><span class="Time">' + getDate + '</span></div>';
                            chatContentDiv += '<div class="Original">' + $.t("Letter.otherPartyLetterOver") + '<a class="Upgrade u-line">' + $.t("Letter.clickHere") + '</a>' + $.t("Letter.nviteEachOtherToUpgradeServices") + '<p>' + $.t("Letter.otherPartyUpgradeGetReward") + '</p></div>';
                            chatContentDiv += '</div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 6) {
                            chatContentDiv += '<div class="messageContainer receiveMSGContainer LetterchatMessage maleUpgradeTips " data-systemTip="false" data-ranid="' + dataMSG[i].id + '">';
                            chatContentDiv += '<div class="nameTime"><span class="NickName receiveNickName">' + $.t("Letter.systemTips") + '</span><span class="Time">' + getDate + '</span></div>';
                            chatContentDiv += '<div class="Original">' + $.t("Letter.youLetterOver") + $.t("Letter.chatWithHer") + '<a class="c-2d57a1 u-line" href="' + ctx + '/pay/upgradeMember">' + $.t("Letter.clickUpgrade") + '</a> ' + $.t("Letter.or") + ' <a class="buyNum c-2d57a1 u-line" href="javascript:void(0);">' + $.t("Letter.payLetterNum") + '</a></div>';
                            chatContentDiv += '</div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 7) {
                            chatContentDiv += '<div class="messageContainer receiveMSGContainer LetterchatMessage maleUpgradeTips " data-systemTip="true" data-ranid="' + dataMSG[i].id + '">';
                            chatContentDiv += '<div class="nameTime"><span class="NickName receiveNickName">' + $.t("Letter.systemTips") + '</span><span class="Time">' + getDate + '</span></div>';
                            chatContentDiv += '<div class="Original">' + $.t("Letter.youLetterOver") + $.t("Letter.inviteYou") + '<a class="c-2d57a1 u-line" href="' + ctx + '/pay/upgradeMember?femaleid=' + dataMSG[i].sid + '">' + $.t("Letter.upgradeMember") + '</a> ' + $.t("Letter.or") + ' <a class="buyNum c-2d57a1 u-line" href="javascript:void(0);">' + $.t("Letter.payLetterNum") + '</a>' + $.t("Letter.chatWithHer") + '</div>';
                            chatContentDiv += '</div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 8) {
                            chatContentDiv += '<div class="messageContainer receiveMSGContainer LetterchatMessage" data-ranid="' + dataMSG[i].id + '">';
                            chatContentDiv += '<div class="nameTime"><span class="NickName receiveNickName">' + $.t("Letter.systemTips") + '</span><span class="Time">' + getDate + '</span></div>';
                            chatContentDiv += '<div class="Original">' + $.t("Letter.otherPartySuccessfullyUpgraded") + $.t("Letter.systemPresentedToYou") + '<span class="moneyNum">'+dataMSG[i].cot.msg.content+'</span>' + $.t("Letter.Gold") + '<a href="' + ctx + '/pay/myMoney">' + $.t("Letter.clickView") + '</a>。</div>';
                            chatContentDiv += '</div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 9) {
                            chatContentDiv += '<div class="messageContainer receiveMSGContainer LetterchatMessage" data-ranid="' + dataMSG[i].id + '">';
                            chatContentDiv += '<div class="nameTime"><span class="NickName receiveNickName">' + $.t("Letter.systemTips") + '</span><span class="Time">' + getDate + '</span></div>';
                            chatContentDiv += '<div class="Original">' + $.t("Letter.shieldEachOtherLetter") + '。</div>';
                            chatContentDiv += '</div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 10) {
                            chatContentDiv += '<div class="messageContainer receiveMSGContainer LetterchatMessage" data-ranid="' + dataMSG[i].id + '">';
                            chatContentDiv += '<div class="nameTime"><span class="NickName receiveNickName">' + $.t("Letter.systemTips") + '</span><span class="Time">' + getDate + '</span></div>';
                            chatContentDiv += '<div class="Original">' + $.t("Letter.cancelShieldEachOtherLetter") + '。</div>';
                            chatContentDiv += '</div><div class="cleard"></div>';
                        } else if (dataMSG[i].cot.isPl == 13) {
                            chatContentDiv += '<div class="messageContainer receiveMSGContainer LetterchatMessage invitationUpgradeOverTime" data-ranid="' + dataMSG[i].id + '">';
                            chatContentDiv += '<div class="nameTime"><span class="NickName receiveNickName">' + $.t("Letter.systemTips") + '</span><span class="Time">' + getDate + '</span></div>';
                            chatContentDiv += '<div class="Original">' + $.t("Letter.otherPartyLetterOver") + '<a class="u-line">' + $.t("Letter.clickHere") + '</a>' + $.t("Letter.nviteEachOtherToUpgradeServices") + '<p>' + $.t("Letter.otherPartyUpgradeGetReward") + '</p></div>';
                            chatContentDiv += '</div><div class="cleard"></div>';
                        }

                    }
                    $(".container .LetterhistoryContainer").children(".historyCon").append(chatContentDiv);
                }
            },
            error: function() {
                layer.msg($.t("im.requestFailure"), {
                    time: 2000
                }, function() {});
            }
        });
     },
    /*-------------清空历史纪录--------*/
    historicalDeleteFun: function(gagaID) {
        var data = {
            rid: gagaID
        };
        $.ajax({
            url: ctx + "/pm/delChat",
            data: data,
            type: 'post',
            cache: false,
            dataType: 'json',
            success: function(reg) {
                //console.log("删除历史纪录" + JSON.stringify(reg));
                //console.log("删除历史纪录" + reg);
                if (reg.success) {
                    $.Letter.TimeArr[gagaID] = "";
                    $(".LetterhistoryContainer .historyCon").html("");
                    $(".LetterhistoryContainer .tcdPageCode").html("");
                    $("#chatMiddle").children("[data-gagaID=" + gagaID + "]").find(".LetterchatContent").html("");
                } else {}
            },
            error: function() {}
        });
    },
    /*-----------删除联系人---------*/
    DeleteContacts: function(DeletegagaID, th, count, chatPeopleNum, chatPeopleNum, allContactsUl, totalPeopleNum, chatMiddle, ContactsUl) {
        var that = this;
        var data = {
            fid: DeletegagaID
        };
        $.ajax({
            type: "post",
            url: ctx + "/pm/delContacts",
            data: data,
            async: true,
            dataType: "json",
            success: function(reg) {
                // console.log("删除联系人:" + JSON.stringify(reg));
                // console.log("删除联系人:" + reg);
                if (reg.success) {
                    if (th.parents(".ContactsUl").hasClass("allContactsUl")) {
                        if (chatPeopleNum == 1) {
                            $(".LetterchatContainer .rightCon .noContactsContaner").show();
                            $(".LetterchatContainer").find("#LetterchatBox").hide();
                            th.parents(".leftCon").find(".noContacts").show();
                            th.parents(".ContactsUl").hide();
                            ContactsUl.children("[data-gagaID=" + DeletegagaID + "]").remove();
                            chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").remove();
                        } else {
                            count++;
                            if (count == chatPeopleNum) {
                                count = count - 2;
                            }
                            if (ContactsUl.children(".activeContacts").attr("data-gagaID") == DeletegagaID) {
                                th.parents(".ContactsUl").children("li:eq(" + count + ")").addClass("activeContacts");
                                var activeContacts = th.parents(".ContactsUl").children("li:eq(" + count + ")");
                                var gagaID = th.parents(".ContactsUl").children("li:eq(" + count + ")").attr("data-gagaid");
                                that.switchChatTop(activeContacts);
                                that.clearUnreadNum(gagaID);
                                if (chatMiddle.children("[data-gagaID = " + gagaID + "]").html()) {
                                    chatMiddle.children("[data-gagaID=" + gagaID + "]").show();
                                    chatMiddle.children("[data-gagaID = " + gagaID + "]").find(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
                                } else {
                                    that.createChatMiddle(activeContacts, chatMiddle);
                                    that.ajxaLateHistorical(gagaID);
                                    that.postCurrentChatPeople(gagaID);
                                }
                            }
                            if (chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").html()) {
                                chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").remove();
                            }
                            ContactsUl.children("[data-gagaID=" + DeletegagaID + "]").remove();


                        }
                    } else if (th.parents(".ContactsUl").hasClass("onlineContactsUl")) {
                        if (chatPeopleNum == totalPeopleNum) {
                            if (chatPeopleNum == 1) {
                                $(".LetterchatContainer .rightCon .noContactsContaner").show();
                                $(".LetterchatContainer").find("#LetterchatBox").hide();
                                th.parents(".leftCon").find(".noContacts").show();
                                th.parents(".ContactsUl").hide();
                                ContactsUl.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").remove();
                            } else {
                                count++;
                                if (count == chatPeopleNum) {
                                    count = count - 2;
                                }
                                if (ContactsUl.children(".activeContacts").attr("data-gagaID") == DeletegagaID) {
                                    th.parents(".ContactsUl").children("li:eq(" + count + ")").addClass("activeContacts");
                                    var activeContacts = th.parents(".ContactsUl").children("li:eq(" + count + ")");
                                    var gagaID = th.parents(".ContactsUl").children("li:eq(" + count + ")").attr("data-gagaid");
                                    that.switchChatTop(activeContacts);
                                    that.clearUnreadNum(gagaID);
                                    if (chatMiddle.children("[data-gagaID = " + gagaID + "]").html()) {
                                        chatMiddle.children("[data-gagaID=" + gagaID + "]").show();
                                        chatMiddle.children("[data-gagaID = " + gagaID + "]").find(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
                                    } else {
                                        that.createChatMiddle(activeContacts, chatMiddle);
                                        that.ajxaLateHistorical(gagaID);
                                        that.postCurrentChatPeople(gagaID);
                                    }
                                }
                                if (chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").html()) {
                                    chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                }
                                ContactsUl.children("[data-gagaID=" + DeletegagaID + "]").remove();


                            }
                        } else {
                            if (chatPeopleNum == 1) {
                                if (ContactsUl.children(".activeContacts").attr("data-gagaID") == DeletegagaID) {
                                    ContactsUl.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                    chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                    allContactsUl.children(".contactsPeopleContent:first").addClass("activeContacts");

                                    var activeContacts = ContactsUl.children(".activeContacts");
                                    var gagaID = activeContacts.attr("data-gagaid");
                                    that.switchChatTop(activeContacts);
                                    that.clearUnreadNum(gagaID);
                                    if (chatMiddle.children("[data-gagaID = " + gagaID + "]").html()) {
                                        chatMiddle.children("[data-gagaID=" + gagaID + "]").show();
                                        chatMiddle.children("[data-gagaID = " + gagaID + "]").find(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
                                    } else {
                                        that.createChatMiddle(activeContacts, chatMiddle);
                                        that.ajxaLateHistorical(gagaID);
                                        that.postCurrentChatPeople(gagaID);
                                    }
                                } else {
                                    ContactsUl.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                    if (chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").html()) {
                                        chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                    }
                                }

                            } else {
                                count++;
                                if (count == chatPeopleNum) {
                                    count = count - 2;
                                }
                                if (ContactsUl.children(".activeContacts").attr("data-gagaID") == DeletegagaID) {
                                    th.parents(".ContactsUl").children("li:eq(" + count + ")").addClass("activeContacts");
                                    var activeContacts = th.parents(".ContactsUl").children("li:eq(" + count + ")");
                                    var gagaID = th.parents(".ContactsUl").children("li:eq(" + count + ")").attr("data-gagaid");
                                    that.switchChatTop(activeContacts);
                                    that.clearUnreadNum(gagaID);
                                    if (chatMiddle.children("[data-gagaID = " + gagaID + "]").html()) {
                                        chatMiddle.children("[data-gagaID=" + gagaID + "]").show();
                                        chatMiddle.children("[data-gagaID = " + gagaID + "]").find(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
                                    } else {
                                        that.createChatMiddle(activeContacts, chatMiddle);
                                        that.ajxaLateHistorical(gagaID);
                                        that.postCurrentChatPeople(gagaID);
                                    }
                                }
                                ContactsUl.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                if (chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").html()) {
                                    chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                }
                            }
                        }
                    } else {
                        if (chatPeopleNum == totalPeopleNum) {
                            if (chatPeopleNum == 1) {
                                $(".LetterchatContainer .rightCon .noContactsContaner").show();
                                $(".LetterchatContainer").find("#LetterchatBox").hide();
                                th.parents(".leftCon").find(".noContacts").show();
                                th.parents(".ContactsUl").hide();
                                ContactsUl.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").remove();
                            } else {
                                if (ContactsUl.children(".activeContacts").attr("data-gagaID") == DeletegagaID) {
                                    chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                    allContactsUl.children(".contactsPeopleContent:first").addClass(".activeContacts");
                                    var activeContacts = ContactsUl.children(".activeContacts");
                                    var gagaID = activeContacts.attr("data-gagaid");
                                    that.switchChatTop(activeContacts);
                                    that.clearUnreadNum(gagaID);
                                    if (chatMiddle.children("[data-gagaID = " + gagaID + "]").html()) {
                                        chatMiddle.children("[data-gagaID=" + gagaID + "]").show();
                                        chatMiddle.children("[data-gagaID = " + gagaID + "]").find(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
                                    } else {
                                        that.createChatMiddle(activeContacts, chatMiddle);
                                        that.ajxaLateHistorical(gagaID);
                                        that.postCurrentChatPeople(gagaID);
                                    }
                                } else {
                                    if (chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").html()) {
                                        chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                    }
                                }
                                ContactsUl.children("[data-gagaID=" + DeletegagaID + "]").remove();
                            }
                        } else {
                            if (ContactsUl.children(".activeContacts").attr("data-gagaID") == DeletegagaID) {
                                chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                allContactsUl.children(".contactsPeopleContent:first").addClass(".activeContacts");
                                var activeContacts = ContactsUl.children(".activeContacts");
                                var gagaID = activeContacts.attr("data-gagaid");
                                that.switchChatTop(activeContacts);
                                that.clearUnreadNum(gagaID);
                                if (chatMiddle.children("[data-gagaID = " + gagaID + "]").html()) {
                                    chatMiddle.children("[data-gagaID=" + gagaID + "]").show();
                                    chatMiddle.children("[data-gagaID = " + gagaID + "]").find(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
                                } else {
                                    that.createChatMiddle(activeContacts, chatMiddle);
                                    that.ajxaLateHistorical(gagaID);
                                    that.postCurrentChatPeople(gagaID);
                                }
                            } else {
                                if (chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").html()) {
                                    chatMiddle.children("[data-gagaID=" + DeletegagaID + "]").remove();
                                }

                            }
                            ContactsUl.children("[data-gagaID=" + DeletegagaID + "]").remove();

                        }
                    }
                    totalPeopleNum--;
                    $(".LetterchatContainer .tabCon .peopleNum").text(totalPeopleNum);

                    if (!$("#onlineContactsGroup .ContactsUl .contactsPeopleContent").html()) {
                        $("#onlineContactsGroup .noContacts").show();
                        $("#onlineContactsGroup .ContactsUl").hide();
                    }
                    var language="";
                    if($(".LetterchatContainer .tabCon").find(".activeContacts").html()){
                        language = $(".LetterchatContainer .tabCon").find(".activeContacts").attr("data-language");
                    }
                    that.resetchatConBottomStyles(language);
                } else {}
            },
            error: function() {}

        });
    },
    /*--------------举报-----------------*/
    reportFun: function(gagaID, TXT) {
        var data = {
            type: "M",
            id: "-1",
            isGagaId: gagaID,
            reason: TXT
        };
        $.ajax({
            url: ctx + "/Report/report",
            data: data,
            type: 'post',
            cache: false,
            dataType: 'json',
            success: function(reg) {
                if (reg.success) {
                    layer.msg(reg.msg, {
                        time: 2000
                    }, function() {});
                } else {
                    layer.msg(reg.msg, {
                        time: 2000
                    }, function() {});
                }
            },
            error: function() {}
        });
    },
    /*----------------屏蔽-------------*/
    ShieldFun: function(gagaID, shield, th) {
        var that = this;
        var data = {
            fid: gagaID,
            pb: shield
        };
        //console.log("data:" + JSON.stringify(data));
        var ContactsUl = $(".LetterchatContainer .leftCon .ContactsUl");
        $.ajax({
            url: ctx + "/pm/pbFriend",
            data: data,
            type: 'post',
            cache: false,
            dataType: 'json',
            success: function(reg) {
                //console.log("屏蔽:" + JSON.stringify(reg));
                //console.log("屏蔽L:" + reg);
                if (reg.success) {
                    ContactsUl.children("[data-gagaID=" + gagaID + "]").attr("data-shield", shield);
                    if (shield == 1) {
                        that.ShieldArr.push("" + gagaID);
                        th.attr("data-shield", "0").text($.t("im.cancelShield"));
                        ContactsUl.children("[data-gagaID=" + gagaID + "]").find(".headLine").attr("src", staticCtx + "img/shield.png").show();
                    } else {
                        that.ShieldArr.splice($.inArray(gagaID, that.shieldArr), 1);
                        th.attr("data-shield", "1").text($.t("im.Shield"));
                        if (ContactsUl.children("[data-gagaID=" + gagaID + "]").attr("data-online") == 1) {
                            ContactsUl.children("[data-gagaID=" + gagaID + "]").find(".headLine").attr("src", staticCtx + "img/On-line.png").show();
                        } else {
                            ContactsUl.children("[data-gagaID=" + gagaID + "]").find(".headLine").attr("src", staticCtx + "img/On-line.png").hide();
                        }
                        var receiveMessageDiv = '<div class="femaleGetMoneyTips tips cleard"><span class="TipsCon"><span class="fw800">' + $.t("Letter.systemTips") + '</span>' + $.t("Letter.cancelShieldEachOtherLetter") + '</span></div>';
                        $("#chatMiddle").children("[data-gagaID =" + gagaID + "]").find(".LetterchatContent").append(receiveMessageDiv);

                    }



                } else {}
            },
            error: function() {}
        });

    },
    /*----------------发红包-------------*/
    sendRedEnvelopeFun: function(gagaID, moneyNum, content, imgUrl, lan, wordsId) {
        var that = this;
        //mn红包数
        var data = {
            toid: gagaID,
            to: lan,
            msg: content,
            image: imgUrl,
            mn: moneyNum,
            uuid: wordsId
        };
        console.log(data);
        $.ajax({
            url: ctx + "/pm/sendMsg",
            data: data,
            type: 'post',
            cache: false,
            dataType: 'json',
            success: function(reg) {
                // console.log("发红包:" + JSON.stringify(reg));
                // console.log("发红包:" + reg);
                //var sendDiv = $("#chatMiddle").children("[data-gagaID = " + gagaID+ "]").find("[data-ranid = " + reg.attributes.uuid + "]");
                if (reg.success) {
                    $.IM.getMoneyNum();

                    var wordsId = reg.obj.newsModel.id;
                    var read = reg.obj.isRead;
                    var sendState = reg.success;
                    var getSendTime = $.fn.returnTime(reg.obj.newsModel.ct, "full", "YYYY-MM-DD hh:mm");
                    that.addsendRedEnvelopeMSG(gagaID, moneyNum, content, wordsId, getSendTime, sendState, read);
                } else {
                    if (reg.msg == "1") {
                        $("#chatConBottom").children(".TipsContent").show();
                        var OvertimeHide = setTimeout(function() {
                            $("#chatConBottom").children(".TipsContent").hide();
                            clearTimeout(OvertimeHide);
                        }, 2000);
                    } else {}
                }
                $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("update");
                $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");
            },
            error: function() {}
        });
    },
    addsendRedEnvelopeMSG: function(gagaID, moneyVal, content, wordsId, getSendTime, sendState, read) {
        var sendRedEnvelope = "";
        var sendTime = TimeDifference2(getSendTime, $.Letter.TimeArr[gagaID]);
        if (sendTime != "") {
            $.Letter.TimeArr[gagaID] = getSendTime;
            sendRedEnvelope += '<p class="chatTime">' + getSendTime.substr(11, 5) + '</p>';
        }

        sendRedEnvelope += '<div class="sendRedEnvelope LetterchatMessage fr cleard" data-ranid="' + wordsId + '" data-money="' + moneyVal + '" data-open="0" data-con="' + content + '"><div><div class="sendNickName NickName fr">' + myNickname + '</div>';

        if (sendState) {
            if (read == 0) {
                sendRedEnvelope += '<span class="newsState read fr" style="color:#999">' + $.t("im.noRead") + '</span> <i class="readHorn fr" style="display:none"></i></div>';
            } else if (read == 1) {
                sendRedEnvelope += '<span class="newsState read fr" style="color:#97a7c3">' + $.t("im.read") + '</span> <i class="readHorn fr" style="display:block"></i></div>';
            } else if (read == -1) {
                sendRedEnvelope += '<span class="newsState read fr" style="display:none;"></span> <i class="readHorn fr" style="display:none"></i></div>';
            }
        }
        sendRedEnvelope += '<div class="sendRedContainer fr cleard"><span class="RedEnvelopeImg"></span><span class="RedEnvelopeWord">' + $.t("Letter.checkred") + '</span>';
        if (content) {
            sendRedEnvelope += '<div class="TranslateBtnConainer"><i class="sendTranslateBtn translateBtn"></i><div class="sendlanChoice lanChoice" style="display:none"><i class="lanI"></i>' + $.IM.languageListStr + '<div class="clear"></div></div></div>';
        }

        sendRedEnvelope += '</div>';
        sendRedEnvelope += '<div class="sendFailTip" style="display:none"></div>';
        if (content) {
            sendRedEnvelope += '<div class="RedEnvelopeTranslationCon fr receiveTranslationContainer" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="RedEnvelopeTranslation receiveTranslation ">sgdsf t</p></div>';
        }
        sendRedEnvelope += '</div><div class="cleard"></div>';
        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").find(".LetterchatContent").append(sendRedEnvelope);
        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("update");
        $("#chatMiddle").children("[data-gagaID = " + gagaID + "]").children(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");

        /*-----------提到第一位-----------------*/
        var allContactsLi = $("#allContactsGroup .ContactsUl").children("[data-gagaID =" + gagaID + "]");
        var online = allContactsLi.attr("data-online");
        if (online == 1) {
            var onlineContactsLi = $("#onlineContactsGroup .ContactsUl").children("[data-gagaID =" + gagaID + "]");
            if (sendTime != "") {
                onlineContactsLi.find(".contactsTime").text(sendTime);
            }
            onlineContactsLi.prependTo(onlineContactsLi.parent());
        }
        if (sendTime != "") {
            allContactsLi.find(".contactsTime").text(sendTime);
        }
        if (allContactsLi.hasClass('onStick')) {
            allContactsLi.prependTo(allContactsLi.parent());
        } else {
            if ($("#allContactsGroup .ContactsUl li.onStick").length>0) {
                $("#allContactsGroup .ContactsUl li.onStick:last").after(allContactsLi);
            } else {
                allContactsLi.prependTo(allContactsLi.parent());
            }
        } 
        $(".LetterchatContainer .leftCon .ContactsUl").children("[data-gagaID =" + gagaID + "]").show();
    },
    /*-----------查看红包--------*/
    checkRedEnvelopeClick: function(th) {
        var open = th.parent().attr("data-open");
        var moneyNum = th.parent().attr("data-money");
        var content = th.parent().attr("data-con");
        var RedEnvelopeOpen = $(".RedEnvelopeOpen");
        
       
        
        RedEnvelopeOpen.find(".name").text(myNickname);
        RedEnvelopeOpen.find(".MoneyCount").text(moneyNum);
        RedEnvelopeOpen.find(".headImg").attr("src", qiniuImgURL + sendHeadImgUrl);
        RedEnvelopeOpen.find(".RedEnvelopeContent").text(content);
        RedEnvelopeOpen.find(".getRedEnvelopeBtn").hide();
        if (open == "1") {
            RedEnvelopeOpen.find(".RedEnvelopeExplain").text($.t("Letter.redStateReceive"));
        } else {
            RedEnvelopeOpen.find(".RedEnvelopeExplain").text($.t("Letter.redStating"));
        }
        RedEnvelopeOpen.show();
         var topH = ($.IM.winH - RedEnvelopeOpen.children(".RedEnvelopeOpenContainer").height())/2
        RedEnvelopeOpen.children(".RedEnvelopeOpenContainer").css("top",topH);
        //console.log("$.IM.winH:"+$.IM.winH+"{}"+"aa"+RedEnvelopeOpen.children(".RedEnvelopeOpenContainer").height())
    },
    /*-------打开红包---------------*/
    openRedEnvelopeClick: function(th, ContactsUl, position) {
        var open = th.parent().attr("data-open");
        var gagaID = ContactsUl.children(".activeContacts").attr("data-gagaID");
        var headimg = ContactsUl.children(".activeContacts").find(".headImg").attr("src");
        var nickname = ContactsUl.children(".activeContacts").attr("data-nickname");
        var RedID = th.parent().attr("data-ranid");
        var moneyNum = th.parent().attr("data-money");
        var content = th.parent().attr("data-con");
        var RedEnvelopeOpen = $(".RedEnvelopeOpen");
        RedEnvelopeOpen.find(".name").text(nickname);
        RedEnvelopeOpen.find(".MoneyCount").text(moneyNum);
        RedEnvelopeOpen.find(".headImg").attr("src", headimg);
        RedEnvelopeOpen.find(".RedEnvelopeContent").text(content);
        RedEnvelopeOpen.find(".RedEnvelopeExplain").text($.t("Letter.redExplain"));
        RedEnvelopeOpen.show();
        var topH = ($.IM.winH - RedEnvelopeOpen.children(".RedEnvelopeOpenContainer").height())/2
        RedEnvelopeOpen.children(".RedEnvelopeOpenContainer").css("top",topH);
       // console.log("$.IM.winH:"+$.IM.winH+"{}"+"aa"+RedEnvelopeOpen.children(".RedEnvelopeOpenContainer").height())

        if (open == "1") {
            RedEnvelopeOpen.find(".getRedEnvelopeBtn").css("background-position", "0px -31px").text($.t("Letter.redreceived")).show();
        } else {
            RedEnvelopeOpen.find(".getRedEnvelopeBtn").addClass("openRed").css("background-position", "0px -82px").text($.t("Letter.redGet"));
            RedEnvelopeOpen.undelegate(".openRed", "click").delegate(".openRed", "click", function() {
                $.Letter.getRedEnvelope(gagaID, RedID, th, RedEnvelopeOpen, position);
            });
        }
    },
    /*---------领取红包-------*/
    getRedEnvelope: function(gagaID, RedID, th, RedEnvelopeOpen, position) {
        var data = {
            fid: gagaID,
            msgId: RedID
        };
        //console.log("领取红包:"+data);
        $.ajax({
            url: ctx + "/pm/openHb",
            data: data,
            type: 'post',
            cache: false,
            dataType: 'json',
            success: function(reg) {
                //console.log("领取红包:" + JSON.stringify(reg));
                //console.log("领取红包:" + reg);
                if (reg.success) {
                    $.IM.getMoneyNum();
                    if (position == "historyCon") {
                        $("#chatMiddle").children("[data-gagaID =" + gagaID + "]").find("[data-ranid =" + RedID + "]").attr("data-open", "1")
                        $("#chatMiddle").children("[data-gagaID =" + gagaID + "]").find("[data-ranid =" + RedID + "]").find(".RedEnvelopeWord").text($.t("Letter.redPacketsReceive"));
                    }
                    th.parent().attr("data-open", "1");
                    th.find(".RedEnvelopeWord").text($.t("Letter.redPacketsReceive"));
                    RedEnvelopeOpen.find(".getRedEnvelopeBtn").css("background-position", "0px -31px").text($.t("Letter.redreceived"));
                    RedEnvelopeOpen.find(".getRedEnvelopeBtn").removeClass("openRed");

                } else {}
            },
            error: function() {}
        });

    },
    /*---------获得对方拆红包通知-------*/
    getRedEnvelopeNotice: function(msg) {
        //console.log("拆红包通知:"+JSON.stringify(msg));
        // console.log("拆红包通知:"+msg);
        $("#chatMiddle").children("[data-gagaID =" + msg.fid + "]").find("[data-ranid=" + msg.msgId + "]").attr("data-open", "1");
    },
    /*-------------一键50人----------*/
    fiftyMaleFun: function(TXT, gagaID) {
        var that = this;
        var data = {
            msg: TXT
        };
        $.ajax({
            url: ctx + "/pm/sendMsgToOppositeSex",
            data: data,
            type: 'post',
            cache: false,
            dataType: 'json',
            success: function(reg) {
                //console.log("一键50人" + JSON.stringify(reg));
                // console.log("一键50人" + reg);
                if (reg.success) {
                    $.IM.getMoneyNum();

                    var ContactsUl = $(".LetterchatContainer .leftCon .ContactsUl");
                    if ($("#allContactsGroup .ContactsUl").children(".contactsPeopleContent").html()) {
                        var allContactsLi = "";
                        var onlineContactsLi = "";
                        var Contacts = "";
                        var findgagaID = "";
                        for (var i = 0; i < reg.obj.length; i++) {
                            allContactsLi = "";
                            onlineContactsLi = "";
                            findgagaID = "";
                            Contacts = "true";

                            $("#allContactsGroup .allContactsUl .contactsPeopleContent").each(function() {
                                var th = $(this);
                                findgagaID = th.attr("data-gagaid");
                                if (findgagaID == reg.obj[i].frid) {
                                    Contacts = "false";
                                    var getSendTime = $.fn.returnTime(reg.obj[i].ut, "full", "YYYY-MM-DD hh:mm");
                                    var sendTime = TimeDifference2(getSendTime, $.Letter.TimeArr[findgagaID]);
                                    if (sendTime != "") {
                                        $.Letter.TimeArr[gagaID] = getSendTime;
                                        th.find(".contactsTime").text(sendTime);
                                    }
                                    if ($("#chatMiddle").children("[data-gagaID=" + reg.obj[i].frid + "]").html()) {
                                        //------------拼接聊天框内容----------------------------------
                                        var sendMessageDiv = "";
                                        if (sendTime != "") {
                                            sendMessageDiv += '<p class="chatTime">' + sendTime + '</p>';
                                        }
                                        sendMessageDiv += ' <div class="sendMessage LetterchatMessage fr cleard" data-ranid="' + reg.attributes[reg.obj[i].frid] + '">' +
                                            '<div><div class="sendNickName NickName fr">' + myNickname + '</div>' +
                                            '<span class="newsState read fr" style="color:#97a7c3">' + $.t("im.read") + '</span> <i class="readHorn fr" style="display:none"></i></div>';
                                        sendMessageDiv += '<div class="sendContainer msgContent fr cleard">';

                                        sendMessageDiv += '<div class="OriginalCon"><span class="sendOriginal Original">' + TXT + '</span>';
                                        sendMessageDiv += '<div class="TranslateBtnConainer"><i class="sendTranslateBtn translateBtn"></i><div class="sendlanChoice lanChoice"><i class="lanI"></i>' + $.IM.languageListStr + '<div class="clear"></div></div></div>';
                                        sendMessageDiv += '</div>';
                                        sendMessageDiv += '<div class="receiveTranslationContainer fr" style="display:none"><i class="receiveTranslationContainerHorn"></i><p class="receiveTranslation"></p></div>';
                                        sendMessageDiv += ' </div><div class="sendFailTip" style="display:none"></div><div class="clear"></div></div><div class="clear"></div>';
                                        $("#chatMiddle").children("[data-gagaID = " + reg.obj[i].frid + "]").find(".LetterchatContent").append(sendMessageDiv);
                                        $("#chatMiddle").children("[data-gagaID = " + reg.obj[i].frid + "]").children(".chatConDiv").mCustomScrollbar("update");
                                        $("#chatMiddle").children("[data-gagaID = " + reg.obj[i].frid + "]").children(".chatConDiv").mCustomScrollbar("scrollTo", "bottom");

                                        return false;
                                    }

                                }

                            });
                            if (Contacts == "true") {
                                that.TimeArr[reg.obj[i].frid] = "";
                                // getDate = jsonDateFormatReceive(new Date(reg.obj[i].ut).Format("yyyy-MM-dd hh:mm"));
                                var getDate = $.fn.returnTime(reg.obj[i].ut, "full", "YYYY-MM-DD hh:mm");
                                var contactsLi = "";
                                contactsLi += '<li class="contactsPeopleContent'+(reg.obj[i].pb == 1?' pbleter':'')+(reg.obj[i].isStick == 1?' onStick':'')+'" data-gagaid="' + reg.obj[i].frid + '" data-nickname="' + reg.obj[i].membNickname + '" data-shield="' + reg.obj[i].pb + '" data-online="' + reg.obj[i].online + '" data-language="' + reg.obj[i].membLanguage + '" ';
                                contactsLi += 'data-country="' + getMemberCountryInfo(myLanguage, reg.obj[i].membCountry) + '" data-age="' + reg.obj[i].age + '" data-friend="' + reg.obj[i].isFriend + '">';

                                contactsLi += '<div class="contactsHeadDiv"><img class="headImg" src="' + qiniuImgURL + reg.obj[i].membBigimg + '" />';
                                if (reg.obj[i].pb == 1) {
                                    that.ShieldArr.push("" + reg.obj[i].pb);
                                    contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/shield.png">';
                                } else {
                                    if (reg.obj[i].online == 1) {
                                        contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/On-line.png">';
                                    } else {
                                        contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/On-line.png" style="display:none">';
                                    }
                                }
                                contactsLi += '</div><div class="fl contactsTXT"><span class="contactsNickName overHidTXT">' + reg.obj[i].membNickname + '</span>';
                                contactsLi += '<span class="newsNum newsNumSingle" style="display:none">0</span>';
                                contactsLi += '<p class="contactsTime overHidTXT">' + getDate + '</p></div><i class="LetterchatDelete"></i><i class="letterIsStick" title="'+(reg.obj[i].isStick == 1?$.t('Letter.canceltop'):$.t('Letter.gotop'))+'"></i></li>';
                                if (reg.obj[i].online == 1) {
                                    onlineContactsLi += contactsLi;
                                }
                                allContactsLi += contactsLi;
                                var peopleNum = $(".LetterchatContainer .tabCon .peopleNum").text();
                                peopleNum++;
                                $(".LetterchatContainer .tabCon .peopleNum").text(peopleNum);
                                $("#allContactsGroup .ContactsUl").append(allContactsLi);
                                $("#onlineContactsGroup .ContactsUl").append(onlineContactsLi);
                            }
                            
                        }
                        if ($("#onlineContactsGroup .ContactsUl").children(".contactsPeopleContent").html()) {
                                $("#onlineContactsGroup").find(".noContacts").hide();
                                $("#onlineContactsGroup").find(".ContactsUl").show();
                             }
                        $("#allContactsGroup").mCustomScrollbar("update");
                        $("#onlineContactsGroup").mCustomScrollbar("update");
                        $("#searchResultGroup").mCustomScrollbar("update");
                    } else {
                        for (var i = 0; i < reg.obj.length; i++) {
                            var allContactsLi = "";
                            var onlineContactsLi = "";
                            that.TimeArr[reg.obj[i].frid] = "";
                            // var getDate = jsonDateFormatReceive(new Date(reg.obj[i].ut).Format("yyyy-MM-dd hh:mm"));
                            var getDate = $.fn.returnTime(reg.obj[i].ut, "full", "YYYY-MM-DD hh:mm");

                            var contactsLi = "";
                            contactsLi += '<li class="contactsPeopleContent'+(reg.obj[i].pb == 1?' pbleter':'')+(reg.obj[i].isStick == 1?' onStick':'')+'" data-gagaid="' + reg.obj[i].frid + '" data-nickname="' + reg.obj[i].membNickname + '" data-shield="' + reg.obj[i].pb + '" data-online="' + reg.obj[i].online + '" data-language="' + reg.obj[i].membLanguage + '" ';
                            contactsLi += 'data-country="' + getMemberCountryInfo(myLanguage, reg.obj[i].membCountry) + '" data-age="' + reg.obj[i].age + '" data-friend="' + reg.obj[i].isFriend + '">';

                            contactsLi += '<div class="contactsHeadDiv"><img class="headImg" src="' + qiniuImgURL + reg.obj[i].membBigimg + '" />';
                            if (reg.obj[i].pb == 1) {
                                that.ShieldArr.push("" + reg.obj[i].pb);
                                contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/shield.png">';
                            } else {
                                if (reg.obj[i].online == 1) {
                                    contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/On-line.png">';
                                } else {
                                    contactsLi += '<img class="headLine" src="' + globalStaticCtx + '/images/On-line.png" style="display:none">';
                                }
                            }
                            contactsLi += '</div><div class="fl contactsTXT"><span class="contactsNickName overHidTXT">' + reg.obj[i].membNickname + '</span>';
                            contactsLi += '<span class="newsNum newsNumSingle" style="display:none">0</span>';
                            contactsLi += '<p class="contactsTime overHidTXT">' + getDate + '</p></div><i class="LetterchatDelete"></i><i class="letterIsStick" title="'+(reg.obj[i].isStick == 1?$.t('Letter.canceltop'):$.t('Letter.gotop'))+'"></i></li>';
                            if (reg.obj[i].online == 1) {
                                onlineContactsLi += contactsLi;
                            }
                            allContactsLi += contactsLi;
                            var peopleNum = $(".LetterchatContainer .tabCon .peopleNum").text();
                            peopleNum++;
                            $(".LetterchatContainer .tabCon .peopleNum").text(peopleNum);
                            $("#allContactsGroup .ContactsUl").append(allContactsLi);
                            $("#onlineContactsGroup .ContactsUl").append(onlineContactsLi);
                        }
                        $("#allContactsGroup").mCustomScrollbar("update");
                        $("#onlineContactsGroup").mCustomScrollbar("update");
                        $("#searchResultGroup").mCustomScrollbar("update");


                        $("#searchResultGroup").hide();
                        $("#searchCloseBtn").hide();
                        $("#searchBtn").hide();

                        $("#allContactsGroup").find(".noContacts").hide();
                        $("#allContactsGroup").find(".ContactsUl").show();
                        if ($("#onlineContactsGroup .ContactsUl").children(".contactsPeopleContent").html()) {
                            $("#onlineContactsGroup").find(".noContacts").hide();
                            $("#onlineContactsGroup").find(".ContactsUl").show();
                        }

                        if ($(".LetterchatContainer .tabCon .onlineContacts").hasClass("activeTitle")) {
                            $(".LetterchatContainer .tabCon .onlineContacts").removeClass("activeTitle");
                            $(".LetterchatContainer .tabCon .allContacts ").addClass("activeTitle");
                        }
                        $("#allContactsGroup .ContactsUl .contactsPeopleContent:first").addClass("activeContacts");


                        $(".LetterchatContainer .rightCon .noContactsContaner").hide();
                        $("#chatTop").attr("data-gagaID", reg.obj[0].frid);
                        $("#chatTop .HeadImg").attr("src", qiniuImgURL + reg.obj[0].membBigimg);
                        $("#chatTop .NickName").text(reg.obj[0].membNickname);
                        $("#chatTop .country").text(getMemberCountryInfo(myLanguage, reg.obj[0].membCountry));
                        $("#chatTop .age").text(reg.obj[0].age);
                        $("#chatTop .addFriend").attr("data-friend", reg.obj[0].isFriend);
                        $("#chatMiddle .chatCon").attr("data-gagaID", reg.obj[0].frid);
                        $("#chatMiddle").children("[data-gagaID =" + reg.obj[0].frid + "]").children(".chatConDiv").mCustomScrollbar({});
                        if (reg.obj[0].isFriend == 0) {
                            $("#chatTop .addFriend").css("display", "inline-block");
                        }
                        if (reg.obj[0].pb == 1) {
                            $("#chatTop .funShieldState").attr("data-shield", 0).text($.t("im.cancelShield"));
                        } else {
                            $("#chatTop .funShieldState").attr("data-shield", 1).text($.t("im.Shield"));
                        }
                        that.ajxaLateHistorical(reg.obj[0].frid);
                        // $("#chatConBottom [langs-lang=" + reg.obj.membLanguage + "]").click();
                        $("#LetterchatBox").show();
                        $.Letter.postCurrentChatPeople(reg.obj[0].frid);
                        $("#LetterchatBox").show();


                    }



                    $("#fiftyMale").bind("click", that.fiftyMaleClick);
                    $("#fiftyStateDiv").css("display", "block");
                    $("#fiftyStateDiv .fiftyStateING").css("display", "none");
                    $("#fiftyStateDiv .fiftyStateOver").css("display", "block");
                    var Timeout = setTimeout(function() {
                        $("#fiftyStateDiv").hide();
                        clearTimeout(Timeout);
                    }, 1500);
                } else {}
            },
            error: function() {}
        });
    },
    /*-----------点击--一键50人----------*/
    fiftyMaleClick: function() {
        var gagaID = "";
        if ($("#allContactsGroup .ContactsUl .contactsPeopleContent").html()) {
            gagaID = $(".LetterchatContainer .leftCon .ContactsUl").children(".activeContacts").attr("data-gagaID");
        }

        $.IM.getMoneyNum();
        if (sendGender == "1" && myMemberGrade == "1") {
            if ($.IM.myMoneyNum >= 5) {
                layer.open({
                    area: '542px',
                    skin: 'privateall',
                    title: $.t("Letter.prompt"),
                    content: $(".privateallCon").html(),
                    success: function(layero, index) {
                        $(".layui-layer-btn").after("<div class='textCenter h50 lh50'><a href='" + ctx + "/pay/upgradeMember' class='c-2d57a1'>" + $.t("Letter.memberMoreCost-effective") + "</a></div>");
                    },
                    btn: $.t("Letter.send"),
                    yes: function(index, layero) {
                        var TXT = $(".privateall .xld-select .default").text();
                        $("#fiftyStateDiv").css("display", "block");
                        $("#fiftyStateDiv .fiftyStateING").css("display", "block");
                        $("#fiftyStateDiv .fiftyStateOver").css("display", "none");
                        $("#fiftyMale").unbind("click");

                        $.Letter.fiftyMaleFun(TXT, gagaID);
                        layer.close(index);
                    }
                });
            } else {
                layer.open({
                    area: '542px',
                    skin: 'privateall privateall22',
                    title: $.t("Letter.prompt"),
                    content: $(".privateallCon").html(),
                    success: function(layero, index) {
                        $(".layui-layer-btn").after("<div class='textCenter h50 lh50'><a href='" + ctx + "/pay/upgradeMember' class='c-2d57a1'>" + $.t("Letter.memberMoreCost-effective") + "</a></div>");
                    },
                    btn: $.t("Letter.send"),
                    yes: function(index, layero) {
                        //layer.close(index);
                    }
                });
            }

        } else {
            if (!!myMemberGrade && myMemberGrade == '1') {
                layer.open({
                    area: '350px',
                    skin: 'wommen1_onekey',
                    title: $.t("Letter.prompt"),
                    content: '<p>' + $.t('Letter.wommen1onekey') + '</p>',
                    btn: $.t("Letter.clickUpgrade"),
                    yes: function(index, layero) {
                        layer.close(index);
                        window.location.href= ctx + "/pay/upgradeMember";
                    }
                });
            } else {
                layer.open({
                    area: '542px',
                    skin: 'privateall',
                    title: $.t("Letter.prompt"),
                    content: $(".privateallCon").html(),
                    success: function(layero, index) {
                        $(".privateall").find(".myMoney").text($.IM.myMoneyNum);
                        $(".privateall").find(".needMoney").text(0);
                        $(".layui-layer-btn").after("<div class='textCenter h50 lh50'><a href='" + ctx + "/pay/upgradeMember' class='c-2d57a1'>" + $.t("Letter.memberMoreCost-effective") + "</a></div>");

                    },
                    btn: $.t("Letter.send"),
                    yes: function(index, layero) {
                        var TXT = $(".privateall .xld-select .default").text();
                        $("#fiftyStateDiv").css("display", "block");
                        $("#fiftyStateDiv .fiftyStateING").css("display", "block");
                        $("#fiftyStateDiv .fiftyStateOver").css("display", "none");
                        $("#fiftyMale").unbind("click");
                        $.Letter.fiftyMaleFun(TXT, gagaID);
                        layer.close(index);
                    }
                });
            }
        }
        /*下拉菜单*/
        $(".xld").each(function(index, element) {
            $(this).click(function(e) {
                if ($(this).next("ul").css("display") == "block") {
                    $(this).next("ul").css("display", "none")
                } else {
                    $(this).next("ul").css("display", "block")
                }

                $(this).css("background-image", "url(" + globalStaticCtx + "/images/xld1.png)");



                $(".xld-select>li").each(function(e) {
                    var _selt = $(this);
                    $(this).hover(function() {
                        $(this).addClass("default").siblings().removeClass("default");
                    })
                    $(this).click(function(e) {
                        $(_selt.parent(".xld-select").siblings("span")).text(_selt.children("a").text()).css("background-image", "url(" + globalStaticCtx + "/images/xld.png)");
                        _selt.parent(".xld-select").css("display", "none");
                    });
                });
                e.stopPropagation();
                $(document).click(function() {
                    $(".privateall .xld-select").css("display", "none")
                });
            })
        });
    },
    /*-----切换时修改信息状态-----*/
    modifyMSGState: function(reg) {
        if (myMemberGrade == "3") {
            if ($("#chatMiddle").children("[data-gagaID = " + reg + "]").html()) {
                $("#chatMiddle").children("[data-gagaID = " + reg + "]").find(".readHorn").show();
                $("#chatMiddle").children("[data-gagaID = " + reg + "]").find(".read").text($.t("im.read")).css("color", "#97a7c3");
            }
        }
    },
    /*----------用户上线-------------*/
    userOnline: function(gagaID) {
        var ContactsUl = $(".LetterchatContainer .leftCon .ContactsUl");

        if (ContactsUl.children("[data-gagaID=" + gagaID + "]").html()) {
            if (ContactsUl.children("[data-gagaID=" + gagaID + "]").attr("data-online") == 0) {

                ContactsUl.children("[data-gagaID=" + gagaID + "]").attr("data-online", "1");
                if (ContactsUl.children("[data-gagaID=" + gagaID + "]").attr("data-shield") == 0) {
                    ContactsUl.children("[data-gagaID=" + gagaID + "]").find(".headLine").show();
                }
                var userLi = ContactsUl.children("[data-gagaID=" + gagaID + "]");
                $("#onlineContactsGroup .ContactsUl").append(userLi.clone());
                if (userLi.hasClass("activeContacts")) {
                    $("#onlineContactsGroup .ContactsUl").children(".activeContacts").removeClass("activeContacts");
                }
            }
        }
        $("#onlineContactsGroup .noContacts").hide();
        $("#onlineContactsGroup .ContactsUl").show();
    },
    /*----------用户下线-------------*/
    userOffline: function(userArr) {
        var that = this;
        var ContactsUl = $(".LetterchatContainer .leftCon .ContactsUl");
        $("#allContactsGroup .ContactsUl").children(".contactsPeopleContent").each(function() {
            var gagaID = $(this).attr("data-gagaid");
            if ($.inArray(gagaID, userArr) > -1) {
                if ($(this).attr("data-online") == 1) {
                    $(this).attr("data-online", "0");
                }
                if ($(this).attr("data-shield") == 0) {
                    $(this).find(".headLine").hide();
                }
            }
        });
        $("#onlineContactsGroup .ContactsUl").children(".contactsPeopleContent").each(function() {
            var that = this;
            var gagaID = $(this).attr("data-gagaid");
            if ($.inArray(gagaID, userArr) > -1) {
                if ($(this).hasClass("activeContacts")) {
                    if ($(this).parent().length == 1) {
                        $("#allContactsGroup .ContactsUl .contactsPeopleContent:first").addClass("activeContacts");
                        $("#onlineContactsGroup .noContacts").show();
                        $("#onlineContactsGroup .ContactsUl").hide();
                        if (gagaID != $("#allContactsGroup .ContactsUl .contactsPeopleContent:first").attr("data-gagaID")) {
                            var activeContacts = $("#allContactsGroup .ContactsUl .contactsPeopleContent:first");
                            var newgagaID = $("#allContactsGroup .ContactsUl .contactsPeopleContent:first").attr("data-gagaID");
                            var chatMiddle = $("#chatMiddle");
                            if (!chatMiddle.children("[data-gagaID=" + newgagaID + "]").html()) {
                                that.ajxaLateHistorical(newgagaID);
                                that.createChatMiddle(activeContacts, chatMiddle);
                            }
                            that.postCurrentChatPeople(newgagaID);
                        }
                    } else {
                        $(this).prev().addClass("activeContacts");
                        var activeContacts = $(this).prev();
                        var newgagaID = $(this).prev().attr("data-gagaID");
                        var chatMiddle = $("#chatMiddle");
                        if (!chatMiddle.children("[data-gagaID=" + newgagaID + "]").html()) {
                            that.ajxaLateHistorical(newgagaID);
                            that.createChatMiddle(activeContacts, chatMiddle);
                        }
                        that.postCurrentChatPeople(newgagaID);
                    }
                    $(this).remove();
                } else {
                    $(this).remove();
                    var chatMiddle = $("#chatMiddle");
                    if (!chatMiddle.children("[data-gagaID=" + gagaID + "]").html()) {
                        chatMiddle.children("[data-gagaID=" + gagaID + "]").remove();
                    }
                }
            }
        });
        if (!$("#onlineContactsGroup .ContactsUl .contactsPeopleContent").html()) {
            $("#onlineContactsGroup .noContacts").show();
            $("#onlineContactsGroup .ContactsUl").hide();
        }
    },
    /*-----加好友------*/
    addFriendFun: function(gagaID) {
        var ContactsUl = $(".LetterchatContainer .leftCon .ContactsUl");
        var data = {
            friGagaid: gagaID,
            source: "2"
        };
        $.ajax({
            type: "post",
            url: ctx + "/Member/Friend/applyFriend",
            data: data,
            async: true,
            dataType: "json",
            success: function(reg) {
                //console.log("加好友" + JSON.stringify(reg));
                //console.log("加好友" + reg);
                // 1:成功，2：失败，3：已经是好友，4：等待中
                if (reg.success) {
                    if (reg.obj == 1) {
                        ContactsUl.children("[data-gagaID=" + gagaID + "]").attr("data-friend", "1");
                        if ($("#chatTop").attr("data-gagaID") == gagaID) {
                            $("#chatTop").find(".addFriend").hide();
                        }
                        layer.msg($.t("Letter.addFriendSuccess"), {time: 2000}, function() {});
                    } else if (reg.obj == 4) {
                        /*ContactsUl.children("[data-gagaID=" + gagaID + "]").attr("data-friend", "2");
                        if ($("#chatTop").attr("data-gagaID") == gagaID) {
                            $("#chatTop").find(".addFriend").attr("data-friend", "2");
                        }*/
                        layer.msg($.t("Letter.applyFriendBeenSent"), {time: 2000}, function() {});
                    }
                } else {}


            },
            error: function() {}
        });
    },
    /*------向后台发送当前联系人-------*/
    postCurrentChatPeople: function(gagaID) {
        var data = {
            rid: gagaID,
            status: "1"
        };
        $.ajax({
            type: "post",
            url: ctx + "/pm/updateCurrWin",
            data: data,
            async: true,
            dataType: "json",
            success: function(reg) {},
            error: function() {}
        });
    },
    /*----------新建当前联系人对话框------------*/
    createChatMiddle: function(activeContacts, chatMiddle) {
        var gagaID = activeContacts.attr("data-gagaid");
        var chatConDiv = '<div class="chatCon" data-gagaID="' + gagaID + '">' +
            '<div class="chatConDiv"><p class="textCenter marT5 cursor moreNews c-2d57a1" style="display:none">' + $.t("im.moreNews") + '</p><div class="LetterchatContent"></div></div>' +
            '<div class="upLoadImgContainer">' +
            '<div class="upLoadContnet"><i class="upLoadImgHorn"></i><span class="bigImgBtn"><img class="upLoadImg" src="" /></span></div>' +
            '<div class="upLoadExplain"><span class="upLoadImgName">5550ssssss.jpg</span><span class="fr"><span class="upLoadImgDelete"></span><span class="upLoadImgState">' + $.t("Letter.uploadIng") + '</span><i class="upLoadImging"></i></span></div></div></div>';
        chatMiddle.prepend(chatConDiv);
        /* chatMiddle.children("[data-gagaID="+gagaID+"]").mCustomScrollbar("update");
         chatMiddle.children("[data-gagaID="+gagaID+"]").mCustomScrollbar("scrollTo", "bottom");*/
        $("#chatMiddle").children("[data-gagaID =" + gagaID + "]").children(".chatConDiv").mCustomScrollbar({});
    },
    /*------------发送时有翻译---扣金币提示---------*/
    deductMoney: function(th, sendContent, sendConPD, gagaID, imgUrl, targetLan, moneyNum, MSGtype) {
        var that = this;
        var msgMoney = $.IM.deleteQQFace(sendContent).trim()
        var data = {
            msg: msgMoney
        };
        $.ajax({
            type: "post",
            url: ctx + "/pm/getTranGold",
            data: data,
            async: false,
            dataType: "json",
            success: function(reg) {
                // console.log("翻译字符扣金币："+JSON.stringify(reg));
                // console.log("翻译字符扣金币："+reg);
                //1:扣费1员，0：不扣费；-1：余额不足；3：需要提示；4：不需要提示
                if (reg.success) {
                    if (reg.obj == 0 || reg.obj == 4) {
                        that.SendMessage(th, sendContent, sendConPD, gagaID, imgUrl, targetLan, moneyNum, MSGtype);
                    } else if (reg.obj == -1) {
                        var contentTip = '<div class="textCenter marT5">' + $.t("im.goldLack")  + '</div>';
                        layer.open({
                            title: false,
                            content: contentTip,
                            skin: 'noTitleTips',
                            btn: [$.t("im.ToRecharge")],
                            yes: function(index, layero) {
                                window.location.href = ctx + "/pay/recharge";
                                layer.close(index);
                            }
                        });
                    } else if(reg.obj == 3) {
                    	debugger;
                        var contentTip = '<div class="textCenter marT5"><div class="deductMoneyTXT">' + $.t("im.translationNeeds") + $.t("im.goldContinue") + '</div></div>';
                        layer.open({
                            title: false,
                            content: contentTip,
                            skin: 'noTitleTips',
                            btn: [$.t("global.ok"), $.t("global.cancel")],
                            yes: function(index, layero) {
                                $.post(ctx + "/pm/okTransTip",function(msg){})
                                that.SendMessage(th, sendContent, sendConPD, gagaID, imgUrl, targetLan, moneyNum, MSGtype);
                                layer.close(index);
                            },
                            cancel: function(index) {
                                layer.close(index);
                            },
                        });
                    }

                } else {}



            },
            error: function() {}
        });
    },
    /*------------邀请对方升级---------*/
    invitationUpgradeFun: function(th, gagaID, wordsId, position) {
        var data = {
            rid: gagaID,
            msgId: wordsId
        };
        $.ajax({
            type: "post",
            url: ctx + "/pm/invitationPay",
            data: data,
            async: false,
            dataType: "json",
            success: function(reg) {
                // console.log("邀请对方升级："+JSON.stringify(reg));
                //console.log("邀请对方升级："+reg);
                if (reg.success) {
                    if (position == "historyCon") {
                        $("#chatMiddle").children("[data-gagaID =" + gagaID + "]").find("[data-ranid =" + wordsId + "]").removeClass("invitationUpgrade").addClass("invitationUpgradeOverTime");
                    }
                    th.parents(".invitationUpgrade ").removeClass("invitationUpgrade").addClass("invitationUpgradeOverTime");
        
                    layer.msg($.t("Letter.InvitationHasBeenSent"), { time: 2000}, function() {});
                } else {}
            },
            error: function() {}
        });
    },
    /*------------邀请对方升级过期-------------*/
    invitationUpgradeOverTime: function(reg) {
        console.log(reg)
        if ($("#chatMiddle").children("[data-gagaID =" + reg.rid + "]").find("[data-ranid =" + reg.msgid + "]").html()) {
            $("#chatMiddle").children("[data-gagaID =" + reg.rid + "]").find("[data-ranid =" + reg.msgid + "]").removeClass("invitationUpgrade ").addClass("invitationUpgradeOverTime");
        }
        if ($(".LetterhistoryContainer").children("[data-gagaID =" + reg.rid + "]").find("[data-ranid =" + reg.msgid + "]").html()) {
            $(".LetterhistoryContainer").children("[data-gagaID =" + reg.rid + "]").find("[data-ranid =" + reg.msgid + "]").removeClass("invitationUpgrade ").addClass("invitationUpgradeOverTime");
        }
    },
    /*------------男性购买条数------------*/
    buyNumClick: function() {
        $.IM.getMoneyNum();
        var privatebuyNumCon = "";
        var buyNumber = "";
        /*    var systemTip=$(this).parents(".maleUpgradeTips").attr("data-systemTip");*/
        layer.open({
            area: '542px',
            skin: 'privateall',
            title: $.t("Letter.prompt"),
            content: $(".privatebuyNumCon").html(),
            success: function(layero, index) {

                privatebuyNumCon = $(".privateall");
                privatebuyNumCon.find(".myMoney").text($.IM.myMoneyNum);
                privatebuyNumCon.find(".min").click(function() {
                    buyNumber = privatebuyNumCon.find(".text_box").val();
                    if (buyNumber > 0) {
                        buyNumber=parseInt(buyNumber)-10;
                    }
                    privatebuyNumCon.find(".text_box").val(buyNumber);
                });
                privatebuyNumCon.find(".add").click(function() {
                    buyNumber = privatebuyNumCon.find(".text_box").val();
                    buyNumber=parseInt(buyNumber)+10;
                    privatebuyNumCon.find(".text_box").val(buyNumber);
                });
                $(".layui-layer-btn").after("<div class='textCenter h50 lh50'><a href='" + ctx + "/pay/upgradeMember' class='c-2d57a1' >" + $.t("Letter.memberMoreCost-effective") + "</a></div>");
            },
            btn: $.t("global.ok"),
            yes: function(index, layero) {
                buyNumber = privatebuyNumCon.find(".text_box").val();
                if (buyNumber * 0.1 <= $.IM.myMoneyNum) {
                    $.Letter.buyNumFun(buyNumber);
                    layer.close(index);
                } else {
                    var contentTip = '<div class="textCenter marT5">' + $.t("im.goldLack")  + '</div>';
                    layer.open({
                        title: false,
                        content: contentTip,
                        skin: 'noTitleTips',
                        btn: [$.t("im.ToRecharge")],
                        yes: function(index, layero) {
                            window.location.href = ctx + "/pay/recharge";
                            layer.close(index);
                        }
                    });
                }


            }
        });
    },
    buyNumFun: function(buyNumber) {
        var data = {
            count: buyNumber
        };
        $.ajax({
            type: "post",
            url: ctx + "/pm/buyingPmCount",
            data: data,
            async: false,
            dataType: "json",
            success: function(reg) {
                //console.log("购买条数："+JSON.stringify(reg));
                //console.log("购买条数："+reg);
                if (reg.success) {
                      $.IM.getMoneyNum();
                } else {
                    var contentTip = '<div class="textCenter marT5">' + $.t("im.goldLack")  + '</div>';
                    layer.open({
                        title: false,
                        content: contentTip,
                        skin: 'noTitleTips',
                        btn: [$.t("im.ToRecharge")],
                        yes: function(index, layero) {
                            window.location.href = ctx + "/pay/recharge";
                            layer.close(index);
                        }
                    });
                }
            },
            error: function() {}
        });
    },
    /*------------点击预览大图-----------------------*/
    bigImgPreview: function(th) {
        var imgDIV = '<img src="' + $(th).attr("src") + '" style="max-width:600px;max-height:600px;border-radius: 10px;">';
        layer.open({
            type: 1,
            title: false,
            maxWidth: 650,
            skin: 'bigImgClosed-class',
            content: imgDIV
        });
    },
    /*-----------切换人物头部--------------------*/
    switchChatTop: function(activeContacts) {

        var chatTop = $("#chatTop");
        var gagaID = activeContacts.attr("data-gagaid");
        var nickName = activeContacts.attr("data-nickname");
        var shield = activeContacts.attr("data-shield");
        /*var online = activeContacts.attr("data-online");
        var language = activeContacts.attr("data-language");*/
        var country = activeContacts.attr("data-country");
        var age = activeContacts.attr("data-age");
        var friend = activeContacts.attr("data-friend");
        var headImg = activeContacts.find(".headImg").attr("src");

        chatTop.attr("data-gagaID", gagaID);
        chatTop.find(".HeadImg").attr("src", headImg);        
        chatTop.find(".NickName").text(nickName);
        if (chatTop.find(".pl-goto").length == 0) {
            chatTop.find(".HeadImg").wrap('<a href="'+ctx+'/Member/otherHome/'+gagaID+'" class="pl-goto"></a>');
            chatTop.find(".NickName").wrap('<a href="'+ctx+'/Member/otherHome/'+gagaID+'" class="pl-goto"></a>');
        } else {
            chatTop.find(".pl-goto").attr('href', (ctx+'/Member/otherHome/'+gagaID))
        }


        if (country) {
            chatTop.find(".country").text(country).show();
            chatTop.find(".countryBefor").show();
        } else {
            chatTop.find(".country").hide();
            chatTop.find(".countryBefor").hide();
        }

        if (age != 0) {
            chatTop.find(".age").text(age).show();
            chatTop.find(".ageBefor").show();
        } else {
            chatTop.find(".age").hide();
            chatTop.find(".ageBefor").hide();
        }


        chatTop.find(".addFriend").attr("data-friend", friend);
        if (friend == 1) {
            chatTop.find(".addFriend").hide();
        } else {
            chatTop.find(".addFriend").css("display", "inline-block");
        }
        if (shield == 1) {
            chatTop.find(".funShieldState").attr("data-shield", 0).text($.t("im.cancelShield"));
        } else {
            chatTop.find(".funShieldState").attr("data-shield", 1).text($.t("im.Shield"));
        }

        chatTop.find('.pr-lel').remove();
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
                    chatTop.find('.information').append('<img src="'+staticPath+levelImg+'" class="pr-lel" />');
                }                
            }
        });

    },
    /*----------人物聊天切换时底部恢复默认---------------*/
    resetchatConBottomStyles: function(language) {
        $("#chatConBottom .sendBtn").css({
            "color": "#696969",
            "background-color": "#fff"
        });
        $("#chatConBottom .sendContent").val($.t("im.enterKeySend"));
        $("#chatConBottom .LetterHistoricalRecords").show();
        
        if(sendGender =="1"){
            switch(language){
                    case "":
                        $("#chatConBottom  .language").attr("langs-lang", "").text("不翻译");
                        break; 
                    case "en":
                        $("#chatConBottom .language").attr("langs-lang", "en").text("English");
                        break;
                    case "zh":
                        $("#chatConBottom .language").attr("langs-lang", "zh").text("简体中文");
                        break;
                    case "cht":
                        $("#chatConBottom .language").attr("langs-lang", "cht").text("繁體中文");
                        break;
                    case "kor":
                        $("#chatConBottom .language").attr("langs-lang", "kor").text("한국어");
                        break;
                    case "ru":
                        $("#chatConBottom .language").attr("langs-lang", "ru").text("Pусский");
                        break;
                    case "de":
                        $("#chatConBottom .language").attr("langs-lang", "de").text("Deutsch");
                        break;
                    case "spa":
                        $("#chatConBottom .language").attr("langs-lang", "spa").text("Español");
                        break;
                    case "jp":
                        $("#chatConBottom .language").attr("langs-lang", "jp").text("日本語");
                        break;
                }
        }else{
             $("#chatConBottom  .language").attr("langs-lang", "").text($.t("im.noTranslate"));
        }
        
        
    },
    /*---------切换时清楚对应人的消息提醒---*/
    clearUnreadNum: function(gagaID) {
        var ContentLi = $("#allContactsGroup .ContactsUl").children("[data-gagaID=" + gagaID + "]");
        
        if(ContentLi.find(".newsNum").hasClass("newsNumDouble")){
            ContentLi.find(".newsNum").removeClass("newsNumDouble").addClass("newsNumSingle");
        }
        ContentLi.find(".newsNum").hide().text("0");
        var online = ContentLi.attr("data-online");
        if (online == 1) {
            if($("#onlineContactsGroup .ContactsUl").children("[data-gagaID=" + gagaID + "]").find(".newsNum").hasClass("newsNumDouble")){
                $("#onlineContactsGroup .ContactsUl").children("[data-gagaID=" + gagaID + "]").find(".newsNum").removeClass("newsNumDouble").addClass("newsNumSingle");
            }
            $("#onlineContactsGroup .ContactsUl").children("[data-gagaID=" + gagaID + "]").find(".newsNum").hide().text("0");
        }
        if($("#searchResultGroup .ContactsUl").children("[data-gagaID=" + gagaID + "]").html()){
            if($("#searchResultGroup .ContactsUl").children("[data-gagaID=" + gagaID + "]").find(".newsNum").hasClass("newsNumDouble")){
                $("#searchResultGroup .ContactsUl").children("[data-gagaID=" + gagaID + "]").find(".newsNum").removeClass("newsNumDouble").addClass("newsNumSingle");
            }
            $("#searchResultGroup .ContactsUl").children("[data-gagaID=" + gagaID + "]").find(".newsNum").hide().text("0");
        }
    },
    /*----MSGContainer--div------恢复默认-----------不用管--------*/
    resetMSGContentStyles: function() {
        var MGContainer = $("#MSGContainer");
        /*-----公用---结构-----*/
        MGContainer.find(".NickName").text("");
        MGContainer.find(".Original").text("");
        /*-----接受消息---结构-----*/
        MGContainer.children(".receiveMessage").attr("data-rain", "");
        MGContainer.children(".receiveMessage").find(".OriginalCon").hide();
        MGContainer.children(".receiveMessage").find(".Original").text("").hide();
        MGContainer.children(".receiveMessage").find(".TranslateBtnConainer").hide();
        MGContainer.children(".receiveMessage").find(".translateBtn").hide();
        MGContainer.children(".receiveMessage").find(".lanChoice").hide();
        MGContainer.children(".receiveMessage").find(".receiveTranslationContainer").hide();
        MGContainer.children(".receiveMessage").find(".receiveTranslation").text("");
        MGContainer.children(".receiveMessage").find(".bigImgBtn").hide();
        /*-----接受红包---结构-----*/
        MGContainer.children(".receiveRedEnvelope").attr({
            "data-rain": "",
            "data-money": "",
            "data-open": "",
            "data-con": ""
        });
        MGContainer.children(".receiveRedEnvelope").find(".TranslateBtnConainer").hide();
        MGContainer.children(".receiveRedEnvelope").find(".translateBtn").hide();
        MGContainer.children(".receiveRedEnvelope").find(".lanChoice").hide();
        MGContainer.children(".receiveRedEnvelope").find(".receiveTranslationContainer").hide();
        MGContainer.children(".receiveRedEnvelope").find(".receiveTranslation").text("");
        /*---------心情动态 ----------*/
        MGContainer.children(".receiveDynamicMood").attr("data-rain", "");
        MGContainer.children(".DynamicMoodTXT").text("");
        MGContainer.children(".systemChatTips").text("");
        /*--------初次登陆----提示-----*/
        MGContainer.children(".firstLogin").attr("data-rain", "");
        /*--------更新头像--------*/
        MGContainer.children(".goClickLike").attr("data-rain", "");
        /*-- 发消息---结构-----*/
        MGContainer.children(".sendMessage").attr("data-rain", "");
        MGContainer.children(".sendMessage").find(".newsState").text("").hide();
        MGContainer.children(".sendMessage").find(".readHorn").hide();
        MGContainer.children(".sendMessage").find(".OriginalCon").hide();
        MGContainer.children(".sendMessage").find(".Original").text().hide();
        MGContainer.children(".sendMessage").find(".TranslateBtnConainer").hide();
        MGContainer.children(".sendMessage").find(".translateBtn").hide();
        MGContainer.children(".sendMessage").find(".lanChoice").hide();
        MGContainer.children(".sendMessage").find(".receiveTranslationContainer").hide();
        MGContainer.children(".sendMessage").find(".receiveTranslation").text();
        MGContainer.children(".sendMessage").find(".bigImgBtn").hide();
        MGContainer.children(".sendMessage").find(".sendFailTip").hide();
        /*--------初次打招呼----提示-----*/
        MGContainer.children(".firstHello").attr("data-rain", "");
        MGContainer.children(".firstHello").find(".newsState").text("").hide();
        MGContainer.children(".firstHello").find(".readHorn").hide();
        MGContainer.children(".firstHello").find(".sendFailTip").hide();
        /*------赞-新头像--------*/
        MGContainer.children(".clickLike").attr("data-rain", "");
        MGContainer.children(".clickLike").find(".newsState").text("").hide();
        MGContainer.children(".clickLike").find(".readHorn").hide();
        MGContainer.children(".clickLike").find(".sendFailTip").hide();
        /*----- 发红包---结构-----*/
        MGContainer.children(".sendRedEnvelope").attr({
            "data-rain": "",
            "data-money": "",
            "data-open": "",
            "data-con": ""
        });
        MGContainer.children(".sendRedEnvelope").find(".newsState").text("").hide();
        MGContainer.children(".sendRedEnvelope").find(".readHorn").hide();
        MGContainer.children(".sendRedEnvelope").find(".TranslateBtnConainer").hide();
        MGContainer.children(".sendRedEnvelope").find(".translateBtn").hide();
        MGContainer.children(".sendRedEnvelope").find(".lanChoice").hide();
        MGContainer.children(".sendRedEnvelope").find(".RedEnvelopeTranslationCon").hide();
        MGContainer.children(".sendRedEnvelope").find(".RedEnvelopeTranslation").text();
        MGContainer.children(".sendRedEnvelope").find(".sendFailTip").hide();
        /*-----时间---结构-----*/
        MGContainer.children(".chatTime").text("");
        /*----男性条数用完提示-----*/



    },
    /*私信置顶，取消置顶*/
    stickUser: function(item) {
        var $item = $(item);
        var data = {
            gagaId: $item.attr('data-gagaid'),
            isStick: $item.hasClass('onStick')? 0:1
        };
        if (!data.gagaId || data.isStick == undefined ) {
            layer.msg($.t('global.zoneApiError'));
        }
        var stickLy = layer.load(1);
        $._post(ctx+'/pm/contactStick', data, function(res) {
            layer.close(stickLy);
            if (res.success) {
                if (data.isStick == 1) {
                    $item.addClass('onStick');
                    $item.find('.letterIsStick').attr('title', $.t('Letter.canceltop'));
                    $('#allContactsGroup .ContactsUl').prepend($item);
                } else {
                    $item.removeClass('onStick');
                    $item.find('.letterIsStick').attr('title', $.t('Letter.gotop'));
                    if ($('#allContactsGroup .ContactsUl li.onStick').length > 0) {
                        $('#allContactsGroup .ContactsUl li.onStick:last').after($item);
                    } else {
                        $('#allContactsGroup .ContactsUl').prepend($item);
                    }                    
                }            
            } else {
                 layer.msg($.t('global.zoneApiError'));
            }
        }, function() {
            layer.close(stickLy);   
        });
    }

}
