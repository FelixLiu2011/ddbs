var platformDictConsumeType=[{"dctyId":1,"dctyCode":"红包","dctyRemark":"红包","dctyParentid":0},{"dctyId":2,"dctyCode":"电商","dctyRemark":"电商","dctyParentid":0},{"dctyId":3,"dctyCode":"会员升级","dctyRemark":"会员升级","dctyParentid":0},{"dctyId":4,"dctyCode":"翻译","dctyRemark":"翻译","dctyParentid":0},{"dctyId":5,"dctyCode":"私信翻译","dctyRemark":"私信翻译","dctyParentid":4},{"dctyId":6,"dctyCode":"IM翻译","dctyRemark":"IM翻译","dctyParentid":4},{"dctyId":7,"dctyCode":"动态翻译","dctyRemark":"动态翻译","dctyParentid":4},{"dctyId":8,"dctyCode":"虚拟礼物","dctyRemark":"虚拟礼物","dctyParentid":2},{"dctyId":9,"dctyCode":"表情","dctyRemark":"表情","dctyParentid":2},{"dctyId":10,"dctyCode":"翻译包","dctyRemark":"翻译包","dctyParentid":2},{"dctyId":11,"dctyCode":"商城消费","dctyRemark":"商城消费","dctyParentid":2},{"dctyId":12,"dctyCode":"游戏","dctyRemark":"游戏","dctyParentid":0},{"dctyId":13,"dctyCode":"展现天数","dctyRemark":"展现天数","dctyParentid":0},{"dctyId":14,"dctyCode":"私信条数","dctyRemark":"私信条数","dctyParentid":0},{"dctyId":15,"dctyCode":"主页照片展示张数","dctyRemark":"主页照片展示张数","dctyParentid":0},{"dctyId":17,"dctyCode":"一键50位异性购买","dctyRemark":"一键50位异性购买","dctyParentid":14},{"dctyId":19,"dctyCode":"聊天窗口购买","dctyRemark":"聊天窗口购买","dctyParentid":14},{"dctyId":21,"dctyCode":"其他","dctyRemark":"其他","dctyParentid":0},{"dctyId":200,"dctyCode":"充值","dctyRemark":"充值","dctyParentid":0},{"dctyId":201,"dctyCode":"提现","dctyRemark":"提现","dctyParentid":0}];
function getPlatformDictConsume(consumeParentId,consumedesc){
	for(var i =0;i<platformDictConsumeType.length;i++){
		var item = platformDictConsumeType[i];
		if(item.dctyParentid == consumeParentId){
			//console.log(e.dctyRemark);
			return item.dctyRemark;
		}else{
			return consumedesc;
		}
	}
}