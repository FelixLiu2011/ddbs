/**
 * 我的空间 业务JS
 */
var memberParm = "";
$(function () {
    var memberId = $("#memberId", window.top.document).val();
    if(memberId) {
        memberParm = "?memberid=" + memberId
    }
    //创建日志
    /*$("#createMyLog").modal("show");*/

    //我的头像鼠标事件
    createHaedPhotoLisenter();
    //保存我的头像的监听事件
    createSaveHeadPhotoListener();

    $("#mySpaceTab").click(function () {
        getLatestContent();
    });

    init();
});

function init(){
    getLatestContent();
}
/**
 * 保存头像的监听事件
 */
function createSaveHeadPhotoListener() {
    $("#saveHeadPhotoBtn").click(function () {
        var btn=$(this).button("loading");
        $btn.button('reset');
    });
}
/**
 * 创建"我的头像" 一系列的监听事件
 */
function createHaedPhotoLisenter() {
    $("#right").mouseenter(function () {
        var div=$(this);
        var position=div.find("#headPhoto").position();
        $(this).find("#txtDiv_0").css({
            "left":position.left,
            "top":position.top
        })
    }).mouseleave(function () {
        $(this).find("#txtDiv_0").css({
            "left":"-1000px"
        })
    });

  /*  $("#right").find("#txtDivSpan_0").click(function () {
    });*/
}

function getLatestContent() {
    getLatestPhoto();
    getLatestBlog();
    getLatestMessage();
}

function getLatestPhoto() {
    var url=path+"/userPhoto/getLatestPhoto" + memberParm;
    $.ajax({
        url:url,
        type:"POST",
        data:{},
        dataType:"json",
        success:function(data){
            initLatestPhoto(data);
        }
    })
    
}

function initLatestPhoto(data) {
    $("#latestPhotoContentDiv").empty();
    var latesPhotoDivTemplete='<div class="col-xs-3 col-md-3 width175">'+
        '<div class="thumbnail">'+
        '<img src="basePathphotoUrl" alt="140x140" class="width150 height150">'+
        '<div class="caption">'+
        '<h5 class="white-space-nowrap">photoGroupName</h5>'+
        '<h5>createdTime</h5>'+
        '</div>'+
        '</div>'+
        '</div>';
    var list=data.dataList;
    for(var index in list){
        var _data=list[index];
        var _replace=latesPhotoDivTemplete.replace(/photoUrl/g,_data.photoUrl).replace(/photoGroupName/g,_data.groupName)
            .replace(/createdTime/g, _data.createdTime.substring(0,10))
            .replace(/basePath/g, path);
        $("#latestPhotoContentDiv").append(_replace);
    }
}

function getLatestBlog() {
    var url=path+"/userBlog/queryRecordsByPage" + memberParm;
    $.ajax({
        url:url,
        type:"POST",
        data:{
            currentPage:1,
            pageSize:2
        },
        dataType:"json",
        success:function(data){
            initLatestBlog(data);
        }
    })

}

function initLatestBlog(data) {
    $("#latestBlogContentDiv").empty();
    var latesBlogDivTemplete='<div class="panel-body">'+
        '${blogTitle}'+
        '<div style="font-size:12px;color:#aaa;margin-top:15px;padding-left:10px;">标签：${blogTag}&nbsp;&nbsp;&nbsp;权限：${blogPrivilege}&nbsp;&nbsp;&nbsp;评论(<span id="friendCommentCount_${blogId}">0</span>)</div>'+
        '</div>';
    var list=data.dataList;
    for(var index in list){
        var _data=list[index];
        var _replace=latesBlogDivTemplete.replace("${blogTitle}",_data.blogTitle).replace("${blogTag}",_data.blogTags).replace(/\$\{blogId\}/g,_data.ubId);
        if(_data.blogPrivilege == "0") {
            _replace = _replace.replace("${blogPrivilege}",blogContent.public);
        }else if(_data.blogPrivilege == "1") {
            _replace = _replace.replace("${blogPrivilege}",blogContent.private);
        }
        fetchCommentCount(_data.ubId);//获取评论数

        $("#latestBlogContentDiv").append(_replace);
    }
}

function getLatestMessage() {
    var url=path+"/userMessage/queryRecordsByPage" + memberParm;
    $.ajax({
        url:url,
        type:"POST",
        data:{
            currentPage:1,
            pageSize:2
        },
        dataType:"json",
        success:function(data){
            initLatestMessage(data);
        }
    })

}

function initLatestMessage(data) {
    $("#latestMessageContentDiv").empty();
    var latesMessageDivTemplete='<div class="panel-body">'+
        '${messageContent}'+
        '<div style="font-size:12px;color:#aaa;margin-top:15px;padding-left:10px;">By：${messageByName}&nbsp;&nbsp;&nbsp;Time:&nbsp;&nbsp;createdTime</div>'+
        '</div>';
    var list=data.dataList;
    for(var index in list){
        var _data=list[index];
        var _replace=latesMessageDivTemplete.replace("${messageContent}",_data.messageContent).replace("${messageByName}",_data.messageByName)
            .replace(/createdTime/g, _data.createdTime.substring(0,10));
        $("#latestMessageContentDiv").append(_replace);
    }
}
