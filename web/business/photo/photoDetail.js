var currentIndex=-1000;//记录当前的鼠标位置
var friendPhoto=null;//记录是否查看的是好友的相册详情
var PAGE_SIZE=12;
/**
 * 照片详情
 */
$(function () {
    friendPhoto=$("#friendPhoto").val();
    //注册 跳转到 升级会员的页面    
    registerToVIPListener();  
    getPhotoData(1);
});

function registerToVIPListener() {
    $("#toVip").click(function () {
        //$("#levelVip",window.top.document).click();//点击最上层window的`升级会员`的li
        $("#content_iframe",window.top.document).attr("src",path+"/vip/gotoVip");
    });
}

/**
 * 获取当前页的数据
 * @param pageNo 分页
 */
function getPhotoData(pageNo){
    $("#photoDiv").html("");//清空数据
    var loader=SLLib.loader({
        ele:"#photoDiv",
        spinner:"spinner2",
        height:"500px"
    });
    loader.start();
    if(pageNo){
        $.ajax({
            url:path+"/userPhoto/queryRecordsByPage",
            type:"POST",
            data:{
                "currentPage":pageNo,
                "pageSize":PAGE_SIZE,
                "groupId":groupId,
                "friendPhoto":friendPhoto
            },
            dataType:"json",
            success:function(data){
                loader.stop();
                if(data.dataList.length < 1) {
                    $("#photoPaginationDiv").html("");//清空页码
                    return; //如果没有查询到数据，就不分页
                }

                if(pageNo==1){//如果是第一页，则初始化分页
                    initPhotoPagination(data);
                }
                initPhotoData(data);
                //检测是否要提醒升级为vip
                checkVIP(data.extra);
            }
        })
    }
}
function checkVIP(extra) {
    if(extra&&extra.vipExtraInfo){//为true要提示
        $("#vipTip").show();
    }else{
        $("#vipTip").hide();
    }
}
/**
 * 初始化分页条
 * @param pageData
 */
function initPhotoPagination(pageData) {
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
                getPhotoData(newPage);//重新拉取数据
            }
        }
    }
    $("#photoPaginationDiv").bootstrapPaginator(options);
}
/**
 * 初始化我的日志的数据
 * @param data
 */
function initPhotoData(data) {
    var photoDivTemplete=' <div id="parent_${index}" class="parentDiv">'
        +' <img src="${basePath}${imagePath}" alt="140x140" class="img-rounded" data-index="${index}" id="image_${index}">'
        +' <div style="width:140px;height: 140px;background:rgba(214, 200, 216, 0.8);text-align: center;position: absolute; left: -1000px;cursor: hand;"'
        +'  id="txtDiv_${index}">'
        +' <a class="inline-block txtDivSpan" style="cursor:hand;" id="txtDivSpan_${index}">'+photoDetailContent.setForCover+'</a>'
        +' </div>'
        +'  </div>';
    var list = data.dataList;
    for (var index in list) {
        var _data = list[index];
        var _replace = photoDivTemplete.replace("${basePath}", path).replace("${imagePath}", _data.photoUrl)
                                        .replace(/\$\{index\}/g,index);
        $("#photoDiv").append(_replace);
        var memberId = $("#memberId", window.top.document).val();//是否是查看网站成员
        if(!memberId && friendPhoto=="false"){//查看的为自己的相册的详情
            addMouseListener(index,_data.upId,groupId);
        }
    };
    $("#photoDiv").find("img").dblclick(function(){//当查看好友的相册详情时,会直接调用这个注册
       if(window.top.showPhotos){
           window.top.showPhotos(groupId,friendPhoto);
       }
    });
}

/**
 * 添加"设置封面"鼠标事件
 * @param index list对应的index 无意义
 * @param upId 当前的照片的id
 * @param groupId 相册的id
 */
function addMouseListener(index,upId,groupId) {
    $("#parent_"+index).mouseenter(function () {
        var position=$(this).position();
        $(this).find("#txtDiv_"+index).css({
            "left":position.left+25,
            "top":position.top+25
        })
    }).mouseleave(function () {
        $(this).find("#txtDiv_"+index).css({
            "left":"-1000px"
        })
    });
    //弹出相应的照片墙
    $("#txtDiv_"+index).dblclick(function () {
        if(window.top.showPhotos){
            window.top.showPhotos(groupId,friendPhoto);
        }
    });
    //设置封面
    $("#txtDivSpan_"+index).click(function () {
       $.ajax(path+"/userPhoto/userThisPhotoForFace",{
           data:{
               "upId":upId,
               "groupId":groupId
           },
           dataType:"json",
           type:"POST",
           success:function (data) {
               if(data){
                   if(data.successful){
                       $.confirm({
                           title:"",
                           content:data.msg,
                           autoClose: 'confirm|2000',
                           cancelButton:false
                       });
                   }else{
                       $.alert({
                           title:"Error",
                           content:data.msg
                       })
                   }
               }
           }
       })
    })
}
