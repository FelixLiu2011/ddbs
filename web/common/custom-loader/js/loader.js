/***
 * 自定义加载数据等待
 *使用注意:
 * width:100%----设置这个属性时，通过$(...).width()可能拿到的宽度可能为空，此时 将设置加载的Div "margin-left:50%"
 *height:100%----设置这个属性时，通过$(...).height()可能拿到的高度可能为空，设置div "margin-top:50%"不起作用，而这个时候务必设置高度为固定像素
 */
(function(window,$) {
    if(!$){
        throw "jquery is not loaded!";
    }
    var SLLib = SLLib || {};
    SLLib.loader = SLLib.loader || {};
    SLLib.loader = function (options) {
        options=options||{};
        var defaultOptions = {
            ele: window.document.body,//要应用的元素
            pos: 'fixed',// Default Position
            top: '0px',  // Default Top value
            left: '0px', // Default Left value
            width: '100%', // Default width
            height: '100%', // Default Height
            zIndex: '999',  // Default zIndex
           // bgColor: '#2ecc71', // Default background color
            bgColor:"#fcf5f1",//Default background color
            spinner: 'spinner7', // Default Spinner
            imagePath: '', // Default Path custom image
            reposition:false //是否要重新根据el的位置来重新定位loaderDiv的位置(默认为`否`)
        };
        var _options = $.extend(defaultOptions, options);//继承
        //Customized Spinners
        var spinner01 = '<div class="fl spinner1"><div class="double-bounce1"></div><div class="double-bounce2"></div></div>';
        var spinner02 = '<div class="fl spinner2"><div class="spinner-container container1"><div class="circle1"></div><div class="circle2"></div><div class="circle3"></div><div class="circle4"></div></div><div class="spinner-container container2"><div class="circle1"></div><div class="circle2"></div><div class="circle3"></div><div class="circle4"></div></div><div class="spinner-container container3"><div class="circle1"></div><div class="circle2"></div><div class="circle3"></div><div class="circle4"></div></div></div>';
        var spinner03 = '<div class="fl spinner3"><div class="dot1"></div><div class="dot2"></div></div>';
        var spinner04 = '<div class="fl spinner4"></div>';
        var spinner05 = '<div class="fl spinner5"><div class="cube1"></div><div class="cube2"></div></div>';
        var spinner06 = '<div class="fl spinner6"><div class="rect1"></div><div class="rect2"></div><div class="rect3"></div><div class="rect4"></div><div class="rect5"></div></div>';
        var spinner07 = '<div class="fl spinner7"><div class="circ1"></div><div class="circ2"></div><div class="circ3"></div><div class="circ4"></div></div>';

        var containerDiv='<div id="loaderDiv" style="background: '+_options.bgColor+';z-index: '+_options.zIndex+';"></div>';
        //容器
        var el = $(_options.ele);

        var isNull=false;//记录$(el).width()==0 && _options.width=="100%"

/*
        //Init styles
        var initStyles = {
            'position': _options.pos,
            'width': _options.width,
            'height': _options.height,
            'top': _options.top,
            'left': _options.left
        };*/

        /**
         * 设置Loader的div的大小
         */
        function initLoaderDivCss(){
            var winW =_options.width|| $(el).width();
            var winH =_options.height|| $(el).height();
            if(_options.width=="100%"){//$(el).width()==0 如果设置width:100%
                isNull=true;
            }else{
                isNull=false;
            }
           $(el).find("#loaderDiv").css({height:winH,width:winW});
            //add by shaojx modifty 2016-9-4 重定位loaderDiv的位置
            if(options.reposition){
             //   var elPosition = $(el).position();
                $(el).find("#loaderDiv").css({
                    "position": "absolute",
                    "top": "0",
                    "left": "0"
                })
            }
        }

        //Center Spinner
        function centerLoader() {
            var winW = $(el).find("#loaderDiv").width();
            var winH =$(el).find("#loaderDiv").height();
            var spinnerW =$(el).find(".fl").width();
            var spinnerH = $(el).find(".fl").height();
            var loaderDivPosition=$(el).find("#loaderDiv").position();
            var loaderDivLeft=loaderDivPosition.left;
            var loaderDivTop=loaderDivPosition.top;
            
            //绝对定位
            if(isNull){//当width是100%时，winW有可能拿不到对应的高度值，这个时候设置"margin-left" 为"50%"
                $('.fl').css({
                    'position': 'relative',
                    'margin-left': "50%",
                    'top': ((winH / 2) - (spinnerH / 2)) + loaderDivTop+"px"
                });
            }else{
                $('.fl').css({
                    'position': 'absolute',
                    'left': ((winW / 2) - (spinnerW / 2)) + loaderDivLeft+"px",
                    'top': ((winH / 2) - (spinnerH / 2)) + loaderDivTop+"px"
                });
            }
            isNull=false;//重置
        }

        function start() {
            stop();
            var spinner = getSinner();
            $(_options.ele).append(containerDiv);//添加
            initLoaderDivCss();
            $("#loaderDiv").append(spinner);
            centerLoader();
            //添加窗口改变大小时的监听事件
            $(window).resize(function () {
                centerLoader();
            });
        }

        /**
         * 删除对应的加载动画
         */
        function stop(){
            $(el).find("#loaderDiv").remove();
        }

        /**
         *根据设置的属性 来获取相应的div
         * @returns {*}
         */
        function getSinner() {
            var a = _options.spinner;
            //console.log(a)
            switch (a) {
                case 'spinner1':
                    return spinner01;
                case 'spinner2':
                    return spinner02;
                case 'spinner3':
                    return spinner03;
                case 'spinner4':
                    return spinner04;
                case 'spinner5':
                    return spinner05;
                case 'spinner6':
                    return spinner06;
                case 'spinner7':
                    return spinner07;
                default:
                    return spinner01;
            }
        }
        
        //向外抛的接口
        SLLib.loader.start=start;
        SLLib.loader.stop =stop;
        return SLLib.loader;
    };
    //向外引用
    window.SLLib=SLLib;
})(window,$);