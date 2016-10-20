$(function () {
    init();
});

function init(){
    initIndexUserList();
}

function initIndexUserList() {
    getUserListExcludeMeData(1);//取到首页的列表
}

/**
 * 获取首页的用户列表数据
 * @param pageNo 分页
 */
function getUserListExcludeMeData(pageNo){
    $("#userListContentDiv").html("");//清空数据
    var searchUserName = $("#searchUserName", window.top.document).val();
    if(pageNo){
        $.ajax({
            url:path+"/userInfo/queryUserListExcludeMe",
            type:"POST",
            data:{
                "currentPage":pageNo,
                "pageSize":12,
                "searchUserName":searchUserName
            },
            dataType:"json",
            success:function(data){
                if(data.dataList.length < 1) {
                    $("#userListPaginationDIV").html("");//清空页码
                    return; //如果没有查询到数据，就不分页
                }
                if(pageNo==1){//如果是第一页，则初始化分页
                    initUserListPagination(data);
                }
                initUserListData(data);
            }
        })
    }
}

/**
 * 初始化分页条
 * @param pageData
 */
function initUserListPagination(pageData) {
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
                getUserListExcludeMeData(newPage);//重新拉取数据
            }
        }
    }
    $("#userListPaginationDIV").bootstrapPaginator(options);
}

/**
 * 初始化用户列表的数据
 * @param data
 */
function initUserListData(data) {
    var userListDivTemplete = '<div class="col-xs-3 col-md-3">'+
        '<div class="imageDiv">'+
        '<img alt="140x140" src="${basePath}" class="img-thumbnail" style="width: 140px;height: 140px;"/>'+
        '<p>'+
        '${userNameVal} <a class="btn" href="javascript:void(0)" id="${userId}_addBtn">addFriendBtn</a>'+
        '</p>'+
        '</div>'+
        '</div>';
    var list = data.dataList;
    for (var index in list) {
        var _data = list[index];
        var photoUrl=_data.headPhotoUrl;
        var vipIcon = '<img src="http://images6.baihe.com/icon/icon_01.gif" alt="">';
        var _replace = userListDivTemplete.replace("${basePath}", photoUrl?photoUrl:path+"/common/images/people140x140.jpg")

            .replace("${userId}", _data.userId)
            .replace(/addFriendBtn/g, indexMsg.addFriendBtn);
        if(_data.vipTypeCode == "1" || _data.vipTypeCode == "2") {//是vip就带上vip的图标
            _replace = _replace.replace("${userNameVal}", _data.userName + vipIcon);
        }else{
            _replace = _replace.replace("${userNameVal}", _data.userName);
        }
        $("#userListContentDiv").append(_replace);
        addAddBtnClickListener("#"+_data.userId+"_addBtn", _data.userId);
    }
    //添加头像加载失败的监听
    addImgLoadedFailedListener();
}
function addImgLoadedFailedListener() {
    $("#userListContentDiv").find("img").error(function () {
        $(this).attr("src",path+"/common/images/people140x140.jpg");
    })
}
function addAddBtnClickListener(addUserBtnId, friendId){
    $(addUserBtnId).click(function () {
        $.confirm({
            container:window.top.document.body,
            content:indexMsg.confirmAddFriend,
            confirm:function () {
                $.ajax({
                    url:path+"/userFriend/applyFriend",
                    type:"POST",
                    data:{
                        "userId":friendId
                    },
                    dataType:"json",
                    success:function(data){
                        if(data.successful){
                            $.confirm({
                                container:window.top.document.body,
                                title:"",
                                content:data.msg,
                                cancelButton:false,
                                autoClose: 'confirm|1000'
                            });
                        }
                    }
                })
            },
            cancel:function () {
            }
        });
    })

}