/**
 * 注册JS
 */

$(function () {

    createValidator();

    //注册点击
    $("#registerBtn").click(function () {
        var bv= $('#myForm').data("bootstrapValidator").validate();
        if(!bv.isValid()){
            return ;
        }

        $.ajax({
            url:path+"/login/register?repeatPwd"+md5($("#repeatPwd").val()),
            data:JSON.stringify({
                "userName":$("#userName").val(),
                "userPwd":md5($("#password").val()),
                "userEmail":$("#email").val(),
                "userSex":$("#sex").val()
            }),
            dataType:"json",
            type:"POST",
            contentType:"application/json",
            success:function (data) {
                if (data&&data.successful==true){
                    $.confirm({
                        container:window.top.document.body,
                        title:"",
                        content:data.msg,
                        autoClose: 'confirm|2000',
                        cancelButton:false,
                        container:"#myForm",
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
            username: {
                validators: {
                    notEmpty: true,
                    remote: {
                        type: 'POST',
                        url: path+'/login/identifyUserName',
                        message:registerMsg.userNameRepeate,
                        delay: 2000
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: registerMsg.userNameReg
                    },
                    stringLength:{
                        min:5,
                        max:10,
                        message:registerMsg.userNameLen
                    }
                }
            },
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
