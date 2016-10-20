
$(function () {
    //导航条部分操作
    $("#friendsNavigation").click(function () {
        $("#myFriend").click();
    });
    $("#levelVipNavigation").click(function () {
        $("#levelVip").click();
    });
    $("#payCenterNavigation").click(function () {
        $("#payCenter").click();
    });
    $("#giftNavigation").click(function () {
        $("#gift").click();
    });
    //点击左侧导航"相册"
    $("#myPhoto").click(function(){
        $("#content_iframe").attr("src",path+"/userPhoto/gotoIndex");
    });
    
    // 左侧好友点击事件
    $("#myFriend").click(function () {
        $("#content_iframe").attr("src", path+"/userFriend/myFriend");
    });
    
    //左侧 升级会员 点击事件 
    $("#levelVip").click(function () {
       $("#content_iframe").attr("src",path+"/vip/gotoVip"); 
    });
    
    //左侧 充值中心  点击事件 
    $("#payCenter").click(function () {
       $("#content_iframe").attr("src",path+"/payfor/gotoIndex"); 
    });

    //左侧 邮箱  点击事件
    $("#emailBox").click(function () {
        $("#content_iframe").attr("src",path+"/email/gotoIndex");
    });

    //退出  点击事件
    $("#logoutBtn").click(function () {
        $.confirm({
            theme: 'black',
            confirmButtonClass: 'btn-info',
            cancelButtonClass: 'btn-danger',
            title:false,
            content: indexContent.exitTip+'<br>'+indexContent.welcomeNextTime,
            confirm: function(){
                $.ajax({
                    url:path+"/login/out",
                    type:"POST",
                    data:{},
                    dataType:"json",
                    success:function(){
                        window.top.location.href=path+"/login/gotoLoginPage";//跳转登陆页
                    }
                })
            }
        })
    });

    $("#myBlog").click(function () {
        $("#content_iframe").attr("src",path+"/userBlog/gotoIndex");
    });

    $("#gift").click(function () {
        $("#content_iframe").attr("src",path+"/gift/gotoIndex");
    });

    $("#searchUserBtn").click(function () {
        $("#content_iframe").attr("src",path+"/index/indexContent");
    });
    init();

    //修改头像的加载
    if(!$("#headPhoto").attr("src")){
        $("#headPhoto").attr("src",path+"/common/images/people140x140.jpg");
    }
    //头像加载失败监听
    $("#headPhoto").error(function () {
        $(this).attr("src",path+"/common/images/people140x140.jpg");
    })
});

function init(){
    getRecommendUserListExcludeMeData(1, "2", "#recommendContentDiv");//拿到首页的推荐用户的数据,2代表推荐的
    getRecommendUserListExcludeMeData(1, "3", "#recentVisitorContentDiv");//拿到最近访问的用户的数据,3代表最近访问
}

/**
 * 获取首页的用户列表数据
 * @param pageNo 分页
 */
function getRecommendUserListExcludeMeData(pageNo, recommendType, containerId){//拿到首页的推荐用户的数据,2代表推荐的,拿到最近访问的用户的数据,3代表最近访问
    $(containerId).html("");//清空数据
    if(pageNo){
        $.ajax({
            url:path+"/userInfo/queryUserListExcludeMeAndRecommend",
            type:"POST",
            data:{
                "currentPage":pageNo,
                "pageSize":5,
                "recommendType":recommendType
            },
            dataType:"json",
            success:function(data){
                initRecommendUserListData(data, containerId);
            }
        })
    }
}

/**
 * 初始化好友相册分组的数据
 * @param data
 */
function initRecommendUserListData(data, containerId) {
    var recommendUserListDivTemplete = 	'<article class="widget-post">'+
        '<div class="post-image">'+
        '<a target="_blank" href="_path/memberspace/gotoindex?memberid=_userId"><img class="width60 height60" src="${basePath}" alt=""></a>'+
        '</div>'+
        '<div class="post-body">'+
        '<h2><a target="_blank" href="_path/memberspace/gotoindex?memberid=_userId">${userNameVal}</a></h2>'+
        '<div class="post-meta">'+
        '<span><div><a href="#"  rel="54">'+
        '<a href="javascript:void(0)" id="_userId_addRecommendBtn" rel="54">'+
        '<img src="/common/images/addfriends.gif" alt="'+indexContent.addFriend+'" title="'+indexContent.addFriend+'"></a></div></span>'+
        '</div>'+
        '</div>'+
        '</article>';
    var list = data.dataList;
    for (var index in list) {
        var _data = list[index];
        var photoUrl=_data.headPhotoUrl;
        var _replace = recommendUserListDivTemplete.replace("${basePath}", photoUrl?photoUrl:path+"/common/images/people60x55.jpg")
            .replace("${userNameVal}", _data.userName).replace(/_userId/g, _data.userId)
            .replace(/_path/g, path);
        $(containerId).append(_replace);
        addRecommendAddBtnClickListener("#"+_data.userId+"_addRecommendBtn", _data.userId);
    }
    //添加头像加载失败的监听
    addImgLoadedFailedListener();
}
function addImgLoadedFailedListener() {
    $("#recommendContentDiv").find("img").error(function () {
        $(this).attr("src",path+"/common/images/people60x55.jpg");
    })
}

function addRecommendAddBtnClickListener(addUserBtnId, friendId){
    $(addUserBtnId).click(function () {
        $.confirm({
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

/**
 * 照片弹出
 * @param groupId
 */
function showPhotos(groupId,friendPhoto) {
   if(groupId){
       $.ajax(path+'/userPhoto/queryRecordsByPage',{
           data:{
               "groupId":groupId,
               "currentPage":1,
               "pageSize":10000,
               "friendPhoto":friendPhoto
           },
           dataType:"json",
           type:"post",
           success:function(data){
               parsing(data);
           }
       });
   }

   var parsing=function(data){
       var parsedJson={
           "title": "Photo",
           "id": 99935,
           "start": 0,
           "data":[]
       };
       for(var index in data.dataList){
           var _data=data.dataList[index];
           parsedJson.data.push({
               "alt": _data.photoDescription,
               "pid": _data.upId,
               "src": path+_data.photoUrl,
               "thumb": path+_data.thumbnailurl
           })
       }
       layer.photos({
           area: '500px',
           offset:($(window).height() - 500)/2+"px",
           photos:parsedJson
       });
   }
}

