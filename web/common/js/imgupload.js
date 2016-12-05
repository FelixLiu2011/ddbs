// 个人主页图片上传
Zoneyet.define("Zoneyet.nms.myInfor.imgupload",function(){
    var $ = jQuery,
        fileNumLimitset = 9,//定义上传图片的数量
        $wrap = $('#uploader'),
         
        // 图片容器
        $queue = $('<ul class="filelist"></ul>').prependTo( $wrap.find('.queueList') ),
        // 状态栏，包括进度和控制按钮
        $statusBar = $wrap.find('.statusBar'),

        // 文件总体选择信息。
        $info = $statusBar.find('.info'),

        // 上传按钮
        $upload = $wrap.find('.uploadBtn'),

        // 没选择文件之前的内容。
        $placeHolder = $wrap.find('.placeholder'),

        // 总体进度条
        $progress = $statusBar.find('.progress').hide(),

        // 添加的文件数量
        fileCount = 0,

        // 添加的文件总大小
        fileSize = 0,
		 //剩余上传的数量
        fileSurplus = fileNumLimitset,

        // 优化retina, 在retina下这个值是2
        ratio = window.devicePixelRatio || 1,

        // 缩略图大小
        thumbnailWidth = 120 * ratio,
        thumbnailHeight = 120 * ratio,

        // 可能有pedding, ready, uploading, confirm, done.
        state = 'pedding',
		// 所有文件的进度信息，key为file id
        percentages = {},
        token,key,

        supportTransition = (function(){
            var s = document.createElement('p').style,
                r = 'transition' in s ||
                      'WebkitTransition' in s ||
                      'MozTransition' in s ||
                      'msTransition' in s ||
                      'OTransition' in s;
            s = null;
            return r;
        })(),

        // WebUploader实例
        uploader;

    if ( !WebUploader.Uploader.support() ) {
        layer.msg( 'Web Uploader 不支持您的浏览器！如果你使用的是IE浏览器，请尝试升级 flash 播放器');
        throw new Error( 'WebUploader does not support the browser you are using.' );
    }
    if(uploader){
        uploader.destroy();
    }
    // 实例化
   var uploader = WebUploader.create({
		auto:false,
        pick: {
            id: '#filePicker',
            label:$.t("global.selectPhoto")
        },
        dnd: '#uploader > .queueList',
        paste: document.body,
        thumb:{
            quality: 100
        },
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        },

        // swf文件路径
        swf:staticCtx+'js/Uploader.swf',

        disableGlobalDnd: true,

        chunked: true,
        server: 'http://up.qiniu.com/',
        fileNumLimit:fileNumLimitset,
        fileSizeLimit: 50 * 1024 * 1024,    // 50 M
        fileSingleSizeLimit: 5 * 1024 * 1024    // 5 M
    });

    // 添加“添加文件”的按钮，
    uploader.addButton({
        id: '#filePicker2',
        label: '继续添加'
    });

    // 当有文件添加进来时执行，负责view的创建
    function addFile( file ) {
		if($queue.find("li").size()>=8){
            $("#filePicker2").hide();
        }else{
            $("#filePicker2").show();
        }
        var $li = $( '<li id="' + file.id + '">' +
                '<p class="title">' + file.name + '</p>' +
                '<p class="imgWrap"></p>'+
                '<p ee="'+file.id+'" class="progress"><span></span></p>' +
                '</li>' ),

            $btns = $('<div class="file-panel">' +
              /*  '<span class="cancel">删除</span>' +*/
                '<span class="rotateRight">向右旋转</span>' +
                '<span class="rotateLeft">向左旋转</span></div>').appendTo( $li ),
            $prgress = $li.find('p.progress span'),
            $wrap = $li.find( 'p.imgWrap' ),
            $info = $('<span class="error"><span/>'),

            showError = function( code ) {
                switch( code ) {
                    case 'exceed_size':
                        text = '文件大小超出';
                        break;

                    case 'interrupt':
                        text = '上传暂停';
                        break;

                    default:
                        text = '';
                        break;
                }

                $info.text( text ).appendTo( $li );
            };

        if ( file.getStatus() === 'invalid' ) {
            showError( file.statusText );
        } else {
            // @todo lazyload
            $wrap.text( '预览中' );
            uploader.makeThumb( file, function( error, src ) {
                if ( error ) {
                    $wrap.text( '不能预览' );
                    return;
                }

                var img = $('<img src="'+src+'">');
                $wrap.empty().append( img );
            }, thumbnailWidth, thumbnailHeight );

            percentages[ file.id ] = [ file.size, 0 ];
            file.rotation = 0;
        }

        file.on('statuschange', function( cur, prev ) {
            if ( prev === 'progress' ) {
                //$prgress.hide().width(0);
            } else if ( prev === 'queued' ) {
                $li.off( 'mouseenter mouseleave' );
                $btns.remove();
            }

            // 成功
            if ( cur === 'error' || cur === 'invalid' ) {
                console.log( file.statusText );
                showError( file.statusText );
                percentages[ file.id ][ 1 ] = 0;
            } else if ( cur === 'interrupt' ) {
                showError( 'interrupt' );
            } else if ( cur === 'queued' ) {
                $prgress.css('display', 'block');
                $prgress.width("20%");
                percentages[ file.id ][ 1 ] = 0;
            } else if ( cur === 'progress' ) {
                $info.remove();
                $prgress.width("70%");
            } else if ( cur === 'complete' ) {
                $prgress.width("100%");
                percentages[ file.id ][ 1 ] = 1;
                updateTotalProgress();
                $li.append( '<span class="success"></span>' );
            }
            $li.removeClass( 'state-' + prev ).addClass( 'state-' + cur );
        });

        $li.on( 'mouseenter', function() {
            $btns.stop().animate({height: 30});
        });

        $li.on( 'mouseleave', function() {
            $btns.stop().animate({height: 0});
        });

        $btns.on( 'click', 'span', function() {
            var index = $(this).index(),
                deg;
           console.info(index);
            switch ( index ) {
                case 0:
                /*    uploader.removeFile( file );
                    return;*/
                    file.rotation += 90;
                    break
                case 1:
                  //  file.rotation += 90;
                    file.rotation -= 90;
                    break;

             /*   case 2:
                    file.rotation -= 90;
                    break;*/
            }

            if ( supportTransition ) {
                deg = 'rotate(' + file.rotation + 'deg)';
                $wrap.css({
                    '-webkit-transform': deg,
                    '-mos-transform': deg,
                    '-o-transform': deg,
                    'transform': deg
                });
            } else {
                $wrap.css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((file.rotation/90)%4 + 4)%4) +')');
                // use jquery animate to rotation
                // $({
                //     rotation: rotation
                // }).animate({
                //     rotation: file.rotation
                // }, {
                //     easing: 'linear',
                //     step: function( now ) {
                //         now = now * Math.PI / 180;

                //         var cos = Math.cos( now ),
                //             sin = Math.sin( now );

                //         $wrap.css( 'filter', "progid:DXImageTransform.Microsoft.Matrix(M11=" + cos + ",M12=" + (-sin) + ",M21=" + sin + ",M22=" + cos + ",SizingMethod='auto expand')");
                //     }
                // });
            }


        });

        $li.appendTo( $queue );
    }

    // 负责view的销毁
    function removeFile( file ) {
        var $li = $('#'+file.id);
        delete percentages[ file.id ];
        updateTotalProgress();
        $li.off().find('.file-panel').off().end().remove();
		if($queue.find("li").size()>9){
            $("#filePicker2").hide();
        }else{
			if($queue.find("li").size()===0){
				$("#filePicker").show();
				$("#filePicker2").hide();
				}
             else{ $("#filePicker2").show();
                  $("#filePicker").hide();}
        }
    }

    function updateTotalProgress() {
        var loaded = 0,
            total = 0,
            spans = $progress.children(),
            percent;

        $.each( percentages, function( k, v ) {
          //  total += v[ 0 ];
            total++;
          //  loaded += v[ 0 ] * v[ 1 ];
            loaded += 1 * v[ 1 ];
        } );
        percent = total ? loaded / total : 0;
        spans.eq( 0 ).text( Math.round( percent * 100 ) + '%' );
        spans.eq( 1 ).css( 'width', Math.round( percent * 100 ) + '%' );
        updateStatus();
    }
     var text = '', stats;
	/* 更新上传状态*/
    function updateStatus() {
       

        if ( state === 'ready' ) {
            text = $.t("home.uploadCountTip",{uploaded:fileCount,more:fileSurplus});
        } else if ( state === 'confirm' ) {
            stats = uploader.getStats();
            if ( stats.uploadFailNum ) {
                text = $.t("home.uploadResultTip",{uploaded:stats.successNum,failed:stats.uploadFailNum})+
                    '<a class="retry c-2d57a1 curPor mr10" href="#"> '+$.t("home.reupload")+'</a>'+$.t("home.or")+'<a class="ignore c-2d57a1 curPor ml10" href="#">'+$.t("home.ignore")+'</a>';
            }

        } else {
            stats = uploader.getStats();
            text = $.t("home.uploadCountTip",{uploaded:fileCount,more:fileSurplus});
        }

        $info.html( text );
    }

    function setState( val ) {
        var file, stats;

        if ( val === state ) {
            return;
        }

        $upload.removeClass( 'state-' + state );
        $upload.addClass( 'state-' + val );
        state = val;

        switch ( state ) {
            case 'pedding':
                $placeHolder.removeClass( 'element-invisible' );
                $queue.parent().removeClass('filled');
                $queue.hide();
                $statusBar.addClass( 'element-invisible' );
                uploader.refresh();
                break;

            case 'ready':
                $placeHolder.addClass( 'element-invisible' );
                $( '#filePicker2' ).removeClass( 'element-invisible');
                $queue.parent().addClass('filled');
                $queue.show();
                $statusBar.removeClass('element-invisible');
                uploader.refresh();
                break;

            case 'uploading':
                $( '#filePicker2' ).addClass( 'element-invisible' );
                $progress.show();
                $upload.text($.t('global.uploadHold'));
                break;

            case 'paused':
                $progress.show();
                $upload.text($.t('global.uploadContinue'));
                break;

            case 'confirm':
                $progress.show();
                $upload.text( 'wo' ).addClass( 'disabled').hide();
				
                stats = uploader.getStats();
				
                if ( stats.successNum && !stats.uploadFailNum ) {
					
                    setState( 'finish' );
                    return;
                }
                break;
            case 'finish':
            	var allimg = $("#pop_upLoad_box").attr("data-key")
            	var imgs = allimg.split(",");
            	var arr =  new Array();
            	for(var i=0;i<imgs.length;i++){
            		arr[i] = imgs[i];
            	}
                alert(arr.length);
            	$.post("http://localhost:8080/ihome/photo/upload",{"img" : arr},function(result){

                    alert(result.success);
            		 //刷新相册内容
	              	$.ajax({
	         			  type : "post",
	           		      url:ctx+"/Member/imgcount",
	                      success: function(data){
	    				  if(data.success){
	    					  $("#imgcount").text(data.obj.imgcount);
	    			          Zoneyet.nms.myInfor.photoPage(data.obj.pageNum,1);
	    									   }
	          							  }
	      				 });
	              	//更新动态
	                //zoneObj.reFresh(undefined, true);
                    if($(".ladyScroll").hasClass("photo-do")){
                        //增量操作了
                        $(".photo-control-all").data("upflag",true);
                    }else{
                        //更新删除上墙照片
                        walledList();
                        zoneObj.reFresh(undefined, true);
                    }
 				}, "json");
                stats = uploader.getStats();
                if ( stats.successNum ) {
                    setTimeout(function(){
                        $(".creditcon1,.img-upload").css("visibility","hidden");
                    },500);
                } else {
                    // 没有成功的图片，重设
                    state = 'done';
				}
       
                break;
        }

        updateStatus();
    }

    uploader.onFileQueued = function( file ) {
        fileCount++;
        fileSurplus--;
        fileSize += file.size;

        if ( fileCount === 1 ) {
            $placeHolder.addClass( 'element-invisible' );
            $statusBar.show();
            $("#filePicker2").show();
        }

        addFile( file );

        setState( 'ready' );
        updateTotalProgress();
        
    };

    var index=0;
    uploader.on('uploadBeforeSend', function(block, data) {
        key = $("#pop_upLoad_box").attr("data-key").split(',');
        token = $("#pop_upLoad_box").attr("data-upToken") ;
        data.key = key[index];
        data.token = token;
        index++;
    });

    uploader.on('uploadAccept', function(block, data) { 
        // console.log("上传成功:"+ data)
    });
    uploader.onFileDequeued = function( file ) {
        fileCount--;
        fileSurplus++;
        fileSize -= file.size;

        if ( !fileCount ) {
            setState( 'pedding' );
        }

        removeFile( file );
        updateTotalProgress();

    };

      uploader.on('all', function( type ) {
        var stats;
        switch( type ) {
            case 'uploadFinished':
                setState( 'confirm' );
                break;

            case 'startUpload':
                key = $("#pop_upLoad_box").attr("data-key") ;
                token = $("#pop_upLoad_box").attr("data-upToken") ;
                setState( 'uploading' );
                break;

            case 'stopUpload':
                setState( 'paused' );
                break;

        }
    });

    uploader.onError = function( code ) {
    	if (code == "Q_EXCEED_NUM_LIMIT") {
            layer.msg($.t("global.uploadMax"))
        }
        if (code == "F_DUPLICATE") {
            layer.msg($.t("global.uploadRepeat"))
        }
        if (code == "F_EXCEED_SIZE") {
            layer.msg($.t("global.uploadBig"))
        }
        if (code == "Q_TYPE_DENIED") {
            layer.msg($.t("global.uploadTypeError"))
        }
    };

    $upload.on('click', function() {
        if ( $(this).hasClass( 'disabled' ) ) {
            return false;
        }

        if ( state === 'ready' ) {
            uploader.upload();
        } else if ( state === 'paused' ) {
            uploader.upload();
        } else if ( state === 'uploading' ) {
            uploader.stop();
        }
    });

    $info.on( 'click', '.retry', function() {
        $(".creditcon1,.img-upload").css("visibility","hidden");
        state = 'pedding';
        uploader.destroy();
        $(".upload").click();
/*        var _imgNum=$queue.find("li").size();
        $.ajax({
            url: ctx+'/Image/uploadInit',
            data: {type:'P', imgNum:_imgNum},
            datatype: "json",
            type: 'post',
            success: function (e) {   //成功后回调
                //console.log(e);
                if(e.success){
                    $("#pop_upLoad_box").attr("data-key",e.obj.img);
                    $("#pop_upLoad_box").attr("data-upToken",e.obj.upToken);
                    //重新上传
                    uploader.retry();
                }
                //alert(e.obj.upToken+":"+e.obj.img);

            },
            error: function(e){    //失败后回调
            },
            beforeSend: function(){  //发送请求前调用，可以放一些"正在加载"之类额话
            }
        });*/
    } );

    $info.on( 'click', '.ignore', function() {
        $(".creditcon1,.img-upload").css("visibility","hidden");
    } );

    $upload.addClass( 'state-' + state );
    updateTotalProgress();
	uploader.on('filesQueued',function(){
		var _imgNum=$queue.find("li").size();
        var loadIndex = layer.load(0, {
            shade: 0.1
        });
		$.ajax({
			url: 'http://localhost:8080/Image/uploadInit',
			data: {type:'P', imgNum:_imgNum},
			datatype: "json",
            async:false,
			type: 'post',
			success: function (e) {   //成功后回调
				//console.log(e);
                layer.close(loadIndex);
				if(e.success){
					$("#pop_upLoad_box").attr("data-key",e.obj.img);
					$("#pop_upLoad_box").attr("data-upToken",e.obj.upToken);      	
				}
				//alert(e.obj.upToken+":"+e.obj.img);
				
			},
			error: function(e){    //失败后回调
			},
			beforeSend: function(){  //发送请求前调用，可以放一些"正在加载"之类额话  
			}
		});
	});
},true)
