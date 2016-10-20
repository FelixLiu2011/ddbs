/**
 * 用户VIP的JS,当要使用用户的vip权限信息时，引入这个JS文件
 */
var VIP={};
VIP.loadVipPrivs=false;//记录vip信息是否被加载
VIP.infos=[];//不要使用这个数组，因为这个数组不会实时更新
VIP.fetchVipPrivs=function () {//使用这个方法来获取相应的权限信息
    if(VIP.loadVipPrivs){
        return VIP.infos;
    }else{
        fetchUserVipPrivs();
        return fetchUserVipPrivs();
    }
    //inner function
    function fetchUserVipPrivs() {
        $.ajax(path+"/vip/findVipPrivsByUserId",{
            data:{},
            dataType:"json",
            async:false,
            type:"POST",
            success:function (data) {
                if(data&&data.dataList){
                    VIP.infos=data.dataList;//cache
                    VIP.loadVipPrivs=true;
                }
            }
        });
    }
}

var CONST_FRIEND = "1";//1代表已经添加的好友
var userFriendCondition = {
    pageNo:1,
    friendNameCondition:"",
    status:CONST_FRIEND
};//查询条件初始化

$(function() {
    //给谁充值的事件
    $('input[name="toWho"]').change(function () {
        var valToWho = $('input[name="toWho"]:checked ').attr("id");
        if(valToWho == "toMe") {
            $("#friendList").hide();
        }else {
            getMyFriendData(userFriendCondition);
            $("#friendList").show();
        }
    });

    $("#friendList").change(function () {
        var friendId = $("#friendList").children('option:selected').attr("id");
        $("#toFriend").val(friendId);
    });

    //点击立即升级的时候调用
    $("#chargeVip").click(function () {
        var userId=$('input[name="toWho"]:checked ').val();
        var vipType=$('input[name="vipType"]:checked ').val();

        $.ajax({
            url:path+"/vip/payForVip",
            type:"POST",
            dataType:"json",
            data:{
                userId:userId,
                vipType:vipType
            },
            success:function (data) {
                $.confirm({
                    title:"",
                    content: data.msg,
                    autoClose: 'confirm|1000',
                    cancelButton:false
                })
            }
        })
    })

});

/**
 * 获取我的好友数据
 * @param pageNo 分页
 */
function getMyFriendData(condition){
    if(condition.pageNo){
        $.ajax({
            url:path+"/userFriend/queryRecordsByPage",
            type:"POST",
            data:{
                "currentPage":condition.pageNo,
                "pageSize":1000,
                "friendNameCondition":condition.friendNameCondition,
                "status":condition.status
            },
            dataType:"json",
            success:function(data){
                var list = data.dataList;
                $("#friendList").empty();
                for (var index in list) {
                    var _data = list[index];
                    var option = '<option id="${friendIdVal}">${friendNameVal}</option>';
                    var _replace = option.replace("${friendIdVal}", _data.friendId).replace("${friendNameVal}", _data.friendName);
                    $("#friendList").append(_replace);
                }

            }
        })
    }
}

