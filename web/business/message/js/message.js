/**
 * Created by Administrator on 2016/8/17.
 */
var memberParm = "";//是否访问其他人的空间
$(function () {
    //拼接URL
    var memberId = $("#memberId", window.top.document).val();
    if(memberId) {
        memberParm = "?memberid=" + memberId
    }
    $("#messageTab").click(function () {
        getMyMessageData(1);
    });

    $("#saveMessageBtn").click(saveMessage);
});

/**
 * 保存留言
 */
function saveMessage() {
    var messageContent = $("#messageContent").val();
    if(messageContent == "") {
        alert(blogContent.messageContentRequired);
        return;
    }
    $.ajax({
        url:path+"/userMessage/save" + memberParm,
        type:"POST",
        data:{
            "messageContent":messageContent
        },
        dataType:"json",
        success:function(){
            $("#closeCreateMessageModelBtn").click();
            $("#messageTab").click();
            $.confirm({
                title:"",
                content: "success",
                autoClose: 'confirm|1000',
                cancelButton:false
            })
        }
    })
}
/**
 * 获取当前留言页的数据
 * @param pageNo 分页
 */
function getMyMessageData(pageNo){
    $("#myMessageContentDiv").html("");//清空数据
    var loader=SLLib.loader({
        ele:"#panel-324017",
        spinner:"spinner2",
        height:"500px"
    });
    loader.start();
    if(pageNo){
        $.ajax({
            url:path+"/userMessage/queryRecordsByPage" + memberParm,
            type:"POST",
            data:{
                "currentPage":pageNo,
                "pageSize":4,
                "userId":""
            },
            dataType:"json",
            success:function(data){
                loader.stop();

                if(pageNo==1){//如果是第一页，则初始化分页
                    initMyMessagePagnation(data);
                }
                initMyMessageData(data);
            }
        })
    }
}
/**
 * 初始化分页条
 * @param pageData
 */
function initMyMessagePagnation(pageData) {
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
                getMyMessageData(newPage);//重新拉取数据
            }
        }
    }
    $("#myMessagePagnationDiv").bootstrapPaginator(options);
}
/**
 * 初始化我的留言的数据
 * @param data
 */
function initMyMessageData(data){
    var myMessageDivTemplete='<li class="list-group-item">'+
        '<div><a href="javascript:void(0)">${messageByName}</a><div style="font-size:12px;color:#aaa;float: right">'+messageContent.messageDate+'：${created_time}</div></div>'+
        '<div style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;width:98%;font-size: 15px">${messageContent}</div>'+
        '</li>';
    var list=data.dataList;
    for(var index in list){
        var _data=list[index];
        var _replace=myMessageDivTemplete.replace("${created_time}",_data.createdTime).replace("${messageContent}",_data.messageContent).replace("${messageByName}", _data.messageByName);
        $("#myMessageContentDiv").append(_replace);
    }
}
