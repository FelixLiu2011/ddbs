var CONST_USE_PROPERTY_FRIEND = "1";
var userFriendCondition = {
    pageNo:1,
    friendNameCondition:"",
    status:"1",
};//查询条件初始化
$(function () {
    $('input[name="toWho"]').change(function () {
        var valToWho = $('input[name="toWho"]:checked ').val();
        if(valToWho == loginUserId) {
            $("#friendList").hide();
        }else {
            getMyFriendData(userFriendCondition);
            $("#friendList").show();
        }
    })

    $("#friendList").change(function () {
        var friendId = $(this).children('option:selected').attr("id");
        $("#toFriend").val(friendId);
    })

    //支付按钮点击的操作
    $("#payBtn").click(function () {
        var payMethod = $('input[name="payMethod"]:checked ').val();
        var payToId = $('input[name="toWho"]:checked ').val();
        var mount = $("#mount").val();
        if(mount == "") {
            mount = $('input[name="payValueChoose"]:checked ').val();
        }

        var payssionMethod = $('input[name="payssionMethodRadio"]:checked ').val();

        $("#payMethod1").val(payMethod);
        $("#userId1").val(payToId);
        $("#mount1").val(mount);
        $("#payssionMethod1").val(payssionMethod);

        $("#payForm").submit();

        //等待中
        /*var loader=SLLib.loader({
            spinner:"spinner2",
            height:"110px"
        });
        loader.start();
        //"1"使用paypal支付
        $.ajax({//保存好友信息，主要针对好友分组的改变
            url:path+"/payfor/payPalRedirect1",
            type:"POST",
            data:{
                "userId":payToId,
                "payMethod":payMethod,
                "mount":mount
            },
            dataType:"json",
            success:function(msg){
                loader.stop();
                var redirectUrl = msg.msg;
                alert(redirectUrl);
                window.open(redirectUrl);
            }
        })*/

    })

    $("input[name='payMethod']").change(function(){
        var val = $(this).val();
        if(val=="2"){
            $("#payssionMethod").show();
        }else{
            $("#payssionMethod").hide();
        }

    })

});

/**
 * 获取我的好友当前页的数据
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
