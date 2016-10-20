var CONST_USE_PROPERTY_BLOG = "2";//使用属性(1是好友分组，2是相册分组，3是日志分组)
var userBlogGroupData;//日志分组
var clickedFriendBlogCommentId=null;//保存点击"评论"的id(朋友的日志 )
var saveCommentBtnOldText="";//保存评论按钮的文本
var memberParm = "";//是否访问其他人的空间
$(function () {
    //拼接URL
    var memberId = $("#memberId", window.top.document).val();
    if(memberId) {
        memberParm = "?memberid=" + memberId
    }

    //当添加或者编辑Group的Model框显示的时候，传数据到Model框里面去
    $('#createMyLogDialog').on('show.bs.modal', function (event) {
        loadUserBlogGroup();
    });
    // 当关闭框的时候重置
    $('#createMyLogDialog').on('hide.bs.modal', function (event) {
        $("#logTitle").val("");
        $("#logTags").val("");
        $("#logContent").val("");;
        $("#blogForm").data("bootstrapValidator").resetForm(true);//还原状态
    });

    //添加分类
    $("#addTypeHref").click(function () {
        $(this).hide();
        $("#addTypeDiv").show();
    });

    //取消---日志分类
    $("#addTypeCloseBtn").click(function () {
        $("#addTypeDiv").hide();
        $("#addTypeHref").show();
    });
    //保存----日志分类
    $("#addTypeSaveBtn").click(saveLogType);

    //点击"我的日志 "tab页
    $("#myLogTab").click(function(){
        getMyLogData(1);
        loadUserBlogGroupData();
    });

    //点击'日志'tab页
    $("#logTab").click(function () {
        //点击'日志'tab页，默认选中‘我的日志’tab页，
        //加载 我的日志 数据
        getMyLogData(1);
        //loadUserBlogGroupData();
    });

    //点击朋友的日志tab页
    $("#friendsLogTab").click(function(){
        getMyFriendsLogData(1);
    });

    //保存我的日志按钮点击事件
    $("#saveMyBlogBtn").click(saveMyLog);
    
    //创建 日志 的Validator  目前存在换页面的时候提示该方法未注册，先注释掉
    createBlogValidator();

    //创建 日志 评论的Validator  目前存在换页面的时候提示该方法未注册，先注释掉
    createCommentValidator();

    saveCommentBtnOldText=$("#saveCommentBtn").text();

    //点击评论弹出框的"保存"按钮
    $("#saveCommentBtn").click(saveComment);

    //评论框弹出的时候
    $('#commentFriendBlog').on('hide.bs.modal', function (event) {
        $("#commentContent").val("");//清空内容
        $("#commentForm").data("bootstrapValidator").resetForm(true);//还原状态
        //重置保存按钮中的状态
        $("#saveCommentBtn").text(saveCommentBtnOldText).removeAttr("disabled");
    });

    initBlogIndex();
});

/**
 * 当加载blog的JS的时候初始化
 */
function initBlogIndex() {
    $("#myLogTab").click();
}

/**
 * 创建日志验证器
 */
function createBlogValidator() {
    $('#blogForm').bootstrapValidator({
        feedbackIcons: {
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            logContent: {
                validators: {
                    notEmpty: true
                }
            },
            logTitle: {
                validators: {
                    notEmpty: true
                }
            }
        }
    });
}

/**
 * 创建验证器(评论表单)
 */
function createCommentValidator() {
    $("#commentForm").bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            commentContent: {
                validators: {
                    notEmpty: true
                }
            }
        }
    });
}

/**
 * 保存日志
 */
function saveLogType() {
    var groupName = $("#addTypeInput").val();
    $.ajax({
        url:path+"/userGroup/save",
        type:"POST",
        data:{
            "groupName":groupName,
            "useProperty":CONST_USE_PROPERTY_BLOG
        },
        dataType:"json",
        success:function(){
            loadUserBlogGroupData(true);
            alert("Saving success!");
        }
    })
}
/**
 * 保存评论
 */
function saveComment() {
    var bv=$("#commentForm").data("bootstrapValidator").validate();
    if (bv.isValid()) {//必填
        if(clickedFriendBlogCommentId){
            var oldText=$(this).text();
            var btn=$(this);
            btn.text(btn.data("loading-text")).attr("disabled","disabled");
            $.ajax({
                url:path+"/blogComment/saveFriendComment",
                data:{
                    "comment":$("#commentContent").val(),
                    "blogId":clickedFriendBlogCommentId,
                },
                type:"POST",
                dataType:"json",
                success:function (data) {
                    if(data){
                        if(data.msg=="success"){
                            $.confirm({
                                container:window.top.document.body,
                                title:"",
                                content:mySpaceContent.saveSuccess,
                                autoClose: 'confirm|1000',
                                cancelButton:false,
                                container:"#commentFriendBlog",
                                confirm:function(){
                                    $("#closeCommentBtn").click();//关闭评论区
                                }
                            });
                            //   var jconfirmBoxOldMarginTop=$(".jconfirm-box").css("margin-top");
                            //  $(".jconfirm-box").css({"margin-top":"100px!important"});
                            //更新 评论数
                            var oldCount=parseInt($("#friendCommentCount_"+clickedFriendBlogCommentId).text());
                            $("#friendCommentCount_"+clickedFriendBlogCommentId).text(oldCount+1);
                        }else{
                            $.confirm({
                                container:window.top.document.body,
                                title:"",
                                content:data.msg,
                                cancelButton:false
                            });
                        }
                        btn.text(oldText).removeAttr("disabled");
                    }
                }
            });
        }
    }
}

/**
 * 保存我的日志
 */
function saveMyLog(){
    var logTitle = $("#logTitle").val();
    var logType = $("#logType").children('option:selected').attr("data-groupid");
    var logTags = $("#logTags").val();
    var logPrivilege = $('input[name="blogPrivilege"]:checked ').val();
    var logContent = $("#logContent").val();;
    var bv=$("#blogForm").data("bootstrapValidator").validate();
    if(bv.isValid()) {
        $.ajax({
            url:path+"/userBlog/save",
            type:"POST",
            data:{
                "groupId":logType,
                "blogTitle":logTitle,
                "blogContent":logContent,
                "blogPrivilege":logPrivilege,
                "blogTags":logTags
            },
            dataType:"json",
            success:function(data){
                $("#closeCreateBlogModelBtn").click();
                $.confirm({
                    container:window.top.document.body,
                    title:"",
                    content:data.msg,
                    autoClose: 'confirm|1000',
                    cancelButton:false
                });
                $("#myLogTab").click();
            }
        })
    }
}

//加载日志分组option
function loadUserBlogGroup() {
    $("#logType").empty();//清空日志分组
    for(var obj in userBlogGroupData) {
        var option = "<option data-groupId="+obj+">" + userBlogGroupData[obj].groupName + "</option>";
        $("#logType").append(option);//添加日志分组option
    }
}

//加载用户日志分组到JS中
function loadUserBlogGroupData(isReloadSelectOption) {
    $.ajax({
        url:path+"/userGroup/queryRecordsByPage",
        type:"POST",
        data:{
            "currentPage":1,
            "pageSize":1000,
            "useProperty":CONST_USE_PROPERTY_BLOG
        },
        dataType:"json",
        success:function(data){
            var list = data.dataList;
            userBlogGroupData = [];
            for (var index in list) {
                var _data = list[index];
                userBlogGroupData[_data.groupId] = {
                    "groupId":_data.groupId,
                    "groupName":_data.groupName
                };
            }
            if(isReloadSelectOption) {//如果要重新加载Select option
                loadUserBlogGroup();
            }
        }
    })
}

/**
 * 获取当前页的数据
 * @param pageNo 分页
 */
function getMyLogData(pageNo){
    $("#myLogContentDiv").html("");//清空数据
    var loader=SLLib.loader({
        ele:"#panel-324017",
        spinner:"spinner2",
        height:"500px"
    });
    loader.start();
    if(pageNo){
        $.ajax({
            url:path+"/userBlog/queryRecordsByPage"+memberParm,
            type:"POST",
            data:{
                "currentPage":pageNo,
                "pageSize":4
            },
            dataType:"json",
            success:function(data){
                loader.stop();
                if(data.dataList && data.dataList.length > 0) {
                    if(pageNo==1){//如果是第一页，则初始化分页
                        initMyLogPagnation(data);
                    }
                    initMyLogData(data);
                }else{
                    $("#myLogPagnationDiv").empty();
                }

            }
        })
    }
}
/**
 * 初始化分页条
 * @param pageData
 */
function initMyLogPagnation(pageData) {
    var pageIndex=pageData.currentPage;
    var totalPages=pageData.totalPages;
    var options = {
        alignment:"center",//居中显示
        currentPage: pageIndex,//当前页数
        totalPages: totalPages,//总页数 注意不是总条数
        bootstrapMajorVersion:3,
        onPageChanged: function(event,oldPage,newPage){
            if (oldPage==newPage) {
                return ;
            } else {
                getMyLogData(newPage);//重新拉取数据
            }
        }
    }
    $("#myLogPagnationDiv").bootstrapPaginator(options);
}
/**
 * 初始化我的日志的数据
 * @param data
 */
function initMyLogData(data){
    var myLogDivTemplete=' <div class="panel panel-default">'+
        ' <div class="panel-heading">'+
        '  <a class="panel-title" data-toggle="collapse" data-parent="#panel-839153" href="#panel-element-115285">${myLogTitle}</a>'+
        '  </div>'+
        '<div id="panel-element-113" class="panel-collapse in">'+
        '<div class="panel-body">'+
        "${myLogContent}"+
        '<div style="font-size:12px;color:#aaa;margin-top:15px;padding-left:10px;">'+blogContent.tags+'：${myLogTags}&nbsp;&nbsp;&nbsp;' +
        '<a href="javascript:void(0);" id="friendCommentedA_${blogId}">'+blogContent.comments+'(<span id="friendCommentCount_${blogId}">0</span>)</a> | '+blogContent.reads+'(0)'+
        '<span class="pull-right">'+
        '<a href="javascript:void(0);" data-target="#commentFriendBlog" data-toggle="modal" data-backdrop="" data-blog-id="${blogId}" id="commentFriendA_${blogId}">'+blogContent.comment+'</a>'+
        '</span>'+
        '</div>'+
        '</div>'+
        '</div>'+
        '</div>';
    var list=data.dataList;
    for(var index in list) {
        var _data = list[index];
        var _replace = myLogDivTemplete.replace("${myLogTitle}", _data.blogTitle).replace("${myLogContent}", _data.blogContent)
            .replace("${myLogTags}", _data.blogTags).replace(/\$\{blogId\}/g, _data.ubId);
        $("#myLogContentDiv").append(_replace);

        addCommentListener("#commentFriendA_" + _data.ubId);//添加监听事件
        addCommentDetailListener("#friendCommentedA_" + _data.ubId, _data.ubId);//添加 "评论" 事件 跳转到详情
        fetchCommentCount(_data.ubId);//获取评论数
    }
}

/**
 * 获取当前页的数据
 * @param pageNo 分页
 */
function getMyFriendsLogData(pageNo){
    $("#myFriendsLogContentDiv").html("");//清空数据
    var loader=SLLib.loader({
        ele:"#myFriendsLogContentDiv",
        spinner:"spinner2",
        height:"500px"
    });
    loader.start();
    if(pageNo){
        $.ajax({
            url:path+"/userFriend/queryFriendBlogByPage",
            type:"POST",
            data:{
                "currentPage":pageNo,
                "pageSize":4
            },
            dataType:"json",
            success:function(data){
                loader.stop();
                if(data.dataList && data.dataList.length > 0) {
                    if(pageNo==1){//如果是第一页，则初始化分页
                        initMyFriendsLogPagnation(data);
                    }
                    initMyFriendsLogData(data);
                }else{
                    $("#myFriendsLogPagnationDiv").empty();
                }
            }
        })
    }
}
/**
 * 初始化分页条
 * @param pageData
 */
function initMyFriendsLogPagnation(pageData) {
    var pageIndex=pageData.currentPage;
    var totalPages=pageData.totalPages;
    var options = {
        alignment:"center",//居中显示
        currentPage: pageIndex,//当前页数
        totalPages: totalPages,//总页数 注意不是总条数
        bootstrapMajorVersion:3,
        onPageChanged: function(event,oldPage,newPage){
            if (oldPage==newPage) {
                return ;
            } else {
                getMyFriendsLogData(newPage);//重新拉取数据
            }
        }
    }
    $("#myFriendsLogPagnationDiv").bootstrapPaginator(options);
}
/**
 * 初始化我的日志的数据
 * @param data
 */
function initMyFriendsLogData(data){
    var myFriendsLogDivTemplete=' <div class="panel panel-default">'+
        ' <div class="panel-heading">'+
        '  <a class="panel-title" data-toggle="collapse" data-parent="#panel-839153" href="#panel-element-115285">${myLogTitle}</a>'+
        '  </div>'+
        '<div id="panel-element-113" class="panel-collapse in">'+
        '<div class="panel-body">'+
        "${myLogContent}"+
        '<div style="font-size:12px;color:#aaa;margin-top:15px;padding-left:10px;">'+blogContent.tags+'：${myLogTags}&nbsp;&nbsp;&nbsp;' +
        '<a href="javascript:void(0);" id="friendCommentedA_${blogId}">'+blogContent.comments+'(<span id="friendCommentCount_${blogId}">0</span>)</a> | '+blogContent.reads+'(0)'+
        '<span class="pull-right">'+
        '<a href="javascript:void(0);" data-target="#commentFriendBlog" data-toggle="modal" data-backdrop="" data-blog-id="${blogId}" id="commentFriendA_${blogId}">'+blogContent.comment+'</a>'+
        '</span>'+
        '</div>'+
        '</div>'+
        '</div>'+
        '</div>';
    var list=data.dataList;
    for(var index in list){
        var _data=list[index];
        var _replace=myFriendsLogDivTemplete.replace("${myLogTitle}",_data.blogTitle).replace("${myLogContent}",_data.blogContent)
            .replace("${myLogTags}",_data.blogTags).replace(/\$\{blogId\}/g,_data.ubId);
        $("#myFriendsLogContentDiv").append(_replace);

        addCommentListener("#commentFriendA_"+_data.ubId);//添加监听事件
        addCommentDetailListener("#friendCommentedA_"+_data.ubId,_data.ubId);//添加 "评论" 事件 跳转到详情
        fetchCommentCount(_data.ubId);//获取评论数
    }
}

/**
 * 点击 "评论(0)"跳转到 详情页
 * @param commentDetailId
 */
function addCommentDetailListener(commentDetailId,blogId) {
    if (commentDetailId){
        $(commentDetailId).click(function () {
                $("#content_iframe",window.top.document)[0].contentWindow.location.href=path+"/blogComment/gotoCommentDetail?blogId="+blogId;
            }
        );
    }
}

/**
 * 为朋友的日志 "评论" 添加监听事件
 * @param commentId
 */
function  addCommentListener(commentId) {
    $(commentId).click(
        function () {
            var blogId=$(this).data("blog-id");
            clickedFriendBlogCommentId=blogId;
        }
    );
}

/**
 * 根据 blogId来获取评论总数
 * @param blogId
 */
function fetchCommentCount(blogId) {
    if (!blogId) {
        return;
    }
    $.ajax({
        url: path + "/blogComment/fetchCommentCountById",
        data: {
            "blogId": blogId
        },
        dataType: "json",
        type: "POST",
        success: function (data) {
            if (data && data.msg) {
                $("#friendCommentCount_" + blogId).text(data.msg);
            }
        }
    })
}
