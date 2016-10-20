var CONST_FRIEND = "1";
var CONST_APPLY_FRIEND = "0";
var CONST_USE_PROPERTY_FRIEND = "1";
var CONST_FRIEND_GROUP_ALL = "all";
var userFriendCondition = {
	pageNo:1,
	friendNameCondition:"",
	status:"1",
	userFriendGroupCondition:CONST_FRIEND_GROUP_ALL
};//查询条件初始化
var userFriendGroupData; //好友分组

$(function() {
	/**
	 *我的朋友点击事件
	 */
	$("#myFriendTab").click(function () {
		userFriendCondition = {
			pageNo:1,
			friendNameCondition:"",
			status:CONST_FRIEND,
			userFriendGroupCondition:CONST_FRIEND_GROUP_ALL
		};//查询条件初始化
		$("#searchName").val("");
		

		getMyFriendData(userFriendCondition);
		//加载搜索条件中的Group
		loadGroupSearchCondition();
	});

	/**
	 *查询好友按钮点击事件
	 */
	$("#searchFriend").click(function () {
		userFriendCondition.pageNo = 1;
		userFriendCondition.friendNameCondition = $("#searchName").val().trim();
		userFriendCondition.userFriendGroupCondition = $("#friendGroupCondition").children('option:selected').attr("data-groupId")
		getMyFriendData(userFriendCondition);
	});

	/**
	 * 我的好友申请列表
	 */
	$("#myFriendApplyTab").click(function () {
		userFriendCondition = {
			pageNo:1,
			friendNameCondition:"",
			status:CONST_APPLY_FRIEND
		};//查询条件初始化
		getMyFriendApplyData(userFriendCondition);
	});

	/**
	 * 点击保存好友分组的事件
	 */
	$("#saveMyFriendGroup").click(function () {
		var userFriendGroupName = $("#userFriendGroupName").val();
		var userFriendGroupId = $("#userFriendGroupId").val();
		if(userFriendGroupName == "") {
			$.confirm({
				container:window.top.document.body,
				title:"",
				content:friendContent.groupNameRequired,
				autoClose: 'confirm|2000',
				cancelButton:false
			});
			return;
		}
		$.ajax({
			url:path+"/userGroup/save",
			type:"POST",
			data:{
				"groupName":userFriendGroupName,
				"groupId":userFriendGroupId,
				"useProperty":CONST_USE_PROPERTY_FRIEND,
			},
			dataType:"json",
			success:function(){
				$("#closeAddGroupModel").click();
				$.confirm({
					title:"",
					content:friendContent.createGroupSuccess,
					autoClose: 'confirm|2000',
					cancelButton:false
				});
				$("#myFriendGroupTab").click(); //重新加载用户分组的数据
			}
		})
	});

	/**
	 * 管理好友分组的Tab的点击事件
	 */
	$("#myFriendGroupTab").click(function () {
		var friendGroupCondition = {
			pageNo:1,
			useProperty:CONST_USE_PROPERTY_FRIEND,
		};//查询条件初始化
		getMyFriendGroupData(friendGroupCondition);
		loadUserFriendGroupData();
	});

	/**
	 * 当添加或者编辑Group的Model框显示的时候，传数据到Model框里面去
	 */
	$('#createMyFriendGroupDialog').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget);// Button that triggered the modal
		var groupName = button.data('groupname'); // Extract info from data-* attributes
		var groupId = button.data('groupid'); // Extract info from data-* attributes
		var modal = $(this);
		modal.find('#userFriendGroupName').val(groupName);
		modal.find('#userFriendGroupId').val(groupId);
	});


	/**
	 * 当添发送邮件的时候，传数据到Model框里面去
	 */
	$('#createEmailDialog').on('show.bs.modal', function (event) {
       var rtn= checkUserDailyEmailCount();//检测权限
        if(rtn){//超过每日发送的上限 `提示VIP`
            $("#vipTip").show();//Vip Tip
            $("#CreateEmail").hide();//显示相应的输入区
            $("#friendList").hide();
            $("#friendLabel").hide();
        }else{
            $("#vipTip").hide();//VIP TIP
            $("#CreateEmail").show();//隐藏相应的输入区
            $("#friendList").show();
            $("#friendLabel").show();
            var button = $(event.relatedTarget);// Button that triggered the modal
            var friendId = button.data('friendid'); // Extract info from data-* attributes
            var modal = $(this);
            modal.find('#friendId').val(friendId);
            modal.find('#emailContent').html("");
            modal.find('#friendList').children('#'+ friendId).attr("selected", true)
        }
	});

	/**
	 * 当添发送邮件的时候，传数据到Model框里面去
	 */
	$('#createEmailDialog').on('hide.bs.modal', function (event) {
		var modal = $(this);
		var friendId = $("#friendId").val();
		modal.find('#emailContent').html("");
		modal.find('#friendList').children('#'+ friendId).attr("selected", false);
	});

	//发送邮件的点击事件
	$("#sendEmailBtn").click(function () {
		var emailContent = $("#emailContent").val();
		var emailReceiver = $("#friendList").children('option:selected').attr("id");
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
					container:window.top.document.body,
					title:"",
					content:friendContent.sendEmailSuccess,
					autoClose: 'confirm|2000',
					cancelButton:false
				});
			}
		})
	});

	//加载好友分组
	loadUserFriendGroupData();
	//提前加载所有好友的List，主要用在email选择好友
	loadMyAllFriendList();
    //注册 跳转到 升级会员的页面
    registerToVIPListener();

	//表情
	$("#face").mouseover(function () {
		$(this).attr("src",path+"/common/images/Happy-25-g.png");
	}).mouseleave(function () {
		$(this).attr("src",path+"/common/images/Happy-25-b.png");
	}).click(function () {
		if(! $('#sinaEmotion').is(':visible')){
			$(this).sinaEmotion("#emailContent");
			event.stopPropagation();
		}
	});
});

function registerToVIPListener() {
    $("#toVip").click(function () {
        //$("#levelVip",window.top.document).click();//点击最上层window的`升级会员`的li
        $("#content_iframe",window.top.document).attr("src",path+"/vip/gotoVip");
    });
}
/**
 * 检测相应的权限
 */
function  checkUserDailyEmailCount() {
    var rtn=true;
    $.ajax(path+"/email/checkDailyEmailCount",{
        data:{},
        dataType:"json",
        async:false,//cancle async
        type:"POST",
        success:function (data) {
            if(data&&data.successful==true){
               rtn=true;
            }else{
                rtn=false;
            }
        }
    });
    return rtn;
}
//加载搜索条件中的好友分组信息
function loadGroupSearchCondition() {
	$("#friendGroupCondition").empty();
	var optionAll = '<option selected data-groupId= "all">'+friendContent.all+'</option>';
	$("#friendGroupCondition").append(optionAll);
	for(var obj in userFriendGroupData) {
		var option = "<option data-groupId="+obj+">"+userFriendGroupData[obj].groupName+"</option>";
		$("#friendGroupCondition").append(option);
	}
}


function loadUserFriendGroupData() {
	$.ajax({
		url:path+"/userGroup/queryRecordsByPage",
		type:"POST",
		data:{
			"currentPage":1,
			"pageSize":1000,
			"useProperty":CONST_USE_PROPERTY_FRIEND
		},
		dataType:"json",
		success:function(data){
			var list = data.dataList;
			userFriendGroupData = [];
			for (var index in list) {
				var _data = list[index];
				userFriendGroupData[_data.groupId] = {
					"groupId":_data.groupId,
					"groupName":_data.groupName
				};
			}

			//初始化好友分组完成,继续初始化我的好友列表
			//进到好友页面默认点击我的好友
			$("#myFriendTab").click();
		}
	})
}

/**
 * 获取我的好友当前页的数据
 * @param pageNo 分页
 */
function getMyFriendGroupData(condition){
	$("#myFriendGroupContentDiv").html("");//清空数据
	if(condition.pageNo){
		$.ajax({
			url:path+"/userGroup/queryRecordsByPage",
			type:"POST",
			data:{
				"currentPage":condition.pageNo,
				"pageSize":8,
				"useProperty":condition.useProperty
			},
			dataType:"json",
			success:function(data){
				if(data.dataList.length < 1) {
					$("#myFriendGroupPaginationDIV").html("");//清空页码
					return; //如果没有查询到数据，就不分页
				}
				if(condition.pageNo==1){//如果是第一页，则初始化分页
					initMyFriendGroupPagination(data);
				}
				initMyFriendGroupData(data);
			}
		})
	}
}

/**
 * 初始化分页条
 * @param pageData
 */
function initMyFriendGroupPagination(pageData) {
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
				var friendGroupCondition = {
					pageNo:1,
					useProperty:CONST_USE_PROPERTY_FRIEND
				};//查询条件初始化
				getMyFriendGroupData(friendGroupCondition);//重新拉取数据
			}
		}
	}
	$("#myFriendGroupPaginationDIV").bootstrapPaginator(options);
}

/**
 * 初始化我的好友分组的数据
 * @param data
 */
function initMyFriendGroupData(data) {
	var myFriendGroupDivTemplete = '<tr>'+
		'<th scope="row"><input type="checkbox" class="checkbox" name="types_checkbox"></th>'+
		'<td>groupNameValue</td>'+
		'<td>groupTimeValue</td>'+
		'<td><a href="javascript:void(0)" data-toggle="modal" data-backdrop="" data-groupid="groupIdValue" data-groupname="groupNameValue" autocomplete="off" data-target="#createMyFriendGroupDialog"><i class="fa fa-pencil"></i>'+friendContent.edit+'</a> | <a href="javascript:void(0)" data-groupid="groupIdValue" name="deleteFriendGroup"><i class="fa fa-times"></i>'+friendContent.delete+'</a></td>'+
		'</tr>';
	var defaultGroupDivTemplate = '<tr>'+
		'<th scope="row"><input type="checkbox" class="checkbox" name="types_checkbox"></th>'+
		'<td>groupNameValue</td>'+
		'<td>groupTimeValue</td>'+
		'<td><a href="javascript:void(0)" style="cursor:not-allowed"><i class="fa fa-pencil"></i>'+friendContent.edit+'</a> | <a href="javascript:void(0)" style="cursor:not-allowed"><i class="fa fa-times"></i>'+friendContent.delete+'</a></td>'+
		'</tr>';

	var list = data.dataList;
	for (var index in list) {
		var _data = list[index];
		var _replace = "";
		if(_data.userId == "1000") {
			_replace = defaultGroupDivTemplate;
		}else {
			_replace = myFriendGroupDivTemplete;
		}
		_replace = _replace.replace(/groupNameValue/g, _data.groupName).replace(/groupIdValue/g, _data.groupId).replace(/groupTimeValue/g, _data.createdTime);
		$("#myFriendGroupContentDiv").append(_replace);
	}

	/**
	 *Group的A标签删除点击事件
	 *@Author liuchen6
	 *@Date 2016/7/5 15:38
	 */
	$("a[name='deleteFriendGroup']").click(function () {
		var userFriendGroupId = $(this).attr("data-groupid");
		$.ajax({
			url:path+"/userGroup/delete",
			type:"POST",
			data:{
				"groupId":userFriendGroupId
			},
			dataType:"json",
			success:function(){
				alert("success!");
				$("#myFriendGroupTab").click(); //重新加载用户分组的数据
			}
		})
	})
}

/**
 * 获取我的好友当前页的数据
 * @param pageNo 分页
 */
function getMyFriendData(condition){
	$("#myFriendContentDiv").html("");//清空数据
	var loader=SLLib.loader({
		ele:"#panel-myFriend",
		spinner:"spinner2",
		height:"500px"
	});
	loader.start();
	if(condition.pageNo){
		$.ajax({
			url:path+"/userFriend/queryRecordsByPage",
			type:"POST",
			data:{
				"currentPage":condition.pageNo,
				"pageSize":4,
				"friendName":condition.friendNameCondition,
				"status":condition.status,
				"groupId":condition.userFriendGroupCondition
			},
			dataType:"json",
			success:function(data){
				loader.stop();
				if(data.dataList.length < 1) {
					$("#myFriendPaginationDIV").html("");//清空页码
					return; //如果没有查询到数据，就不分页
				}
				if(condition.pageNo==1){//如果是第一页，则初始化分页
					initMyFriendPagination(data);
					//提前加载所有好友的List，主要用在email选择好友
					loadMyAllFriendList();
				}
				initMyFriendData(data);
			}
		})
	}
}
/**
 * 初始化分页条
 * @param pageData
 */
function initMyFriendPagination(pageData) {
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
				userFriendCondition.pageNo = newPage;
				userFriendCondition.friendNameCondition = $("#searchName").val().trim();
				userFriendCondition.userFriendGroupCondition = $("#friendGroupCondition").children('option:selected').attr("data-groupId")
				userFriendCondition.status = CONST_FRIEND;
				getMyFriendData(userFriendCondition); //重新拉取数据
			}
		}
	}
	$("#myFriendPaginationDIV").bootstrapPaginator(options);
}
/**
 * 初始化我的好友的数据
 * @param data
 */
function initMyFriendData(data) {
	var myFriendDivTemplete = '<div class="panel panel-default width350 pull-left">' +
		'<img src="${basePath}/common/images/people.jpg" style="vertical-align:top;width:59px;height:59px;margin: 5px;">' +
		'<div class="inline-block center" style="height: 50px;">' +
		'<div style="width: 270px;">' +
		'<span class="text-muted inline-block" style="margin-top: 5px;">${friendName}</span>' +
		'<span class="glyphicon glyphicon-remove pull-right inline-block cursor-pointer" style="margin-left: 10px;margin-top: 5px;color: #d9d9d1;" data-ufid="ufIdVal"></span>' +
		'<span class="glyphicon glyphicon-envelope pull-right cursor-pointer" style="margin-left: 10px;margin-top: 5px;color: #d9d9d1;" data-friendid="friendIdVal" data-toggle="modal" data-backdrop="" autocomplete="off" data-target="#createEmailDialog"></span>' +
		'</div>' +
		'<div class="width250" style="margin-top: 10px;">' +
		'<select id="ufIdVal" class="selectpicker form-control width80 input-sm">' +
		'</select>' +
		'</div>' +
		'</div>' +
		'</div>';
	var list = data.dataList;
	for (var index in list) {
		var _data = list[index];
		var _replace = myFriendDivTemplete.replace("${basePath}", path).replace("${friendName}", _data.friendName).replace(/ufIdVal/g, _data.ufId).replace(/friendIdVal/g, _data.friendId);
		$("#myFriendContentDiv").append(_replace);
		for(var obj in userFriendGroupData) {
			var option = "<option data-groupId="+obj+">"+userFriendGroupData[obj].groupName+"</option>";
			if(obj == _data.groupId) {
				var option = "<option selected>"+userFriendGroupData[obj].groupName+"</option>";
			}
			$("#"+ _data.ufId).prepend(option);
		}
		$("#"+ _data.ufId).change(function () {
			var groupId = $(this).children('option:selected').attr("data-groupId");
			var ufId = $(this).attr("id");
			$.ajax({//保存好友信息，主要针对好友分组的改变
				url:path+"/userFriend/save",
				type:"POST",
				data:{
					"ufId":ufId,
					"groupId":groupId
				},
				dataType:"json",
				success:function(){
					$.confirm({
						title:"",
						content:friendContent.editGroupNameSuccess,
						autoClose: 'confirm|2000',
						cancelButton:false
					});
				}
			})
		})
	}

	//删除好友按钮点击事件
	$(".glyphicon-remove").click(function () {
		var ufid = $(this).attr("data-ufid");
		$.confirm({
			container:window.top.document.body,
			content:friendContent.confirmDeleteFriend,
			confirm:function () {
				deleteUserFriend(ufid);
			},
			cancel:function () {
			}
		});
	})
}

function deleteUserFriend(ufId) {
	if(ufId){
		$.ajax({
			url:path+"/userFriend/delete",
			type:"POST",
			data:{
				"ufId":ufId
			},
			dataType:"json",
			success:function(data){
				$.confirm({
					container:window.top.document.body,
					title:"",
					content:friendContent.deleteFriendSuccess,
					autoClose: 'confirm|2000',
					cancelButton:false
				});
				//刷新页面
				$("#myFriendTab").click();
			}

		})
	}
	
}

/**
 * 获取我的好友申请页的数据
 * @param pageNo 分页
 */
function getMyFriendApplyData(condition){
	$("#myFriendApplyContentDiv").html("");//清空数据
	if(condition.pageNo){
		$.ajax({
			url:path+"/userFriend/queryRecordsByPage",
			type:"POST",
			data:{
				"currentPage":condition.pageNo,
				"pageSize":4,
				"friendName":condition.friendNameCondition,
				"status":condition.status
			},
			dataType:"json",
			success:function(data){
				if(data.dataList.length < 1) {
					$("#myFriendPaginationApplyDIV").html("");//清空页码
					return; //如果没有查询到数据，就不分页
				}
				if(condition.pageNo==1){//如果是第一页，则初始化分页
					initMyFriendApplyPagination(data);
				}
				initMyFriendApplyData(data);
			}
		})
	}
}

/**
 * 初始化我的好友申请列表的分页条
 * @param pageData
 */
function initMyFriendApplyPagination(pageData) {
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
				userFriendCondition.pageNo = newPage;
				userFriendCondition.friendNameCondition = $("#searchName").val().trim();
				userFriendCondition.status = CONST_APPLY_FRIEND;
				getMyFriendApplyData(userFriendCondition); //重新拉取数据
			}
		}
	}
	$("#myFriendPaginationApplyDIV").bootstrapPaginator(options);
}

/**
 * 初始化我的好友申请的数据
 * @param data
 */
function initMyFriendApplyData(data) {
	var myFriendApplyDivTemplete = '<div class="panel panel-default width350 pull-left margin-left-10px">'+
		'<img src="${basePath}/common/images/people.jpg" style="vertical-align:top;width:59px;height:59px;margin: 5px;">'+
		'<div class="inline-block center" style="height: 50px;">'+
		'<div style="width: 270px;">'+
		'<span class="text-muted inline-block pull-left margin-left-10px" style="margin-top: 5px;">${friendName}</span>'+
		'<span class="pull-right inline-block cursor-pointer" style="margin-left: 10px;margin-top: 5px;">'+
		'<a href="javascript:void(0)" data-ufId="ufIdValue"  name="refuseAdd">'+friendContent.refuse+'</a>'+
		'</span>'+
		'<span class="pull-right cursor-pointer" style="margin-left: 10px;margin-top: 5px;">'+
		'<a href="javascript:void(0)" data-ufId="ufIdValue" name="allowAdd">'+friendContent.accept+'</a>'+
		'</span>'+
		'</div>'+
		'<div class="width250 clear-both">'+
		'<select id="ufIdValue" class="form-control width80 input-sm pull-left" style="margin-top: 10px;">'+
		'</select>'+
		'</div>'+
		'</div>'+
		'</div>';
	var list = data.dataList;
	for (var index in list) {
		var _data = list[index];
		var _replace = myFriendApplyDivTemplete.replace("${basePath}", path).replace("${friendName}", _data.friendName).replace(/ufIdValue/g, _data.ufId);
		$("#myFriendApplyContentDiv").append(_replace);
		for(var obj in userFriendGroupData) {
			var option = "<option data-groupId="+obj+">"+userFriendGroupData[obj].groupName+"</option>";
			if(obj == _data.groupId) {
				var option = "<option selected>"+userFriendGroupData[obj].groupName+"</option>";
			}
			$("#"+ _data.ufId).prepend(option);
		}
		$("#"+ _data.ufId).change(function () {
			var groupId = $(this).children('option:selected').attr("data-groupId");
			var ufId = $(this).attr("id");
			$.ajax({//保存好友信息，主要针对好友分组的改变
				url:path+"/userFriend/save",
				type:"POST",
				data:{
					"ufId":ufId,
					"groupId":groupId
				},
				dataType:"json",
				success:function(){
					$.confirm({
						container:window.top.document.body,
						title:"",
						content:friendContent.editGroupNameSuccess,
						autoClose: 'confirm|2000',
						cancelButton:false
					});
				}
			})
		})
	}
	/**
	 * 同意添加好友的点击事件
	 *@Author liuchen6
	 *@Date 2016/7/4 15:21
	 */
	$("a[name='allowAdd']").click(function () {
		var ufId = $(this).attr("data-ufId");
		$.ajax({
			url:path+"/userFriend/saveNewFriend",
			type:"POST",
			data:{
				"ufId":ufId,
				"groupId":"1"
			},
			dataType:"json",
			success:function(data){
				$.confirm({
					container:window.top.document.body,
					title:"",
					content:data.msg,
					autoClose: 'confirm|2000',
					cancelButton:false
				});
				$("#myFriendApplyTab").click();
			}
		})
	});

	/**
	 * 拒绝添加好友的点击事件
	 *@Author liuchen6
	 *@Date 2016/7/4 15:21
	 */
	$("a[name='refuseAdd']").click(function () {
		var ufId = $(this).attr("data-ufId");
		$.confirm({
			container:window.top.document.body,
			content:friendContent.refuseFriendTip,
			confirm:function () {
				//删除该条添加好友的信息
				$.ajax({
					url:path+"/userFriend/delete",
					type:"POST",
					data:{
						"ufId":ufId
					},
					dataType:"json",
					success:function(){
						$.confirm({
							container:window.top.document.body,
							title:"",
							content:friendContent.refused,
							autoClose: 'confirm|2000',
							cancelButton:false
						});
						$("#myFriendApplyTab").click();
					}
				})
			},
			cancel:function () {
			}
		});
	});
}

function loadMyAllFriendList() {
	var userAllFriendCondition = {
		pageNo:1,
		friendName:"",
		status:CONST_FRIEND
	};//查询条件初始化

	getAllMyFriendData(userAllFriendCondition);//取到好友列表
}

/**
 * 获取我的好友当前页的数据
 * @param pageNo 分页
 */
function getAllMyFriendData(condition){
	if(condition.pageNo){
		$.ajax({
			url:path+"/userFriend/queryRecordsByPage",
			type:"POST",
			data:{
				"currentPage":condition.pageNo,
				"pageSize":1000,
				"friendName":condition.friendNameCondition,
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
