var totalCount=30;//30s倒计时
var countDownTimer=null;//倒计时的timer
var restBtnOldText=null;//保存 重置按钮的text


var delay = 1500;//1.5s delay
var timer = null;
$(function () {
    //禁止按回车提交
    $(document).ready(function(){
        $("input").each(
            function(){
                $(this).keypress( function(e) {
                    var key = window.event ? e.keyCode : e.which;
                    if(key.toString() == "13"){
                        return false;
                    }
                });
            });
    });
    createResetFormValidator();

    $('#myForm').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                validators: {
                    notEmpty: true
                }
            },
            password: {
                validators: {
                    notEmpty:true
                }
            }
        }
    });
    //登录 
   $("#loginBtn").click(function () {
      login();
   });


    //回车登录(有bug 不开启)
    $(document).keyup(function(event){
        var keyCode = event.keyCode ? event.keyCode
            : event.which ? event.which : event.charCode;
        if(keyCode==13){
            $("#loginBtn").click();
        }
    });
    //注册
    $("#registerBtn").click(function () {
       window.top.location.href=path+"/login/gotoRegister" 
    });

    /*//忘记密码
    $("#forgetPwd").click(function () {
        
    });*/

    $("#resetPwdDialog").on("show.bs.modal",function(){
        var userName=$("#userName").val();
       $("#userNameReset").val(userName);
        if(userName){//如果有值 ，先去获取相应的用户的邮箱
            fetchEmailByUserName($("#userNameReset").val());
        }else{
            //等待输入
        }
    });

    $("#resetPwdDialog").on("hide.bs.modal",function () {
       $("#tipDiv").hide();
        $("#resetPwdBtn").removeAttr("disabled");
        resetBtnStatusAndClearTimer();
    });

    $("#resetPwdBtn").click(function () {
        var bv=$('#resetFrom').data("bootstrapValidator").validate();
        if(bv.isValid()){
            $("#tipDiv").show();
            $(this).attr("disabled","disabled");
            createCountdownTimer();

            //send email
            sendEmail();
        }else{
        }
    });

    $("#userNameReset").keyup(function () {
        if (timer) {
            clearTimeout(timer);
        }
        timer = setTimeout(function () {
            fetchEmailByUserName($("#userNameReset").val());
            clearTimeout(timer);
        }, delay);
    });

     restBtnOldText=$("#resetPwdBtn").text();//save
});
/**
 * 登录
 */
function login(){
    $("#errorP").html("");//清空错误的信息
    var bv=$('#myForm').data("bootstrapValidator").validate();
    if(!bv.isValid()){
        return ;
    }
    var btn=$("#loginBtn").button("loading");
    $.ajax({
        url:path+"/login/in?remeberme="+$("#remeberme").is(':checked'),
        data:JSON.stringify({
            "userName":$("#userName").val(),
            "userPwd":md5($("#password").val())
        }),
        dataType:"json",
        type:"POST",
        contentType:"application/json",
        success:function (data) {
            btn.button('reset');//reset
            if (data&&data.msg==="success"){
                window.top.location.href=path+"/index/gotoIndex";//跳转到首页
            }else{
                if(data&&data.msg){//登录失败
                    $("#errorP").html("").html(data.msg);
                }
            }
        }
    })
}

function sendEmail() {
    $.ajax({
        url:path+"/login/resetpwd",
        data:{
            "userName":$("#userNameReset").val(),
            "email":$("#emailReset").val()
        },
        dataType:"json",
        type:"post",
        success:function (data) {
            if (data&&data.successful==true){
                $.confirm({
                    title:"",
                    content:data.msg,
                    autoClose: 'confirm|3000',
                    cancelButton:false,
                    confirm:function(){
                       // window.top.location.href=path+"/login/gotoLogin";
                    }
                });
            }else{
                if(data&&data.msg){//发送失败
                    $.confirm({
                        title:"",
                        content:data.msg,
                     //   autoClose: 'confirm|3000',
                        cancelButton:false,
                        confirm:function(){
                        }
                    });
                }
            }
        }
    })
}

/**
 * 创建定时器
 */
function createCountdownTimer() {
    var tempCount=totalCount;
    countDownTimer=setInterval(function () {
        $("#resetPwdBtn").text(restBtnOldText+"("+tempCount+")");
        tempCount--;
        if(tempCount<0){
           resetBtnStatusAndClearTimer();
        }
    },1000)
}
/**
 * 还原 重置按钮 的文本信息以及相应的样式
 */
function resetBtnStatusAndClearTimer() {
    if(countDownTimer){
        clearInterval(countDownTimer);
        $("#resetPwdBtn").text(restBtnOldText);
        $("#resetPwdBtn").removeAttr("disabled");
    }
}

/**
 * 根据用户名查找对应的注册邮箱
 * @param userName
 */
function  fetchEmailByUserName(userName) {
    if(userName){
        $.ajax({
            url:path+"/login/fetchEmailByUserName",
            data:{
                "userName":userName
            },
            dataType:"json",
            type:"POST",
            success:function (data) {
                if(data&&data.msg){
                    $("#emailReset").val(data.msg);
                }
            }
        })
    }
}


function createResetFormValidator(){
    $('#resetFrom').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            userNameReset: {
                validators: {
                    notEmpty: true
                }
            },
            emailReset: {
                validators: {
                    notEmpty: true
                }
            }
        }
    });
}