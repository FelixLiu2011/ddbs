//个人主页动态信息载入 '${CurrentMember.membGagaid }'
function loadMyZone(melaid, isOhter) {
    var $box = $("#gerendongtai .dynamic > ul");
    var myGagaid = $('.head').attr('gagaid');
    var selfBigImg = $('.yhtx img').attr('src');
    var selfName = $('.yhxx a').text();
    var imgUrl;
    var page = 1;
    var commentArr = [];
    var isNoMore = true;

    reLoad();

    function reLoad(pageNum, isReFresh, callback) {
        var loadIndex = layer.load(0, {
            shade: 0.1
        });
        if (!pageNum) {
            page = 1;
        }
        if (isNoMore) {
            $._post(ctx + "/Zone/personList", {
                "gagaId": melaid,
                "pageNum": page
            }, function(data) {
                var html = '';
                layer.close(loadIndex);
                if (data.success) {
                    var datalist = data.obj;
                    imgUrl = imgWebPaht = data.attributes ? data.attributes.imgUrlPre : '';                    
                    if (data.obj && data.obj.length) {
                        page++;
                        $("#gerendongtai").attr('load-data', data.obj.length);
                        if (isReFresh) {
                            $box.html('');
                        }
                        $.each(datalist, function(index, item) {
                            commentArr.push(new dynamicMsg(item, imgUrl));
                            if (index == (datalist.length - 1)) {
                                callback && callback();
                            }
                        });
                        $('.no-dynamic').addClass('hide');
                        //页面滚动加载逻辑
                        window.onscroll = function() {
                            if ($('.layui-layer-shade').length != 0 || $('.photo-all ').is(':visible')) {
                                return;
                            }
                            var scrollTopValue = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
                            if (Math.abs(getScrollHeight() - getScrollTop() - getClientHeight()) <= 1) {
                                if ($("#gerendongtai:visible").length === 0) {
                                    return;
                                }
                                var itemLength = $('.dynamic > ul > li').length - $('.dynamic > ul > li.new').length;
                                if ($("#gerendongtai").attr('load-data') >= 30) {
                                    //console.log(itemLength / 30 + 1);
                                    window.onscroll = null;
                                    zoneObj.reFresh(page);
                                } else {
                                    layer.msg($.t('zone.noMoreZone'), {
                                        time: 1000
                                    });
                                }
                            }
                        };
                    } else {
                        if (!pageNum) {
                            $('.no-dynamic p').html(isOhter ? data.msg : $.t('zone.myZoneEmpty'));
                            $('.no-dynamic').show();
                        } else {
                            isNoMore = false;
                            layer.msg($.t('zone.noMoreZone'), {
                                time: 1000
                            });
                        }
                        $('.no-dynamic').removeClass('hide');
                    }
                } else {
                    layer.msg(data.msg, {
                        time: 1000
                    });
                }
            }, function() {
                layer.close(loadIndex);
            });
        } else {
            layer.msg($.t('zone.noMoreZone'), {
                time: 1000
            });
            layer.close(loadIndex);
        }
    };

    //单个动态消息
    function dynamicMsg(data, imgUrl, type) {
        var $temp = '<li zone-id="' + data.zone_id + '">' + $("#zoneTemp").html() + '</li>';
        if (type == 'new') {
            $box.prepend($temp);
        } else {
            $box.append($temp);
        }
        var $container;
        if (type == 'new') {
            $container = $box.children().first();
            $container.addClass('new');
        } else {
            $container = $box.children().last();
        }
        var replyObjArr = [];
        var transTypeTemp = $('#transTypeTemp').html();
        var form = {
            memb_bigimg: $($container.find('[field="memb_bigimg"]')[0]),
            memb_nickname: $container.find('[field="memb_nickname"]'),
            zone_datetime: $container.find('[field="zone_datetime"]'),
            zone_content: $container.find('[field="zone_content"]'),
            zone_img: $container.find('[field="zone_img"]'),
            zone_likecount: $container.find('[field="zone_likecount"]'),
            zone_commentcount: $container.find('[field="zone_commentcount"]'),
            zoneTrans: $container.find('[field="zoneTrans"]'),
            isLove: $container.find('[field="isLove"]')
        };
        var $likeBtn = $container.find('.onlike');
        var $inputBtn = $container.find('.c_tx3');
        $inputBtn.html(isOhter ? $.t('zone.likecomments') : $.t('zone.speakwords'));
        var $changePage = $container.find('.more-commont');
        var $delBtn = $container.find('.del-dynamic');
        var $reportBtn = $container.find('.report-dynamic');
        var $imgBox = $container.find('.zoneimgs');
        var isFinishChange = true;
        var noMore = false;

        $inputBtn.click(function() {
            commontInput({
                zoneId: data.zone_id,
                name: data.memb_nickname
            }, 1);
        });
        
        $changePage.click(function() {
            replyChangePage();
        });
        /*
        var isWaring = false;
        $container.find('.commont-content-box').mousewheel(function(event, delta, deltaX, deltaY) {
            if (noMore && !isWaring) {
                layer.msg($.t('zone.nomorecomment'));
                noMore = false;
                isWaring = true;
                return;
            }
            if (delta == -1 && isFinishChange && !noMore) {
                event.stopPropagation();
                event.preventDefault();
                isFinishChange = false;
                replyChangePage();
            }
        });*/

        setData();

        $container.find('.more-commont').html($.t('global.loadmore'));
        $container.find('.onreply.zones').click(function() {
            var replyLen = $container.find('.commont-content-box .commont-content-out').length;
            if (data.commList.length > 0 || replyLen > 0) {
                if ($container.find('.commont-content-box').is(':visible')) {
                    $container.find('.commont-content-box').hide();
                    $container.find('.more-commont').addClass('hide');
                    $(this).find('.dt_reply_btn').removeClass('on');
                } else {
                    $container.find('.commont-content-box').show();
                    if (replyLen >= 10) {
                        $container.find('.more-commont').removeClass('hide');
                    }                    
                    $(this).find('.dt_reply_btn').addClass('on');
                }
            } else {
                commontInput({
                    zoneId: data.zone_id,
                    name: data.memb_nickname
                }, 1);
            }
        });

        $delBtn.click(function() {
            $._post(ctx + '/Zone/delete', {
                zoneId: data.zone_id
            }, function(data) {
                $container.remove();
                //layer.msg(data.msg);
                //刷新相册内容
                $.ajax({
                    type: "post",
                    url: ctx + "/Member/imgcount",
                    success: function(data) {
                        if (data.success) {
                            $("#imgcount").text(data.obj.imgcount);
                            Zoneyet.nms.myInfor.photoPage(data.obj.pageNum, 1);
                        }
                    }
                });
                walledList();
            }, function(request, errorText) {
                layer.msg(errorText, {
                    time: 1000
                });
            });
        });

        $reportBtn.report(function(_reason) {
            var reportData = {
                type: 'Z',
                id: data.zone_id,
                reason: _reason
            };
            $._post(ctx + '/Report/report', reportData, function(data) {
                layer.msg(data.msg, {
                    time: 1000
                });
            }, function(request, errorText) {
                layer.msg(errorText, {
                    time: 1000
                });
            });
        }, 'other-zone-report');

        $likeBtn.click(function() {
            var likeCount = $(this).attr('data-like');
            var isLove = $(this).attr('islove');
            var likeApi = isLove == 0 ? (ctx + '/Zone/love') : (ctx + '/Zone/cancelLove');
            if (isLove == 0) {
                $.zone.likeAct($(this).find('i'));
            }
            $._post(likeApi, {
                'zoneId': data.zone_id
            }, function(data) {
                if (data.success) {
                    var v = isLove == 0 ? (Number(likeCount) + 1) : (Number(likeCount) - 1);
                    $likeBtn.attr({
                        'data-like': v,
                        'islove': isLove == 0 ? 1 : 0
                    });
                    form.zone_likecount.html(v);
                    if (isLove == 0) {
                        form.isLove.addClass("on");
						/*
                        layer.msg($.t('global.loveSucc'), {
                            time: 1000
                        });*/
                    } else {
                        form.isLove.removeClass("on");
						/*
                        layer.msg($.t('global.cancelLoveSucc'), {
                            time: 1000
                        });*/
                    }
                } else {
                    layer.msg($.t('global.zoneApiError'), {
                        time: 1000
                    });
                }
            })
        });

        $imgBox.delegate('img', 'click', function() {
            var zoneId = data.zone_id;
            $.fn.zoneDetail(zoneId, $(this).index(), function(newZoneData) {
                //动态部分更新
                form.zone_likecount.html(newZoneData.zone_likecount);
                if (newZoneData.isLove === 1) {
                    form.isLove.addClass('on');
                } else {
                    form.isLove.removeClass('on');
                }
                form.zone_commentcount.html(newZoneData.zone_commentcount);
                $container.find('.onreply').attr('data-reply', newZoneData.zone_commentcount)
                if (newZoneData.zoneTrans) {
                    if (newZoneData.zoneTrans.zotrCompletime) {
                        form.zoneTrans.html(newZoneData.zoneTrans.zotrTranslathigh || newZoneData.zoneTrans.zotrTranslat).parent().show();
                        $container.find('.dt_tranS_btn').remove();
                    } else {
                        $container.find('.dt_tranS_btn').addClass('trans_londing');
                    }
                    $container.find('.dt_tranS_box').unbind('hover');
                }
                var $comBox = $container.find('.commont-content-box');
                if ($comBox.html() != '') {
                    //评论与回复部分更新
                    if (newZoneData.obj.length > 0) {
                        $.each(newZoneData.obj, function(index, item) {
                            replyObjArr.push(new replyInit(item, (item.zoco_parentid ? true : false)));
                        });
                    }
                    if (newZoneData.delArr && newZoneData.delArr.length) {
                        $.each(newZoneData.delArr, function(index, item) {
                            $comBox.find('.commont-content-out[data-id="' + item + '"]').remove();
                        });
                    }
                    if (newZoneData.comTrans && newZoneData.comTrans.length) {
                        $.each(newZoneData.comTrans, function(index, item) {
                            var $thisCom = $comBox.find('.commont-content-out[data-id="' + item.zmtrCommentid + '"]');
                            if (item.zmtrCompletime) {
                                $thisCom.find('.translate').find('span').text(item.zmtrTranslathigh || item.zmtrTranslat).end().show();
                                $thisCom.find('.dt_tranS_btn1').remove();
                            } else {
                                $thisCom.find('.dt_tranS_btn1').addClass('sub_trans_londing');
                            }
                            $thisCom.find('.trans-type').remove();
                            $thisCom.find('.dt_tranS_box').unbind('hover');
                        });
                    }
                }
            });
        });

        //动态翻译逻辑
        var $transBtn = $container.find('.dt_tranS_btn');
        var $transBox = $transBtn.parent();
        var $transDiv = $container.find('.translate.zones');
        if (!data.zone_content || !$.zone.filterZone(data.zone_content)) {
            $container.find('.dt_tranS_btn').parent().remove();
        } else {
            if (data.zoneTrans) {
                if (data.zoneTrans.zotrCompletime) {
                    $transDiv.show();
                    $transBox.remove();
                } else {
                    $transBtn.addClass('trans_londing');
                }
            } else {
                $transBtn.after(transTypeTemp);
                $transBox.hover(function() {
                    $(this).find('.trans-type').show();
                }, function() {
                    $(this).find('.trans-type').hide();
                });
                var $transLis = $transBtn.next();
                $transLis.find('li').click(function() {
                    var _type = $(this).attr('data-type');
                    $.fn.checkTrans(data.zone_content, function() {
                        $transBtn.addClass('trans_londing');
                        $._post(ctx + '/Zone/translate', {
                            "zoneId": data.zone_id,
                            "translatType": _type
                        }, function(data) {
                            if (data.success) {
                                if (data.obj.zotrCompletime) {
                                    form.zoneTrans.html($.IM.replace_em(data.obj.zotrTranslathigh || data.obj.zotrTranslat || ' '));
                                    $transDiv.show();
                                    $transBox.remove();
                                }
                                $transLis.remove();
                                $.IM.getMoneyNum();
                                $.IM.getTranslationCharacterNum();
                            } else {
                                layer.msg($.t('im.translationFailed'), {
                                    time: 1000
                                });
                                $transBtn.removeClass('trans_londing');
                            }
                        }, function(request, errorText) {
                            $transBtn.removeClass('trans_londing');
                            layer.msg($.t('im.translationFailed'), {
                                time: 1000
                            });
                        });
                    });
                });
            }
        }

        //翻译按钮事件绑定
        function bindTansBtn() {
            $container.find('.dt_tranS_btn').click(function() {
                var $transDiv = $container.find('[field="zone_content"]').next('.translate');
                if ($transDiv.is(':visible')) {
                    $transDiv.hide();
                } else {
                    $transDiv.show();
                }
            });
        }

        //评论翻页
        function replyChangePage() {
            var commontNum = $container.find('.commont-content-box .commont-content-out:not(.new-coms)').length;
            if (commontNum % 10 == 0) {
                var newPage = commontNum / 10 + 1;
                var replyPageLoad = layer.load(0, {
                    shade: 0.1
                });
                $._post(ctx + '/ZoneComment/list', {
                    "zoneId": data.zone_id,
                    "pageNum": newPage
                }, function(data) {
                    layer.close(replyPageLoad);
                    if (data.success) {
                        $.each(data.obj, function(index, item) {
                            replyObjArr.push(new replyInit(item, (item.zoco_parentid ? true : false)));
                        });
                        isFinishChange = true;
                        if (data.obj.length < 10) {
                            noMore = true;
                            $changePage.addClass('hide');
                        }
                    } else {
                        isFinishChange = true;
                        layer.open({
                            content: data.msg
                        });
                    }
                }, function(request, errorText) {
                    layer.close(replyPageLoad);
                    layer.msg(errorText, {
                        time: 1000
                    });
                });
            }
        }

        //数据展现
        function setData() {
            //主动态数据展示
            for (var key in form) {
                switch (key) {
                    case 'memb_bigimg':
                        form[key].attr('src', imgUrl + data[key]);
                        break;
                    case 'zone_img':
                        if (data['img'].length) {
                            var imgHtml = '';
                            var imgSize, imgHeight;
                            switch (data['img'].length) {
                                case 1:
                                    imgSize = '?imageView2/2/w/262/h/262';
                                    imgHeight = 262;
                                    break;
                                case 2:
                                case 4:
                                    imgSize = '?imageView2/5/w/131/h/131';
                                    imgHeight = 131;
                                    break;
                                default:
                                    imgSize = '?imageView2/5/w/87/h/87';
                                    imgHeight = 87;
                            };
                            $.each(data['img'], function(index, item) {
                                if (data['img'].length == 1) {
                                    imgHtml += '<span class="imgboxs"><span class="loadimg"><img src="' + staticPath + '/images/default-square.jpg"/></span><img src="' + imgUrl + item.zoimImgurl + imgSize + '" /></span>';
                                } else {
                                    imgHtml += '<span class="imgboxs" style="width:' + imgHeight + 'px; height:' + imgHeight + 'px;"><span class="loadimg"><img src="' + staticPath + '/images/default-square.jpg"/></span><img src="' + imgUrl + item.zoimImgurl + imgSize + '" width="' + imgHeight + '" /></span>';
                                }
                            });
                            form['zone_img'].html(imgHtml);
                            if (data['img'].length > 1) {
                                form['zone_img'].addClass('multi-img');
                            }                            
                        }
                        break;
                    case 'zone_datetime':
                        var dateText = $.fn.convertUTC(data[key]);
                        form[key].html(dateText);
                        break;
                    case 'isLove':
                        if (data[key] == 1) {
                            form[key].addClass('on');
                        }
                        $(form[key]).parent().attr({
                            'data-like': data['zone_likecount'],
                            'islove': data['isLove']
                        });
                        break;
                    case 'zoneTrans':
                        if (data[key]) {
                            form[key].html($.IM.replace_em(data[key].zotrTranslathigh || data[key].zotrTranslat || ' '));
                        }
                        break;
                    case 'zone_content':
                        if (data[key]) {
                            data[key] = data[key].replace(/\&lt;\s*\/*\s*script\s*&gt;/g,' script ').replace(/\&lt;\s*\/*\s*style\s*&gt;/g,' style ');
                            if (data[key].indexOf('[') != -1 && data[key].indexOf(']') != -1) {
                                form[key].html($.IM.replace_em(data[key]));
                            } else {
                                form[key].html(data[key]);
                            }
                        }       
                        break;
                    default:
                        form[key].html(data[key]);
                }
            }
            //生成动态回复序列
            if (data.commList && data.commList.length > 0) {
                $.each(data.commList, function(index, item) {
                    replyObjArr.push(new replyInit(item, (item.zoco_parentid ? true : false)));
                });
            }
            $container.find('.imgboxs img').each(function() {
                $(this).load(function() {
                    $(this).prev('.loadimg').remove();
                    if ($(this).closest('.zoneimgs').hasClass('multi-img')) {
                        var $thisi = $(this);
                        var $thisP = $(this).parent();
                        if ($thisi.height() < $thisP.height()) {
                            $thisi.css({
                                'height': $thisP.height(),
                                'width': 'auto'
                            }).css({
                                'position': 'relative',
                                'left': ($thisP.width() - $thisi.width()) / 2 + 'px'
                            });
                        }
                    }
                });                
            });
        }

        //动态回复对象
        function replyInit(replydata, islowlevel, isnew) {
            var $replyBox = $container.find('.commont-content-box');
            var replyId = replydata.zoco_id;
            if ($replyBox.find('.commont-content-out[data-id="' + replyId + '"]').length) {
                return;
            }
            var temp = $('#commontContentTemp').html();
            var $html = $(temp).attr({
                'data-id': replyId,
                'parent-id': replydata.zoco_parentid
            }).addClass(isnew? 'new-coms':'');
            if (islowlevel) {
                var parentZone = $replyBox.find('[data-id="' + replydata.zoco_parentid + '"]');
                if (parentZone.next().hasClass('commont-content1')) {
                    parentZone.nextAll('.commont-content1[parent-id="' + replydata.zoco_parentid + '"]').last().after($html);
                } else {
                    parentZone.after($html);
                }
            } else {
                if ($replyBox.find('.commont-content-out.new-coms').length) {
                    if (isnew) {
                        $replyBox.find('.commont-content-out.new-coms:last').after($html);
                    } else {
                        $replyBox.find('.commont-content-out.new-coms:first').before($html);
                    }                    
                } else {
                    $replyBox.append($html);
                }                
            }
            var $subContainer = $replyBox.find('[data-id="' + replyId + '"]');
            if (islowlevel) {
                $subContainer.addClass('commont-content1');
            }
            var $sunInputBtn = $subContainer.find('.dt_icon_r1');
            var subform = {
                memb_bigimg: $($subContainer.find('[field="memb_bigimg"]')[0]),
                memb_nickname: $subContainer.find('[field="memb_nickname"]'),
                zoco_time: $subContainer.find('[field="zoco_time"]'),
                zoco_content: $subContainer.find('[field="zoco_content"]'),
                zmtr_trans: $subContainer.find('[field="zmtr_trans"]')
            };
            var $delZoco = $subContainer.find('.del-zoco');
            if (replydata.zoco_gagaid != myGagaid) {
                $delZoco.remove();
            } else {
                $delZoco.click(function() {
                    $._post(ctx + '/ZoneComment/delete', {
                        zocoId: replyId
                    }, function(data) {
                        if (data.success) {
                            $subContainer.remove();
                            $container.find('[parent-id="' + replyId + '"]').remove();
                            if (!islowlevel) {
                                var numC = Number($container.find('[field="zone_commentcount"]').html()) - 1;
                                $container.find('[field="zone_commentcount"]').html(numC);
                            }
                        } else {
                            layer.msg(data.msg, {
                                time: 1000
                            });
                        }
                    });
                });
            }

            setReplyData(replydata);

            var $subTransBtnBox = $subContainer.find('.dt_tranS_box');
            var $subTransBtn = $subContainer.find('.dt_tranS_btn1');
            if (replydata.zmtr_submitime) {
                if (replydata.zmtr_completime) {
                    $subTransBtnBox.remove();
                    $subContainer.find('.translate').show();
                } else {
                    $subTransBtn.addClass('sub_trans_londing');
                }
            } else {
                $subTransBtn.append(transTypeTemp);
                $subTransBtnBox.hover(function() {
                    $(this).find('.trans-type').show();
                }, function() {
                    $(this).find('.trans-type').hide();
                });
                var $subTransBox = $subContainer.find('.dt_tranS_btn1 .trans-type');
                $subTransBox.find('li').click(function() {
                    var _type = $(this).attr('data-type');
                    $.fn.checkTrans(replydata.zoco_content, function() {
                        $subTransBtn.addClass('sub_trans_londing');
                        $._post(ctx + '/ZoneComment/translate', {
                            "zocoId": replyId,
                            "translatType": _type
                        }, function(data) {
                            if (data.success) {
                                if (data.obj.zmtrCompletime) {
                                    $subTransBtn.removeClass('sub_trans_londing');
                                    subform.zmtr_trans.html(data.obj.zmtrTranslathigh || data.obj.zmtrTranslat || ' ');
                                    $subContainer.find('.translate').show();
                                    $subTransBtn.remove();
                                }
                                $subTransBox.remove();
                                $.IM.getMoneyNum();
                                $.IM.getTranslationCharacterNum();
                            } else {
                                layer.msg($.t('im.translationFailed'), {
                                    time: 1000
                                });
                                $subTransBtn.removeClass('sub_trans_londing');
                            }
                        }, function(request, errorText) {
                            $subTransBtn.removeClass('sub_trans_londing');
                            layer.msg($.t('im.translationFailed'), {
                                time: 1000
                            });
                        });
                    });
                });
            }
            $sunInputBtn.unbind('click').click(function() {
                commontInput({
                    "zoneId": replydata.zoco_zoneid,
                    "zocoParentid": islowlevel ? replydata.zoco_parentid : replydata.zoco_id,
                    "name": replydata.memb_nickname
                }, 2);
            });


            //评论翻译事件
            function bindSubTrans() {
                $subContainer.find('.dt_tranS_btn1').click(function() {
                    var $transDiv = $subContainer.find('.translate');
                    if ($transDiv.is(':visible')) {
                        $transDiv.hide();
                    } else {
                        $transDiv.show();
                    }
                });
            }

            function setReplyData(data) {
                for (var key in subform) {
                    switch (key) {
                        case 'memb_bigimg':
                            subform[key].attr('src', imgUrl + data[key]);
                            break;
                        case 'zoco_time':
                            var dateText = $.fn.convertUTC(data[key]);
                            subform[key].html(dateText);
                            break;
                        case 'zmtr_trans':
                            subform[key].html(data['zmtr_translathigh'] || data['zmtr_translat']);
                            break;
                        default:
                            subform[key].html(data[key]);
                    }
                }
            }
        }

        //动态评论输入功能, type: 1/动态评论调用 2、
        function commontInput(data, type) {
            var $replyBox = $container.find('.reply_box');
            $container.find('.c_tx3').hide();
            $replyBox.show();
            if (type == 2) {
                $replyBox.addClass('reply');
            }
            var $pushBtn = $replyBox.find('.reply_send');
            var $pushTextBox = $replyBox.find('textarea');
            var $selectLan = $replyBox.find('.xld');
            var $selectUl = $replyBox.find('.xld-select');
            var $textLeng = $replyBox.find('.reply-lens');
            if (type == 1) {
                $pushTextBox.attr('placeholder', $.t('zone.commentwords'))
            } else {
                $pushTextBox.attr('placeholder', $.t('global.reply') + '：' + data.name);
            }
            $pushTextBox.focus();

            $pushTextBox.focus(function() {
                $replyBox.find('.replyTextBox').addClass('onin');
            }).blur(function() {
                $replyBox.find('.replyTextBox').removeClass('onin');
                if (!$pushTextBox.val()) {
                    $container.find('.c_tx3').show();
                    $replyBox.hide();
                }
                $textLeng.html($pushTextBox.val().length + '/240');
            }).keyup(function() {
                var val = $pushTextBox.val();
                if ($.trim(val)) {
                    if (val.length >= 240) {
                        $pushTextBox.val(val.substring(0, 240));
                    }
                    $textLeng.html($pushTextBox.val().length + '/240');
                } else {
                    $pushTextBox.val('');
                    $textLeng.html('0/240');
                }
            });

            var isComPush = true;
            $pushBtn.unbind('click').click(function() {
                var pushText = stripscript($pushTextBox.val());
                var pushData = {
                    zoneId: data.zoneId,
                    content: pushText.indexOf(data.name) != -1 ? pushText.split(data.name + ' ')[1] : pushText
                };
                if (data.zocoParentid) {
                    pushData.zocoParentid = data.zocoParentid;
                }
                if (data && isComPush) {
                    isComPush = false;
                    $._post(ctx + '/ZoneComment/publish', pushData, function(data) {
                        if (data.success) {
                            replyObjArr.push(new replyInit(data.obj, (data.obj.zoco_parentid ? true : false), true));
                            $container.find('.commont-content-box').show();
                            //$container.find('.more-commont').show();
                            if (type == 1) {
                                var numC = Number($container.find('[field="zone_commentcount"]').html()) + 1;
                                $container.find('[field="zone_commentcount"]').html(numC);
                            }
                            $container.find('.c_tx3').show();
                            $replyBox.hide();
                            $pushTextBox.val('');
                            $textLeng.html($pushTextBox.val().length + '/240');
                            isComPush = true;
                        } else {
                            layer.msg(data.msg, {
                                time: 1000
                            });
                            isComPush = true;
                        }
                    }, function(request, errorText) {
                        layer.msg(errorText, {
                            time: 1000
                        });
                        isComPush = true;
                    });
                }
            });
        }

        //防止xss攻击，过滤输入字符
        function stripscript(s) {
            //格式 RegExp("[在中间定义特殊过滤字符]")
            var pattern = new RegExp("[<>]");
            var rs = "";
            for (var i = 0; i < s.length; i++) {
                rs = rs + s.substr(i, 1).replace(pattern, '');
            }
            return rs;
        }

    }

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


    this.addZone = dynamicMsg;
    this.reFresh = reLoad;
    this.zoneArr = commentArr;
    this.imgurl = imgUrl;
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