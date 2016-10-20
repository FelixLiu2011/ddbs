/**
 * 重置密码JS
 */

$(function () {
    createValidator();
    //注册点击
    $("#resetBtn").click(function () {
        var bv= $('#myForm').data("bootstrapValidator").validate();
        if(!bv.isValid()){
            return ;
        }
        $.ajax({
            url:path+"/login/doResetPwd",
            data:{
                "resetPwd":md5($("#password").val()),
                "repeatPwd":md5($("#repeatPwd").val()),
                "encodedKey":$("#encodedKey").val()
            },
            dataType:"json",
            type:"POST",
            success:function (data) {
                if (data&&data.successful==true){
                    $.confirm({
                        container:window.top.document.body,
                        title:"",
                        content:data.msg,
                        autoClose: 'confirm|2000',
                        cancelButton:false,
                        confirm:function(){
                            window.top.location.href=path+"/login/gotoLogin";//跳转到登录页面
                        }
                    });
                }else{
                    if(data&&data.msg){//注册失败
                        $("#errorP").html("").html(data.msg);
                    }
                }
            }
        })
    });
});

/**
 * 创建验证器
 */
function createValidator(){
    $('#myForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            password: {
                validators: {
                    notEmpty: true
                }
            },
            repeatPwd:{
                validators:{
                    notEmpty: true,
                    identical: {
                        field: 'password',
                        message: registerMsg.repeatPwdError
                    }
                }
            },
            email:{
                validators:{
                    notEmpty:true,
                    emailAddress:true
                }
            }
        }
    });
}
