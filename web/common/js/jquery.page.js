//分页插件
/**
2014-08-05 ch
**/
(function($){
	var ms = {
		init:function(obj,args){
			return (function(){
				ms.fillHtml(obj,args);
				ms.bindEvent(obj,args);
				if(args.initTrig&&args.pageCount){
					args.backFn(1);
				}
			})();
		},
		triggerCur:function(obj,args){
			var current = 1;//parseInt(obj.children("span.current").text())||1;
			ms.fillHtml(obj,{"current":current,"pageCount":args.pageCount||1});
			if(typeof(args.backFn)=="function"){
				args.backFn(current);
			}
		},
		//填充html
		fillHtml:function(obj,args){
			return (function(){
				obj.empty();
				//上一页
				if(args.pageCount>10) {
					if (args.current > 1) {
						obj.append('<a href="javascript:;" class="prevPage"></a>');
					} else {
						obj.remove('.prevPage');
						obj.append('<span class="disabled"></span>');
					}
				}
				//中间页码
				if( args.current >= 6){
					obj.append('<a href="javascript:;" class="tcdNumber">'+1+'</a>');
				}
				if(args.current> 6 && args.current <= args.pageCount){
					obj.append('<span>...</span>');
				}
				var start = args.current -4,end = args.current+4;
				if(start<1){
					end=8;
				}else{
					end--;
				}
				for (;start <= end; start++) {
					if(start <= args.pageCount && start >= 1){
						if(start != args.current){
							obj.append('<a href="javascript:;" class="tcdNumber">'+ start +'</a>');
						}else{
							obj.append('<span class="current">'+ start +'</span>');
						}
					}
				}
				if(args.current + 4< args.pageCount && args.current >= 1 && args.pageCount > 9){
					obj.append('<span>...</span>');
				}
				if(args.current != args.pageCount && args.current < args.pageCount -3&& args.pageCount > 8){
					obj.append('<a href="javascript:;" class="tcdNumber">'+args.pageCount+'</a>');
				}
				//下一页
				 if(args.pageCount>10){
					if(args.current < args.pageCount){
						obj.append('<a href="javascript:;" class="nextPage"></a>');
					}else{
						obj.remove('.nextPage');
						obj.append('<span class="disabled1"></span>');
					}
				 }
				//只有一页隐藏, 否则显示
				if(args.pageCount==1 || args.pageCount==0) {
					obj.addClass('hide');
				}else{
					obj.removeClass('hide');
				}
			})();
		},
		//绑定事件
		bindEvent:function(obj,args){
			return (function(){
				obj.off("click");
				obj.on("click","a.tcdNumber",function(){
					var current = parseInt($(this).text());
					ms.fillHtml(obj,{"current":current,"pageCount":args.pageCount});
					if(typeof(args.backFn)=="function"){
						args.backFn(current);
					}
				});
				//上一页
				obj.on("click","a.prevPage",function(){
					var current = parseInt(obj.children("span.current").text());
					ms.fillHtml(obj,{"current":current-1,"pageCount":args.pageCount});
					if(typeof(args.backFn)=="function"){
						args.backFn(current-1);
					}
				});
				//下一页
				obj.on("click","a.nextPage",function(){
					var current = parseInt(obj.children("span.current").text());
					ms.fillHtml(obj,{"current":current+1,"pageCount":args.pageCount});
					if(typeof(args.backFn)=="function"){
						args.backFn(current+1);
					}
				});
			})();
		}
	}
	$.fn.createPage = function(options){
		//扩展分页方法
		if(typeof options==='string'){
			var dop=$(this).data("cpOption");
			$(this).data(options)(this,dop);
			return;
		}
		var args = $.extend({
			pageCount : 10,
			current : 1,
			initTrig:false,//初始化触发
			backFn : function(){}
		},options);
		ms.init(this,args);
		$(this).data("cpOption",args);
		$(this).data("triggerCur",ms.triggerCur);
		return this;
	}
})(jQuery);

//代码整理：懒人之家 www.lanrenzhijia.com