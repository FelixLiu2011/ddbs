var userPhotoGroupCondition = {
    pageNo:1
};//查询条件初始化
$(function () {
    userPhotoGroupCondition = {
        pageNo:1
    };//查询条件初始化
    getMyPhotoGroupData(userPhotoGroupCondition);

  /*  //监听select change事件
    $("#photoGroup").change(function () {
        var val=$(this).val();
        uploadConfig.uploadExtraData={
            "photoGroupId":val
        }
    })*/
});

/**
 * 获取我的相册数据
 * @param pageNo 分页
 */
function getMyPhotoGroupData(condition){
    $("#myPhotoGroupContentDiv").html("");//清空数据
    if(condition.pageNo){
        $.ajax({
            url:path+"/userPhotoGroup/queryRecordsByPage",
            type:"POST",
            data:{
                "currentPage":condition.pageNo,
                "pageSize":1000
            },
            dataType:"json",
            success:function(data){
                initMyPhotoGroupOptionData(data);
            }
        })
    }
}

/**
 * 初始化我的相册分组的数据
 * @param data
 */
function initMyPhotoGroupOptionData(data) {
    var photoGroupSelect=$("#photoGroup");
    photoGroupSelect.empty();
    var list = data.dataList;
    for (var index in list) {
        var _data = list[index];
        var option = "<option data-groupId="+_data.groupId+" value="+_data.groupId+">"+_data.groupName+"</option>";
        photoGroupSelect.prepend(option);
    }
}
