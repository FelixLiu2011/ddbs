var staticGiftCondition = {//用来初始化分页条件
    pageNo:1,
    giftProperty:"0",//0表示虚拟的礼物，1表示真实的礼物
    contentListDiv:"#virtualGiftContentDiv",//列表展示的DIV
    paginationDiv:"#virtualGiftPaginationDIV",//分页条
    loaderDiv:"#panel-virtualGift",//等待转动圈所在的DIV
    postUrl:"/staticGift/queryRecordsByPage"//请求的url
};
var allFriendListData;//用于存放所有好友
$(function() {
    $("#virtualGiftTab").click(function () {
        staticGiftCondition = {
            pageNo:1,
            giftProperty:"0",//0表示虚拟的礼物，1表示真实的礼物，2表示我收到的礼物，3表示我送出的礼物
            contentListDiv:"#virtualGiftContentDiv",//列表展示的DIV
            paginationDiv:"#virtualGiftPaginationDiv",//分页条
            loaderDiv:"#panel-virtualGift",//等待转动圈所在的DIV
            postUrl:"/staticGift/queryRecordsByPage"//请求的url
        };
        getGiftData(staticGiftCondition)
    });

    $("#trueGiftTab").click(function () {
        staticGiftCondition = {
            pageNo:1,
            giftProperty:"1",//0表示虚拟的礼物，1表示真实的礼物
            contentListDiv:"#trueGiftContentDiv",//列表展示的DIV
            paginationDiv:"#trueGiftPaginationDiv",//分页条
            loaderDiv:"#panel-trueGift",//等待转动圈所在的DIV
            postUrl:"/staticGift/queryRecordsByPage"//请求的url
        };
        getGiftData(staticGiftCondition)
    });

    /**
     * 当添加或者编辑Group的Model框显示的时候，传数据到Model框里面去
     */
    $('#sendGiftDialog').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);// Button that triggered the modal
        var giftId = button.data('giftid'); // Extract info from data-* attributes
        var modal = $(this);
        modal.find('#giftId').val(giftId);
        var imageUrl = button.data('image');
        modal.find('#imageUrl').attr("src", imageUrl);
        $("#myFriend").empty();
        for(var obj in allFriendListData) {//已缓存到js中的数据
            var option = "<option data-friendId="+allFriendListData[obj].friendId+">"+allFriendListData[obj].friendName+"</option>";
            $("#myFriend").append(option);
        }
    });

    //赠送礼物的btn的点击事件
    $("#sendGiftBtn").click(function () {
        sendGiftToFriend();
    });

    //收到的礼物的tab的点击事件
    $("#receiveGiftTab").click(function () {
        staticGiftCondition = {//用来初始化分页条件
            pageNo:1,
            giftProperty:"2",//0表示虚拟的礼物，1表示真实的礼物，2表示我收到的礼物，3表示我送出的礼物
            contentListDiv:"#receiveGiftContentDiv",//列表展示的DIV
            paginationDiv:"#receiveGiftPaginationDiv",//分页条
            loaderDiv:"#panel-receive-gift",//等待转动圈所在的DIV
            postUrl:"/gift/queryRecordsByPage"//请求的url
        };
        getGiftData(staticGiftCondition);
    })

    //送出的礼物的tab的点击事件
    $("#sendGiftTab").click(function () {
        staticGiftCondition = {//用来初始化分页条件
            pageNo:1,
            giftProperty:"3",//0表示虚拟的礼物，1表示真实的礼物，2表示我收到的礼物，3表示我送出的礼物
            contentListDiv:"#sendGiftContentDiv",//列表展示的DIV
            paginationDiv:"#sendGiftPaginationDiv",//分页条
            loaderDiv:"#panel-send-gift",//等待转动圈所在的DIV
            postUrl:"/gift/queryRecordsByPage"//请求的url
        };
        getGiftData(staticGiftCondition);
    })

    //初始化页面调用
    init();
});

/**
 * 初始化页面加载的时候调用
 */
function init() {
    $("#virtualGiftTab").click();
    getMyAllFriendData();//取到所有的好友列表，方便后面使用
}

/**
 * 获取礼物列表的数据
 * @param pageNo 分页
 */
function getGiftData(condition){
    $(condition.contentListDiv).html("");//清空数据
    var loader=SLLib.loader({
        ele:condition.loaderDiv,
        spinner:"spinner2",
        height:"200px"
    });
    loader.start();
    if(condition.pageNo){
        $.ajax({
            url:path + condition.postUrl,
            type:"POST",
            data:{
                "currentPage":condition.pageNo,
                "pageSize":4,
                "giftProperty":condition.giftProperty
            },
            dataType:"json",
            success:function(data){
                loader.stop();
                if(data.dataList.length < 1) {
                    $(condition.paginationDiv).html("");//清空页码
                    return; //如果没有查询到数据，就不分页
                }
                if(condition.pageNo==1){//如果是第一页，则初始化分页
                    initStaticGiftPagination(data);
                }
                initStaticGiftData(data);
            }
        })
    }
}
/**
 * 初始化分页条
 * @param pageData
 */
function initStaticGiftPagination(pageData) {
    var pageIndex=pageData.currentPage;
    var totalPages=pageData.totalPages;
    var options = {
        alignment:"center",//居中显示
        currentPage: pageIndex,//当前页数
        totalPages: totalPages,//总页数 注意不是总条数
        bootstrapMajorVersion:3,
        onPageChanged: function(event,oldPage,newPage){
            if (oldPage==newPage) {
                return;
            } else {
                staticGiftCondition.pageNo = newPage;
                getGiftData(staticGiftCondition); //重新拉取数据
            }
        }
    };
    $(staticGiftCondition.paginationDiv).bootstrapPaginator(options);
}
/**
 * 初始化礼物列表数据
 * @param data
 */
function initStaticGiftData(data) {
    var staticGiftDivTemplete = "";
    if(staticGiftCondition.giftProperty == "0" || staticGiftCondition.giftProperty == "1"){//如果是查询展示的礼物的List
        staticGiftDivTemplete = '<div class="col-xs-3 col-md-3 width175">'+
            '<div class="thumbnail cursor-pointer" id="giftId" data-image="basePathgiftUrl" data-giftid="giftId" data-toggle="modal" data-backdrop="" data-target="#sendGiftDialog" autocomplete="off">'+
            '<img src="basePathgiftUrl" alt="140x140">'+
            '<div class="caption" style="text-align: center">'+
            '<h5>giftName</h5>'+
            '</div>'+
            '</div>'+
            '</div>';
    }else if(staticGiftCondition.giftProperty == "2") {//收到的礼物列表
        staticGiftDivTemplete = '<tr>'+
            '<th scope="row"><input type="checkbox" class="checkbox" name="types_checkbox"></th>'+
            '<td>giftName</td>'+
            '<td><img style="width: 50px" src="giftUrl"></td>'+
            '<td>giftProperty</td>'+
            '<td>giftSenderName</td>'+
            '<td>giftCount</td>'+
            '<td>createdTime</td>'+
            '</tr>';
    }else if(staticGiftCondition.giftProperty == "3") {//送出的礼物列表
        staticGiftDivTemplete = '<tr>'+
            '<th scope="row"><input type="checkbox" class="checkbox" name="types_checkbox"></th>'+
            '<td>giftName</td>'+
            '<td><img style="width: 50px" src="giftUrl"></td>'+
            '<td>giftProperty</td>'+
            '<td>giftReceiverName</td>'+
            '<td>giftCount</td>'+
            '<td>createdTime</td>'+
            '</tr>';
    }

    var list = data.dataList;
    for (var index in list) {
        var _data = list[index];
        var _replace = staticGiftDivTemplete
            .replace(/basePath/g, path)
            .replace(/giftName/g, _data.giftName)
            .replace(/giftPrice/g, _data.giftPrice)
            .replace(/giftUrl/g, _data.giftUrl)
            .replace(/giftId/g, _data.giftId)
            .replace(/giftReceiverName/g, _data.giftReceiverName)
            .replace(/giftSenderName/g, _data.giftSenderName)
            .replace(/giftCount/g, _data.giftCount)
            .replace(/createdTime/g, _data.createdTime);
        if(_data.giftProperty == "0") {
            _replace = _replace.replace(/giftProperty/g, gitContent.virtualGift)
        }else if(_data.giftProperty == "1") {
            _replace = _replace.replace(/giftProperty/g, gitContent.realGift)
        }
        $(staticGiftCondition.contentListDiv).append(_replace);
    }
}
//获得我的所有的好友列表
function getMyAllFriendData() {
    $.ajax({
        url:path+"/userFriend/queryRecordsByPage",
        type:"POST",
        data:{
            "currentPage":1,
            "pageSize":1000,
            "status":"1"//用户已添加好友
        },
        dataType:"json",
        success:function(data){
            var list = data.dataList;
            allFriendListData = [];
            for (var index in list) {
                var _data = list[index];
                allFriendListData[_data.ufId] = {
                    "friendId":_data.friendId,
                    "friendName":_data.friendName
                };
            }
        }
    })
}
//送礼物给好友
function sendGiftToFriend() {
    var giftId = $("#giftId").val();
    var friendId = $("#myFriend").children('option:selected').attr("data-friendid");
    var giftCount = $("#giftCount").val();
    $.ajax({
        url:path+"/gift/sendGiftToFriend",
        type:"POST",
        data:{
            "giftId":giftId,
            "friendId":friendId,
            "giftCount":giftCount
        },
        dataType:"json",
        success:function(data){
            $.confirm({
                container:window.top.document.body,
                title:"",
                content:data.msg,
                autoClose: 'confirm|1000',
                cancelButton:false
            });
        }
    })
}

