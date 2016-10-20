/*admin 首页的js*/
var loader=null;//加载条

if(!String.prototype.endsWith){
    String.prototype.endsWith = function(pattern) {
        var d = this.length - pattern.length;
        return d >= 0 && this.lastIndexOf(pattern) === d;
    };
}
$(document).ready(function () {
 $(".navigation").pjax("a","#content-wrapper",{
       timeout:1000*60,
       fragment:"body"
   });

    /*加载Loading*/
    $(document).on('pjax:send', function() {
        loader=SLLib.loader({
            ele:"#content-wrapper",
            spinner:"spinner2",
            height:"700px",
            width:$("#content-wrapper").width()+30,
            reposition:true
        });
        loader.start();
    });
    $(document).on('pjax:complete', function(xhr) {
        if(loader){
            loader.stop();
        }
    });
    $(document).on('pjax:end', function(event,placeholder,options) {
        if(event.relatedTarget){
            $(".navigation").find("li").removeClass("active");
            $(event.relatedTarget).closest("li").addClass("active");
        }else if(options.url){//backward
           if(options.url.endsWith("/gotoIndex")){
               $("#userInfos").click();
           }else{
               $(".navigation").find("li").removeClass("active");
               $(".navigation").find("a").each(function(index,ele){
                   if($(ele).attr("href").endsWith(options.url.substring(options.url.lastIndexOf("/")))){
                       $(ele).closest("li").addClass("active");
                   }
               });
           }
        }
    });
    /*添加选中的样式*/
  /*  $(".navigation").find("li").click(function () {
        $(".navigation").find("li").removeClass("active");
        $(this).addClass("active");
    })*/
    /*click userInfos li*/
    $("#userInfos").click();

    //监听相应的样式
    $(".custom").closest("a").mouseover(function () {
        var classes=$(this).find(".custom").attr("class").split(" ");
        var className=null;
        for(var index in classes){
            if(classes[index].indexOf("fa-")!=-1){
                className=classes[index];
            }
            if(classes[index].indexOf("-b")!=-1
                ||classes[index].indexOf("-w")!=-1){//if this `li` has been selected,skip
                return;
            }
        }
        if(className){
            $(this).find(".custom").removeClass(className).addClass(className+"-w");
        }
    }).mouseleave(function () {
        var classes=$(this).find(".custom").attr("class").split(" ");
        var className=null;
        for(var index in classes){
            if(classes[index].indexOf("-w")!=-1){
                className=classes[index];
            }
        }
        if(className){
            var _oriClassName=className.substr(0,className.length()-2);
            $(this).find(".custom").removeClass(className).addClass(_oriClassName);
        }
    }).click(function () {
        var classes=$(this).find(".custom").attr("class").split(" ");
        var className=null;
        for(var index in classes){
            if(classes[index].indexOf("-w")!=-1){
                className=classes[index];
            }
        }
        if(className){
            var _oriClassName=className.substr(0,className.length-2);
            $(this).find(".custom").removeClass(_oriClassName+"-w").addClass(_oriClassName+"-b");
        }
    });

    $(".navigation").find("li").click(function () {
        if(!$(".navigation").find(".custom").length){
            return;
        }
        var classes=$(".navigation").find(".custom").attr("class").split(" ");
        var className=null;
        for(var index in classes){
            if(classes[index].indexOf("-b")!=-1){
                className=classes[index];
            }
        }
        if(className){
            var _oriClassName=className.substr(0,className.length-2);
            $(this).siblings("li").find(".custom").removeClass(_oriClassName+"-b").addClass(_oriClassName);
        }
    });
});

window.onbeforeunload = function(e) {
    //return 'Dialog text here.';
  /*  if (window.event) {//for ie
        if (window.event.clientX < 40 && window.event.clientY < 0) {
            // alert("back button is clicked");
        } else {
            //alert("refresh button is clicked");
            window.location.href=path+"/admin/gotoIndex";
        }
    } else {

        if (event.currentTarget.performance.navigation.type == 2) {
            // alert("back button is clicked");
        }
        if (event.currentTarget.performance.navigation.type == 1) {
            //alert("refresh button is clicked");
            alert("??")
            window.location.href=path+"/admin/gotoIndex";
        }
    }*/
};

/*function CallbackFunction(event) {
    console.log("test")
    if (window.event) {//for ie
        if (window.event.clientX < 40 && window.event.clientY < 0) {
           // alert("back button is clicked");
        } else {
            //alert("refresh button is clicked");
            window.location.href=path+"/admin/gotoIndex";
        }
    } else {

        if (event.currentTarget.performance.navigation.type == 2) {
           // alert("back button is clicked");
        }
        if (event.currentTarget.performance.navigation.type == 1) {
            //alert("refresh button is clicked");
            alert("??")
            window.location.href=path+"/admin/gotoIndex";
        }
    }
}*/
var mv=new Vue({
    el:"#main-wrapper",
    data:{},
    methods:{
        //退出
        logOut:function () {
            $.confirm({
                container:window.top.document.body,
                theme: 'black',
                confirmButtonClass: 'btn-info',
                cancelButtonClass: 'btn-danger',
                title:false,
                content:"确认退出吗?",
                confirm: function(){
                    $.ajax({
                        url:path+"/admin/out",
                        type:"POST",
                        data:{},
                        dataType:"json",
                        success:function(){
                            window.top.location.href=path+"/admin/gotoLoginPage";//跳转登陆页
                        }
                    })
                }
            })
        }
    },
    ready:function(){
    }
});
