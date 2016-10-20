/**
 * 评论详情页
 */

$(function () {
   getComment(1); 
});

function getComment(pageNo) {
    var blogId=$("#blogId").val();
    if (blogId){
        $.ajax({
            url:path+"/blogComment/fetchAllCommentByPage",
            data:{
                "currentPage":pageNo,
                "pageSize":4,
                "blogId":blogId
            },
            dataType:"json",
            type:"POST",
            success:function (data) {
                if(pageNo==1){//如果是第一页，则初始化分页
                    initCommentDetailPagnation(data);
                }
                initCommentDetail(data);
            }
        })
    }
}

/**
 * 初始化分页条
 * @param pageData
 */
function initCommentDetailPagnation(pageData) {
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
                getComment(newPage);//重新拉取数据
            }
        }
    }
    $("#commentPagnationDiv").bootstrapPaginator(options);
}
/**
 * 初始化我的日志的数据
 * @param data
 */
function initCommentDetail(data){
    var templete = '<div class="row">' +
        '<div class="panel panel-default">' +
        ' <div class="panel-body">' +
        '     ${commentContent}' +
        '<div style="font-size:12px;color:#aaa;margin-top:15px;padding-left:10px;">' +
        blogCommentContent.commentUser+':${commentUser} '+blogCommentContent.commentDate+':${commentTime}' +
        '</div>' +
        ' </div>' +
        ' </div>' +
        ' </div>';
    for(var index in data.dataList){
        var _object=data.dataList[index];
        var _replacer=templete.replace("${commentContent}",_object.commentContent).replace("${commentTime}",_object.commentTime)
            .replace("${commentUser}",_object.userInfo.userName);
        $("#commentContentDiv").append(_replacer);
    }
}