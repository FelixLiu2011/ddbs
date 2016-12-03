/**
 * 
 * @authors Your Name (you@example.org)
 * @date    2016-03-14 16:20:27
 * @version $Id$
 */
var htmlDiv = "";
// 初始化Web Uploader
if(uploader){
    uploader.destroy();
}
var uploader = WebUploader.create({

    // 选完文件后，是否自动上传。
    auto: false,

    // swf文件路径
    swf:staticCtx+'js/Uploader.swf',

    // 文件接收服务端。
    server: 'http://up.qiniu.com/',

    // 选择文件的按钮。可选。
    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
     pick: {
            id: '#filePicker',
            label: $.t("global.selectPhoto")
        },

    // 只允许选择图片文件。
    accept: {
        title: 'Images',
        extensions: 'gif,jpg,jpeg,bmp,png',
        mimeTypes: 'image/*'
    },
    fileSizeLimit: 50 * 1024 * 1024,    // 
    fileSingleSizeLimit: 5 * 1024 * 1024    // 5 M
});

//uploader.upload();

function photo_init(){
	$.ajax({
        url: path + '/Image/uploadInit',
		data: {type:'A', imgNum:1},
        datatype: "json",
        type: 'post',
        success: function (e) {   //成功后回调
        	//console.log(e);
        	$("#token").val(e.obj.upToken);
        	$("#key").val(e.obj.img);        	
        	//alert(e.obj.upToken+":"+e.obj.img);
        	uploader.upload();
        	
			/*var img = e.obj.img;
			var url = "http://7xqybr.com1.z0.glb.clouddn.com/" + img + "?imageMogr2/thumbnail/410x300";
			$("#imgval").attr("src", url);
			$("#imgval1").attr("src", url);
			$("#imgval2").attr("src", url);
			$("#imgval3").attr("src", url);
			$(".img-editcon,").css("display", "none")
			$(".img-shear").css("display", "block")*/
        	
        },
        error: function(e){    //失败后回调
           
        },
        beforeSend: function(){  //发送请求前调用，可以放一些"正在加载"之类额话
           
        }
	});
}

uploader.on('fileQueued',function(){photo_init()});

uploader.on('uploadBeforeSend', function(block, data) {       
    // console.log('as:' +block)
	data.key = $("#key").val();
	data.token = $("#token").val();
});
uploader.on('uploadSuccess',function(){
	// 上传成功时，重新加载DIV数据

});
uploader.onError = function( code ) {
    console.log( 'Eroor: ' + code );
   if (code == "F_EXCEED_SIZE") {
       layer.msg($.t("global.uploadBig"))
   }
   if (code == "Q_TYPE_DENIED") {
       layer.msg($.t("global.uploadTypeError"))
   }
};
uploader.on('uploadFinished',function(block, data){

});

/*function updatePreview(c){
    if (parseInt(c.w) > 0) {
      var rx = xsize / c.w;
      var ry = ysize / c.h;

      $pimg.css({
        width: Math.round(rx * boundx) + 'px',
        height: Math.round(ry * boundy) + 'px',
        marginLeft: '-' + Math.round(rx * c.x) + 'px',
        marginTop: '-' + Math.round(ry * c.y) + 'px'
      });
    }
}*/

//文件上传开始
/*头像裁剪*/
uploader.on('uploadAccept', function(block, data) {
    var img = data.key;
    var url = qiniuImgUrl + img + "?imageMogr2/thumbnail/410x300";
    //$.ajaxSetup({cache: true});

    //$("#cjimgurl").val(img);
    $("#imgdataurl").val(img);
	
    //console.log(url);
    //$("#target").attr('src', url);
    $("#imgval1").attr("src", url);
    $("#imgval2").attr("src", url);
    $("#imgval3").attr("src", url);
    $('#target').attr("src", url);
    if(jcrop_api.setImage){
        $(".jcrop-holder img").attr("src","");
    }
    layer.load(2);
    $('#target').off("load");
    $('#target').load(function(){
        layer.closeAll('loading');
        $(".img-editcon").css("display", "none");
        $(".img-shear").css("display", "block");
        if(jcrop_api.setImage){
            jcrop_api.setImage(url);
            jcrop_api.setSelect([100,70,230,200]);
        }else{
            $('#target').Jcrop({
                onChange:  updatePreview,
                onSelect:  updatePreview
			    //onRelease:  clearCoords
            },function(){
                jcrop_api = this;
			    jcrop_api.enable();
                jcrop_api.setSelect([100,70,230,200]);
            });
        }
    });

});
	
	
	
	
	
	
	
	
	