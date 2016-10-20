/**
 * 好友的空间 业务JS
 */
$(function () {
    //发送邮件的点击事件
    $("#sendEmailBtn").click(sendEmailToMember);

    $("#friendHomeBar").click(function () {
        $("#content_iframe",window.top.document).attr("src",path+"/memberspace/getMyspceContent");
    });

    //左侧 升级会员 点击事件
    $("#levelVipLeftBar").click(function () {
        $("#content_iframe").attr("src",path+"/vip/gotoVip");
    });

    //左侧 充值中心  点击事件
    $("#rechargeLeftBar").click(function () {
        $("#content_iframe").attr("src",path+"/payfor/gotoIndex");
    });

    $("#sendGiftLeftBar").click(function () {
        $("#content_iframe").attr("src",path+"/gift/gotoIndex");
    });

    $("#addFriendLeftBar").click(addFriendFunc);
});

function addFriendFunc(){
    var friendId = $("#memberId").val();
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
}

function sendEmailToMember() {
    var emailContent = $("#emailContent").val();
    var emailReceiver = $("#memberId", window.top.document).val();
    $.ajax({
        url:path+"/email/save",
        type:"POST",
        data:{
            "emailContent":emailContent,
            "emailReceiver":emailReceiver
        },
        dataType:"json",
        success:function(){
            $("#closeModel").click();
            $.confirm({
                title:"",
                content:"Email send success!",
                autoClose: 'confirm|2000',
                cancelButton:false
            });
        }
    })
}