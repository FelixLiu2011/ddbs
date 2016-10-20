<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    String path=request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Myspace</title>
    <meta charset="UTF-8">
    <link href="<%=path%>/common/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="<%=path%>/common/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="<%=path%>/common/bxslider/css/jquery.bxslider.css" rel="stylesheet"/>
    <script src="<%=path%>/common/jquery/jquery.js"></script>
    <script src="<%=path%>/common/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path%>/business/common/language/${local}.js"></script>
    <link href="<%=path%>/business/common/css/common.css" rel="stylesheet"/>
    <script src="<%=path%>/common/bootstrapvalidator/js/bootstrapValidator.js" type="text/javascript"></script>
    <link  rel="stylesheet" href="<%=path%>/common/custom-loader/css/sllib.css"/>
    <script type="text/javascript" src="<%=path%>/common/custom-loader/js/loader.js"></script>
    <script type="text/javascript" src="<%=path%>/business/myspace/mySpaceContent.js"></script>
    <%--分页--%>
    <script type="text/javascript" src="<%=path%>/common/bootstrap-paginator/js/bootstrap-paginator.js"></script>
    <%--文件上传JS--%>
    <link href="<%=path%>/common/bootstrap-fileupload/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="<%=path%>/common/bootstrap-fileupload/js/fileinput.js" type="text/javascript"></script>
    <script src="<%=path%>/common/bootstrap-fileupload/js/fileinput_locale_${local}.js" type="text/javascript"></script>
    <!--[if IE]>
    <script src="<%=path%>/common/bootstrap-fileupload/js/html5shiv.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var path = "<%=path%>";
    </script>
    <%--引入业务JS --%>
    <script type="text/javascript" src="<%=path%>/business/blog/language/${local}.js"></script>
    <link href="<%=path%>/common/bootstrapvalidator/css/bootstrapValidator.min.css" rel="stylesheet"/>
    <script src="<%=path%>/common/bootstrapvalidator/js/bootstrapValidator.min.js" type="text/javascript"></script>
    <script src="<%=path%>/common/bootstrapvalidator/js/language/${local}.js" type="text/javascript"></script>
    <%--datatime picker--%>
    <link href="<%=path%>/common/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/common/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="<%=path%>/common/bootstrap-datetimepicker/js/datePickerLocales/bootstrap-datetimepicker.Constom_${local}.js" charset="UTF-8"></script>
    <link href="<%=path%>/common/jquery-confirm/jquery-confirm.min.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/common/jquery-confirm/jquery-confirm.min.js"></script>
    <script type="text/javascript" src="<%=path%>/business/myspace/language/${local}.js"></script>
    <script type="text/javascript" src="<%=path%>/business/photo/language/${local}.js"></script>
    <%--引入自定义样式--%>
    <script type="text/javascript" src="<%=path%>/business/blog/blog.js"></script>
    <script type="text/javascript" src="<%=path%>/business/photo/language/${local}.js"></script>
    <script type="text/javascript" src="<%=path%>/business/photo/photo.js"></script>
    <script type="text/javascript" src="<%=path%>/business/message/language/${local}.js"></script>
    <script type="text/javascript" src="<%=path%>/business/blog/language/${local}.js"></script>
    <script type="text/javascript" src="<%=path%>/business/message/js/message.js"></script>
    <script type="text/javascript" src="<%=path%>/business/myspace/userInfoEdit.js"></script>
    <link type="text/css" href="<%=path%>/business/photo/photo.css" rel="stylesheet"/>
    <style type="text/css">
        body,html{
            overflow: hidden !important;
            height:100%;
            width:100%;
        }
        .txtDivSpan{
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
      <div class="tabbable" id="tabs-262840">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#panel-tabs0" data-toggle="tab" id="mySpaceTab"><spring:message code="mySpace" text="个人主页"></spring:message></a>
            </li>
            <li>
                <a href="#panel-tabs1" data-toggle="tab"><spring:message code="myProfile" text="用户资料"></spring:message></a>
            </li>
<%--            <li>
                <a href="#panel-tabs2" data-toggle="tab">心情</a>
            </li>--%>
            <li>
                <a href="#panel-tabs3" data-toggle="tab" id="logTab"><spring:message code="blog" text="日志"></spring:message></a>
            </li>
            <li>
                <a href="#panel-tabs4" data-toggle="tab"><spring:message code="album" text="相册"></spring:message></a>
            </li>
<%--            <li>
                <a href="#panel-tabs5" data-toggle="tab">分享</a>
            </li>--%>
<%--            <li>
                <a href="#panel-tabs6" data-toggle="tab">群组</a>
            </li>--%>
            <li>
                <a href="#panel-tabs7" id="messageTab" data-toggle="tab"><spring:message code="messageBoard" text="留言板"></spring:message></a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="panel-tabs0">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <a class="panel-title" data-toggle="collapse" data-parent="#panel-839153" href="#panel-element-1331"><spring:message code="latestPhotos" text="最近照片"></spring:message></a>
                    </div>
                    <div id="panel-element-1331" class="panel-collapse in">
                        <div class="panel-body">
                            <div class="row" id="latestPhotoContentDiv">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <a class="panel-title" data-toggle="collapse" data-parent="#panel-839153" href="#panel-element-1233"><spring:message code="latestBlog" text="最近日志"></spring:message></a>
                    </div>
                    <div id="panel-element-1233" class="panel-collapse in">
                        <div id="latestBlogContentDiv">
                        </div>
                    </div>
                </div>
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <a class="panel-title" data-toggle="collapse" data-parent="#panel-839153" href="#panel-element-1152"><spring:message code="latestMessage" text="最近留言"></spring:message></a>
                    </div>
                    <div id="panel-element-1152" class="panel-collapse in">
                        <div id="latestMessageContentDiv">
                        </div>
                    </div>
                </div>
            </div>
            <%--个人资料--%>
            <div class="tab-pane " id="panel-tabs1" align="center">
                <p class="bg-info text-info" style="height: 30px;line-height: 30px;"><spring:message code="myProfileInfo" text="填写完整准确的个人资料，可以让更多的朋友找到您。"></spring:message></p>
                <form class="form-horizontal" role="form" id="userInfoForm">
                   <div>
                      <div id="left"  style="float:left;width: 400px;">
                          <div class="form-group">
                              <label class="col-sm-offset-1 col-sm-2 control-label pull-left">
                                  <span class="inline-block width120"><spring:message code="username" text="用户名"></spring:message></span>
                              </label>
                              <label class="col-sm-offset-1 col-sm-2 control-label pull-left">
                                  <span class="inline-block">${memberInfo.userName}</span>
                              </label>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-offset-1 col-sm-2 control-label pull-left ">
                                  <span class="inline-block width120"><spring:message code="sex" text="性别"></spring:message></span>
                              </label>
                              <label class="col-sm-offset-1 col-sm-2 control-label pull-left">
                                  <span class="inline-block" id="sex">
                                  </span>
                                  <span style="display: none;" id="sexHidden">${memberInfo.userSex}</span>
                              </label>
                          </div>
                      </div>
                       <div id="right">
                           <img id="headPhoto" src="<%=path%>${memberInfo.headPhotoUrl}" alt="120X120" class="img-rounded"
                                style="width: 100px;height: 100px;">
                       </div>
                   </div>
                    <div class="form-group">
                        <label class="col-sm-offset-1 col-sm-2 control-label pull-left">
                            <span class="inline-block width120"><spring:message code="height" text="身高"></spring:message></span>
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control width300 pull-left" id="height" name="userHeight" disabled="disabled" value="${memberInfo.userHeight}" />
                        </div>
                        <label class="col-sm-1 control-label pull-left"><span class="inline-block" style="height: 34px;line-height: 34px;">CM</span></label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-offset-1 col-sm-2 control-label pull-left"><span class="inline-block width120">
                            <spring:message code="weight" text="体重"></spring:message></span></label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control width300 pull-left" id="weight" name="userWeight" disabled="disabled" value="${memberInfo.userWeight}" />
                        </div>
                        <label class="col-sm-1 control-label pull-left"><span class="inline-block" style="height:34px;line-height: 34px;">KG</span></label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-offset-1 col-sm-2 control-label pull-left"><span class="inline-block width120">
                            <spring:message code="country" text="国家"></spring:message>
                        </span></label>
                        <div class="col-sm-4">
                            <select class="form-control pull-left width300" name="userContury" disabled="disabled" data-value="${memberInfo.userContury}" id="contury">
                                <option value="Other"><spring:message code="countryOther" text="其他"></spring:message> </option>
                                <option value="Taiwan">Taiwan</option>
                                <option value="Hongkong">Hongkong</option>
                                <option value="China">China</option>
                                <option value="U.S.A">U.S.A</option>
                                <option value="Poland">Poland</option>
                                <option value="Iceland">Iceland</option>
                                <option value="Austria">Austria</option>
                                <option value="Ireland">Ireland</option>
                                <option value="Israel">Israel</option>
                                <option value="Denmark">Denmark</option>
                                <option value="Saudi Arabia">Saudi Arabia</option>
                                <option value="Thailand">Thailand</option>
                                <option value="Vietnam">Vietnam</option>
                                <option value="New Zealand">New Zealand</option>
                                <option value="Chile">Chile</option>
                                <option value="Burma">Burma</option>
                                <option value="Philippines">Philippines</option>
                                <option value="Russia">Russia</option>
                                <option value="Holland">Holland</option>
                                <option value="Italy">Italy</option>
                                <option value="Macao">Macao</option>
                                <option value="Japan">Japan</option>
                                <option value="Korea">Korea</option>
                                <option value="Singapore">Singapore</option>
                                <option value="Malaysia">Malaysia</option>
                                <option value="Canada">Canada</option>
                                <option value="Australia">Australia</option>
                                <option value="New Zealand">New Zealand</option>
                                <option value="Britain">Britain</option>
                                <option value="France">France</option>
                                <option value="Germany">Germany</option>
                                <option value="Europe">Europe</option>
                                <option value="India">India</option>
                                <option value="Greece">Greece</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="dtp_input2" class="col-sm-offset-1 col-sm-2 control-label pull-left">
                            <span class="inline-block width120"><spring:message code="birthday" text="出生日期"></spring:message></span>
                        </label>
                        <div class="col-sm-5">
                           <div  id="datetimepicker" class="input-group date form_date width300 pull-left" data-date="${memberInfo.userBirth}"
                                 data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                <input class="form-control" size="16" type="text" readonly value="${memberInfo.userBirth}" disabled="disabled" name="userBirth">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <input type="hidden" id="dtp_input2" value="" /><br/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-offset-1 col-sm-2 control-label pull-left">
                            <span class="inline-block width120"><spring:message code="religion" text="宗教"></spring:message> </span>
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control width300 pull-left" disabled="disabled" id="religion" value="${memberInfo.userReligion}" name="userReligion" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-offset-1 col-sm-2 control-label pull-left">
                            <span class="inline-block width120"><spring:message code="education" text="教育"></spring:message></span>
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control pull-left width300" disabled="disabled" id="education" name="userEducation" value="${memberInfo.userEducation}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-offset-1 col-sm-2 control-label pull-left">
                            <span class="inline-block width120">
                                <spring:message code="description" text="交友宣言"></spring:message>
                            </span>
                        </label>
                        <div class="col-sm-5">
                            <textarea class="form-control width300 pull-left" disabled="disabled" id="declaration" rows="3"
                                      name="userDeclaration"> ${memberInfo.userDeclaration}</textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-offset-1 col-sm-2 control-label pull-left">
                            <span class="inline-block width120">
                                <spring:message code="annualIncome" text="年收入"></spring:message>
                            </span>
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control width300 pull-left" disabled="disabled" name="userEnroll" data-value="${memberInfo.userEnroll}">
                                <option value="50,000-100,000">50,000-100,000</option>
                                <option value="100,000-500,000">100,000-500,000</option>
                                <option value="500,000 Above">500,000 Above</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-offset-1 col-sm-2 control-label pull-left">
                            <span class="inline-block width120">
                                <spring:message code="marrayStatus" text="婚姻状态"></spring:message>
                            </span>
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control width300 pull-left" disabled="disabled" name="userMarryStatus" data-value="${memberInfo.userMarryStatus}">
                                <option value="single"><spring:message code="single" text="单身"></spring:message> </option>
                                <option value="married"><spring:message code="married" text="已婚"></spring:message> </option>
                                <option value="divorce"><spring:message code="divorce" text="离异"></spring:message> </option>
                                <option value="loving"><spring:message code="loving" text="恋爱"></spring:message> </option>
                            </select>
                        </div>
                    </div>
<%--                    <div class="row">
                        <div class="col-xs-8 col-md-8">
                            <button id="savingPersonal" class="btn btn-info" type="button" data-loading-text='<spring:message code="saving" text="保存中..."></spring:message>'>
                                <spring:message code="save" text="保存"></spring:message>
                            </button>
                        </div>
                    </div>--%>
                    <input type="hidden" name="userId" value="${memberInfo.userId}" id="userId2"/>
                </form>
            </div>
    <%--            &lt;%&ndash;心情&ndash;%&gt;
                <div class="tab-pane " id="panel-tabs2">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title" data-toggle="collapse" data-parent="#panel-839153" href="#panel-element-115285"><spring:message code="latestPhotos" text="最近照片"></spring:message></a>
                        </div>
                        <div id="panel-element-115111" class="panel-collapse in">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-6 col-md-3">
                                        <div class="thumbnail">
                                            <img src="/common/images/140x140.jpg" alt="140x140">
                                            <div class="caption">
                                                <h4>caption/文字</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <div class="thumbnail">
                                            <img src="/common/images/140x140.jpg" alt="140x140">
                                            <div class="caption">
                                                <h4>caption/文字</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <div class="thumbnail">
                                            <img src="/common/images/140x140.jpg" alt="140x140">
                                            <div class="caption">
                                                <h4>caption/文字</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-md-3">
                                        <div class="thumbnail">
                                            <img src="/common/images/140x140.jpg" alt="140x140">
                                            <div class="caption">
                                                <h4>caption/文字</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title" data-toggle="collapse" data-parent="#panel-839153" href="#panel-element-115285"><spring:message code="latestBlog" text="最新日志"></spring:message></a>
                        </div>
                        <div id="panel-element-115231" class="panel-collapse in">
                            <div class="panel-body">
                                日志标题是这里
                                <div style="font-size:12px;color:#aaa;margin-top:15px;padding-left:10px;">标签：今天天气真好&nbsp;&nbsp;&nbsp;权限：自己可见&nbsp;&nbsp;&nbsp;评论(0) | 阅读(0)</div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a class="panel-title" data-toggle="collapse" data-parent="#panel-839153" href="#panel-element-115285"><spring:message code="latestMessage" text="最新留言"></spring:message></a>
                        </div>
                        <div id="panel-element-115232" class="panel-collapse in">
                            <div class="panel-body">
                                留言内容在这里
                                <div style="font-size:12px;color:#aaa;margin-top:15px;padding-left:10px;">By：Mate&nbsp;&nbsp;&nbsp;Time:&nbsp;&nbsp;2016/06/26</div>
                            </div>
                        </div>
                    </div>
                </div>--%>
            <%--日志 start--%>
            <div class="tab-pane " id="panel-tabs3">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <div class="tabbable" id="tabs-295323">
                            <ul class="nav nav-tabs">
                                <li class="active" id="myLogTab">
                                    <a href="#panel-324017" data-toggle="tab"><spring:message code="blogList" text="日志列表"></spring:message></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <%--我的日志 start--%>
                        <div class="tab-pane active" id="panel-324017" style="height: 100%;">
                            <div id="myLogContentDiv">
                            </div>
                                <%--我的日志分页--%>
                            <ul id="myLogPagnationDiv"></ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="panel-tabs4">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" id="photoGroupTab" href="#myPhoto"><spring:message code="albumList" text="相册列表"/></a></li>
                </ul>
                <div class="tab-content">
                    <div id="myPhoto" class="tab-pane fade in active">
                        <div id="myPhotoGroupContentDiv">
                        </div>
                        <!--分页控件-->
                        <ul class="pagination" id="myPhotoGroupPaginationDIV">
                        </ul>
                    </div>
                </div>

                <%--创建相册分组弹出框 --%>
                <div class="modal fade" id="createMyPhotoGroupDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel"><spring:message code="createAlbum" text="新建相册"/></h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-md-10">
                                            <label for="photoGroupName" class="col-sm-2 control-label "><span class="inline-block width110">
                                    <spring:message code="albumName" text="相册名称"/>
                                </span></label>
                                <span class="inline-block width280" style="margin-left: 5px;">
                                    <input  class="form-control" id="photoGroupName" placeholder=<spring:message code="albumName" text="相册名称"/>>
                                </span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-md-10">
                                            <label for="photoGroupDescription" class="col-sm-2 control-label float-left"><span class="inline-block width110">
                                    <spring:message code="albumDescription" text="相册描述"/>
                                </span></label>
                                            <div class="float-left" style="margin-left: 10px;">
                                                <textarea rows="5" id="photoGroupDescription" class="width280"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-md-10">
                                            <label for="photoGroupTags" class="col-sm-2 control-label "><span class="inline-block width110">
                                    <spring:message code="albumTag" text="相册标签"/>
                                </span></label>
                                <span class="inline-block width280" style="margin-left: 5px;">
                                    <input  class="form-control" id="photoGroupTags" placeholder=<spring:message code="albumTag" text="相册标签"/>>
                                </span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-md-10">
                                            <label for="privilege" class="col-sm-2 control-label"><span class="inline-block width110">
                                     <spring:message code="logPrivilege" text="权 限"/>
                                 </span></label>
                                 <span class="inline-block width280" style="margin-left: 5px;">
                                 <span class="inline-block text-span">
                                     <input type="radio" id="privilege" name="privilege" style="margin-right: 5px;margin-top: 3px;" value="2" checked="checked">
                                 </span><span class="inline-block text-span"><spring:message code="privilegeAll" text="全部人可见"/></span>
                                 <span class="inline-block text-span margin-left-10px">
                                     <input type="radio" id="privilege2" name="privilege" style="margin-right: 5px;margin-top: 3px;" value="0">
                                 </span><span class="inline-block text-span"><spring:message code="privilegeMe" text="仅自己可见"/></span>
                                </span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" id="closeCreatePhotoGroupModelBtn" class="btn btn-default" data-dismiss="modal"><spring:message code="close" text="关闭"/></button>
                                <button type="button" id="savePhotoGroupBtn" name="savePhotoGroupBtn" class="btn btn-primary"><spring:message code="save" text="保存"/></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="panel-tabs5">
                <p>
                    分享暂时不做
                </p>
            </div>
            <div class="tab-pane" id="panel-tabs6">
                <p>
                   群组
                </p>
            </div>
            <div class="tab-pane" id="panel-tabs7">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        ${memberInfo.userName} <spring:message code="deMessageBoard" text="的留言板"/>
                        <div style="margin-left:80%;">
                            <button type="button" id="createMessage" class="btn btn-info" data-toggle="modal" data-backdrop="" autocomplete="off" data-target="#createMessageDialog">
                                <spring:message code="leavingAMessage" text="我要留言"/>
                            </button>
                        </div>
                    </div>
                    <ul class="list-group" id="myMessageContentDiv">
                    </ul>
                    <%--我的留言分页--%>
                    <ul id="myMessagePagnationDiv"></ul>
                </div>
            </div>
        </div>
    </div>
</div>
    <%--创建日志弹出框 --%>
    <div class="modal fade" id="createMyLogDialog" tabindex="-1" role="dialog" aria-labelledby="myLogDialogLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myLogDialogLabel"><spring:message code="newLog" text="新建日志"/></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="blogForm">
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                <label for="logTitle" class="col-sm-2 control-label "><span class="inline-block width110">
                                    <spring:message code="logTitle" text="日志标题"/>
                                </span></label>
                                <span class="inline-block width280" style="margin-left: 5px;">
                                    <input  class="form-control" id="logTitle" name="logTitle" placeholder="<spring:message code="logTitle" text="日志标题"/>">
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10 float-left">
                            <label for="logType" class="col-sm-2 control-label"><span class="inline-block width110">
                                <spring:message code="logType" text="日志分类"/>
                            </span></label>
                            <span class="inline-block width280" style="margin-left: 5px;">
                                <select id="logType" class="form-control">
                                </select>
                            </span>
                            </div>
                            <div style="height: 34px;line-height: 34px;" class="pull-left">
                                <a href="javascript:void(0)" id="addTypeHref" class="center"><spring:message code="addLogType" text="添加分类"/></a>
                            </div>
                            <div class="width250 float-left displayNone" id="addTypeDiv">
                                <input class="col-md-2 form-control width110 float-left" id="addTypeInput" placeholder="<spring:message code="typeName" text="分类名称"/>">
                                <button type="button" class="btn btn-primary float-left margin-left-5px" id="addTypeSaveBtn">
                                    <spring:message code="save" text="保存"/>
                                </button>
                                <button type="button" class="btn btn-default float-left margin-left-5px" id="addTypeCloseBtn">
                                    <spring:message code="cancel" text="取消"/>
                                </button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                <label for="logTags" class="col-sm-2 control-label "><span class="inline-block width110">
                                    <spring:message code="logTags" text="日志标签"/>
                                </span></label>
                                <span class="inline-block width280" style="margin-left: 5px;">
                                    <input  class="form-control" id="logTags" placeholder="<spring:message code="logTags" text="日志标签"/>">
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                 <label for="blogPrivilege" class="col-sm-2 control-label"><span class="inline-block width110">
                                     <spring:message code="logPrivilege" text="权 限"/>
                                 </span></label>
                                 <span class="inline-block width280" style="margin-left: 5px;">
                                 <span class="inline-block text-span"><input type="radio" id="blogPrivilege" name="blogPrivilege" checked="checked" value="0" style="margin-right: 5px;margin-top: 3px;"></span><span class="inline-block text-span">全部人可见</span>
                                 <span class="inline-block text-span margin-left-10px"><input type="radio" id="blogPrivilege2" name="blogPrivilege" value="1" style="margin-right: 5px;margin-top: 3px;"></span><span class="inline-block text-span">仅自己可见</span>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                <label for="logContent" class="col-sm-2 control-label float-left"><span class="inline-block width110">
                                    <spring:message code="logContent" text="日志内容"/>
                                </span></label>
                                <div class="float-left" style="margin-left: 5px;">
                                    <textarea rows="5" id="logContent" name="logContent" class="width280"></textarea>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeCreateBlogModelBtn" class="btn btn-default" data-dismiss="modal"><spring:message code="close" text="关闭"/></button>
                    <button type="button" id="saveMyBlogBtn" name="saveMyBlogBtn" class="btn btn-primary"><spring:message code="save" text="保存"/></button>
                </div>
            </div>
        </div>
    </div>

    <%--留言弹出框 --%>
    <div class="modal fade" id="createMessageDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="messageModalLabel"><spring:message code="leavingAMessage" text="我要留言"/></h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-md-10">
                                <label for="logContent" class="col-sm-2 control-label float-left"><span class="inline-block width110">
                                    <spring:message code="messageContent" text="留言内容"/>
                                </span></label>
                                <div class="float-left" style="margin-left: 5px;">
                                    <textarea rows="5" id="messageContent" class="width280"></textarea>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeCreateMessageModelBtn" class="btn btn-default" data-dismiss="modal"><spring:message code="close" text="关闭"/></button>
                    <button type="button" id="saveMessageBtn" name="saveMyMessageBtn" class="btn btn-primary"><spring:message code="save" text="保存"/></button>
                </div>
            </div>
        </div>
    </div>
<%--日志评论--%>
    <div class="modal fade" id="commentFriendBlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">评论</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal margin-left-20px " id="commentForm">
                        <div class="form-group">
                           <label for="logContent" class="control-label">评论内容</label>
                           <textarea rows="5" name="commentContent" id="commentContent" class="form-control" style="width: 90%;"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" id="closeCommentBtn" class="btn btn-default" data-dismiss="modal"><spring:message code="close" text="关闭"/></button>
                    <button type="button" id="saveCommentBtn" name="saveMyBlogBtn" data-loading-text="<spring:message code="saving" text="保存中..."/>"  class="btn btn-primary"><spring:message code="save" text="保存"/></button>
                </div>
            </div>
        </div>
    </div>
    <%--更换头像--%>
    <div class="modal fade" id="changeHeadPhoto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="changeHeadPhotoLabel">更换头像</h4>
                </div>
                <div class="modal-body">
                   <form class="form-horizontal" id="headPhotoForm" style="height: 370px;">
                       <div class="form-group" style="margin:5px 15px;">
                           <input type="file" class="file" id="changeHeadPhotoInput" multiple name="headPhoto">
                          <%-- <div id="errorBlock" class="help-block"></div>--%>
                       </div>
                   </form>
                </div>
                <div class="modal-footer" style="display: none;">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="closeHeadPhotoBtn">关闭</button>
                    <button type="button" class="btn btn-primary" data-loading-text="保存中..." id="saveHeadPhotoBtn">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--用户id--%>
<input type="hidden" id="userId" name="userId" data-name="${userInfo.userName}" data-coin="${userInfo.userCoin}" value="${userInfo.userId}">
</body>
</html>
<%--更换头像JS--%>
<script type="text/javascript">
  $(function () {
      //加载头像失败 使用默认的图片
      $("#headPhoto").error(function(){
          $(this).attr("src",path+"/common/images/140x140.jpg");
      });

      $("#changeHeadPhotoInput").fileinput({
          "uploadUrl": path + "/userInfo/changeHeadPhoto",
          'showPreview': true,
          "allowedFileTypes": ['image'],
          'allowedFileExtensions': ['jpg', 'png', 'gif'],
          /*'elErrorContainer': '#errorBlock',*/
          "maxFileCount": 1,
          "maxFileSize": 3 * 1024,//上传限制3M
          uploadExtraData: function () {
              return {
                  "userId": $("#userId").val()
              }
          }
      });
      $('#changeHeadPhotoInput').on('fileuploaded', function (event, data, previewId, index) {
          $("#changeHeadPhotoInput").fileinput("clear");
          $.confirm({
              title: "",
              content: uploadMsg.saveSuccess,
              autoClose: 'confirm|1000',
              cancelButton: false,
              confirm:function () {
                  $("#closeHeadPhotoBtn").click();
              }
          });
          $("#headPhoto").attr("src",path+data.response.imagePath+"?"+new Date().getTime());
      });
  })
</script>

