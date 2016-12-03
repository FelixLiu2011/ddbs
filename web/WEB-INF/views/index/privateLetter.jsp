<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>gagahi_Multi language international dating_Across Languages，Say Hi to the world！</title>
    <link href="<%=path%>/common/images/favicon.ico" rel="shortcut icon">
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <meta content="gagahi,International dating,Multilingual sns,Multilingual dating sites,Multi language dating platform,Social translation,International dating platform,Multilingual social networking site,Multi language social networking platform,Translated social networking platform,Cross language social networking platform" name="keywords">
    <meta content="gagahi is a translation based international social platform,providing you with the international community, multi language international dating, translation and other social services at any time and at any time,allowing you to easily overcome language barriers and expand international social circle." name="description">
    <link href="<%=path%>/common/js/ScrollBar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/base.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/common.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/webupload.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/jquery.range.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/jquery.range.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/lang.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/lrtk.css" rel="stylesheet" type="text/css">
    <!-- <link href="http://static.gagahi.com/css/skin/zhongqiu/style.css" rel="stylesheet" type="text/css"> -->
    <script src="<%=path%>/common/js/jquery.min.js" type="text/javascript"></script>
    <script  src="<%=path%>/common/js/laytpl.js"       type="text/javascript"></script>
    <script  src="<%=path%>/common/js/core.js"    type="text/javascript"></script>
    <script  src="<%=path%>/common/js/i18next-1.11.2.min.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/jquery.page.js"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
        var local="${local}";
    </script>
    <%--引入相应的资源文件--%>
    <script type="text/javascript" src="<%=path%>/common/common.js"></script>
    <script src="<%=path%>/common/js/webuploader.js" type="text/javascript"></script>
    <script src="<%=path%>/common/layer/js/layer.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/template.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/global_plugin.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/ScrollBar/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/koala.min.1.5.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/terminator2.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=path%>/common/IM/js/processingTime.js"></script>
    <script type="text/javascript" src="<%=path%>/common/js/gift.js"></script>
    <script type="text/javascript" src="<%=path%>/common/IM/js/IM.js"></script>
    <script type="text/javascript" src="<%=path%>/common/IM/js/IMAjax.js"></script>
    <link type="text/css" href="<%=path%>/common/IM/css/qqFace.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/common/IM/js/jquery.qqFace.js"></script>
</head>

<body style="position:relative;" class='en-us'>
<div class="coverall">
    <div class=" w1100 jz searchTip">
        <div class="step1">
            <p>Cannot find the one you like?Try "search".</p>
        </div>
        <div class="step2">
            <p>If you like him/her,then vote for him/her.</p>
        </div>
        <div class="step3">
            <p>Please upload your avatar, everybody wants to see you.</p>
        </div>
    </div>
</div>
<!-- 新版说明-->
<div class="coverall1">
    <div class="xbtc">
        <div id="fsD1" class="focus">
            <div id="D1pic1" class="fPic">
                <div class="fcon" style="display: none;">
                    <a><img src="<%=path%>/common/images/en-us-xb01.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu1"></span>
                </div>

                <div class="fcon" style="display: none;">
                    <a><img src="<%=path%>/common/images/en-us-xb02.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu2"></span>
                </div>

                <div class="fcon" style="display: none;">
                    <a><img src="<%=path%>/common/images/en-us-xb03.jpg" style="opacity: 1; "></a>
                    <span class="shadow" data-i18n="sm1.tu3"></span>
                </div>

                <div class="fcon" style="display: none;">
                    <a><img src="<%=path%>/common/images/en-us-xb04.jpg" style="opacity: 1; "></a>
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
            <a href="<%=path%>/index/iHome" class="logo"><img src="<%=path%>/common/images/logo.png" alt="gagahi"/></a>
            <a href="<%=path%>/index/iHome" id="encounterIndex"  >Encounter</a>
            <a href="<%=path%>/zone/myZone"  id="zoneIndex" >Feeds</a>
            <!--<a href="http://game.gagahi.com/" target="blank"  id="gameIndex" >Game</a>-->
            <a href="<%=path%>/mall/giftReal/shopHome" id="shopIndex" >Mall</a>
        </div>
        <div class="fr">
            <!--<a class="fhlb" data-i18n="fhlb.nr"></a> -->
            <a class="xbsm"  data-i18n="xbsm.nr"></a>
            <a class="vip" href="<%=path%>/pay/recharge" >Recharge</a>
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
                        <li><a href="<%=path%>/member/memberInformation">About Me</a></li>
                        <li><a href="<%=path%>/member/memberInformation#showinfo">Account Settings</a></li>
                        <li style=" border-bottom:none;"><a href="javascript:loginout()">Sign out</a></li>
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
<%--IM fixme--%>
<script type="text/javascript">
    var f = 1;
    var isConta =-1;
</script>

<div class="mid">
    <div class="w1100 jz">
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

                <a href="<%=path%>/member/memberInformation"><span class="ws"></span>Please upload your charming avatar.</a><br>

                <span class="hui f12">Perfect information, let friends know you faster</a></span>
            </p>
            <div class="lf-cz">
                <button class="leftMoneyTranslate leftMoney bdra15  pad1-2 overVisible" data-explain="0" data-suffix="Gold"><!-- 金币 -->
                    <span></span>
                    <div id="totalMoney">0</div>
                    <!-- <p class="totalMoney"><a class="Money"></a>Gold</p>-->
                </button>
                <button class="leftMoneyTranslate leftTranslate bdra15  pad1-2 overVisible" data-explain="0" data-suffix="Character"><!-- 翻译包 -->
                    <span class="fy"></span>
                    <div id="totalTranslate">0</div>

                </button>
            </div>
            <div class="lf-lb">
                <span id="leftSixinIndexImg" class="on"></span><a href="<%=path%>/platform/privateLetter" id="leftSixinIndexText" class="on">Direct Message</a>
                <div class="inlineblock newsNum" id="leftSixinNotice"></div>
            </div>
            <div class="lf-lb">
                <span class="lkm" id="leftLikeMeIndexImg"></span><a href="<%=path%>/member/like/likeMe" id="leftLikeMeIndexText">Liked me</a>
                <div class="inlineblock newsNum" id="leftLikeMeNotice"></div>
            </div>
            <div class="lf-lb">
                <span class="mlk" id="leftIlikeIndexImg"></span><a href="<%=path%>/member/like/iLike" id="leftIlikeIndexText">I liked</a>
                <div class="inlineblock newsNum" id="leftIlike"></div>
            </div>
            <div class="lf-lb lf-mutual">
                <span class="each-lk" id="leftFriendIndexImg"></span><a href="<%=path%>/member/like/likeMeAndILike" id="leftFriendIndexText">Liked mutual</a>
                <div class="inlineblock newsNum" id="leftFriendNotice"></div>
            </div>
            <div class="lf-lb" >
                <span class="visitor" id="leftVisitorIndexImg" ></span><a href="<%=path%>/member/visitor/myVisitor" id="leftVisitorIndexText">Visitor</a>
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


        <div class="fr container">
            <div class="LetterchatContainer">
                <div class="leftCon fl">
                    <div class="tabCon">
                        <span class="allContacts contacts overHidTXT activeTitle">All<!-- 全部 -->（<span class="peopleNum">0</span>）</span>
                        <span class="onlineContacts contacts overHidTXT">online<!-- 在线 --></span>
                        <div class="clear"></div>
                    </div>
                    <div class="searchDiv">
                        <input type="text" class="LettersearchInput" id="LettersearchInput" value="Search for contacts">
                        <i id="searchBtn" class="Btn"></i>
                        <i id="searchCloseBtn" class="Btn"></i>
                    </div>
                    <div class="initLoading relative">
                        <div id="allContactsGroup" class="contactsGroup">
                            <div class="noContacts" >
                                <i class="noContactsImg"></i>
                                <span class="noContactsTXT">No contacts<!-- 暂无联系人 -->!</span>
                            </div>
                            <ul class="allContactsUl ContactsUl">






                            </ul>
                        </div>
                        <div id="onlineContactsGroup" class="contactsGroup" style="display:none">
                            <div class="noContacts">
                                <i class="noContactsImg"></i>
                                <span class="noContactsTXT">No online contacts<!-- 暂无在线联系人 -->!</span>
                            </div>
                            <ul class="onlineContactsUl ContactsUl">

                            </ul>
                        </div>
                        <div id="searchResultGroup" class="contactsGroup" style="display:none">
                            <div class="noContacts">
                                <i class="noContactsImg"></i>
                                <span class="noContactsTXT">No results<!-- 无搜索结果 --></span>
                            </div>
                            <ul class="searchResultUl ContactsUl"></ul>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div id="fiftyMale">One key to contact 50 opposite sex<!-- 一键联系到50位异性 --> </div>
                </div>
                <div class="rightCon fl">
                    <div class="noContactsContaner">
                        <img src="<%=path%>/common/images/xiehou-2.png" class="xiehou">
                        <p class="noNews">No one has sent you messages.<!-- 还没有人给您发消息 --></p>
                        <p class="toEncounter">Come and meet your favorite person in Encounter.<!-- 来偶遇页邂逅您中意的人 --></p>
                        <a href="<%=path%>/index/iHome">Encounter<!-- 去邂逅 --></a>
                    </div>
                    <div id="LetterchatBox">
                        <div id="chatTop" data-gagaId="">
                            <i class="contactHead"><img class="HeadImg" src="<%=path%>/common/images/head2.jpg"></i>
                            <p class="information">
                                <span class="NickName"></span>
                                <span class="w20 textCenter countryBefor">,</span>
                                <span class="country"></span>
                                <span class="w20 textCenter ageBefor">,</span>
                                <span class="age"></span>
                            </p>
                            <!-- <span class="friending">
                                    <div class="friend-tip1 f12 tc"><p>已发送好友申请，正在等待对方确认</p></div>
                            </span> -->
                            <div class="fr relative">
                                <i class="btn addFriend"></i>
                                <i class="btn more"></i>
                                <ul class="LetterfunctionMore">
                                    <i class="functionI"></i>
                                    <li class="funReport">Report<!-- 举报 --></li>
                                    <li class="funShieldState">Shield<!-- 屏蔽 --></li>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div id="chatMiddle">
                            <div class="chatCon">
                                <div class="chatConDiv">
                                    <p class="textCenter marT5 cursor moreNews c-2d57a1" style="display:none">View more messages<!-- 查看更多消息 --></p>
                                    <div class="LetterchatContent">


                                    </div>

                                </div>
                                <div class="upLoadImgContainer">
                                    <div class="upLoadContnet">
                                        <i class="upLoadImgHorn"></i>
                                        <span class="bigImgBtn"><img class="upLoadImg" src="" /></span>
                                    </div>
                                    <div class="upLoadExplain">
                                        <span class="upLoadImgName"></span>
                                            <span class="fr">
                                            <span class="upLoadImgDelete"></span>
                                            <span class="upLoadImgState"></span>
                                            <i class="upLoadImging"></i>
                                            </span>
                                    </div>
                                </div>
                            </div>
                            <p class="saveTip overHidTXT"><a href="http://www.gagahi.com:80/Platform/friendssafe" target="_blank">Safety tips<!-- 安全提示 -->：</a>Please do not disclose your contact information, do not lend money to strangers<!-- 请不要轻易透露您的联系方式，不要借钱给陌生人 -->。</p>

                        </div>
                        <div id="chatConBottom">
                            <div class="TipsContent">You have run out of the number of chat today.<!-- 您今日私信条数已用完 --></div>
                            <!--  <div class="HistoricalRecords"></div>
                             <div class="HistoricalRecordsClosed"></div> -->
                            <div class="character"><span class="characterNum">0</span>/500</div>
                            <textarea id="sendContent" class="sendContent">Press enter to send messages</textarea><!-- 按回车键发送消息 -->

                            <div class="btnContainer">
                                <div class="langOptions">
                                    <span class="txt">translate<!-- 翻译 -->：</span>
                                    <div class="langBtn">
                                        <span class="language" langs-lang="">No translation</span>
                                        <i class="Triangle"></i>
                                    </div>
                                    <ul class="languageUl">
                                        <li class="langLi" langs-lang="">No translation<!-- 不翻译 --></li>
                                        <!--   <li class="langLi" langs-lang="en">English</li>
                                          <li class="langLi" langs-lang="cn">简体中文</li>
                                          <li class="langLi" langs-lang="tr">繁體中文</li>
                                          <li class="langLi" langs-lang="ko">한국어</li>
                                          <li class="langLi" langs-lang="rs">Pусский</li>
                                          <li class="langLi" langs-lang="gm">Deutsch</li>
                                          <li class="langLi" langs-lang="sp">Español</li>
                                          <li class="langLi" langs-lang="jp">日本語</li> -->

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
                                <ul class="funBtnUl">
                                    <li class="qqFaceBtn" data-Explain="Select emoticons"></li>
                                    <li class="imgBtn" data-Explain="Send picture"></li>
                                    <li class="giftBtn" data-Explain="Send gift"></li>
                                    <li class="redBtn" data-Explain="Send red packet"></li>
                                    <li class="LetterHistoricalRecords" data-Explain="Show chat record"></li>
                                    <li class="sendBtn">Send<!-- 发送 --></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="fiftyStateDiv">
                    <div class="fiftyStateTXT">One key to contact 50 opposite sex<!-- 一键联系到50位异性 --></div>
                    <i class="fiftyStateING"></i>
                    <i class="fiftyStateOver"></i>
                </div>
                <div class="clear"></div>
            </div>
            <div class="LetterhistoryContainer">
                <div class="backBtn">
                    <i class="backImg"></i>
                    <span class="backTXT">Return<!-- 返回 --></span>
                </div>
                <div class="clear"></div>
                <h2 class="fs16 c-696969 marT10">Chat record<!-- 聊天记录 --></h2>
                <div class="chatPerson">
                    <span class="NickName"></span><span class="country"></span><span class="ageBefor">,</span><span class="age"></span>
                    <span class="emptyHistory">Clear<!-- 清空 --></span>
                </div>
                <div class="textCenter marT5 LetternoChat" style="margin-top: 20px; display:none">No chat record.</div><!-- 暂无聊天记录 -->
                <div class="historyCon">

                </div>
                <div class="page">
                    <!-- <div class="tcdPageCode"> </div> -->
                </div>
            </div>

        </div>
        <div class="clear"></div>
    </div>

</div>

<div class="privateallCon" style=" display:none;">
    <div class="balance tc">The service fee<!-- 本次服务费 -->：<span class="c-ff8a00 f25 mr5 needMoney">5</span><span class="money mt15"></span><span class="hui ml10">（Your gold balance is<!-- 您金币余额为 --> <span class="myMoney">0.00</span> Gold<!-- 金币 -->）</span></div>
    <div class="lxlb h36 bdra30" style="margin:50px auto 45px;">



        <span class="xld inlineblock">What kind of opposite gender member you like</span>
        <ul style="display:none; top:39px;" class="xld-select">
            <li class="default"><a>What kind of opposite gender member you like</a></li>







            <li><a>I go there,this makes me a good feeling just like seeing a movie myself</a></li>






            <li><a>Every time you finish watching a tv series,it just like you're gonna break up</a></li>






            <li><a>The one i open gagahi to find is you at a speed of 100</a></li>






            <li><a>It's your choice to become better or older</a></li>






            <li><a>It seems you lack of safety sense from your picture</a></li>






            <li><a>What kind of person you think about yourself</a></li>






            <li><a>Chinese Mid-Autumn Festival is coming, do you know this festival?</a></li>






            <li><a>In this Mid-Autumn Festival reunion, who you want to spend time with?</a></li>



        </ul>
    </div>
</div>
<!----------男性---购买条数-------------->
<div class="privatebuyNumCon" style=" display:none;">
    <div class="balance tc">Your gold balance：<span class="c-ff8a00 f25 mr5 myMoney">0</span><span class="money mt15"></span><span class="hui ml10">（Service fee 1 Gold / 10 messages）</span></div>
    <div class="recharge" style="margin:50px auto 45px;">
        <p class=" tc mb10">Choose number：
            <input class="min bdra15 h36 fb f20" name="" type="button" value="-">
            <b><input class="text_box f18 fb" name="" type="text" value="10"></b>
            <b><input class="add bdra15 h36 fb f18" name="" type="button" value="+"></b>
        </p>
    </div>
</div>
<!-- 聊天内容 -->
<div id="MSGContainer" style="display:none">
    <p class="chatTime cleard">
        <!--<span class="yearMonthDay">06-29</span><span>12:51</span>-->
    </p>
    <div class="maleUpgradeTips tips cleard">
        <span class="TipsCon">
        <span class="fw800">系统提示：</span>你今日私信条数已用完，继续与她聊天，<a href="#">点此升级</a> 或 <a href="#">购买条数</a>
        </span>
    </div>
    <div class="maleUpgradeTips tips cleard">
        <span class="TipsCon">
        <span class="fw800">系统提示：</span>你今日私信条数已用完，对方邀请您<a href="#">升级会员</a> 或 <a href="#">购买条数</a>，继续与她聊天。
        </span>
    </div>
    <div class="femaleGetMoneyTips tips cleard">
        <span class="TipsCon">
      <span class="fw800">系统提示：</span>你已屏蔽对方发来的私信</span>
    </div>
    <div class="shieldTips tips cleard">
        <span class="TipsCon">
      <span class="fw800">系统提示：</span>对方已成功升级服务，系统赠送你<span class="moneyNum">100</span>金币，<a href="#">点击查看</a>。
        </span>
    </div>
    <div class="invitationUpgrade tips cleard">
        <span class="TipsCon">
      <span class="fw800">系统提示：</span>对方私信条数已用完，<a class="Upgrade" href="#">点击此处</a>邀请对方升级服务继续聊天
        <p class="c-f47726">（若对方升级成功，您将获得奖励哦~）</p>
        </span>
    </div>
    <div class="invitationUpgradeOverTime cleard">
        <span class="TipsCon">
      <span>系统提示：</span>对方私信条数已用完，<a href="#">点击此处</a>邀请对方升级服务继续聊天
        <p>（若对方升级成功，您将获得奖励哦~）</p>
        </span>
    </div>
    <!-- 接受消息---结构----->
    <div class="receiveMessage LetterchatMessage cleard" data-rain="">
        <div class="receiveNickName NickName">aaaaaaa</div>
        <div class="receiveContainer msgContent fl">
            <div class="OriginalCon">
                <span class="receiveOriginal Original">四撒肯定换大护法和理解撒肯定换定换付款</span>
                <div class="TranslateBtnConainer">
                    <i class="receiveTranslateBtn translateBtn"></i>
                    <div class="receivelanChoice lanChoice">
                        <i class="lanI"></i>
                        <ul class="lanUl">
                            <li langs-lang="en">English</li>
                            <li langs-lang="zh">简体中文</li>
                            <li langs-lang="cht">繁體中文</li>
                            <li langs-lang="kor">한국어</li>
                            <li langs-lang="ru">Pусский</li>
                            <li langs-lang="de">Deutsch</li>
                            <li langs-lang="spa">Español</li>
                            <li langs-lang="jp">日本語</li>
                        </ul>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="receiveTranslationContainer">
                <i class="receiveTranslationContainerHorn"></i>
                <p class="receiveTranslation c-D24040">sgdsf sfg drt </p>
                <p class="receiveTranslation c-FF8A00"> sf gdrt ht r</p>
                <p class="receiveTranslation">sgdsfgdrt t ryjyrsgdsfgd rthtryjyr</p>
            </div>
            <div class="bigImgBtn">
                <img class="receiveImg" src="">
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <!-- 接受红包---结构----->
    <div class="receiveRedEnvelope LetterchatMessage cleard" data-rain="" data-money="" data-open="" data-con="">
        <div>
            <div class="receiveNickName NickName">简体中文a</div>
        </div>
        <div class="receiveRedContainer">
            <span class="RedEnvelopeImg"></span>
            <span class="RedEnvelopeWord">马上拆红包</span>
            <div class="TranslateBtnConainer">
                <i class="receiveTranslateBtn translateBtn"></i>
                <div class="receivelanChoice lanChoice">
                    <i class="lanI"></i>
                    <ul class="lanUl">
                        <li langs-lang="en">English</li>
                        <li langs-lang="zh">简体中文</li>
                        <li langs-lang="cht">繁體中文</li>
                        <li langs-lang="kor">한국어</li>
                        <li langs-lang="ru">Pусский</li>
                        <li langs-lang="de">Deutsch</li>
                        <li langs-lang="spa">Español</li>
                        <li langs-lang="jp">日本語</li>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="RedEnvelopeTranslationCon receiveTranslationContainer">
            <i class="receiveTranslationContainerHorn"></i>
            <p class="RedEnvelopeTranslation receiveTranslation c-D24040">sgdsf sdrt</p>
        </div>
    </div>
    <!---------心情动态 ---------->
    <div class="receiveDynamicMood LetterchatMessage cleard" data-rain="">
        <div class="receiveNickName NickName">简体中文a</div>
        <div class="DynamicMoodTXT">前几天胡歌上访谈节目时，鲁豫</div>
        <div class="bigImgBtn">
            <img class="receiveImg" src="">
        </div>
        <div class="dynamicBtn">去点个赞吧</div>
    </div>
    <!--------初次登陆----提示----->
    <div class="firstLogin LetterchatMessage cleard" data-rain="">
        <div class="receiveNickName NickName">简体中文a</div>
        <div class="receiveOriginal Original">初来乍到，请多多关照～ </div>
        <div class="HelloBtn">打个招呼吧～ </div>
    </div>
    <!--------更新头像-------->
    <div class="goClickLike LetterchatMessage cleard" data-rain="">
        <div class="receiveNickName NickName">简体中文a</div>
        <div class="receiveOriginal Original">我刚刚更新了头像 ～ </div>
        <div class="clickLikeBtn">去点个赞吧</div>
    </div>
    <!-- 发动态----->
    <div class="sendMessage LetterchatMessage fr cleard" data-rain="">
        <div>
            <div class="sendNickName NickName fr">简aa</div>
            <span class="newsState read fr">已读</span>
            <i class="readHorn fr"></i>
        </div>
        <div class="sendContainer msgContent fr">
            <div class="OriginalCon">
                <span class="sendOriginal Original">四换定换付款</span>
            </div>
            <div class="bigImgBtn cleard fr">
                <img class="receiveImg" src="<%=path%>/common/images/01.jpg">
            </div>
        </div>
        <div class="bigImgBtn cleard fr">
            <img class="receiveImg" src="<%=path%>/common/images/01.jpg">
        </div>
        <div class="sendFailTip"></div>
        <div class="clear"></div>
    </div>
    <!-- 发消息---结构----->
    <div class="sendMessage LetterchatMessage fr cleard" data-rain="">
        <div>
            <div class="sendNickName NickName fr">简aa</div>
            <span class="newsState read fr">已读</span>
            <i class="readHorn fr"></i>
        </div>
        <div class="sendContainer msgContent fr">
            <div class="OriginalCon">
                <span class="sendOriginal Original">四换定换付款</span>
                <div class="TranslateBtnConainer">
                    <i class="sendTranslateBtn translateBtn"></i>
                    <div class="sendlanChoice lanChoice">
                        <i class="lanI"></i>
                        <ul class="lanUl">
                            <li langs-lang="en">English</li>
                            <li langs-lang="zh">简体中文</li>
                            <li langs-lang="cht">繁體中文</li>
                            <li langs-lang="kor">한국어</li>
                            <li langs-lang="ru">Pусский</li>
                            <li langs-lang="de">Deutsch</li>
                            <li langs-lang="spa">Español</li>
                            <li langs-lang="jp">日本語</li>
                        </ul>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="receiveTranslationContainer fr">
                <i class="receiveTranslationContainerHorn"></i>
                <p class="receiveTranslation c-D24040">sgdsf sfg drt </p>
                <p class="receiveTranslation c-FF8A00"> sf gdrt ht r</p>
                <p class="receiveTranslation">sgdsfgdrt htryjyrsgyjyr</p>
            </div>
            <div class="bigImgBtn cleard fr">
                <img class="receiveImg" src="<%=path%>/common/images/01.jpg">
            </div>
        </div>
        <div class="sendFailTip"></div>
        <div class="clear"></div>
    </div>
    <!--------初次打招呼----提示----->
    <div class="firstHello LetterchatMessage fr cleard" data-rain="">
        <div>
            <div class="sendNickName NickName fr">aaaaaaaaaaaa</div>
            <span class="newsState read fr">已读</span>
            <i class="readHorn fr"></i>
        </div>
        <div class="sendContainer msgContent fr">
            <div class="OriginalCon">
                <span class="sendOriginal Original">hello，上午好！ </span>
                <div class="TranslateBtnConainer">
                    <i class="sendTranslateBtn translateBtn"></i>
                    <div class="sendlanChoice lanChoice">
                        <i class="lanI"></i>
                        <ul class="lanUl">
                            <li langs-lang="en">English</li>
                            <li langs-lang="zh">简体中文</li>
                            <li langs-lang="cht">繁體中文</li>
                            <li langs-lang="kor">한국어</li>
                            <li langs-lang="ru">Pусский</li>
                            <li langs-lang="de">Deutsch</li>
                            <li langs-lang="spa">Español</li>
                            <li langs-lang="jp">日本語</li>
                        </ul>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="receiveTranslationContainer fr">
                <i class="receiveTranslationContainerHorn"></i>
                <p class="receiveTranslation c-D24040">sgdsf sfg drt </p>
            </div>
        </div>
        <div class="sendFailTip"></div>
    </div>
    <!------赞-新头像-------->
    <div class="clickLike LetterchatMessage fr cleard" data-rain="">
        <div>
            <div class="sendNickName NickName fr">简体中文aaaaaa</div>
            <span class="newsState read fr">未读</span>
            <i class="readHorn fr"></i>
        </div>
        <div class="sendContainer msgContent fr">
            <div class="OriginalCon">
                <span class="sendOriginal Original">你的头像很棒哦！</span>
                <div class="TranslateBtnConainer">
                    <i class="sendTranslateBtn translateBtn"></i>
                    <div class="sendlanChoice lanChoice">
                        <i class="lanI"></i>
                        <ul class="lanUl">
                            <li langs-lang="en">English</li>
                            <li langs-lang="zh">简体中文</li>
                            <li langs-lang="cht">繁體中文</li>
                            <li langs-lang="kor">한국어</li>
                            <li langs-lang="ru">Pусский</li>
                            <li langs-lang="de">Deutsch</li>
                            <li langs-lang="spa">Español</li>
                            <li langs-lang="jp">日本語</li>
                        </ul>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="receiveTranslationContainer fr">
                <i class="receiveTranslationContainerHorn"></i>
                <p class="receiveTranslation c-D24040">sgdsf sfg drt </p>
            </div>
        </div>
        <div class="sendFailTip"></div>
    </div>
    <!-- 发红包---结构----->
    <div class="sendRedEnvelope LetterchatMessage fr cleard" data-rain="" data-money="" data-open="" data-con="">
        <div>
            <div class="sendNickName NickName fr">简体中文a</div>
            <span class="newsState read fr">未读</span>
            <i class="readHorn fr"></i>
        </div>
        <div class="sendRedContainer fr cleard">
            <span class="RedEnvelopeImg"></span>
            <span class="RedEnvelopeWord">查看红包</span>
            <div class="TranslateBtnConainer">
                <i class="sendTranslateBtn translateBtn"></i>
                <div class="sendlanChoice lanChoice">
                    <i class="lanI"></i>
                    <ul class="lanUl">
                        <li langs-lang="en">English</li>
                        <li langs-lang="zh">简体中文</li>
                        <li langs-lang="cht">繁體中文</li>
                        <li langs-lang="kor">한국어</li>
                        <li langs-lang="ru">Pусский</li>
                        <li langs-lang="de">Deutsch</li>
                        <li langs-lang="spa">Español</li>
                        <li langs-lang="jp">日本語</li>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="sendFailTip"></div>
        <div class="RedEnvelopeTranslationCon fr receiveTranslationContainer">
            <i class="receiveTranslationContainerHorn"></i>
            <p class="RedEnvelopeTranslation receiveTranslation c-D24040"></p>
        </div>
    </div>

</div>
<!--登录弹出框开始-->
<div class="creditcon"></div>
<div class="logn-con">
    <div class="diy-layer-top">
        Log in<span class="diy-close2"></span>
    </div>
    <div class="logn-con-bottom">
        <div style="display: block;">
            <div class="form-control">
                <div style="display: inline;">
                    <span style="display: none;" class="f12 ts kd ">Please enter your account number<!-- 用户名不能为空 --></span>
                </div>
                <input type="text" placeholder='Email'
                       data-type-diy-regex="^(1\d{10})|(([0-9a-zA-Z]+[-._+&amp;])*[0-9a-zA-Z]+@([-0-9a-zA-Z]+[.])+[a-zA-Z]{2,6})$"
                       data-type="required|diy-regex" name="name"
                       class="inp txt-name bdra30" autocomplete="off" id="txt-name">
            </div>
            <div class="form-control">
                <div style="display: inline;">
                    <span style="display: none;" class="f12 ts mkd ">Please enter a password.<!-- 密码不能为空！ --></span>
                </div>
                <input type="password" err="required" name="pwd"
                       data-type="required|diy-regex"
                       data-type-diy-regex="^[\da-zA-Z]{6,20}$" maxlength="20"
                       id="txt-pwd" class="inp txt-pwd bdra30" placeholder='Password'
                       autocomplete="off">
            </div>
            <div style="text-align: center; margin: 10px 0 15px;">
                <button id="log-bnt" class="btn">Log in<!-- 登录 --></button>
            </div>
            <div class=" mt10">
                <a href="http://www.gagahi.com:80/Platform/inviteRegIndex?source=2&inviter=&sysid=" class="fl c-2d57a1 f13">Register<!-- 注册 --></a>
                <a href="http://www.gagahi.com:80/Platform/forgotPassword" class="fr c-2d57a1 f13">Forget password<!-- 忘记密码？ --></a>
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
            <a href="http://www.gagahi.com:80/Platform/abutUs" target="_blank">About us</a> |
            <a href="http://www.gagahi.com:80/Platform/friendssafe" target="_blank">Online safety</a> |
            <a href="http://www.gagahi.com:80/Platform/privacyclause" target="_blank">Terms</a> |
            <a href="http://www.gagahi.com:80/Platform/help" target="_blank">Help</a> |
            <a href="http://www.gagahi.com:80/Platform/contactus" target="_blank">Contact us</a>
        </p>
        <div class="fhdb">
            <div class="scroll_t">
                <img src="<%=path%>/common/images/xs.png">
            </div>
            <!-- <div class="fk">
                <a href="#" class="f12">Feedback意见反馈</a>
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
</html>
<link href="<%=path%>/common/css/privateLetter.css" rel="stylesheet" type="text/css">
<script src="<%=path%>/common/js/slides-1.1.1-min.js" type="text/javascript"></script>
<link href="<%=path%>/common/css/login-layer.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=path%>/common/js/platformCountryElementMap.js"></script>
<script type="text/javascript" src="<%=path%>/common/js/privateLetterUploadIMG.js"></script>
<script type="text/javascript" src="<%=path%>/common/js/privateLetterAjax.js"></script>
<script type="text/javascript" src="<%=path%>/common/js/privateLetter.js"></script>



