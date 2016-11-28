var popPrivate=popPrivate||{};
(function(pv){
    var private= function () {
        this.init();
        this.bind();
    };

    private.prototype.init=function(){
        var ContactsUl = $(".LetterchatContainer .leftCon .ContactsUl");
        /*------------输入框---------------*/
        $("#chatConBottom .sendContent").focus(function () {
            $("#chatConBottom .sendBtn").css({
                "color": "#fff",
                "background-color": "#2D57A1"
            });
            var th = $(this);
            th.css("color", "#333");
            if (th.val() == $.t("im.enterKeySend")) {
                th.val("");
            }
        }).blur(function () {
            var th = $(this);
            if (th.val() == $.t("im.enterKeySend") || th.val().trim() == "") {
                th.val($.t("im.enterKeySend")).css("color", "#999");
            }
        });
        /* -------------语言选择-------------------*/
        $("#chatConBottom .langBtn").click(function (e) {
            $(this).parent().children(".languageUl").toggle();
            if ($(this).children(".Triangle").css("background-position-x") == "-273px") {
                $(this).children(".Triangle").css("background-position", "-240px -50px");
            } else {
                $(this).children(".Triangle").css("background-position", "-273px -50px");
            }
            e.stopPropagation();
            $(document).click(function () {
                $("#chatConBottom .languageUl").hide();
                $("#chatConBottom .langBtn .Triangle").css("background-position", "-240px -50px");
            });
        });
        $("#chatConBottom .langLi").click(function () {
            $(this).parent().hide();
            $(this).parents(".langOptions").find(".language").attr("langs-lang", $(this).attr("langs-lang")).text($(this).text());
            $(this).parents(".langOptions").find(".Triangle").css("background-position", "-240px -50px");
        });
        //初始化Web Uploader
        var uploader = WebUploader.create({
            // 选完文件后，是否自动上传。
            //auto: true,
            // swf文件路径
             swf: staticCtx+'js/Uploader.swf',
            // 文件接收服务端。
            server: "http://up.qiniu.com",
            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: {
                id: '#chatConBottom .imgBtn',
                multiple: false
            },
            duplicate: true,
            // 只允许选择图片文件。
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        });
        function LetterupIMG(){
            var LetterupIMGgagaID = "";
            var LetterupLoadImgContainer ="";
            var urlIMGPath="";
            uploader.on('beforeFileQueued', function (file) {
                $.post(ctx+"/Image/uploadInit",{"type":"M","imgNum":1},function(regImg){
                    if(regImg.success){
                        //$("#Im_data").attr({"data-token":regImg.obj.upToken,"data-imgname":regImg.obj.img[0]});
                        $("#chatConBottom .imgBtn").attr({"data-token":regImg.obj.upToken,"data-imgname":regImg.obj.img[0]});
                        uploader.upload();
                        urlIMGPath = regImg.attributes.imgUrlPre + regImg.obj.img[0];
                        LetterupIMGgagaID =  ContactsUl.children(".activeContacts").attr("data-gagaID");
                        LetterupLoadImgContainer = $("#chatMiddle ").children("[data-gagaID = " + LetterupIMGgagaID + "]").find(".upLoadImgContainer");
                        LetterupLoadImgContainer.show();
                        LetterupLoadImgContainer.find(".upLoadContnet").hide();
                        LetterupLoadImgContainer.find(".upLoadImging").css("background", "url("+staticCtx+"img/upLoadImging.gif) no-repeat").show();
                        LetterupLoadImgContainer.find(".upLoadImgState").text($.t(Letter.uploadIng)).css("color", "#333").show();
                        LetterupLoadImgContainer.find(".upLoadImgDelete").hide();
                        LetterupLoadImgContainer.find(".upLoadImgName").text(regImg.obj.img[0]);
                        LetterupLoadImgContainer.attr("data-imgId", regImg.obj.img[0]);

                    }
                });
            });
            // 当有文件添加进来的时候
            uploader.on('fileQueued', function (file) {
                $(".upLoadImgContainer").show();
            });
            uploader.on('uploadBeforeSend', function(block, data) {
                data.key = $("#chatConBottom .imgBtn").attr("data-imgname");
                data.token = $("#chatConBottom .imgBtn").attr("data-token");
            });
            //当一批文件添加进队列以后触发。
            uploader.on('filesQueued', function (files) {
            });
            uploader.on('uploadSuccess', function (file) {
                //console.log("成功："+JSON.stringify(file));
                LetterupLoadImgContainer.show();
                LetterupLoadImgContainer.find(".upLoadImg").attr("src", urlIMGPath);
                LetterupLoadImgContainer.find(".upLoadContnet").show();
                LetterupLoadImgContainer.find(".upLoadImging").hide();
                LetterupLoadImgContainer.find(".upLoadImgState").hide();
                LetterupLoadImgContainer.find(".upLoadImgDelete").show();
                $(".FunBtncontainer .sendBtn").css({ "color": "#fff", "background-color": "#2D57A1" });


            });
            uploader.on('uploadError', function (file) {
                //console.log("失败："+JSON.stringify(file));
                LetterupLoadImgContainer.show();
                LetterupLoadImgContainer.find(".upLoadContnet").hide();
                LetterupLoadImgContainer.find(".upLoadImging").css("background", "url(" + staticCtx + "img/IMicon.png) -472px -80px no-repeat").show();
                LetterupLoadImgContainer.find(".upLoadImgState").text($.t("Letter.uploadFailed")).css("color", "#d24040").show();
                LetterupLoadImgContainer.find(".upLoadImgDelete").show();
            });
            uploader.on('uploadComplete', function (file) {
                //console.log("完成："+JSON.stringify(file));
            });
        };
        LetterupIMG();
    };
    /*----------请求词包数-------*/
    private.prototype.getTranslationCharacterNum=$.IM.getTranslationCharacterNum,
        /*----------请求金币数-------*/
    private.prototype.getMoneyNum=$.IM.getMoneyNum,
    private.prototype.deductMoney=function(data){
        var that=this;
        var msgMoney = that.deleteQQFace(data.msg).trim();
        var moneydata = {msg:msgMoney};
        var loadlay=layer.load(0,{zIndex:19890405});
        $.ajax({
            type: "post",
            url: ctx + "/pm/getTranGold",
            data: moneydata,
           // async: false,
            dataType: "json",
            success: function (reg) {
                layer.closeAll("loading");
                // console.log("翻译字符扣金币："+JSON.stringify(reg));
                // console.log("翻译字符扣金币："+reg);
              //1:扣费1员，0：不扣费；-1：余额不足；3：需要提示；4：不需要提示
                if(reg.success){
                    if(reg.obj==0 ||reg.obj==4){
                        that.SendMessage(data);
                    }else if(reg.obj==-1){
                        var contentTip = '<div class="textCenter marT5">'+$.t("im.goldLack")+$.t("im.ToRecharge")+'</div>';
                        layer.open({
                            title: false,
                            content: contentTip,
                            skin: 'noTitleTips',
                            btn: [$.t("im.ToRecharge")],
                            yes: function (index, layero) {
                                window.location.href=ctx+"/pay/recharge";
                                layer.close(index);
                            }
                        });
                    }else if(reg.obj == 3){
                        var contentTip = '<div class="textCenter marT5"><div class="deductMoneyTXT">' + $.t("im.translationNeeds") + $.t("im.goldContinue") + '</div><div></div></div>';//<a class="aTXT"  href="'+ctx+'/pay/translationPack">' +$.t("im.buyPackageMoreCost-effective")+ '</a>
                        layer.open({
                            title: false,
                            content: contentTip,
                            skin: 'noTitleTips',
                            btn: [$.t("global.ok"), $.t("global.cancel")],
                            yes: function (index, layero) {
                                that.SendMessage(data);
                                layer.close(index);
                            },
                            cancel: function (index) {
                                layer.close(index);
                            },
                        });
                    }

                }else{}
            },
            error: function () {}
        });
    },
    private.prototype.SendMessage=function(data){
        var that=this;
        var loadlay=layer.load(0,{zIndex:19890405});
        $.ajax({
            type: "post",
            url: ctx + "/pm/sendMsg",
            data: data,
            async: true,
            dataType: "json",
            success: function (reg) {
                layer.closeAll("loading");
                /*------------获取钱数和字符数------------*/
                if(data.to){
                    that.getMoneyNum();
                    that.getTranslationCharacterNum();
                }
                if (reg.success) {
                    layer.msg($.t("Letter.sendPriSuccess"));
                    $("#chatConBottom  .characterNum").text(0);
                    layer.closeAll('page');
                }else{
                    if(reg.msg=="1"){
                        $("#chatConBottom  .characterNum").text(0);
                       // $("#chatConBottom").children(".TipsContent").show();
                       // var  OvertimeHide = setTimeout(function(){$("#chatConBottom").children(".TipsContent").hide(); clearTimeout(OvertimeHide);},2000);
                        
                        
                        
                        $.IM.getMoneyNum();
                        var privatebuyNumCon = "";
                        var buyNumber = "";
                        layer.open({
                            area: '542px',
                            skin: 'privateall',
                            title: $.t("Letter.youLetterOver"),
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
                                	that.buyNumFun(buyNumber);
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
 
                    }else{
                        layer.msg($.t("global.zoneApiError"), {time: 2000}, function () { });
                    }
                    /*------------恢复默认设置------------*/
                    $("#chatConBottom .sendBtn").css({
                        "color": "#696969",
                        "background-color": "#fff"
                    });
                }
            },
            error: function () {
                layer.msg($.t("global.zoneApiError"), {time: 2000}, function () { });
            }
        });
    },
    private.prototype.buyNumFun=function (buyNumber) {
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
    }
    
    private.prototype.deleteQQFace=function(str){
        str = str.replace(/\</g, '&lt;');
        str = str.replace(/\>/g, '&gt;');
        str = str.replace(/\n/g, '<br/>');
        str = str.replace(/\[em_([0-9]*)\]/g, '');
        return str;
    },
    private.prototype.bind=function(){
        var that=this;
        var ContactsUl = $(".LetterchatContainer .leftCon .ContactsUl");
        var LetterTimeArr = {};
        /*字数计算*/
        $(document).keyup(function () {
            var texts =  $("#sendContent").val();
            if (typeof (texts) != "undefined") {
                var counter = texts.length; //获取文本域的字符串长度
            }
            $("#chatConBottom  .characterNum").text(counter);    //每次减去字符长度

            if (counter > 500) {
                var newtext = texts.substring(0, 500);
                $("#sendContent").val(newtext);
                $("#chatConBottom  .characterNum").text("500");
            }
        });

        /*-------------qq表情------------------*/
        $('#chatConBottom .qqFaceBtn').qqFace({
            id: 'facebox',
            assign: 'sendContent',

            path: staticPath + '/common/IM/img/qqFace/' //表情存放的路径
        });
        $("#chatConBottom .sendContent").keydown(function (e) {
            if (e.keyCode == "13") {//keyCode=13是回车键
                $("#chatConBottom .sendBtn").click();
                e.preventDefault();
            }

        });
        $("#sendBtn").click(function () {
            var th = $("#chatConBottom .sendContent");
            var sendContent = $("#chatConBottom .sendContent").val();
            var date = new Date();
            var wordsId = date.getTime();
            var targetLan = "";
            if (sendContent == $.t("im.enterKeySend") || sendContent.trim() == "") {
                th.val($.t("im.enterKeySend")).css("color", "#999");
                layer.msg($.t("im.NoSendEmpty"), {time: 2000}, function () { });
            } else {
                if (sendContent == $.t("im.enterKeySend")||that.deleteQQFace(sendContent).trim()=="") {
                    targetLan = "";
                } else {
                    targetLan = $("#chatConBottom .langBtn .language").attr("langs-lang");
                }
                var moneyNum="";
                var mid = $("#give_pv_to_id").val();
                var data = {
                        toid: mid,
                        to: targetLan,
                        msg: sendContent,
                       // image: src,
                        mn: moneyNum,
                        uuid: wordsId
                    };
                if(targetLan){
                    that.deductMoney(data);
                }else{
                    that.SendMessage(data)
                }
            }
        });
    };
    pv.pri=private;
})(popPrivate)
$(function(){
	$(document).on("click",".popPrivateBtn",function(){
		   var gettpl = Zoneyet.template($('#temp_home_popPrivate').html()).render({});
		   var mid = $(".thumbWrap").find(".cur").find("img:first").attr("lmid");
		   
		   $.post(ctx+"/memeber/getMemberId",{"mid":mid},function(reg){
				  var receiveLanguage = reg.obj.membLanguage;
				  
			       var popPriIns=layer.open({
		                area: '600px',
			            skin: 'giftCon1',
			            title:$.t("Letter.sendPri"),
			            content: gettpl,
			            type: 1,
			            //title: false,
			           // btn: [],
			            zIndex:19890305,
			            success: function(layero, index){
			            	if(sendGender =="1"){
		    	        		switch(receiveLanguage){ 
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
			            	
			            	var give_pv_to = $(".thumbWrap").find(".cur").find("img:first").attr("alt");
			            	
			            	$("#give_pv_to").text(give_pv_to);
			            	$("#give_pv_to_id").val(mid);
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
});