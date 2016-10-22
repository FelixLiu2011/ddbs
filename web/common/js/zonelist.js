//动态发布模块
function publishZone() {
    var $pushBox = $('.dynamicTextBox');
    var $sendBtn = $pushBox.find('.send_btn');
    //发布动态字符数计算
    var detail = $("#zone_text").val();
    var counter;
    if (typeof(detail) != "undefined") {
        counter = detail.length; //获取文本域的字符串长度
    }
    $("#textNum").text(counter + "/500");

    $("#zone_text").keyup(function() {
        var texts = $.trim($("#zone_text").val());
        if (texts) {
            $("#textNum").text(texts.length + "/500");
            $sendBtn.addClass('on');
        } else {
            clearZoneInput();
        }

        if (texts.length > 500) {
            var newtext = texts.substring(0, 500);
            $("#zone_text").val(newtext);
            $("#textNum").text("500/500");
        }
    }).change(function() {
        var texts = $.trim($("#zone_text").val());
        if (texts) {
            $sendBtn.addClass('on');
        } else {
            $sendBtn.removeClass('on');
        }
    });


    //表情初始化及点击事件
    var faceObj = $('.dynamicTextBox .dt_emo').facePackage('zone_text');
    $('body').delegate('#facebox', 'click', function() {
        $('#js_publish').addClass('on');
    });
    //修改默认placeholder显示方式
    $("#zone_text").focus(function() {
        $(this).attr("placeholder", "");
    }).blur(function() {
        $(this).attr("placeholder", $.t('zone.zoneShare'));
    });
    //发布动态
    var isPushComplate = true;
    $("#js_publish").click(function() {
        var content = $.trim($("#zone_text").val()),
            imgNum = $("#uploader").find("li").size(),
            img;

        content = faceObj.convertData(content);
        if (content != "" && imgNum == 0 && isPushComplate) {
            //有内容没图
            isPushComplate = false;
            $._post(ctx + "/Zone/publish", {
                "content": content
            }, function(f) {
                isPushComplate = true;
                if (f.success) {
                    initZoneObj.getData(undefined, 'refresh', pageMethod);
                    clearZoneInput();
                    return;
                } else { // $.t('global.zoneApiError')
                    layer.msg(f.msg, {
                        time: 1000
                    });
                }
            });
        } else if (imgNum > 0 && isPushComplate) {
            //有图 有没有内容均可
            isPushComplate = false;
            //请求toKen
            $._post(ctx + "/Image/uploadInit", {
                "type": "Z",
                "imgNum": imgNum
            }, function(z) {
                img = z.obj.img;
                if (z.success) {
                    $("#upLoad_box").attr({
                        "data-upToken": z.obj.upToken,
                        "data-key": img
                    });
                    //发布
                    $._post(ctx + "/Zone/publish", {
                        "content": content,
                        "img": img
                    }, function(f) {
                        isPushComplate = true;
                        if (f.success) {
                            $(".uploadBtn").click();
                            $("#upLoad_box").css('left', '-99999px');
                            clearZoneInput();
                            return false;
                        } else { // $.t('global.zoneApiError')
                            layer.msg(f.msg, {
                                time: 1000
                            });
                        }
                    });
                }
            });
        }
    });

    //发布图片动态
    $("#dynamic_list").on("click", "#picUp", function() {
        if ($('#upLoad_box').is(':visible')) {
            return;
        }
        $("#upLoad_box").show();
        if ($("#upLoad_box").html() == '') {
            $("#upLoad_box").append('<div class="upLoad_main"><i class="triangle"></i><span class="fr"><i class="z_dt_icon inlineblock dt_upCancel mr10"></i></span><span class="inlineblock mb10">' + $.t('global.localUpload') + '</span><div id="uploader"class="wu-example"><div class="info inlineblock mb10"></div><div class="queueList"><div id="dndArea"class="placeholder"><div id="filePicker"></div></div><div id="filePicker2"></div></div><div class="btns"><div class="uploadBtn">' + $.t('global.uploadStart') + '</div></div></div></div>');
        }
        $('#js_publish').addClass('on');
        $.fn.uploadImg(function(data, block) {
            $("#upLoad_box").css('left', '0').hide().empty();
            initZoneObj.getData(undefined, 'refresh', pageMethod);
        });
        $.ajaxSetup({
            cache: true
        });
    });
    $("#dynamic_list").on("click", ".dt_upCancel", function() {
        $("#upLoad_box").hide();
        $("#upLoad_box").empty();
        $('#js_publish').removeClass('on');
    });


    function clearZoneInput() {
        $("#zone_text").val('');
        $('#textNum').text("0/500");
        $sendBtn.removeClass('on');
    }
}

//动态列表模块
function initZoneList() {
    var $container = $('#zone_list');
    var $leftBox = $container.find('.left-zone');
    var $centerBox = $container.find('.center-zone');
    var $rightBox = $container.find('.right-zone');
    var myGagaId = $('.head').attr('gagaid');
    var zoneArr = {
        left: [],
        center: [],
        right: []
    };
    var isNoZone = false;

    function getZoneData(pagenum, type, method) {
        var lastZoneId;
        var _method;
        var isAd = false;
        if (pagenum) {
            lastZoneId = $container.find('.dynamic_item.last-zone:last').attr('data-zoneid');
        } else {
            if (type == 'refresh') {
                isNoZone = false;          
            }
        }
        if (method == 'friend') {
            _method = apiUrl + '/Zone/friendList';
        } else if (method == 'recomm') {
            _method = apiUrl + '/Zone/recommList';
        } else {
            _method = apiUrl + '/Zone/list';
            isAd = true;
        }
        var isGetComplate = true;
        var loadIndex = layer.load(0, {
            shade: 0.1
        });
        if (isGetComplate && !isNoZone) {
            isGetComplate = false;
            $._post(_method, {
                pageNum: pagenum,
                prePageLastZoneId: lastZoneId
            }, function(data) {
                if (data.success) {
                    layer.close(loadIndex);
                    isGetComplate = true;
                    if (data.obj.length == 0) {
                        isNoZone = true;
                        if (!pagenum || pagenum == 1) {
                            $('#dynamic_list').hide();
                            $('.no-zone-msg').removeClass('hide');
                        } else {
                            layer.msg($.t('zone.noMoreZone'), {
                                time: 1000
                            });
                        }
                    } else {
                        $('#dynamic_list .input_zone').removeClass('hidden');
                        initZone(data, type, function() {
                            //插入广告位                        
                            if (isAd && !pagenum) {
                                var loadAdIndex = layer.load(0, {
                                    shade: 0.1
                                });
                                $._post(apiUrl + '/ad/area/getContent', {
                                    areaCode: '1467084894794'
                                }, function(adData) {
                                    //console.log(adData);
                                    layer.close(loadAdIndex);
                                    var adItem;
                                    if (adData.success && adData.obj) {
                                        adItem = '<div class="dynamic_item ad">' + adData.obj + '</div>';                                        
                                    } else {
                                        adItem = '<div class="dynamic_item ad"><img src="' + staticPath + '/images/' + (curLanguage == 'zh-cn'? 'zone_ad': 'zone_ad_en') + '.jpg" width="100%" height="" alt=""></div>';
                                    }
                                    $centerBox.find('.dynamic_item:first').after(adItem);                                    
                                });                                
                            }
                            //页面滚动加载逻辑  Math.abs($(document).height() - $(window).height() - scrollTopValue) <= 1
                            window.onscroll = function() {
                                var scrollTopValue = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
                                if (Math.abs(getScrollHeight() - getScrollTop() - getClientHeight()) <= 1) {
                                    var itemLength = $container.find('.dynamic_item.datas').length;
                                    if (itemLength > 0 && itemLength % 30 == 0) {
                                        window.onscroll = null;
                                        getZoneData(itemLength / 30 + 1, undefined, pageMethod);
                                    } else {
                                        layer.msg($.t('zone.noMoreZone'), {
                                            time: 1000
                                        });
                                    }
                                }
                            };

                            //调整单个图片的动态中，图片高度过小时的显示问题
                            var imgs = $('#dynamic_list .img_box img');
                            $.each(imgs, function(i, n) {
                                $(n).load(function() {
                                     $(n).prev('.loadimg').remove();
                                     /*
                                     if ($(n).closest('.img_box').attr('data-picnum') == 1) {
                                        if ($(n).height() < 262) {
                                            $(n).height($(n).parent().height()).css('width', 'auto');
                                            $(n).css({
                                                'position': 'relative',
                                                'left': (262 - $(n).width()) / 2 + 'px'
                                            });
                                        }
                                     } */                                   
                                });
                            });
                        });
                    }
                }
            });
        } else {
            layer.close(loadIndex);
            layer.msg($.t('zone.noMoreZone'), {
                time: 1000
            });
        }
    }

    function initZone(data, type, callback) {
        if (!data || data.obj.length == 0) {
            layer.msg($.t('global.nodata'), {
                time: 1000
            });
            return;
        }
        var zoneListData = data;
        var itemTemp = '';

        if ($('body #zoneitem-tmpl').length == 0) {
            $.get(staticUrl + '/js/zone_template.html', function(data) {
                itemTemp = data;
                $('body').append(itemTemp);
                initList();
            });
        } else {
            initList();
        }

        function initList() {
            zoneListData.language = curLanguage;
            zoneListData.myGagaId = $('.head').attr('gagaid');
            if (zoneListData.attributes.topZoneList && zoneListData.attributes.topZoneList.length > 0) {
                $.each(zoneListData.attributes.topZoneList, function(i, elem) {
                    elem.isTop = true;
                    elem.zone_content = $.string.decodeHtml(elem.zone_content);
                });
                //console.log(zoneListData.attributes.topZoneList);
                var newZoneArr = zoneListData.attributes.topZoneList.concat(zoneListData.obj);
                zoneListData.obj = newZoneArr;
            }
            var html = $.template($('#zoneitem-tmpl').html(), {
                datalist: zoneListData
            });
            var listLength = zoneListData.obj.length;
            var i = 0;
            var $html = $(html);
            var $zoneBox = $('#zone_list');
            $container.find('.dynamic_item').removeClass('last-zone');
            if (type == 'refresh') {
                $leftBox.html('');
                $centerBox.html('');
                $rightBox.html('');
            }
            $html.each(function() {
                if ($(this).hasClass('dynamic_item')) {
                    var isLast = $(this).hasClass('last-zone');
                    var leftZoneNum = $leftBox.height() + 253;
                    var centerZoneNum = $centerBox.height();
                    var rightZoneNum = $rightBox.height();
                    var LowerH = Math.min(centerZoneNum, rightZoneNum, leftZoneNum);
                    if (centerZoneNum == LowerH) {
                        zoneArr.center.push(new zoneObj($(this), 'center'));
                    } else if (rightZoneNum == LowerH) {
                        zoneArr.right.push(new zoneObj($(this), 'right'));
                    } else {
                        zoneArr.left.push(new zoneObj($(this), 'left'));
                    }
                    if (isLast) {
                        if (callback) {
                            callback();
                        }
                    }
                }
            });
        }
    }

    function zoneObj(obj, _location) {
        var $itemBox;
        if (_location == 'left') {
            $leftBox.append(obj);
            $itemBox = $leftBox.find('.dynamic_item').last();
        } else if (_location == 'center') {
            $centerBox.append(obj);
            $itemBox = $centerBox.find('.dynamic_item').last();
        } else {
            $rightBox.append(obj);
            $itemBox = $rightBox.find('.dynamic_item').last();
        }
        var itemIndex = $itemBox.index();
        var itemZoneid = $itemBox.attr('data-zoneid');
        var form = {
            report: $itemBox.find('.dt_report'),
            content: $itemBox.find('.dt_text'),
            more: $itemBox.find('.js_switch'),
            trans: $itemBox.find('.detail_trans'),
            imgs: $itemBox.find('.img_w'),
            likebtn: $itemBox.find('.f_detail .dt_like_btn'),
            likenum: $itemBox.find('.f_detail .onlike span'),
            commentbtn: $itemBox.find('.onreply i'),
            commentnum: $itemBox.find('.onreply span'),
            transbtn: $itemBox.find('.dt_tranS_btn.js_transZone'),
            showinput: $itemBox.find('.c_tx3'),
            replylist: $itemBox.find('.pl_list'),
            inputarea: $itemBox.find('textarea'),
            reylyBox: $itemBox.find('.reply_box'),
            morereply: $itemBox.find('.load_more_comment')
        };

        //解析动态表情
        var $word = form.content.find('.zone-word');
        var $moreWord = form.content.find('.more-word');
        if (!$word.hasClass('old')) {
            $word.html($.string.decodeHtml($.IM.replace_em($word.html())));
            $moreWord.html($.string.decodeHtml($.IM.replace_em($moreWord.html())));
            form.trans.find('.text').html($.string.decodeHtml($.IM.replace_em(form.trans.find('.text').html())));
        } else {
            $word.html($.string.decodeHtml($.IM.replace_em($word.html())));
            $word.find('img.cursor_zoom').click(function() {
                layer.open({
                    type: 1,
                    title: false,
                    closeBtn: 0,                    
                    skin: 'layui-layer-nobg', //没有背景色 area: '516px',
                    shadeClose: true,
                    content: '<img src="' + $(this).attr('src') + '">'
                });
            });
        }     

        //展开、收起截断的动态内容
        form.more.click(function() {
            if ($moreWord.hasClass('hide')) {
                $(this).text($.t('global.retract'));
                form.content.find('.omit').addClass('hide');
                $moreWord.removeClass('hide');
                form.more.siblings('i').addClass('open');
            } else {
                $(this).text($.t('global.viewMore'));
                form.content.find('.omit').removeClass('hide');
                $moreWord.addClass('hide');
                form.more.siblings('i').removeClass('open');
            }
        });

        //举报
        form.report.report(function(_reason, btn) {
            var reportData = {
                type: 'Z',
                id: $(btn).attr('data-zoneid'),
                reason: _reason
            };
            $._post(apiUrl + '/Report/report', reportData, function(data) {
                if (data.success) {
                    layer.msg($.t('global.zoneApiSucc'), {
                        time: 1000
                    });
                } else {
                    layer.msg($.t('global.zoneApiError'), {
                        time: 1000
                    });
                }
            }, function(request, errorText) {
                layer.msg(errorText, {
                    time: 1000
                });
            });
        }, 'zone-report');

        //点击图片，查看动态详情 ,以及关闭详情后更新动态
        form.imgs.click(function() {
            var zoneId = $itemBox.attr("data-zoneId");
            var isTopZone = $itemBox.hasClass('top-zone');
            $.fn.zoneDetail(zoneId, $(this).index(), function(newZoneData) {
                newZoneData.gagaid = myGagaId;
                //动态点赞更新
                form.likenum.html(newZoneData.zone_likecount);
                if (newZoneData.isLove === 1) {
                    form.likebtn.addClass('on');
                } else {
                    form.likebtn.removeClass('on');
                }
                //动态评论更新
                form.commentnum.html(newZoneData.zone_commentcount);
                $itemBox.find('.onreply').attr('data-reply', newZoneData.zone_commentcount);
                //动态翻译更新
                if (newZoneData.zoneTrans) {
                    if (newZoneData.zoneTrans.zotrCompletime) {
                        form.trans.find('.text').html(newZoneData.zoneTrans.zotrTranslathigh || newZoneData.zoneTrans.zotrTranslat).end().removeClass('hide');
                        form.transbtn.remove();
                    } else {
                        form.transbtn.find('.language_obj_detail').remove();
                        form.transbtn.addClass('trans_londing');
                    }                    
                }
                //如果已展开评论，评论更新 
                if (form.replylist.html() != '') {
                    if (newZoneData.obj.length > 0) {
                        var newHtml = $.template($('#zone-com-tmpl').html(), {
                            datalist: newZoneData
                        });
                        $('#commentTempBox').html(newHtml);
                        $('#commentTempBox .comment_item').each(function() {
                            $(this).addClass('new');
                            if ($(this).hasClass('p-reply')) {
                                form.replylist.append($(this));
                            } else {
                                var parentId = $(this).attr('parent-id');
                                if (form.replylist.find('[parent-id="' + parentId + '"]').length) {
                                    form.replylist.find('[parent-id="' + parentId + '"]').last().after($(this));
                                } else {
                                    form.replylist.find('[reply-id="' + parentId + '"]').after($(this));
                                }
                            }
                        });
                    }
                    if (newZoneData.delArr && newZoneData.delArr.length) {
                        newZoneData.delArr.forEach(function(item) {
                            form.replylist.find('[reply-id="' + item + '"]').remove();
                        });
                    }
                    if (newZoneData.comTrans && newZoneData.comTrans.length) {
                        newZoneData.comTrans.forEach(function(item) {
                            var $thisCom = form.replylist.find('[reply-id="' + item.zmtrCommentid + '"]');
                            if (item.zmtrCompletime) {
                                $thisCom.find('.sub-trans').find('span').text(item.zmtrTranslathigh || item.zmtrTranslat).end().removeClass('hide');
                                $thisCom.find('.dt_tranS_btn2').remove();
                            } else {
                                $thisCom.find('.language_obj_detail').remove();
                                $thisCom.find('.dt_tranS_btn2').addClass('sub_trans_londing');
                            }                                                                                   
                        });
                    }
                }
            }, {showLink: isTopZone});
        });

        //动态点赞
        form.likebtn.click(function() {
            var $parent = $(this).parent();
            var $f_detail = $parent.parent();
            var _likecount = $parent.attr("data-like");
            var isLove = $f_detail.attr("data-isLove");
            var value = {
                "zoneId": $f_detail.attr("data-zoneid")
            };
            var loveUrl = apiUrl + (isLove == 0 ? '/Zone/love' : '/Zone/cancelLove');
            if (isLove == 0) {
                $.zone.likeAct($(this));
            }
            $._post(loveUrl, value, function(data) {
                if (data.success) {
                    _likecount = isLove == 0 ? (parseInt(_likecount) + 1) : (parseInt(_likecount) - 1);
                    $parent.attr("data-like", _likecount).find("span").text(_likecount);
                    if (isLove == 0) {
                        $parent.find("i").addClass("on");
                    } else {
                        $parent.find("i").removeClass("on");
                    }
                    $f_detail.attr("data-isLove", (isLove == 0 ? 1 : 0));
					/*
                    layer.msg($.t(isLove == 0 ? 'global.loveSucc' : 'global.cancelLoveSucc'), {
                        time: 1000
                    });*/
                } else {
                    layer.msg($.t('global.zoneApiError'), {
                        time: 1000
                    });
                }
            });
        });

        //动态翻译
        if (form.transbtn && form.transbtn.attr('trans-status') == 0) {
            form.transbtn.find('li').click(function() {
                zoneStrans($(this));
            });
        }

        //查看、收起动态评论,加载更多评论
        var $onReply = $itemBox.find('.onreply');
        form.commentbtn.click(function() {
            if ($onReply.attr('data-reply') != 0) {
                if (form.replylist.is(':visible') && form.replylist.find('.comment_item:not(".new")').length) {
                    form.replylist.addClass('hide');
                    form.morereply.addClass('hide');
                } else {
                    loadReply(1);
                    form.replylist.removeClass('hide');
                }
            } else {
                comInput();
            }
        });
        form.morereply.click(function() {
            var commentNum = form.replylist.find('.comment_item:not(".comment_item.new")').length;
            if (commentNum % 10 == 0) {
                loadReply(commentNum / 10 + 1);
            }
        });

        //点击显示输入框
        form.showinput.click(function() {
            comInput();
        });

        //动态输入框操作交互
        form.inputarea.blur(function() {
            var val = $.trim($(this).val());
            if (!val) {
                form.showinput.removeClass('hide');
                form.reylyBox.addClass('hide');
            }
        }).keyup(function() {
            var $textLeng = form.reylyBox.find('.reply-lens');
            var val = $(this).val();
            if ($.trim(val)) {
                if (val.length >= 240) {
                    $(this).val(val.substring(0, 240));
                }
                $textLeng.html($(this).val().length + '/240');
            } else {
                $(this).val('');
                $textLeng.html('0/240');
            }
        });

        //发布评论和回复
        var $pushBtn = $itemBox.find('.reply_send');
        var isPushComplate = true;

        function comInput(id, type) {
            form.showinput.addClass('hide');
            form.reylyBox.removeClass('hide');
            form.inputarea.focus();
            $pushBtn.unbind('click').click(function() {
                var value = $.fn.xss(form.inputarea.val());
                if (isPushComplate && value) {
                    isPushComplate = false;
                    $._post(apiUrl + '/ZoneComment/publish', {
                        zoneId: itemZoneid,
                        zocoParentid: type == 'reply' ? id : undefined,
                        content: value
                    }, function(data) {
                        isPushComplate = true;
                        if (data.success) {
                            var newData = {
                                attributes: data.attributes,
                                obj: [data.obj]
                            };
                            initReplyList(newData, 'new');
                            //layer.msg($.t('global.zoneApiSucc'));
                            form.reylyBox.addClass('hide');
                            form.inputarea.val('');
                            form.reylyBox.find('.reply-lens').html('0/240');
                            form.showinput.removeClass('hide');
                            form.replylist.removeClass('hide');
                            if (!type) {
                                form.commentnum.html(Number(form.commentnum.html()) + 1);
                                $onReply.attr('data-reply', Number(form.commentnum.html()));
                            }
                        } else { // $.t('global.zoneApiError')
                            layer.msg(data.msg, {
                                time: 1000
                            });
                        }
                    }, function() {
                        isPushComplate = true;
                    });
                }
            });
        }

        //动态评论加载
        function loadReply(pagenum) {
            $._post(apiUrl + '/ZoneComment/list', {
                zoneId: itemZoneid,
                pageNum: pagenum
            }, function(data) {
                if (data.success && data.obj.length) {
                    if (pagenum == 1) {
                        form.replylist.html('');
                    }
                    initReplyList(data);
                    if (data.obj.length >= 10) {
                        form.morereply.removeClass('hide');
                    } else {
                        form.morereply.addClass('hide');
                    }
                } else {
                    form.morereply.addClass('hide');
                    layer.msg($.t('zone.nomorecomment'), {
                        time: 1000
                    });
                }
            });
        }

        function initReplyList(data, type) {
            if (!data || !data.obj.length) {
                return;
            }
            if (!$('#zoneComTemp').length) {
                $('body').append('<div id="zoneComTemp"></div>');
            }
            var $tempBox = $('#zoneComTemp');
            var comData = {
                attributes: {
                    imgUrlPre: data.attributes.imgUrlPre
                },
                gagaid: myGagaId,
                type: type || undefined,
                obj: []
            };
            var replyData = {
                attributes: {
                    imgUrlPre: data.attributes.imgUrlPre
                },
                gagaid: myGagaId,
                type: type || undefined,
                obj: []
            };
            comData.obj = $.grep(data.obj, function(item) {
                return !item.zoco_parentid;
            });
            replyData.obj = $.grep(data.obj, function(item) {
                return item.zoco_parentid;
            });
            if (comData.obj.length) {
                var comHtml = $.template($('#zone-com-tmpl').html(), {
                    datalist: comData
                });
                $(comHtml).each(function() {
                    var comid = $(this).attr('reply-id');
                    if (!form.replylist.find('[reply-id="' + comid + '"]').length) {
                        if (form.replylist.find('.p-reply.new').length && !$(this).hasClass('new')) {
                            form.replylist.find('.p-reply.new:first').before($(this));
                        } else {
                            form.replylist.append($(this));
                        }
                    }
                });
            }
            if (replyData.obj) {
                var replyHtml = $.template($('#zone-com-tmpl').html(), {
                    datalist: replyData
                });
                $tempBox.append(replyHtml);
                $tempBox.find('.comment_item').each(function() {
                    var parentid = $(this).attr('parent-id');
                    var thisId = $(this).attr('reply-id');
                    var $parentItem = form.replylist.find('[reply-id="' + parentid + '"]');
                    if (!form.replylist.find('[reply-id="' + thisId + '"]').length) {
                        if (form.replylist.find('[parent-id="' + parentid + '"]').length) {
                            form.replylist.find('[parent-id="' + parentid + '"]:last').after($(this));
                        } else {
                            $parentItem.after($(this));
                        }
                    }
                });
            }
        }

        //翻译评论或回复
        form.replylist.delegate('.dt_tranS_btn2', 'click', function() {
            if ($(this).attr('trans-status') == 1) {
                $(this).closest('.comment_item').find('.sub-trans').toggleClass('hide');
            }
        });

        form.replylist.delegate('.language_obj_detail li', 'click', function() {
            zoneStrans($(this));
        });


        //回复评论
        form.replylist.delegate('.dt_reply_btn2', 'click', function() {
            var $replyBox = $(this).closest('.comment_item');
            if ($replyBox.hasClass('sub-reply')) {
                comInput($replyBox.attr('parent-id'), 'reply');
            } else {
                comInput($replyBox.attr('reply-id'), 'reply');
            }
        });

        //删除评论或回复
        form.replylist.delegate('.del_comment', 'click', function() {
            var delId = $(this).attr('data-id');
            var $replyBox = $(this).closest('.comment_item');
            $._post(apiUrl + '/ZoneComment/delete', {
                zocoId: delId
            }, function(data) {
                if (data.success) {
                    form.replylist.find('.comment_item[reply-id="' + delId + '"]').remove();
                    form.replylist.find('.comment_item[parent-id="' + delId + '"]').remove();
                    //layer.msg($.t('global.zoneApiSucc'));
                    if (!$replyBox.hasClass('sub-reply')) {
                        form.commentnum.html(Number(form.commentnum.html()) - 1);
                    }
                } else {
                    layer.msg($.t('global.zoneApiError'), {
                        time: 1000
                    });
                }
            });
        });

        //翻译函数
        function zoneStrans(obj) {
            var _languageLi = $(obj);
            var _transBtn = _languageLi.closest('.js_transZone');
            var isSub = _transBtn.hasClass('substrans');
            var transApi = apiUrl + (isSub ? '/ZoneComment/translate' : '/Zone/translate');
            var contentStr;
            var $transTextBox;
            var _data = {
                'translatType': _languageLi.attr('langs-lang')
            };
            var londingType;
            if (isSub) {
                var $commentItem = _transBtn.closest('.comment_item');
                _data.zocoId = _transBtn.attr('data-id');
                $transTextBox = $commentItem.find('.sub-trans');
                contentStr = $commentItem.find('.comment_words').html();
                londingType = 'sub_trans_londing';
            } else {
                _data.zoneId = _transBtn.attr('data-id');
                $transTextBox = $itemBox.find('.detail_trans');
                contentStr = _transBtn.closest('.dynamic_item').find('.zone-word').html();
                if (_transBtn.closest('.dynamic_item').find('.more-word').length) {
                    contentStr += _transBtn.closest('.dynamic_item').find('.more-word').html();
                }
                londingType = 'trans_londing';
            }
            _transBtn.find('.language_obj_detail').hide();
            $.fn.checkTrans(contentStr, function() {
                _transBtn.addClass(londingType);
                $._post(transApi, _data, function(data) {
                    if (data.success) {
                        layer.msg($.t('global.zoneApiSucc'), {
                            time: 1000
                        });
                        if (isSub) {
                            if (data.obj.zmtrCompletime) {
                                $transTextBox.removeClass('hide').find('span').html(data.obj.zmtrTranslathigh || data.obj.zmtrTranslat);
                                _transBtn.removeClass(londingType);
                                _transBtn.remove();
                            } else {
                                _transBtn.find('.language_obj_detail').remove();
                            }
                        } else {
                            if (data.obj.zotrCompletime) {
                                $transTextBox.removeClass('hide').find(".js_detail_trans").html($.IM.replace_em(data.obj.zotrTranslathigh || data.obj.zotrTranslat));
                                _transBtn.removeClass(londingType);
                                _transBtn.remove();
                            } else {
                                _transBtn.find('.language_obj_detail').remove();
                            }
                        }
                        $.IM.getMoneyNum();
                        $.IM.getTranslationCharacterNum();
                    } else {
                        layer.msg($.t('im.translationFailed'), {
                            time: 1000
                        });
                        _transBtn.removeClass(londingType);
                    }
                }, function() {
                    _transBtn.removeClass(londingType);
                    layer.msg($.t('im.translationFailed'), {
                        time: 1000
                    });
                });
            }, function() {
                _transBtn.find('.language_obj_detail').removeAttr('style');
            }, function(){
                _transBtn.find('.language_obj_detail').removeAttr('style');
            });
        }

    }

    var self = {
        getData: getZoneData
    };
    return self;
}



//获取滚动条当前的位置
function getScrollTop() {
    var scrollTop = 0;
    if (document.documentElement && document.documentElement.scrollTop) {
        scrollTop = document.documentElement.scrollTop;
    } else if (document.body) {
        scrollTop = document.body.scrollTop;
    }
    return scrollTop;
}
//获取当前可是范围的高度
function getClientHeight() {
    var clientHeight = 0;
    if (document.body.clientHeight && document.documentElement.clientHeight) {
        clientHeight = Math.min(document.body.clientHeight, document.documentElement.clientHeight);
    } else {
        clientHeight = Math.max(document.body.clientHeight, document.documentElement.clientHeight);
    }
    return clientHeight;
}
//获取文档完整的高度
function getScrollHeight() {
    return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
}
//判断url资源是否存在  
function isEffective(_url) {
    try {
        var xmlhttp;
        if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else { // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.open("get", _url, false);
        xmlhttp.send();
        if (xmlhttp.status == "404") {
            return false;
        } else {
            return true;
        }
    } catch (e) {
        return false;
    }
}



//原始瀑布流计算方式
function dt_list(obj, objParent) {
    var margin = 12; //这里设置间距
    var li = $("#dynamic_list .dynamic_item");
    var li_W = li[0].offsetWidth + margin;
    var h = [];
    var domH2 = 0;
    var n = Math.floor(objParent / obj); //个数
    for (var i = 0; i < li.length; i++) {
        li_H = li[i].offsetHeight;
        if (i % 3 === 0) {
            domH2 += li[i].offsetHeight;
        }
        if (i < n) {
            h[i] = li_H;
            li.eq(i).css("top", 0);
            li.eq(i).css("left", i * li_W);
        } else {
            min_H = Math.min.apply(null, h);
            minKey = getarraykey(h, min_H);
            h[minKey] += li_H + margin;
            li.eq(i).css("top", min_H + margin);
            li.eq(i).css("left", minKey * li_W);
        }
    }
    $("#dynamic_list").height(domH2);
    setHeight();
}
//设置列表容器高度
function setHeight() {
    var lastItem = $('#zone_list .dynamic_item:last');
    var lastHeightArr = [(Number(lastItem.height()) + Number(lastItem.css('top').replace('px', ''))), (Number(lastItem.prev().height()) + Number(lastItem.prev().css('top').replace('px', ''))), (Number(lastItem.prev().prev().height()) + Number(lastItem.prev().prev().css('top').replace('px', '')))];
    var newHeight = lastHeightArr[0];
    if (newHeight < lastHeightArr[1]) {
        newHeight = lastHeightArr[1];
    }
    if (newHeight < lastHeightArr[2]) {
        newHeight = lastHeightArr[2];
    }
    //console.log(lastHeightArr);    
    $('#dynamic_list').height(newHeight);
}