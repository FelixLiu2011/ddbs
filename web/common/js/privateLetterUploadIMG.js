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
		   id: '#chatConBottom .imgBtn',
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
	function LetterupIMG(){	
		var LetterupIMGgagaID = "";
        var LetterupLoadImgContainer ="";
		var urlIMGPath="";
        uploader.on('beforeFileQueued', function (file) {
			//console.log("文件被加入队列之前触发："+file);
			$.post(path+"/Image/uploadInit",{"type":"M","imgNum":1},function(regImg){
				if(regImg.success){		
					//console.log("七牛权限："+regImg);
					//console.log("七牛权限："+JSON.stringify(regImg));
					//$("#Im_data").attr({"data-token":regImg.obj.upToken,"data-imgname":regImg.obj.img[0]});
					$("#chatConBottom .imgBtn").attr({"data-token":regImg.obj.upToken,"data-imgname":regImg.obj.img[0]});
					uploader.upload();
					urlIMGPath = regImg.attributes.imgUrlPre + regImg.obj.img[0];
					LetterupIMGgagaID =  ContactsUl.children(".activeContacts").attr("data-gagaID");
					LetterupLoadImgContainer = $("#chatMiddle ").children("[data-gagaID = " + LetterupIMGgagaID + "]").find(".upLoadImgContainer");
					LetterupLoadImgContainer.show();
					LetterupLoadImgContainer.find(".upLoadContnet").hide();
					LetterupLoadImgContainer.find(".upLoadImging").css("background", "url("+staticCtx+"img/upLoadImging.gif) no-repeat").show();
					LetterupLoadImgContainer.find(".upLoadImgState").text($.t("Letter.uploadIng")).css("color", "#333").show();
					LetterupLoadImgContainer.find(".upLoadImgDelete").hide();
					LetterupLoadImgContainer.find(".upLoadImgName").text(regImg.obj.img[0]);
					LetterupLoadImgContainer.attr("data-imgId", regImg.obj.img[0]);
		            $("#chatConBottom .sendBtn").css({
				        "color": "#fff",
				        "background-color": "#2D57A1"
				    });
				}
			});
		});
		// 当有文件添加进来的时候
		uploader.on('fileQueued', function (file) {
			//console.log("上传图片加入列队："+file);
		   // $(".upLoadImgContainer").show();
		});
		uploader.on('uploadBeforeSend', function(block, data) {
		    data.key = $("#chatConBottom .imgBtn").attr("data-imgname");
		    data.token = $("#chatConBottom .imgBtn").attr("data-token");
		});
		//当一批文件添加进队列以后触发。
		uploader.on('filesQueued', function (files) {
		        //console.log("当一批文件添加进队列以后触发"+files);
		});
		uploader.on('uploadSuccess', function (file) {
			//console.log("成功："+JSON.stringify(file));
			//console.log("成功："+file);
			LetterupLoadImgContainer.show();
			LetterupLoadImgContainer.find(".upLoadImg").attr("src", urlIMGPath);
			LetterupLoadImgContainer.find(".upLoadContnet").show();
			LetterupLoadImgContainer.find(".upLoadImging").hide();
			LetterupLoadImgContainer.find(".upLoadImgState").hide();
			LetterupLoadImgContainer.find(".upLoadImgDelete").show();
            $(".FunBtncontainer .sendBtn").css({ "color": "#fff", "background-color": "#2D57A1" });
            
            
		});
		uploader.on('uploadError', function (file) {
			//console.log("失败："+JSON.stringify(file));
			//console.log("失败："+file);
			LetterupLoadImgContainer.show();
			LetterupLoadImgContainer.find(".upLoadContnet").hide();
			LetterupLoadImgContainer.find(".upLoadImging").css("background", "url(" + staticCtx + "img/IMicon.png) -472px -80px no-repeat").show();
			LetterupLoadImgContainer.find(".upLoadImgState").text($.t("Letter.uploadFailed")).css("color", "#d24040").show();
			LetterupLoadImgContainer.find(".upLoadImgDelete").show();
		});
		uploader.on('uploadComplete', function (file) {
			 //console.log("完成："+JSON.stringify(file));
			 //console.log("完成："+file);
		});
	};
	$(".imgBtn1 input").click();
	LetterupIMG();
})();