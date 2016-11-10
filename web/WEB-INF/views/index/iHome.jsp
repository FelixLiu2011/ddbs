<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path = request.getContextPath();
%>
<!-- 用户设置的会话语言  -->

<!-- 当前登录用户，在站点内部可直接调用 -->

<!-- 导航选中状态 -->

<!-- 二级导航选中状态 -->

<!-- 头像尺寸 -->

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
    <link href="<%=path%>/common/css/lang.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/common/css/lrtk.css" rel="stylesheet" type="text/css">
    <!-- <link href="http://static.gagahi.com/css/skin/zhongqiu/style.css" rel="stylesheet" type="text/css"> -->
    <script src="<%=path%>/common/js/jquery.min.js" type="text/javascript"></script>
    <script  src="<%=path%>/common/js/laytpl.js"       type="text/javascript"></script>
    <script  src="<%=path%>/common/js/core.js"    type="text/javascript"></script>
    <script  src="<%=path%>/common/js/i18next-1.11.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var path = "<%=path%>";
        var local="${local}";
    </script>
    <%--引入相应的资源文件--%>
    <script type="text/javascript" src="<%=path%>/common/common.js"></script>
    <script src="<%=path%>/common/js/webuploader.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/layer/layer.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/template.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/global_plugin.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/ScrollBar/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/koala.min.1.5.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/terminator2.2.min.js" type="text/javascript"></script>
    <script src="<%=path%>/common/js/jquery.range.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=path%>/common/IM/js/processingTime.js"></script>
    <script type="text/javascript" src="<%=path%>/common/js/gift.js"></script>
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
<div class="head"  gagaid="2935154">
    <div class="w1100 jz">
        <div class="fl">
            <a href="<%=path%>/index/iHome" class="logo"><img src="<%=path%>/common/images/logo.png" alt="gagahi"/></a>
            <a href="<%=path%>/index/iHome" id="encounterIndex" data-i18n="global.encounter">Encounter</a>
            <a href="<%=path%>/zone/myZone"  id="zoneIndex" data-i18n="global.feeds">Feeds</a>
            <!--<a href="http://game.gagahi.com/" target="blank"  id="gameIndex" >Game</a>-->
            <a href="<%=path%>/mall/giftReal/shopHome" id="shopIndex" data-i18n="global.mall">Mall</a>
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
<div class="mid">
    <div class="w1100 jz">
        <!-- 资料完善度 -->
        <!-- 金币 -->
        <!-- 翻译包 -->
        <!-- 会员等级 -->
        <div class="lft fl">
            <div class="lfttop">
                <div class="yhtx fl">
                    <a href="<%=path%>/member/myInformation"><img src="http://images.gagahi.com//images/default/male.png"></a>
                </div>
                <div class="yhxx fr">
                    <p class="ari">
                        <a class="ellipsis-name" href="<%=path%>/member/myInformation"  title="Sampson">Sampson</a>

                    </p>
                    <p class="ari hui f12" style="margin: 8px 0">GaGaID:30039900</p>

                    <p class="jd"><span class="jdt"><span class="jdts f12">0%</span></span></p>
                </div>
                <div class="clear"></div>
            </div>

            <p class="wsw">
                <a href="<%=path%>/member/memberInformation"><span class="ws"></span><span data-i18n="global.uploadPhotoTip">Please upload your charming avatar.</span></a><br>
                <span class="hui f12" data-i18n="global.profileTip">Perfect information, let friends know you faster</a></span>
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
                <span id="leftSixinIndexImg" class="on"></span><a href="<%=path%>/platform/privateLetter" id="leftSixinIndexText" class="on" data-i18n="global.directLetter">Direct Message</a>
                <div class="inlineblock newsNum" id="leftSixinNotice"></div>
            </div>
            <div class="lf-lb">
                <span class="lkm" id="leftLikeMeIndexImg"></span><a href="<%=path%>/member/like/likeMe" id="leftLikeMeIndexText" data-i18n="global.likeMe">Liked me</a>
                <div class="inlineblock newsNum" id="leftLikeMeNotice"></div>
            </div>
            <div class="lf-lb">
                <span class="mlk" id="leftIlikeIndexImg"></span><a href="<%=path%>/member/like/iLike" id="leftIlikeIndexText" data-i18n="global.meLike">I liked</a>
                <div class="inlineblock newsNum" id="leftIlike"></div>
            </div>
            <div class="lf-lb lf-mutual">
                <span class="each-lk" id="leftFriendIndexImg"></span><a href="<%=path%>/member/like/likeMeAndILike" id="leftFriendIndexText" data-i18n="global.likeEachOther">Liked mutual</a>
                <div class="inlineblock newsNum" id="leftFriendNotice"></div>
            </div>
            <div class="lf-lb" >
                <span class="visitor" id="leftVisitorIndexImg" ></span><a href="<%=path%>/member/visitor/myVisitor" id="leftVisitorIndexText" data-i18n="global.visitor">Visitor</a>
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


        <div class="fr">
            <div class="screen rht ">
                <div class="inlineblock fl number">
                    <img src="<%=path%>/common/images/oy1.jpg" class="fl"><span class="fr">We have
					<span class=" c-ff8a00 fb">25,320,233</span> users from all over the world.
					</span>
                </div>
                <div class="inlineblock fl yq">
                    <button class="bdra15" id="yq" data-i18n="global.invite_friends">Invite friends</button>
                </div>

                <div class="inlineblock fl ss bdra15">
                    <input name="keywords" id="keywords" type="text" placeholder="" autocomplete="off" class="f12" id="ss">
                    <button id="searchbution" class="bdra15 " onclick="searchData(1)"></button>
                </div>
                <div class="inlineblock fl jq">
                    <img src="<%=path%>/common/images/jq.png">
                </div>
                <div class="inlineblock fl mun-t all  bdra15">
                    <span class="xld inlineblock" id="qickSearchTypeitems" data-i18n="global.recommend">Recommend</span>
                    <ul class="xld-select" style="display: none;">
                        <li><a href="javascript:void(0);" onclick="searchTypeData(1,2)">Recommend</a></li>
                        <li><a href="javascript:void(0);" onclick="searchTypeData(1,3)">Online</a></li>
                        <li><a href="javascript:void(0);" onclick="searchTypeData(1,4)">Latest </a></li>
                    </ul>
                </div>
            </div>



            <div class="clear"></div>
            <div class="rht jqss">
                <div class="jj jj1"></div>
                <div class="fl jqsslb">
                    <h3 class="f16">Country </h3>
                    <div class="jqssn" id="countrydiv">
                        <p>
                            <input type="radio" name="country" id="om" value="3" class="radio" checked="checked"> <label for="a" class="radio"> European and USA  </label>
                        </p>
                        <p>
                            <input type="radio" name="country" id="zgt" value="1" class="radio"> <label for="b" class="radio">China, HK, Taiwan</label>
                        </p>
                        <p>
                            <input type="radio" name="country" id="rh" value="2" class="radio"> <label for="c" class="radio">Japan and Korea</label>
                        </p>
                        <p>
                            <input type="radio" name="country" id="qt" value="0" class="radio"> <label for="d" class="radio">Others</label>
                        </p>
                        <div class="gj bdra30 h36">
                            <span>Advanced options</span>
                        </div>
                    </div>
                </div>
                <div class="fl jqsslb">
                    <h3 class="f16">Gender</h3>
                    <div class="jqssn jqssn1" id="sexdiv">
                        <p>
                            <input type="radio" name="sex" id="nan" value="1" class="radio"> <label for="m" class="radio">Male</label>
                        </p>
                        <p>
                            <input type="radio" name="sex" id="nv" value="2" class="radio" checked="checked"> <label for="n" class="radio">Female</label>
                        </p>
                    </div>
                    <div class="clear"></div>
                    <h3 class="f16 mt15">Age</h3>
                    <div class="nld">
                        <input class="range-slider" type="hidden" name="ageRange" id="ageRange" value="18,32" />
                    </div>
                </div>
                <div class="fl jqsslb" style="width: 34%;">
                    <h3 class="f16" style="margin-bottom: 28px;">Language</h3>
                    <div class="jqssn jqssn2" id="languagediv">

                        <p>
                            <input type="radio" name="language" id="a1" value="en-us" class="radio"> <label for="a1" class="radio">English</label>
                        </p>

                        <p>
                            <input type="radio" name="language" id="a1" value="ja-jp" class="radio"> <label for="a1" class="radio">日本語</label>
                        </p>

                        <p>
                            <input type="radio" name="language" id="a1" value="ru-ru" class="radio"> <label for="a1" class="radio">русский</label>
                        </p>

                        <p>
                            <input type="radio" name="language" id="a1" value="es-es" class="radio"> <label for="a1" class="radio">Español</label>
                        </p>

                        <p>
                            <input type="radio" name="language" id="a1" value="zh-cn" class="radio"> <label for="a1" class="radio">简体中文</label>
                        </p>

                        <p>
                            <input type="radio" name="language" id="a1" value="zh-tw" class="radio"> <label for="a1" class="radio">繁體中文</label>
                        </p>

                        <p>
                            <input type="radio" name="language" id="a1" value="ko-kr" class="radio"> <label for="a1" class="radio">한국어</label>
                        </p>

                        <p>
                            <input type="radio" name="language" id="a1" value="de-de" class="radio"> <label for="a1" class="radio">Deutsch</label>
                        </p>

                    </div>
                </div>
                <div class="clear"></div>
                <div class="gjn" style="display: none;">
                    <div class="inlineblock fl mun-t gjxxlb  h36 bdra30">
                        <span class="xld inlineblock" id="heightRange" data-tongyong="">170cm—180cm</span>
                        <ul class="xld-select" style="display: none; top: 37px;">
                            <li data-chuandi="150,160">150cm—160cm</li>
                            <li data-chuandi="160,170">160cm—170cm</li>
                            <li data-chuandi="170,180"  class="default">170cm—180cm</li>
                            <li data-chuandi="180">180cm <em data-i18n="global.above"></em></li>
                        </ul>
                    </div>

                    <div class="inlineblock fl mun-t gjxxlb  h36 bdra30">
                        <span class="xld inlineblock" id="weightRange" data-tongyong="">60kg—70kg</span>
                        <ul class="xld-select" style="display: none; top: 37px;">
                            <li data-chuandi="40,50">40kg—50kg</li>
                            <li data-chuandi="50,60" class="default">50kg—60kg</li>
                            <li data-chuandi="60,70">60kg—70kg</li>
                            <li data-chuandi="70,80">70kg—80kg</li>
                            <li data-chuandi="80">80kg <em data-i18n="global.above"></em></li>
                        </ul>
                    </div>
                    <div class="inlineblock fl mun-t gjxxlb  h36 bdra30">
                        <span class="xld inlineblock" id="jobText" data-tongyong="">Copywriter</span>
                        <ul class="xld-select " id="joblist" style="display: none; top: 37px;height:300px;overflow-y:auto;">

                            <li data-chuandi="1">Copywriter</li>

                            <li data-chuandi="2">Clerk</li>

                            <li data-chuandi="3">Programmer</li>

                            <li data-chuandi="4">Designer</li>

                            <li data-chuandi="5">Salesman</li>

                            <li data-chuandi="6">Customer Manager</li>

                            <li data-chuandi="7">Engineer</li>

                            <li data-chuandi="8">CEO</li>

                            <li data-chuandi="9">Accountant</li>

                            <li data-chuandi="10">Cashier</li>

                            <li data-chuandi="11">Civil Servant</li>

                            <li data-chuandi="12">Farmer</li>

                            <li data-chuandi="13">Fisherman</li>

                            <li data-chuandi="14">Doctor</li>

                            <li data-chuandi="15">Nurse</li>

                            <li data-chuandi="16">Cleaner</li>

                            <li data-chuandi="17">Security</li>

                            <li data-chuandi="18">Policeman</li>

                            <li data-chuandi="19">Coach</li>

                            <li data-chuandi="20">Athlete</li>

                            <li data-chuandi="21">Driver</li>

                            <li data-chuandi="22">Delivery Courier</li>

                            <li data-chuandi="23">Waiter</li>

                            <li data-chuandi="24">Airline Stewardess</li>

                            <li data-chuandi="25">Captain</li>

                            <li data-chuandi="26">Maintainer</li>

                            <li data-chuandi="27">Buyer</li>

                            <li data-chuandi="28">Chef</li>

                            <li data-chuandi="29">Gourmet</li>

                            <li data-chuandi="30">Guide</li>

                            <li data-chuandi="31">Teacher</li>

                            <li data-chuandi="32">Student</li>

                            <li data-chuandi="33">Janitor</li>

                            <li data-chuandi="34">Shop Assistant</li>

                            <li data-chuandi="36">Lawyer</li>

                            <li data-chuandi="37">Barber</li>

                            <li data-chuandi="38">Beautician</li>

                            <li data-chuandi="39">Priest</li>

                            <li data-chuandi="40">Actor</li>

                            <li data-chuandi="41">Singer</li>

                            <li data-chuandi="42">Broker</li>

                            <li data-chuandi="43">Photographer</li>

                            <li data-chuandi="44">Director</li>

                            <li data-chuandi="45">Dancer</li>

                            <li data-chuandi="46">Painter</li>

                            <li data-chuandi="47">Writer</li>

                            <li data-chuandi="48">Self-employed</li>

                            <li data-chuandi="49">Housewife</li>

                            <li data-chuandi="50">Freelance</li>

                        </ul>
                    </div>
                </div>
                <div class="sxan">
                    <button class="bdra30 bnt-lan h36 w100 f15" id="cx" onclick="searchSelectionData(1)">Re-search</button>
                    <button class="bdra30 bnt-hui h36 w80 f15" id="qx"  >Cancel</button>
                </div>
            </div>

            <!-- 这是搜索结果 -->

            <div class="oyt rht mt15" id="datacover" style="position: relative;min-height: 120px;">

                <!--没有搜索到展示-->

                <div class="oyt-none p30 tc"  id="nodatatips"  style="display:none">Not finding the one that match your search criteria.</div>
                <ul id="datalists">
                   <%-- <li class="bdra5">
                        <div class="sw"><img src="http://static.gagahi.com/images/sw.jpg"></div>
                        <div class="wz"><p class=" f12 mb10">我想出现在这里，赢得百万人关注</p>
                            <button class="bdra15 ban f12" onclick="checkBuyShowFirst()">了解更多</button>
                        </div>
                    </li>--%>
                  <%--  <li class="bdra5 " dataid="983049"><a href="http://www.gagahi.com:80/Member/otherHome/983049">
                        <div class="pic tc"><span class="wsicon"></span><span><img
                                src="http://images.gagahi.com//A-56f11ca6311013ae00d42dc76aca4019"></span></div>
                    </a>--%>
                </ul>
                <!-- 分页 -->
                <div class="page" id="pagediv">
                    <div class="tcdPageCode"></div>
                </div>
            </div>

        </div>
        <div class="clear"></div>
    </div>
    <!--邀请好友弹窗html-->
    <div class="yqCon" style="display: none;">
        <div class="yqtc">
            Invite more friends and colleages to join GaGaHi, the intimate-friend-making SNS!   <br>
            You can tell your friends the following link and invite them in by QQ、MSN or other chatting tools. <a href="<%=path%>/member/myInformation"><span class="c-2d57a1"><%=path%>/member/myInformation</span></a>
            <div class="yqnr" style="position:relative">
                <p>Your friends' email:</p>
                <textarea  name="emails" id="emails" class="bdra15 mail" style=" height:50px;line-height:25px; padding-top:5px;padding-bottom:5px"></textarea>
                <div style="display: inline;">
                    <span class="f12 ts maxmaillength " style="display: none;top:14px;left:283px;"> You can enter up to 10 mailboxes.</span>
					<span class="f12 ts kd1 " style="display: none;top:14px;left:283px;"> Please enter your account number
					</span> <span class="f12 ts yy " style="display: none;top:14px;left:283px;">The email format is incorrect.</span>
                </div>
                <p class="hui f13">Input your friends' email.You can use ","to seperate when there have several mails.You can enter up to 10 mailboxes.</p>
				<textarea cols="" rows="" id="emailTextWords" class="yqhy">Hi,
         Hi, Im {0}, i have register on GaGaHi, this is a international social communication net, you can not only know more friends all over the world,but also can be their close friends here. Come to GaGaHi, open a trip to make close friends.
         Click http://www.gagahi.com:80/Member/otherHome/2935154, find an international close friend, make your social life relax and wonderful.
                </textarea>
            </div>

        </div>
    </div>
</div>
<span id="winodowtitle"  style="display:none">Invite your friends</span>
<span id="winodowbutton" style="display:none">Yes</span>
<span id="popPrivateBtn" style="display:none;"></span>

<span id="chargewindowyes"  style="display:none">Yes</span>
<span id="onekey50windowsend"  style="display:none">Send</span>

<script type="text/javascript">
    /* (function($){
     $(window).load(function() {
     //隐藏全局加载层
     $("#global_overflow").fadeOut(500);
     });
     })(jQuery); */
    selectItem();

    //选中英语
    function selectItem(){
        $("input[name$='language'][value$='en-us']").attr("checked","true");
    }
    //头像显示
    function showBigImage(imgCode){
        if(imgCode==1){
            return 'images/default/male.png';
        }else if(imgCode==2){
            return 'images/default/female.png';
        }else{
            return imgCode;
        }
    };

    function i18nSucess() {
        $('#keywords').attr('placeholder', $.t('home.searchKey'));
    }
</script>

<script type="text/javascript">
    function doSendMsg(idname){
        var str=idname.split(";");
        var mid = str[0];
        var gettpl = Zoneyet.template($('#temp_home_popPrivate').html()).render({});
        $.post(ctx+"/Member/getMemberId",{"gagaid":mid},function(reg){
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
</script>

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
<script id="temp_home_popPrivate" type="text/html">
    <div>
        <span class="popPLetterWrapLable ihome-pop-name1">##Letter.towho##：</span>
        <span id="give_pv_to" class="popPLetterTo"></span><input type="hidden" id="give_pv_to_id">
    </div>
    <div class="">
        <span class="popPLetterWrapLable ihome-pop-name2">##Letter.pricontent##：</span>
        <div id="chatConBottom" class="inlineblock  border-all bdra15 mt20 popPLetterWrap">
            <div class="TipsContent">You have run out of the number of chat today.<!-- 您今日私信条数已用完 -->！</div>
            <div class="character"><span class="characterNum">0</span>/500</div>
            <textarea id="sendContent" class="sendContent mt10" style="height: 150px;width:450px;">##im.enterKeySend##</textarea>
            <div class="btnContainer bdra15">
                <div class="langOptions">
                    <span class="txt">translate：</span>
                    <div class="langBtn">
                        <span class="language" langs-lang="">No translation</span>
                        <i class="Triangle"></i>
                    </div>
                    <ul class="languageUl">
                        <li class="langLi" langs-lang="">No translation</li>

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
                    <li class="qqFaceBtn"></li>
                    <!--  <li class="imgBtn"></li>
                    <li class="giftBtn"></li>
                    <li class="redBtn"></li>-->
                    <li id="sendBtn" class="sendBtn">Send<!-- 发送 --></li>
                </ul>
            </div>
        </div>
    </div>
</script>

<!--登录弹出框开始-->
<link href="<%=path%>/common/css/login-layer.css" rel="stylesheet" type="text/css"/>

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
<script src="<%=path%>/common/IM/js/IM.js" type="text/javascript"></script>
<%--<script type="text/javascript" src="<%=path%>/common/js/laytpl.js"  ></script>--%>
<script type="text/javascript">
    $(function(){

        var token="db2ec157e2204e109c8342979ad0b1bc";
        if(token==""){
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
            success: function (reg) {},
            error: function () {}
        });



        /*返回顶部*/
        $('.scroll_t').click(function() {
            $('html,body').animate({
                scrollTop : '0px'
            }, 800);
        });
        /**
         *清空队列
         */
        $.ajax({
            type : "post",
            url : "http://webim.gagahi.com/message/cleanQueue",
            async : false,
            data:{
                t:token,
                offset:0,
                size:500
            },
            dataType:"json",
            success : function(data){
                if(data.code=="1"){//成功
                }else if(data.code=="6"){//Token 失效
                }else{
                }
            }
        });

        var url="http://webim.gagahi.com/message/getMessage";
        IM.connection({
            token:token,
            url:url,
            onRead:function(msg){
                if(msg.type==9){//系统消息
                    var message=msg.message;//系统消息体
                    if(message.type==1){
                        var souce = message.content['notiSouce'];
                        var content = message.content['notiContent']
                        var html = "<li class='f13'><span class='tx'><img src='<%=path%>/common/images/gg1.jpg'></span>";
                        html+="<p>2<span class='nm'>"+souce+"</span>"+content+"<br><span class='tim f12'>2:40</span></p></li>";
                        $("#myCustomScrollbar").append(html);

                    }else if(message.type==2){
                        /* 	console.log("tognzhi:"+JSON.stringify(message));
                         console.log("tognzhi:"+message);*/
                        //已读未读状态
                        if(message.content.type==1){
                            $.Letter.modifyMSGState(message.content.rid);
                        }else{
                            $.IM.modifyMSGState(message.content.rid);
                        }

                    }else if(message.type == 3){//用户在其他地方登陆
                        layer.msg(message.content,{
                            //icon: 1,
                            time: 500 //2秒关闭（如果不配置，默认是3秒）
                        },function(){
                            //alert("http://www.gagahi.com:80/");
                            window.location.href ="http://www.gagahi.com:80/Global/loginout?clearIMToken=2";
                        });

                    }else if(message.type == 4){
                        //发送后翻译译文推给对方
                        //console.log("发送后翻译译文推给对方:"+JSON.stringify(message));
                        //console.log("发送后翻译译文推给对方:"+message);
                        $.IM.SendAfterTranslationPush(message.content);


                    }else if(message.type == 100){
                        // 登录超时，提醒用户重新登录
                        //alert(message.content);
                        layer.msg(message.content,function(){
                            // 弹出登录窗体
                            $(".logn-con,.creditcon").css("display","block");
                        });
                    }else if(message.type==5){
                        //创建群通知
                        //console.log("创建群通知:"+JSON.stringify(message));
                        //console.log("创建群通知:"+message);
                        $.IM.createGroupNotice(message.content);

                    }else if(message.type==6){
                        //退群通知别人
                        //console.log("退群通知别人:"+JSON.stringify(message));
                        //console.log("退群通知别人:"+message);
                        $.IM.backGroupNotice(message.content);

                    }else if(message.type == 11){//通知 默认
                        var obj = $("#rightNotice");
                        var count = $(obj).text();
                        if(null == count || $.trim(count).length <= 0){
                            count = parseInt(message.content.count);
                            obj.addClass("gs newsNumSingle");
                        }else if(count =="99+"){
                            count ="99+";
                        }else{
                            count = parseInt(count)+parseInt(message.content.count);
                            if(count>99){
                                count ="99+";
                                obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                            }else{
                                obj.addClass("newsNumSingle");
                            }
                        }
                        $(obj).text(count);

                        //弹窗
                        RBTIPS(message.content);
                    }else if(message.type == 12){//通知 私信
                        var obj1 = $("#leftSixinNotice");
                        var count = $(obj1).text();
                        if(null == count || $.trim(count).length <= 0){
                            count = parseInt(message.content.count);
                            obj1.addClass("newsNumSingle");
                        }else if(count =="99+"){
                            count ="99+";
                        }else{
                            count = parseInt(count)+parseInt(message.content.count);
                            if(count>99){
                                count ="99+";
                                obj1.removeClass("newsNumSingle").addClass("newsNumDouble");
                            }else{
                                obj1.addClass("newsNumSingle");
                            }
                        }
                        $(obj1).text(count);

                        //在私信页面不提醒
                        if(window.location.pathname.indexOf("/privateLetter") < 0){
                            var obj = $("#rightNotice");
                            var count = $(obj).text();
                            if(null == count || $.trim(count).length <= 0){
                                count = parseInt(message.content.count);
                                obj.addClass("gs newsNumSingle");
                            }else if(count =="99+"){
                                count ="99+";
                            }else{
                                count = parseInt(count)+parseInt(message.content.count);
                                if(count>99){
                                    count ="99+";
                                    obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                                }else{
                                    obj.addClass("newsNumSingle");
                                }
                            }
                            $(obj).text(count);

                            //弹窗
                            RBTIPS(message.content);
                        }
                    }else if(message.type == 7){//通知 访客
                        var obj = $("#rightNotice");
                        var count = $(obj).text();
                        if(null == count || $.trim(count).length <= 0){
                            count = parseInt(message.content.count);
                            obj.addClass("gs newsNumSingle");
                        }else if(count =="99+"){
                            count ="99+";
                        }else{
                            count = parseInt(count)+parseInt(message.content.count);
                            if(count>99){
                                count ="99+";
                                obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                            }else{
                                obj.addClass("newsNumSingle");
                            }
                        }
                        $(obj).text(count);


                        var obj2 = $("#leftVisitorNotice");
                        var count2 = $(obj2).text();
                        if(null == count2 || $.trim(count2).length <= 0){
                            count2 = parseInt(message.content.count);
                            obj2.addClass("newsNumSingle");
                        }else if(count2 =="99+"){
                            count2 ="99+";
                        }else{
                            count2 = parseInt(count2)+parseInt(message.content.count);
                            if(count2>99){
                                count2 ="99+";
                                obj2.removeClass("newsNumSingle").addClass("newsNumDouble");
                            }else{
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
                    }else if(message.type == 8){//通知 （赞）
                        var obj = $("#rightNotice");
                        var count = $(obj).text();
                        if(null == count || $.trim(count).length <= 0){
                            count = parseInt(message.content.count);
                            obj.addClass("gs newsNumSingle");
                        }else if(count =="99+"){
                            count ="99+";
                        }else{
                            count = parseInt(count)+parseInt(message.content.count);
                            if(count>99){
                                count ="99+";
                                obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                            }else{
                                obj.addClass("newsNumSingle");
                            }
                        }
                        $(obj).text(count);

                        var obj2 = $("#leftLikeMeNotice");
                        var count2 = $(obj2).text();
                        if(null == count2 || $.trim(count2).length <= 0){
                            count2 = parseInt(message.content.count);
                            obj2.addClass("newsNumSingle");
                        }else if(count2 =="99+"){
                            count2 ="99+";
                        }else{
                            count2 = parseInt(count2)+parseInt(message.content.count);
                            if(count2>99){
                                count2 ="99+";
                                obj2.removeClass("newsNumSingle").addClass("newsNumDouble");
                            }else{
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
                    }else if(message.type == 9){//加好友
                        if(null == message.content.notice||message.content.notice!="nonotice" ){
                            var obj = $("#rightNotice");
                            var count = $(obj).text();
                            if(null == count || $.trim(count).length <= 0){
                                count = parseInt(message.content.count);
                                obj.addClass("gs newsNumSingle");
                            }else if(count =="99+"){
                                count ="99+";
                            }else{
                                count = parseInt(count)+parseInt(message.content.count);
                                if(count>99){
                                    count ="99+";
                                    obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                                }else{
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

                        if(null != message.content.isshow && message.content.isshow != "notshow"){
                            var obj = $("#rightApplyCount");
                            var count = $(obj).text();
                            if(null == count || $.trim(count).length <= 0){
                                count = parseInt(message.content.count);
                                obj.addClass("newsNumSingle");
                            }else if(count =="99+"){
                                count ="99+";
                            }else{
                                count = parseInt(count)+parseInt(message.content.count);
                                if(count>99){
                                    count ="99+";
                                    obj.removeClass("newsNumSingle").addClass("newsNumDouble");
                                }else{
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
                    }else if(message.type == 13){//私信人工翻译通知	邢冬阳
                        $.Letter.SendAfterTranslationPush(message.content);
                    }else if(message.type == 14){//私信红包打开通知	邢冬阳
                        //console.log("拆红包通知"+JSON.stringify(message));
                        //console.log("拆红包通知"+message);
                        $.Letter.getRedEnvelopeNotice(message.content);
                    }else if(message.type == 15){//私信加好友通知	邢冬阳
                        //console.log("加好友通知："+JSON.stringify(message));
                        //console.log("加好友通知："+message);
                        //message.content
                        $.IM.addFriendNoticeFun(message.content);

                    }else if(message.type == 16){//女性邀请联系失效通知	邢冬阳
                        //console.log("女性邀请联系失效通知："+JSON.stringify(message));
                        //console.log("女性邀请联系失效通知："+message);
                        $.Letter.invitationUpgradeOverTime(message.content);
                    }else if(message.type == 17){//动态实时翻译
                        $.zone.changeZoneTrans(message.content);
                    }else if(message.type == 18){//评论实时翻译
                        $.zone.changeCommentTrans(message.content);
                    }else if(message.type == 20){//实时更新被赠送人翻译包字节数  郭印
                        var num = $("#totalTranslate").text();
                        if(null == num || $.trim(num).length <= 0){
                            num = 0;
                        }
                        $("#totalTranslate").text(parseInt(num)+parseInt(message.content.trpaCharcount));
                        //更新session
                        updateSession();
                    }else if(message.type == 21){//实时更新被升级会员 郭印
                        if(null != message.content && null != message.content.mfstRelevel){
                            $(".lfttop").find(".ari:first").find("img").remove();//首先删除元素
                            if(message.content.mfstRelevel == "2"){//高级
                                $(".lfttop").find(".ari:first").append("<img src=\"<%=path%>/common/images/hg.jpg\">");
                            }else if(message.content.mfstRelevel == "3"){//vip
                                $(".lfttop").find(".ari:first").append("<img src=\"<%=path%>/common/images/vip-hg.jpg\">");
                            }

                            //更新session
                            updateSession();
                        }
                    }else if(message.type == 22){//实时更新金币 郭印
                        if(null != message.content && null != message.content.gold){
                            var obj = $("#totalMoney");
                            var count = $(obj).text();
                            if(null != count && $.trim(count).length > 0 ){
                                count = parseFloat(count) - parseFloat(message.content.gold);
                                if(parseFloat(count) <= 0){
                                    count = "0";
                                }
                                $(obj).text(count);
                                $(obj).parent().attr("data-explain",count);
                            }

                            //更新session
                            updateSession();
                        }
                    }

                }else if(msg.type=="1"){//IM
                    $.IM.receiveMessage(msg.message);
                }else if(msg.type=="2"){//私信
                    $.Letter.ReceiveMessage(msg.message);
                }else if(msg.type=="10"){//用户下线通知
                    if(msg.message.isOnline){//上线
                        //console.log("上线用户"+msg.message.users);
                        $.IM.userOnline(msg.message.users);
                        $.Letter.userOnline(msg.message.users);
                    }else{//下线
                        //console.log("下线用户"+msg.message.users);
                        $.IM.userOffline(msg.message.users);
                        $.Letter.userOffline(msg.message.users);
                    }
                }
            },
            onError:function(msg){
                if(msg=="6"){//Token 失效
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

</script>
</html>








<!--购买头像首位位置html-->
<div class="buyCon" style="display:none;" id="buyShowFirstWindow">
    <div class="buy-top tc"><img src="<%=path%>/common/images/xxgg.jpg" width="339" height="180"><br>
        <span class="f16 c-fff inlineblock mb20 h30 mt10 ihome-buy-first">Your avatar has gotten to the top,attract more visitors, and promote your chaming index</span></div>
    <div class="balance tc">Your gold balance：<span class="c-ff8a00 f25 mr5" id="buyShowFirstLeftGlod"></span><span class="money mt15"></span><span class="hui ml10" data-i18n="home.chargePer"><!--（服务费用1金币/天）--></span></div>
    <div class="recharge">
        <p class=" tc mt20 mb10" id="showLessMoneyWin"/>
        <p class=" tc mb10">Choose days：
            <input id="min" name="" type="button" value="-" class="bdra15 h36 fb f20" />
            </b> <b>
                <input id="text_box" name="" type="text" value="1"  class="f18 fb"/ >
            </b><b>
                <input id="add"   type="button" value="+" class="bdra15 h36 fb f18" />
            </b> </p>
    </div>
</div>

<!--充值窗口-->
<div class="rechargeCon" style="background: #fff; display:none;"  id="chargeCoinsWindow">
    <a id="openpay_a" style="display:none;" target="_blank"></a>
    <div class="recharge">
        <div class="recharge-top">
            <span class="rec-1">Know more good-looking member</span><span class="rec-2">Gain more attention</span><span class="rec-3">VIP can enjoy more dignity privilege</span>
        </div>
        <div class="recharge-mid">
            <h3 class="mb15 mt15 rec-title">Choose the gold amount you want to recharge<span class="fr" >Service fee: 1 gold each day</span></h3>
            <ul>
                <li data-dollar='20'>
                    <p class="mt20"><span class="c-ff8a00 f25 mr5">20</span><span class="money"></span></p>
                    <p class=" mt5"><span class="fb">$20</span> /￥<span class="fb">120</span></p>
                    <div class="chosed"></div>
                </li>
                <li data-dollar='50'>
                    <p class="mt20"><span class="c-ff8a00 f25 mr5">50</span><span class="money"></span></p>
                    <p class=" mt5"><span class="fb">$50</span> /￥<span class="fb">300</span></p>
                    <div class="chosed"></div>
                </li>
                <li data-dollar='100'>
                    <p class="mt20"><span class="c-ff8a00 f25 mr5">100</span><span class="money"></span></p>
                    <p class=" mt5"><span class="fb">$100</span> /￥<span class="fb">600</span></p>
                    <div class="chosed"></div>
                </li>
                <li data-dollar='200'>
                    <p class="mt20"><span class="c-ff8a00 f25 mr5">200</span><span class="money"></span></p>
                    <p class=" mt5"><span class="fb">$200</span> /￥<span class="fb">1200</span></p>
                    <div class="chosed"></div>
                </li>
                <li data-dollar='500'>
                    <p class="mt20"><span class="c-ff8a00 f25 mr5">500</span><span class="money"></span></p>
                    <p class=" mt5"><span class="fb">$500</span> /￥<span class="fb">3000</span></p>
                    <div class="chosed"></div>
                </li>
                <li data-dollar='1000'>
                    <p class="mt20"><span class="c-ff8a00 f25 mr5">1000</span><span class="money"></span></p>
                    <p class=" mt5"><span class="fb">$1000</span> /￥<span class="fb">6000</span></p>
                    <div class="chosed"></div>
                </li>
                <div class="clear"></div>
            </ul>
            <h3 class="mb10">Payment method</h3>
            <div class="zf">
                <a data-tple="ali">
                    <img src="<%=path%>/common/images/zfb.png">
                    <div class="chosed1"></div>
                </a>
                <a data-tple="paypal">
                    <img src="<%=path%>/common/images/paypal.png">
                    <div class="chosed1"></div>
                </a>
                <a data-tple="visa">
                    <img src="<%=path%>/common/images/visa.png">
                    <div class="chosed1"></div>
                </a>
                <a data-tple="master">
                    <img src="<%=path%>/common/images/master.png">
                    <div class="chosed1"></div>
                </a>
            </div>
        </div>

    </div>
</div>

<div id="redirectDiv"></div>


<script type="text/javascript">
    $.IM.getMoneyNum();
    $("#buyShowFirstLeftGlod").text($.IM.myMoneyNum);
    //购买首页展示
    function checkBuyShowFirst(){
        if($.IM.myMoneyNum>0){
            buyShowFirstWindow();
        }else{
            recha();
        }

    }

    //购买展现
    function buyShowFirst(){
        $.post("http://www.gagahi.com:80/memberFinance/buyShowFirstDay",
                {
                    "dayNum":$("#layui-layer1 #text_box").val()
                },
                function(data,textStatus){
                    if(data.success){
                        updateSession();
                        layer.msg($.t('home.rechargeSuccess'));
                        window.location.reload();
                    }else{
                        layer.msg($.t('home.rechargeError'));
                    }
                })
    }

    //兑换首页展示天数
    function buyShowFirstWindow(){
        layer.open({
            area: ['660px', '530px'],
            skin: 'demo-buy demo-buy1',
            title: $.t('home.purchase'),
            content: $('#buyShowFirstWindow').html(),
            btn: $.t('global.ok'),
            yes: function(index, layero) {
                // $("#myMoneyTotal").text($.IM.myMoneyNum);
                if($.IM.myMoneyNum< $("#layui-layer1 #text_box").val()){
                    $("#layui-layer1 #showLessMoneyWin").html("<div ><span class='red'>" + $.t('home.goldNotEnough') + "</span> <a href='<%=path%>/pay/recharge' style='color:#2d57a1'>" + $.t('home.rechargeGold') + "</a></div>");
                }else{
                    buyShowFirst();
                    layer.close(index);
                }

            },
            cancel: function(index) {},
        });
        $(".layui-layer-btn0").after("<br><a href='<%=path%>/pay/upgradeMember' class='lj'>It's cheaper to upgrade member</a>");
        var t = $("#layui-layer1 #text_box");
        //初始化数量为1,并失效减
        $("#layui-layer1 #min").attr('disabled', true);
        //数量增加操作
        $("#layui-layer1 #add").live("click", function() {
            t.val(parseInt(t.val()) + 1)
            if (parseInt(t.val()) != 1) {
                $("#layui-layer1 #min").attr('disabled', false);
            }
        })
        //数量减少操作
        $("#layui-layer1 #min").live("click", function() {
            t.val(parseInt(t.val()) - 1);
            if (parseInt(t.val()) == 1) {
                $("#layui-layer1 #min").attr('disabled', true);
            }
        })
    }









    /*充值服务*/
    var money = "";//支付类型
    var zftype = "";//支付类型
    function recha(){
        //转化
        var htmlstr = $('#chargeCoinsWindow').html();
        //用
        layer.open({
            type:1,
            area: ['850px', '700px'],
            skin: 'demo-class',
            title: [$.t('home.recharge'), 'font-size:18px;'],
            content: htmlstr,
            btn: $("#chargewindowyes").text(),
            success: function() {
                $(function() {
                    $(".recharge-mid li").click(function(e) {
                        money = $(this).find(".c-ff8a00").text();//钱数   美元
                        $(this).css("background", "#fff3d9").children(".chosed").css("display", "block");
                        $(this).siblings().css("background", "#fff").children(".chosed").css("display", "none");

                    });
                    $(".zf a").click(function(e) {
                        zftype = $(this).attr("data-tple");//支付类型
                        $(this).css("background", "#fff3d9").children(".chosed1").css("display", "block");
                        $(this).siblings().css("background", "#fff").children(".chosed1").css("display", "none");
                    });
                })
                $(".layui-layer-btn0").after("<br><a herf='' class='lj'>It's cheaper to upgrade member</a>");
            },
            yes: function(index, layero) {
                //实现充值
                if(null == money || $.trim(money).length <= 0){
                    layer.msg($.t('home.goldNumError'));
                    return;
                }
                if(null == zftype || $.trim(zftype).length <= 0){
                    layer.msg($.t('home.payTypeError'));
                    return;
                }

                var url = "";
                var data;
                if(zftype == "ali"){//支付宝
                    url = "http://www.gagahi.com:80/pay/subalipay";
                    data = {"subject": money + "gold","total_fee":money,"paid":money,"money":money*6};
                }else if(zftype == "paypal"){//paypal
                    url = "http://www.gagahi.com:80/pay/subpaypal";
                    data = {"item_name": money + "gold","amount":money,"paid":money,"money":money};
                }else if(zftype == "visa"){
                    $.post("http://www.gagahi.com:80/payMasa/payRedirectIndex",{ "subject": money + $.t('global.Gold'),"total_fee":money,"amount":money,"paid":money,"money":money,"femaleid":$("#femaleid").val(),"payMethod":"VISA"},
                            function(data,textStatus){
                                $("#redirectDiv").html(data.msg);
                                openFinishWinodow()
                            })
                    return;
                }else if(zftype == "master"){
                    $.post("http://www.gagahi.com:80/payMasa/payRedirectIndex",{ "subject": money + $.t('global.Gold'),"total_fee":money,"amount":money,"paid":money,"money":money,"femaleid":$("#femaleid").val(),"payMethod":"MASTER"},
                            function(data,textStatus){
                                $("#redirectDiv").html(data.msg);
                                openFinishWinodow()
                            })
                    return;
                }


                //验证小白登录
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
                    return;
                }

                openFinishWinodow();
                $.ajax({//虚拟礼物
                    type : "post",
                    url : url,
                    contentType : "application/x-www-form-urlencoded",
                    data: data,
                    async: false,//注意这里同步设置
                    success: function(data){
                        if(data.success){
                            if(data.msg != "-1" && data.msg != "-2"){
                                //$("#openpay_a").attr("href",data.msg);
                                $("#openpay_a").click(function(){
                                    window.open(data.msg,"_target");
                                });
                                $("#openpay_a").click();
                            }
                        }else{
                            layer.msg(data.msg);
                        }
                    }
                });


                layer.close(index);
            },
            cancel: function(index) {},
        });
    };


    //支付完成跳转弹窗
    function openFinishWinodow(){
        layer.open({
            type: 1,
            area: '424px',
            title: false,
            content: '<p class="p15"><span class="f16 fb inlineblock mb10">' + $.t('home.payNewlyPage') + '</span><br>' + $.t('home.notClosePayPopup') + '<a href="#" id="reselectpayaction" onclick="reselectpay()" class="c-2d57a1 ml15">' + $.t('home.reselectPayType') + '</a></p>',
            btn: [$.t('home.completePay'), $.t('home.payProblem')],
            success:function (layero, index) {
                $("#reselectpayaction").click(function(){
                    layer.close(index);
                })
            },
            yes: function(index, layero) {
                window.location.reload();
            },
            cancel: function(index) {
                window.location.href="<%=path%>/pay/help";
            }

        });

    }


</script>








<script  type="text/javascript">

    //女性用户一键50人
    function openRecommendWin(){
        //alert($('#sayhelloTo50').text());
        layer.open({
            area: ['660px','620px'],
            fix: false ,
            skin: 'demo-buy demo-buy1',
            title: $.t('home.womenTransGift'),
            content:$('#femaleFirstTask').html(),
            btn: $("#onekey50windowsend").text(),
            success: function(){
                $(".xld").each(function(index, element) {
                    $(this).toggle(function (e) {
                                $(this).next("ul").css("display","block");
                                $(this).css("background-image","url(<%=path%>/common/images/xld1.png)");
                                $(".xld-select>li").each(function (e) {
                                    var _selt = $(this);
                                    $(this).hover(function (){
                                        $(this).addClass("default").siblings().removeClass("default");
                                    });
                                    $(this).click(function (e) {
                                        $(_selt.parent(".xld-select").siblings("span")).text(_selt.children("a").text()).css("background-image","url(<%=path%>/common/images/xld.png)");
                                        _selt.parent(".xld-select").css("display", "none");
                                    });
                                });
                            },
                            function(){
                                $(this).next("ul").css("display","none");
                                $(this).css("background-image","url(<%=path%>/common/images/xld.png)");
                            });
                });
            },
            yes: function (index, layero) {
                var sendmsg=($('.demo-buy .sayhelloTo50').text());
                $.post("http://www.gagahi.com:80/pm/femailSendTo50",{"msg":sendmsg,"isPl":'0'},function(data,textStatus){
                    layer.msg(data.msg);
                })
                layer.close(index)
            },
            cancel: function (index) {

            },
        });
    };

</script>


<script  type="text/javascript">
    var pageNo = 1; //页码
    var pageCount = 1; //总页数
    var searchType= 1;  //  1.精确,2.模糊,3.类型
    var quickSearchType = 1;  //1.全部 2.推荐 3.在线 4.最新


    var selfhtmlstr="";
    var buyshowflag=0;   //是否购买展示


    var lovedListStr="";  //偶遇列表id
    var jsonObj=[];  //一次或取当前点赞信息

    searchTypeData(1,2);


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
                selfhtmlstr=selfhtmlstr+ "<span><img src='<%=path%>/common/images/hg.jpg'/></span>";
            }
            if(bean.memberfinance.mefiLevel==3){
                selfhtmlstr=selfhtmlstr+ "<span><img src='<%=path%>/common/images/vip-hg.jpg'/></span>";
            }

            var countryInfo = null!=bean.membCountry?getMemberCountryInfo("en-us",bean.membCountry):"";
            var ageStr = 0 == bean.age?"":bean.age;
            if(ageStr != "" && countryInfo != ""){
                ageStr += "," + countryInfo;
            }else if(ageStr == "" && countryInfo != ""){
                ageStr += countryInfo;
            }
            selfhtmlstr=selfhtmlstr+"<br> <span class='ari hui '>"+ageStr+"</span> </div>"+
                    "<div class='jbxx1'><span class=' inlineblock dz'><img src='<%=path%>/common/images/hart.png'></span> <span class=' eml inlineblock'></span></div>";
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
                        if(searchType==3) $("#datalists").append("<li class='bdra5'><div class='sw'><img src='<%=path%>/common/images/sw.jpg'></div><div class='wz'><p class=' f12 mb10'>I want to be here to win the attention of millions of people.</p><button class='bdra15 ban f12' onclick='checkBuyShowFirst()'>Learn more</button></div></li>");
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
                    htmlstr=htmlstr+ "<span><img src='<%=path%>/common/images/hg.jpg'></span>";
                }
                if(list[i].mefi_level==3){
                    htmlstr=htmlstr+ "<span><img src='<%=path%>/common/images/vip-hg.jpg'></span>";
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
                        "<div class='jbxx1'><a onclick='javascript:doLikeSb("+list[i].membGagaid+",this)'><span class=' inlineblock dz'><img src='<%=path%>/common/images/hart.png'></span></a>"+
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
        $.post("http://www.gagahi.com:80/Member/Like/findIfIloveList",{"lovedIdList":lovedListStr},
                function(data,textStatus){
                    if(data.success){
                        jsonObj=JSON.parse(data.obj);
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
        $.post("http://www.gagahi.com:80/Member/Like/iliketoonly",
                {'mid':id},
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

</script>




<script type="text/javascript">

    /*修改滚动轴*/



    $(window).load(function() {
        /* if(1=='0') {
         var tmoutopen=setTimeout(function(){
         openRecommendWin();
         clearTimeout(tmoutopen);
         },60000);

         } */
        //新手指引
  /*      if(1=='1'){
            newRegGuide();
        }*/
    });
    /*新手引导*/
    function newRegGuide(){
        //新手引导样式  1:男 2:女
        /* if('1'==1){
         $(".searchTip").css("margin-top","30px");
         } */
        $(".coverall,.searchTip,.searchTip div:eq(0)").show();
        var tmout=setTimeout(function(){
            $(".searchTip div:eq(0)").click();
        },3000);

        $(".searchTip div").click(function() {
            var current=$(this);
            $(current).hide();
            $(current).next().show();
            clearTimeout(tmout);
            tmout=setTimeout(function(){
                $(current).next().click();
            },3000);
        });
        $(".searchTip div:last").click(function(e) {
            $(".coverall,.searchTip,").hide();
            //一键打招呼
            /*    if(1=='0') {
             var tmoutopen=setTimeout(function(){
             //openRecommendWin();
             clearTimeout(tmoutopen);
             },200);

             } */
        });
    };

    /*分页*/

    /*搜索框边框控制*/
    $("#ss").focus(function(e) {
        $(this).parent("div").css("border", "1px solid #2d57a1");
    });

    /*下拉菜单*/
    $(".mun-t").each(function(index, element) {
        $(this).hover(function (e) {
                    $(this).children("ul").css("display","block");
                    $(this).children("span").css("background-image","url(<%=path%>/common/images/xld1.png)");
                    $(".xld-select li",$(this)).each(function (e) {
                        var _selt = $(this);
                        $(this).hover(function (){
                            $(this).addClass("default").siblings().removeClass("default");
                        })
                        $(this).off("click");
                        $(this).on("click",function (e) {
                            $(_selt.parent(".xld-select").siblings("span")).text(_selt.text()).css("background-image","url(<%=path%>/common/images/xld.png)");
                            $(_selt.parent(".xld-select").siblings("span")).attr("data-tongyong",$(_selt).data("chuandi"));
                            _selt.parent(".xld-select").css("display", "none");
                        });
                        $(".mCustomScrollBox li").on("click",function (e) {
                            $(this).parents(".xld-select").siblings("span").text($(this).text()).css("background-image","url(<%=path%>/common/images/xld.png)");
                            $(this).parents(".xld-select").siblings("span").attr("data-tongyong",$(this).data("chuandi"));
                            $(this).parents(".xld-select").css("display", "none");
                        });

                    });

                },
                function  () {
                    $(this).children("ul").css("display","none");
                    $(this).children("span").css("background-image","url(<%=path%>/common/images/xld.png)");
                })

    });
    $("#joblist").mCustomScrollbar();

    /*精确搜索*/
    $(".jq").click(function(e) {
        $(".jqss").toggle()
    });
    $("#cx").click(function(e) {
        $(".jqss").css("display", "none");

    });
    $("#qx").click(function(e) {
        $(".jqss").css("display", "none");

    });
    /*选择年龄段*/
    $('.range-slider').jRange({
        from : 18,
        to : 60,
        step : 1,
        scale : [ 18, 25, 35, 45, 59 ],
        format : '%s',
        width : 210,
        showLabels : true,
        isRange : true
    });
    /*高级选项*/
    $(".gj").click(
            function(e) {
                $(".gjn").toggle(
                        function() {
                            if ($(this).is(":hidden")) {
                                $(".gj>span").css("background-image","url(<%=path%>/common/images/xld.png)");
                                //取消默认数据
                                $("#heightRange").attr("data-tongyong","");
                                $("#weightRange").attr("data-tongyong","");
                                $("#jobText").attr("data-tongyong","");

                            } else {
                                $(".gj>span").css("background-image","url(<%=path%>/common/images/xld1.png)")
                                //填充默认数据
                                $("#heightRange").attr("data-tongyong","170,180");
                                $("#weightRange").attr("data-tongyong","60,70");
                                $("#jobText").attr("data-tongyong","1");
                            }
                        })
            });
    $("#yq")
            .click(
                    function(e) {
                        layer
                                .open({
                                    area :'700px',
                                    skin : 'demo-yq',
                                    title : [ $("#winodowtitle").html(), 'font-size:18px;' ],
                                    content : $('.yqCon').html(),
                                    btn : $("#winodowbutton").html(),
                                    yes : function(index, layero) {
                                        //console.log(index+'||'+layero)
                                        var checkem = /^((\w-*\.*)+@(\w-?)+(\.\w{2,}),)*((\w-*\.*)+@(\w-?)+(\.\w{2,})$)/;
                                        var emails = $(".demo-yq #emails").val();
                                        var flagem = true;
                                        var emalArray=emails.split(",");
                                        if(emalArray.length>10){
                                            $('.maxmaillength').css('display', 'block')
                                                    .siblings().css('display',
                                                    'none');
                                            $(".mail").css("border-color","#ff9c00");
                                            return false;
                                        }
                                        if (emails == '') {
                                            $('.kd1').css('display', 'block')
                                                    .siblings().css('display',
                                                    'none');
                                            $(".mail").css("border-color",
                                                    "#ff9c00");
                                            return false;
                                        }
                                        if (!checkem.test(emails)) {
                                            $('.yy').css('display', 'block')
                                                    .siblings().css('display',
                                                    'none');
                                            $(".mail").css("border-color",
                                                    "#ff9c00");
                                            return false;
                                        }
                                        $('.yy').css('display', 'none')
                                                .siblings().css('display',
                                                'none');
                                        $('.kd1').css('display', 'none')
                                                .siblings().css('display',
                                                'none');
                                        $(".mail").css("border-color", "#fff");
                                        var date = new Date().Format("yyyy-MM-dd hh:mm:ss");
                                        $.post("http://www.gagahi.com:80/Member/emailSent", {
                                            type : "1",
                                            textWords:$("#emailTextWords").val(),
                                            emails : emails,nowdate:date
                                        }, function(result) {
                                            if (result.success) {
                                                layer.msg(result.msg);
                                                layer.close(index);
                                            }else{
                                                layer.msg(result.msg);
                                                layer.close(index);
                                            }
                                        });
                                    },
                                    cancel : function(index) {
                                    },

                                });
                    });

    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }


    //获取随机数
    function GetRandomNum(Min,Max){
        var Range = Max - Min;
        var Rand = Math.random();
        return(Min + Math.round(Rand * Range));
    }

    //中秋弹窗 1.34
    /*
     if (!$.cookie('ztip')) {
     layer.open({
     title: false,
     content: '<div class="zhongqiu-dialog-words"></div>',
     area: ['477px', '395px'],
     skin: 'zhongqiu-dialog',
     btn: $.t('global.actionDetail'),
     yes: function() {
     window.location.href = ctx + '/Platform/action';
     //window.open((ctx + '/Platform/action'),undefined, undefined,false)
     }
     });
     $.cookie('ztip', 1, {expires: 1});
     }*/
</script>

