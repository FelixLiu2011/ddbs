/*
*修改密码JS
 */
$(function () {
    createChangePwdValidator();
    //add listener on button
    $("#changePwdBtn").click(function () {
        var btn=$(this).button("loading");
        changePwd(btn);
    });
});

function createChangePwdValidator() {
    $("#changePwdForm").bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            oldPwd: {
                validators: {
                    notEmpty: true
                }
            },
            newPwd: {
                validators: {
                    notEmpty: true
                }
            },
            confirmPwd: {
                validators: {
                    notEmpty: true,
                    identical: {
                        field: 'newPwd',
                        message: mySpaceContent.repeatPwdError
                    }
                }
            }
        }
    });
}

function changePwd(btn) {
    var $changePwdForm = $("#changePwdForm").data("bootstrapValidator").validate();
    if($changePwdForm.isValid()){
        $.ajax(path+"/userInfo/changePwd",{
            data:{
                "oldPwd":md5($("#oldPwd").val()),
                "newPwd":md5($("#newPwd").val()),
                "repeatPwd":md5($("#confirmPwd").val())
            },
            dataType:"json",
            type:"POST",
            success:function (data) {
                btn.button("reset");
                if(data){
                    if(data.successful){
                        $.confirm({
                            container:window.top.document.body,
                            title:"Tip",
                            content:data.msg,
                            autoClose: 'confirm|3000',
                            cancelButton:false,
                            container:"#changePwdForm"
                        });
                    }else{
                        $.alert({
                            title:"Tip",
                            content:data.msg,
                            autoClose: 'confirm|3000',
                            cancelButton:false,
                            container:"#changePwdForm"
                        });
                    }
                }
            },
            error:function () {
                btn.button("reset");
            }
        })
    }
}