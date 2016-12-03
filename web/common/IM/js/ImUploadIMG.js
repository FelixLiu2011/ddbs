(function(){
	//初始化Web Uploader
	var uploader = WebUploader.create({
		// 选完文件后，是否自动上传。
		//auto: true,
		// swf文件路径
		swf: staticCtx+'js/Uploader.swf',
		// 文件接收服务端。
		server: "http://up.qiniu.com",
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: {
		   id: '.js_imgBtn',
		   multiple: false
		},
		duplicate: true,
		// 只允许选择图片文件。
		accept: {
		   title: 'Images',
		   extensions: 'gif,jpg,jpeg,bmp,png',
		   mimeTypes: 'image/*'
		}
	});
	function IMupIMG(){	
		var IMupIMGgagaID = "";
        var IMupLoadImgContainer ="";
		var urlIMGPath="";
        uploader.on('beforeFileQueued', function (file) {
			//console.log("文件被加入队列之前触发："+file);
			$.post(path+"/Image/uploadInit",{"type":"I","imgNum":1},function(regImg){
				if(regImg.success){		
					//console.log("七牛权限："+regImg);
					//console.log("七牛权限："+JSON.stringify(regImg));
					$(".FunBtncontainer .js_imgBtn").attr({"data-token":regImg.obj.upToken,"data-imgname":regImg.obj.img[0]});
					uploader.upload();
					urlIMGPath = regImg.attributes.imgUrlPre + regImg.obj.img[0];
					IMupIMGgagaID = $(".lowerLeft .chatPeopleChoiced").attr("data-gagaid");
					IMupLoadImgContainer = $(".lowerRight ").children("[data-gagaID = " + IMupIMGgagaID + "]").find(".upLoadImgContainer");
					IMupLoadImgContainer.show();
		            IMupLoadImgContainer.find(".upLoadContnet").hide();
		            IMupLoadImgContainer.find(".upLoadImging").css("background", "url("+staticCtx+"img/upLoadImging.gif) no-repeat").show();
		            IMupLoadImgContainer.find(".upLoadImgState").text($.t("Letter.uploadIng")).css("color", "#333").show();
		            IMupLoadImgContainer.find(".upLoadImgDelete").hide();
		            IMupLoadImgContainer.find(".upLoadImgName").text(regImg.obj.img[0]);
		            IMupLoadImgContainer.attr("data-imgId", regImg.obj.img[0]);
		            
				}
			});
		});
		// 当有文件添加进来的时候
		uploader.on('fileQueued', function (file) {
			//console.log("上传图片加入列队："+file);
		    //IMupLoadImgContainer.show();
		});
		uploader.on('uploadBeforeSend', function(block, data) {
		    data.key = $(".FunBtncontainer .js_imgBtn").attr("data-imgname");
		    data.token = $(".FunBtncontainer .js_imgBtn").attr("data-token");
		});
		//当一批文件添加进队列以后触发。
		uploader.on('filesQueued', function (files) {
		        //console.log("当一批文件添加进队列以后触发"+files);
		});
		uploader.on('uploadSuccess', function (file) {
			//console.log("成功："+JSON.stringify(file));
			//console.log("成功："+file);
			IMupLoadImgContainer.show();
			IMupLoadImgContainer.find(".upLoadImg").attr("src", urlIMGPath);
			IMupLoadImgContainer.find(".upLoadContnet").show();
			IMupLoadImgContainer.find(".upLoadImging").hide();
			IMupLoadImgContainer.find(".upLoadImgState").hide();
			IMupLoadImgContainer.find(".upLoadImgDelete").show();
            $(".FunBtncontainer .sendBtn").css({ "color": "#fff", "background-color": "#2D57A1" });
            
            
		});
		uploader.on('uploadError', function (file) {
			//console.log("失败："+JSON.stringify(file));
			//console.log("失败："+file);
			IMupLoadImgContainer.show();
			IMupLoadImgContainer.find(".upLoadContnet").hide();
			IMupLoadImgContainer.find(".upLoadImging").css("background", "url(" + staticCtx + "img/IMicon.png) -472px -80px no-repeat").show();
			IMupLoadImgContainer.find(".upLoadImgState").text($.t("Letter.uploadFailed")).css("color", "#d24040").show();
			IMupLoadImgContainer.find(".upLoadImgDelete").show();
		});
		uploader.on('uploadComplete', function (file) {
			 //console.log("完成："+JSON.stringify(file));
			 //console.log("完成："+file);
		});
	};
	$(".imgBtn1 input").click();
	IMupIMG();
})();


