/**
 * `偶遇`页面获取数据
 * @type {number}
 */
var sendGender = "1";//1男2女
var pageNo = 1; //页码
var pageCount = 1; //总页数
var searchType= 1;  //  1.精确,2.模糊,3.类型
var quickSearchType = 1;  //1.全部 2.推荐 3.在线 4.最新
var selfhtmlstr="";
var buyshowflag=0;   //是否购买展示
var lovedListStr="";  //偶遇列表id
var jsonObj=[];  //一次或取当前点赞信息
$(function(){
    searchTypeData(1,2);
});


/*模糊搜索*/
function searchData(pageNo) {
    if($("#keywords").val().length<=0)  return;
    $("#datalists").empty();
    $("#datacover").partialLoader();
    $.post("http://www.gagahi.com:80/ihome/getDatas",
        {"keywords":$("#keywords").val(),
            "pageNo":pageNo,
            "pageSize":"60",
            "quickSearchType":"1",
            "searchType":"2"
        },
        function(data,textStatus){
            $("#datacover").partialLoader("close");
            searchType=2;
            var obj = eval(data);
            //parseselfbean(obj.attributes.selfbean);
            parsePage(obj.attributes.page);
            parseList(obj.attributes.data);
            $(".nickfullname").highlight($("#keywords").val());
        })

}

/*快捷搜索 类型搜索*/
function searchTypeData(pageNo,quickSearchTypeval) {
    $("#datalists").empty();
    $("#datacover").partialLoader();
    $.post(path+"/ihome/getTypeData",
        {
            "pageNo":pageNo,
            "pageSize":"60",
            "quickSearchType":quickSearchTypeval,
            "searchType":"3"
        },
        function(data,textStatus){
            $("#datacover").partialLoader("close");
            var obj = eval(data);
            parseselfbean(obj.attributes.selfbean);
            parsePage(obj.attributes.page);
            parseList(obj.attributes.data);

        })
}
/*条件搜索*/
function searchSelectionData(pageNo) {
    $("#datalists").empty();
    $("#datacover").partialLoader();
    $.post("http://www.gagahi.com:80/ihome/getSelectionsData",
        {
            "country":$('#countrydiv input[name="country"]:checked ').val(),
            "sex":$('#sexdiv input[name="sex"]:checked ').val(),
            "ageRange":$("#ageRange").val(),
            "language":$('#languagediv input[name="language"]:checked ').val(),
            "heightRange":$("#heightRange").attr("data-tongyong"),
            "weightRange":$("#weightRange").attr("data-tongyong"),
            "jobId":$("#jobText").attr("data-tongyong"),
            "pageNo":pageNo,
            "pageSize":"60",
            "searchType":"1"
        },
        function(data,textStatus){
            $("#datacover").partialLoader("close");
            var obj = eval(data);
            //  parseselfbean(obj.attributes.selfbean);
            parsePage(obj.attributes.page);
            parseList(obj.attributes.data);
        })
}


//购买显示
function parseselfbean(selfbean){
    if(null!=selfbean){
        buyshowflag=1;
        var bean=selfbean;
        //剪切nickname
        var nickname=bean.membNickname;
        selfhtmlstr="<li class='bdra15'> <a href='http://www.gagahi.com:80/Member/otherHome?gagaid="+bean.membGagaid+"' ><div class='pic tc'>"+
            "<span><img src='http://images.gagahi.com//"+showBigImage(bean.membBigimg)+"'></span></div></a>"+
            "<div class='jbxx'>"+
            "<span class='ari c-2d57a1 nickfullname name-width'>"+nickname+"</span> <span class='idh'>("+bean.membGagano+")</span>";
        if(bean.memberfinance.mefiLevel==2){
            selfhtmlstr=selfhtmlstr+ "<span><img src='"+path+"/common/images/hg.jpg'/></span>";
        }
        if(bean.memberfinance.mefiLevel==3){
            selfhtmlstr=selfhtmlstr+ "<span><img src='"+path+"/common/images/vip-hg.jpg'/></span>";
        }

        var countryInfo = null!=bean.membCountry?getMemberCountryInfo("en-us",bean.membCountry):"";
        var ageStr = 0 == bean.age?"":bean.age;
        if(ageStr != "" && countryInfo != ""){
            ageStr += "," + countryInfo;
        }else if(ageStr == "" && countryInfo != ""){
            ageStr += countryInfo;
        }
        selfhtmlstr=selfhtmlstr+"<br> <span class='ari hui '>"+ageStr+"</span> </div>"+
            "<div class='jbxx1'><span class=' inlineblock dz'><img src='"+path+"/common/images/hart.png'></span> <span class=' eml inlineblock'></span></div>";
        if(bean.ifOnline==1){
            selfhtmlstr=selfhtmlstr+ "<div class='zx bdra15'></div>";
        }
        selfhtmlstr=selfhtmlstr+"</li>";
    }else{
        buyshowflag=0;
    }
}


//填充列表数据
function parseList(list){
    //alert(list.length);
    if(null==list) return;
    if(list.length==0){
        $("#datalists").hide();
        $("#pagediv").hide();
        $("#nodatatips").show();
    }else{
        $("#pagediv").show();
        $("#datalists").show();
        $("#nodatatips").hide();
        $("#datalists").html("");

        lovedListStr="";//初始化列表id

        var num=GetRandomNum(0,2);
        var listLen = list.length;
        for(var i=0;i<list.length;i++){
            lovedListStr=lovedListStr+(lovedListStr.length<=0?"":",")+list[i].membGagaid;  //修改数据列表
            //首页展示
            if(pageNo==1 && '1'<2){
                if(buyshowflag==0 && i==0){
                    if(searchType==3) $("#datalists").append("<li class='bdra5'><div class='sw'><img src='"+path+"/common/images/sw.jpg'></div><div class='wz'><p class=' f12 mb10'>I want to be here to win the attention of millions of people.</p><button class='bdra15 ban f12' onclick='checkBuyShowFirst()'>Learn more</button></div></li>");
                }else if(buyshowflag==1 && num==i){
                    if(searchType==3) $("#datalists").append(selfhtmlstr);
                }
            }
            //广告位
            if((pageNo==1 && i==1) || (listLen==1&&pageNo==1&&i==0)){
                if (searchType==3) {
                    $._post(apiUrl + '/ad/area/getContent', {
                        areaCode: '1467084938622'
                    }, function(adData) {
                        if (adData.success && adData.obj) {
                            if ($("#datalists li.bdra5:first").next('li').length) {
                                $("#datalists li.bdra5:first").next('li').after(" <li class='ggw bdra5'>" + adData.obj + "</li>");
                            } else {
                                $("#datalists li.bdra5:first").after(" <li class='ggw bdra5'>" + adData.obj + "</li>");
                            }
                        } else {
                            if ($("#datalists li.bdra5:first").next('li').length) {
                                $("#datalists li.bdra5:first").next('li').after("<li class='ggw bdra5'><img src='http://static.gagahi.com/images/" + (Zoneyet.Global.language == "zh-cn"? "ad_img" : "ad_img_en") + ".jpg'></li>");
                            } else {
                                $("#datalists li.bdra5:first").after("<li class='ggw bdra5'><img src='http://static.gagahi.com/images/" + (Zoneyet.Global.language == "zh-cn"? "ad_img" : "ad_img_en") + ".jpg'></li>");
                            }
                        }
                    });
                }
            }
            var handStr = list[i].isHand == 1? "ishand":"";
            if (handStr) {
                if (i==0) {
                    handStr += '';
                }else if(i==1) {
                    handStr += ' second';
                }else if(i==2) {
                    handStr += ' three';
                } else {
                    handStr += ' three';
                }
            }
            var htmlstr="<li class='bdra5 " + handStr + "' dataid='"+list[i].membGagaid+"'>"+(list[i].isHand==1?"<span class='crown'></span><span class='s-trangle'></span><span class='s-trangle rt'></span><span class='s-trangle lb'></span><span class='s-trangle rb'></span>":"")+" <a href='http://www.gagahi.com:80/Member/otherHome/"+list[i].membGagaid+"' ><div class='pic tc'>"+
                "<span><img src='http://images.gagahi.com//"+showBigImage(list[i].membBigimg)+"'></span></div></a>"+
                "<div class='jbxx'>";

//		   	       if(list[i].membLightNickname==null){
            htmlstr=htmlstr+"<span class='ari c-2d57a1 nickfullname name-width'>"+list[i].membNickname+"</span>";
//		   	       }else{
//		   	    	htmlstr=htmlstr+"<span class='ari c-2d57a1 nickfullname name-width'>"+list[i].membLightNickname+"</span>";
//		   	       }
            if(searchType==2){
                // if(list[i].membLightGagano==null){
                htmlstr=htmlstr+"(<span class='idh nickfullname'>"+list[i].membGagano+"</span>)";
                // }else{
                //htmlstr=htmlstr+"<span class='idh'>("+list[i].membLightGagano+")</span>";
                // }
            }

            if(list[i].mefi_level==2){
                htmlstr=htmlstr+ "<span><img src='"+path+"/common/images/hg.jpg'></span>";
            }
            if(list[i].mefi_level==3){
                htmlstr=htmlstr+ "<span><img src='"+path+"/common/images/vip-hg.jpg'></span>";
            }
            var countryInfo = null!=list[i].membCountry?getMemberCountryInfo("en-us",list[i].membCountry):"";
            var ageStr= 0==list[i].membAge?"":list[i].membAge;
            if(ageStr != "" && countryInfo != ""){
                ageStr += "," + countryInfo;
            }else if(ageStr == "" && countryInfo != ""){
                ageStr += countryInfo;
            }
            //var ageStr= 0==list[i].membAge?"":list[i].membAge+",";

            htmlstr=htmlstr+"<br> <span class='ari hui '>"+ageStr+"</span> </div>"+
                "<div class='jbxx1'><a onclick='javascript:doLikeSb("+list[i].membGagaid+",this)'><span class=' inlineblock dz'><img src='"+path+"/common/images/hart.png'></span></a>"+
                "<a onclick='javascript:doSendMsg(\""+list[i].membGagaid+";"+list[i].membNickname+"\")'><span class=' eml inlineblock'></span></a></div>";
            if(list[i].ifOnline==1){
                htmlstr=htmlstr+ "<div class='zx bdra15'></div>";
            }
            htmlstr=htmlstr+"</li>";
            $("#datalists").append(htmlstr);
        }
    }

    $("#datalists").append("<div class='clear'></div>");

    //记住点赞状态
    $.post(path+"/like/findIfIloveList",{"lovedIdList":lovedListStr},
        function(data,textStatus){
            if(data.success){
                jsonObj=data.obj;
                console.log(jsonObj)
                //显示点赞和私信
                $("#datalists li").each(
                    function  () {

                        $(this).hover(function  () {
                                $(this).children(".jbxx").css("display","none").next().css("display","block");
                                //查看是否是我点过赞的用户
                                var that=this;
                                console.log(jsonObj[$(this).attr("dataid")]==1);
                                if( typeof(jsonObj[$(this).attr("dataid")])!="undefined" && jsonObj[$(this).attr("dataid")]==1){

                                    $($(that).children(".jbxx1").find("a")[0]).find("span").css("background-position","0 -41px");
                                }
                            },function  () {
                                $(this).children(".jbxx").css("display","block").next().css("display","none");
                            }
                        );
                    }
                )
            }

        })




}

//喜欢某人
function doLikeSb(id,that){
    var data={};
    data["mid"]=id;
    if(jsonObj[id]==1){//如果为1，则说明为取消关注
        data["flag"]="del";
    }else{//为关注

    }
    $.post(path+"/like/iliketoonly",
        data,
        function(data,textStatus){
            // alert(data.success);
            if(data.success){
                var ab=$(that).find("span");
                var dc=$(that).find("img");
                $(dc).css({"top":0,opacity:"1"})
                $(dc).css("display","block").stop(false,true).animate({top:"-70px",opacity:"0",width:"16px",height:"14px"},1000);
                $(ab).css("background-position","0 -41px");
                jsonObj[id]=1
                //layer.msg(data.msg);
            }else{
                var ab=$(that).find("span");
                var dc=$(that).find("img");
                $(dc).css("display","none");
                $(ab).css("background-position","0 0")
                jsonObj[id]=0;
            }
        })
}

function doSendMsg(idname){
    var str=idname.split(";");
    var mid = str[0];
    var gettpl = Zoneyet.template($('#temp_home_popPrivate').html()).render({});
    $.post(path+"/member/getMemberId",{"mid":mid},function(reg){
        //console.log(reg);
        // console.log("dd");
        var receiveLanguage = reg.obj.membLanguage;

        layer.open({
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

                var give_pv_to =str[1] ;

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
}

//整理分页数据
function parsePage(pageUtil){
    if(null!=pageUtil){
        if(pageUtil.totalPage>15){
            pageCount=15;
        }else{
            pageCount=pageUtil.totalPage;
        }
        pageNo=pageUtil.pageNo;
        searchType=pageUtil.searchType;
        quickSearchType=pageUtil.quickSearchType;
        createPage();
    }
}

function  createPage(){
    /*分页*/
    $(".tcdPageCode").createPage({
        pageCount : pageCount,//总页数
        current : pageNo,//当前页
        backFn : function(p) {
            if (1 == searchType) {
                searchSelectionData(p)
            }
            if (2 == searchType) {
                searchData(p)
            }
            if (3 == searchType) {
                searchTypeData(p,quickSearchType)
            }
        }
    });
}

