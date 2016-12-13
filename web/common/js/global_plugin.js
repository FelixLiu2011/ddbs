var apiUrl = ctx; 
var staticUrl = staticPath; 
var facePath = staticUrl + '/IM/img/qqFace/';


(function($) {
    //字符重编码
    $.extend($.string || ($.string = {}), {
        encodeHtmlEp: function(str) {
            return String(str).replace(/[&'"<>\/\\\-\x00-\x1f\x80-\xff]/g, function(r) {
                return "&#" + r.charCodeAt(0) + ";";
            });
        },
        encodeHtml: function(str) {
            return String(str).replace(/[&'"<>\/\\\-\x00-\x09\x0b-\x0c\x1f\x80-\xff]/g, function(r) {
                return "&#" + r.charCodeAt(0) + ";";
            }).replace(/ /g, "&nbsp;").replace(/\r\n/g, "<br />").replace(/\n/g, "<br />").replace(/\r/g, "<br />");
        },
        encodeScript: function(str) {
            return String(str).replace(/[\\"']/g, function(r) {
                return "\\" + r;
            }).replace(/%/g, "\\x25").replace(/\n/g, "\\n").replace(/\r/g, "\\r").replace(/\x01/g, "\\x01");
        },
        encodeURIComponent: function(str) {
            return encodeURIComponent(String(str));
        },
        encodeRegExp: function(str) {
            return String(str).replace(/[\\\^\$\*\+\?\{\}\.\(\)\[\]]/g, function(a, b) {
                return "\\" + a;
            });
        },
        encodeNone: function(str) {
            return String(str);
        },
        decodeHtml: function(str) {
            var m = {
                amp: '&',
                'lt': '<',
                'gt': '>',
                'quot': '"',
                'apos': "'",
                'nbsp': ' '
            };
            return String(str).replace(/&(([a-z]+)|(#([0-9]+))|(#x([0-9a-f]+)));|(\<br\s*\/*\>)/ig, function($m, $00, $w, $01, $d, $02, $h, $l) {
                if ($w) {
                    return m[$w] || $m;
                }
                if ($d) {
                    return String.fromCharCode(parseInt($d, 10));
                }
                if ($h) {
                    return String.fromCharCode(parseInt($h, 16));
                }
                /* 屏蔽换行符<br><br/><br />的替换
                if ($l) {
                    return '\n';
                }*/
                return $m;
            });
        },
        encodeFormatMore: function(str, length) {
            return $.string.encodeNone($.formatMore(str, length));
        }
    });
    //长度截取方法，此处调用上方的 $.string.encodeFormatMore(str, len), 而不使用此方法
    $.formatMore = function(str, len) {
        var _str = String(str);
        if (_str.length > len) {
            _str = '<span title="' + _str + '">' + _str.substring(0, len) + '...<span>';
        }
        return _str;
    };


    /*
     js模板生成插件
     参数：
     strTmpl: 模板字符串
     data: 填充的JSON数据对象

     demo:
     $.tmpl('<ul><%for(var i=0; i<items.length; ++i) { var item = items[i]; %> <li><%=$.string.encodeNone(item.name)%><%=$.string.escapeHtml(item.data)%></li> <%}%></ul>', {
     items: [{
     name: 'name1',
     data: '<script>'
     }, {
     name: 'name2',
     data: '</script>'
     }]
     });
     */
    //特殊字符改为 <# ... #> <#= ... #>
    $.template = function(strTmpl, data) {
        function tmpl(strTmpl) {
            // 字符串JSON转义
            function sstringify(data) {
                if (typeof(JSON) !== 'undefined') {
                    return JSON.stringify(data);
                }
                var e = {
                    "\u0000": "\\u0000",
                    "\u0001": "\\u0001",
                    "\u0002": "\\u0002",
                    "\u0003": "\\u0003",
                    "\u0004": "\\u0004",
                    "\u0005": "\\u0005",
                    "\u0006": "\\u0006",
                    "\u0007": "\\u0007",
                    "\b": "\\b",
                    "\t": "\\t",
                    "\n": "\\n",
                    "\u000b": "\\u000b",
                    "\f": "\\f",
                    "\r": "\\r",
                    "\u000e": "\\u000e",
                    "\u000f": "\\u000f",
                    "\u0010": "\\u0010",
                    "\u0011": "\\u0011",
                    "\u0012": "\\u0012",
                    "\u0013": "\\u0013",
                    "\u0014": "\\u0014",
                    "\u0015": "\\u0015",
                    "\u0016": "\\u0016",
                    "\u0017": "\\u0017",
                    "\u0018": "\\u0018",
                    "\u0019": "\\u0019",
                    "\u001a": "\\u001a",
                    "\u001b": "\\u001b",
                    "\u001c": "\\u001c",
                    "\u001d": "\\u001d",
                    "\u001e": "\\u001e",
                    "\u001f": "\\u001f",
                    "\"": "\\\"",
                    "\\": "\\\\"
                };
                return '"' + data.replace(/[\s\S]/g, function(a) {
                    return (e[a] || a);
                }) + '"';
            }

            var code = ['var  ____internal  = [];', 'with (data) {', '    ____internal .push(' + strTmpl.replace(/(^|#\>)([\s\S]*?)(\<#|$)/g, function($m, $1, $2, $3) {
                return $1 + sstringify($2) + $3;
            }).replace(/\<#[\s]*=([\s\S]*?)#\>/g, function($m, $1) {
                return $1.match(/^\s*\$\.string\.encode\w+\([\s\S]*\)\s*$/) ? (', ' + $1 + ', ') : (', $.string.encodeHtml(' + $1 + '), ');
            }).replace(/\<#([\s\S]*?)#\>/g, ');\n$1\n\t ____internal .push(') + ');', '}', 'return  ____internal .join("");'].join('\n');
            var tf = new Function('data', '$', code);
            return (function(data) {
                return tf(data, $);
            });
        }

        return tmpl(strTmpl)(data);
    };

    //自定义post方法
    $._post = function(url, data, callback, error) {
        $.ajax({
            url: url,
            data: data,
            type: 'post',
            dataType: 'json',
            success: function(data) {
                if (callback) {
                    callback(data);
                }
            },
            error: function(xhr, text) {
                if (xhr.responseText) {
                    $('body').append(xhr.responseText);
                }
                if (error) {
                    error(xhr, text);
                } else {
                    layer.msg($.t('global.zoneApiError'), {
                        time: 1000
                    }, function() {
                        layer.closeAll();
                    });
                    console.log(text);
                }
            }
        });
    }


    /* 通用插件库索引 (代码行)
     * 调用方法, jqueryObj.xxx(aaa,bbb...), 如：$('#aaa').report(...); 或者没有jQuery对象时这样 $.fn.xxx() 调用
     * 1、xss过滤，对所有输入框的值进行过滤
     * 2、举报
     * 3、UTC时间转换
     * 4、表情
     */
    $.fn.extend({
        //局部loader
        partialLoader: function(option) {
            if (option && option === "close") {
                $(".partialLoader", this).remove();
            } else {
                $(".partialLoader", this).remove();
                this.append('<div class="partialLoader" id="partialLoader"> <img src="' + path + '/common/images/load2.gif"></div>');
                $(".partialLoader", this).width(this.width()).height(this.height());
                var mtop = ($(".partialLoader", this).height() - $(".partialLoader img", this).height()) / 2;
                $(".partialLoader img", this).css({
                    "margin-top": mtop + "px"
                });
            }
        },
        xss: function(s) {
            /* 过滤特殊字符 "%--`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？"
             * 参数1：需要被过滤的字符串，string字符串，如：'aaa'
             * 返回：string
             */
            var pattern = new RegExp("[<>]");
            var rs = "";
            for (var i = 0; i < s.length; i++) {
                rs = rs + s.substr(i, 1).replace(pattern, '');
            }
            return rs;
        },
        report: function(callback, self_class) {
            /* 通用举报插件
             * 参数1：插件需要回调的函数
             * 参数2：可选，可传入一个自定义类，添加到弹窗上
             * 返回： string(原因), jquery对象（触发元素）
             */
            var $btn = $(this);
            var reportHtml = '<div class="jqss jqssn3 clearfix" style="display:block"><p><input type="radio" class="radio" value="lj" id="a1" name="jb"><label class="radio" for="a1">' + $.t('global.junkAd') + '</label></p><p><input type="radio" class="radio" value="sq" id="b1" name="jb"><label class="radio" for="b1">' + $.t('global.obscene') + '</label></p><p><input type="radio" class="radio" value="xj" id="c1" name="jb"><label class="radio" for="c1">' + $.t('global.falseWin') + '</label></p><p><input type="radio" class="radio" value="mg" id="d1" name="jb"><label class="radio" for="d1">' + $.t('global.SensitiveInfor') + '</label></p><p><input type="radio" class="radio" value="gj" id="f" name="jb"><label class="radio" for="f">' + $.t('global.PersonalAttack') + '</label></p><p><input type="radio" class="radio" value="sr" id="g" name="jb"><label class="radio" for="g">' + $.t('global.HarassOthers') + '</label></p><div class="clear"></div></div>';
            var reason = {
                lj: '垃圾广告',
                sq: '淫秽色情',
                xj: '虚假中奖',
                mg: '敏感信息',
                gj: '人身攻击',
                sr: '骚扰他人'
            };
            $btn.unbind('click').click(function() {
                layer.open({
                    area: ['482px', '320px'],
                    skin: self_class,
                    title: [$.t('global.report'), 'font-size:18px;'],
                    content: reportHtml,
                    btn: $.t('global.submit'),
                    yes: function(index, layero) {
                        var intHot = reason[$("input[name='jb']:checked").val()];
                        if (intHot) {
                            callback(intHot, $btn);
                            layer.close(index);
                        } else {
                            layer.msg($.t('global.noReportContent'), {
                                time: 1000
                            });
                        }
                    }
                });
            });
        },
        convertUTC: function(time, type, format) {
            /* 通用UTC转换函数
             * 参数1：UTC时间戳
             * 参数2：要转化为的格式 full,无，time   - date.getTimezoneOffset() / 60
             * 参数3深度自定义格式 YYYY/MM/DD hh:mm:ss  YYYY-MM-DD hh:mm:ss等等
             * 返回： string, 当前所在时区时间: 各种格式
             */
            var date = new Date(Number(time));
            var _year = date.getFullYear();
            var _month = date.getMonth() + 1;
            var _date = date.getDate();
            var _hours = date.getHours();
            var _min = date.getMinutes();
            var _sec = date.getSeconds();
            var isLongMonth = _month == 1 || _month == 3 || _month == 5 || _month == 7 || _month == 8 || _month == 10 || _month == 12;
            var isShortMonth = _month == 4 || _month == 6 || _month == 9 || _month == 11;
            var isleap = (_year % 4 === 0 && _year % 100 !== 0) || (_year % 400 === 0);
            if (type == 'time') {
                return date.getTime() - date.getTimezoneOffset() * 60000;
            }

            var currentDate = new Date();
            var cur_year = currentDate.getFullYear();
            var cur_month = prefixZero(currentDate.getMonth() + 1);
            var cur_date = prefixZero(currentDate.getDate());
            var returnType;

            // 补充0
            function prefixZero(num) {
                num = num + "";
                if (num < 10) {
                    return 0 + num;
                }
                return num;
            }
            //小时大于24
            if (_hours >= 24) {
                _hours = _hours - 24;
                _date = _date + 1;
                //日期大于当月数
                if ((isLongMonth && _date > 31) || (isShortMonth && _date > 30) || (isleap && _date > 29 && _month == 2) || (!isleap && _date > 28 && _month == 2)) {
                    _month = _month + 1;
                    if (isShortMonth) {
                        _date -= 30;
                    } else if (isleap && _month == 2) {
                        _date -= 29;
                    } else if (!isleap && _month == 2) {
                        _date -= 28;
                    } else {
                        _date -= 31;
                    }
                }
                if (_month > 12) {
                    _month = _month - 12;
                    _year = _year + 1;
                }
            }
            if (format) {
                var pY = /Y+/.exec(format), // 匹配年份
                    pM = /M+/.exec(format), // 匹配月份
                    pD = /D+/.exec(format), // 匹配日期
                    ph = /h+/.exec(format), // 匹配小时
                    pm = /m+/.exec(format), // 匹配分钟
                    ps = /s+/.exec(format); // 匹配秒
                // 年份替换
                if (pY) {
                    if (pY[0].length === 2) {
                        _year = _year.slice(2);
                    }
                    format = format.replace(pY[0], _year);
                }
                // 月份替换
                if (pM) {
                    if (pM[0].length === 2) {
                        _month = prefixZero(_month);
                    }
                    format = format.replace(pM[0], _month);
                }
                // 日期替换
                if (pD) {
                    if (pD[0].length === 2) {
                        _date = prefixZero(_date);
                    }
                    format = format.replace(pD[0], _date);
                }
                // 小时替换
                if (ph) {
                    if (ph[0].length === 2) {
                        _hours = prefixZero(_hours);
                    }
                    format = format.replace(ph[0], _hours);
                }
                // 分钟替换
                if (pm) {
                    if (pm[0].length === 2) {
                        _min = prefixZero(_min);
                    }
                    format = format.replace(pm[0], _min);
                }
                // 秒数替换
                if (ps) {
                    if (ps[0].length === 2) {
                        _sec = prefixZero(_sec);
                    }
                    format = format.replace(ps[0], _sec);
                }
                return format;
            } else {
                _month = prefixZero(_month);
                _date = prefixZero(_date);
                _hours = prefixZero(_hours);
                _min = prefixZero(_min);
                _sec = prefixZero(_sec);
                if (type == 'full') {
                    if (_year == cur_year) {
                        if (_month == cur_month && _date == cur_date) {
                            return _hours + ":" + _min;
                        } else {
                            return _month + "-" + _date + " " + _hours + ":" + _min;
                        }
                    } else {
                        return _year + "-" + _month + "-" + _date + " " + _hours + ":" + _min;
                    }
                } else {
                    if (_year == cur_year) {
                        if (_month == cur_month && _date == cur_date) {
                            return _hours + ":" + _min;
                        } else {
                            return _month + "-" + _date + " " + _hours + ":" + _min;
                        }
                    } else {
                        return _year + "-" + _month + "-" + _date + " " + _hours + ":" + _min;
                    }
                }
            }
        },
        returnTime: function(time, type, format) {
            /* 通用时间转换函数
             * 参数1：UTC时间戳
             * 参数2：要转化为的格式 full,无，time
             * 参数3深度自定义格式 YYYY/MM/DD hh:mm:ss  YYYY-MM-DD hh:mm:ss等等
             * 返回： string, 当前所在时区时间: 各种格式
             */
            var date = new Date(Number(time));
            var _year = date.getFullYear();
            var _month = date.getMonth() + 1;
            var _date = date.getDate();
            var _hours = date.getHours();
            var _min = date.getMinutes();
            var _sec = date.getSeconds();
            var isLongMonth = _month == 1 || _month == 3 || _month == 5 || _month == 7 || _month == 8 || _month == 10 || _month == 12;
            var isShortMonth = _month == 4 || _month == 6 || _month == 9 || _month == 11;
            var isleap = (_year % 4 === 0 && _year % 100 !== 0) || (_year % 400 === 0);
            if (type == 'time') {
                return date.getTime() - date.getTimezoneOffset() * 60000;
            }

            var currentDate = new Date();
            var cur_year = currentDate.getFullYear();
            var cur_month = prefixZero(currentDate.getMonth() + 1);
            var cur_date = prefixZero(currentDate.getDate());
            var returnType;

            // 补充0
            function prefixZero(num) {
                num = num + "";
                if (num < 10) {
                    return 0 + num;
                }
                return num;
            }
            //小时大于24
            if (_hours >= 24) {
                _hours = _hours - 24;
                _date = _date + 1;
                //日期大于当月数
                if ((isLongMonth && _date > 31) || (isShortMonth && _date > 30) || (isleap && _date > 29 && _month == 2) || (!isleap && _date > 28 && _month == 2)) {
                    _month = _month + 1;
                    if (isShortMonth) {
                        _date -= 30;
                    } else if (isleap && _month == 2) {
                        _date -= 29;
                    } else if (!isleap && _month == 2) {
                        _date -= 28;
                    } else {
                        _date -= 31;
                    }
                }
                if (_month > 12) {
                    _month = _month - 12;
                    _year = _year + 1;
                }
            }
            if (format) {
                var pY = /Y+/.exec(format), // 匹配年份
                    pM = /M+/.exec(format), // 匹配月份
                    pD = /D+/.exec(format), // 匹配日期
                    ph = /h+/.exec(format), // 匹配小时
                    pm = /m+/.exec(format), // 匹配分钟
                    ps = /s+/.exec(format); // 匹配秒
                // 年份替换
                if (pY) {
                    if (pY[0].length === 2) {
                        _year = _year.slice(2);
                    }
                    format = format.replace(pY[0], _year);
                }
                // 月份替换
                if (pM) {
                    if (pM[0].length === 2) {
                        _month = prefixZero(_month);
                    }
                    format = format.replace(pM[0], _month);
                }
                // 日期替换
                if (pD) {
                    if (pD[0].length === 2) {
                        _date = prefixZero(_date);
                    }
                    format = format.replace(pD[0], _date);
                }
                // 小时替换
                if (ph) {
                    if (ph[0].length === 2) {
                        _hours = prefixZero(_hours);
                    }
                    format = format.replace(ph[0], _hours);
                }
                // 分钟替换
                if (pm) {
                    if (pm[0].length === 2) {
                        _min = prefixZero(_min);
                    }
                    format = format.replace(pm[0], _min);
                }
                // 秒数替换
                if (ps) {
                    if (ps[0].length === 2) {
                        _sec = prefixZero(_sec);
                    }
                    format = format.replace(ps[0], _sec);
                }
                return format;
            } else {
                _month = prefixZero(_month);
                _date = prefixZero(_date);
                _hours = prefixZero(_hours);
                _min = prefixZero(_min);
                _sec = prefixZero(_sec);
                if (type == 'full') {
                    if (_year == cur_year) {
                        if (_month == cur_month && _date == cur_date) {
                            return _hours + ":" + _min;
                        } else {
                            return _month + "-" + _date + " " + _hours + ":" + _min;
                        }
                    } else {
                        return _year + "-" + _month + "-" + _date + " " + _hours + ":" + _min;
                    }
                } else {
                    if (_year == cur_year) {
                        if (_month == cur_month && _date == cur_date) {
                            return _hours + ":" + _min;
                        } else {
                            return _month + "-" + _date + " " + _hours + ":" + _min;
                        }
                    } else {
                        return _year + "-" + _month + "-" + _date + " " + _hours + ":" + _min;
                    }
                }
            }
        },
        facePackage: function(inputBox) {
            /* 通用表情包
             * 参数1：表情输入框选择器，如：'aaa' (ps：输入框需同时设置 id 和 name 属性, 且名字相同)
             * 参数2：表情图片路径，如：'/gaga_sns_static/IM/img/qqFace/'
             * 返回： null
             * 备注：未来需扩展其他表情包，暂时用默认的
             */
            var $selectBtn = $(this);
            var $inputBox = $(inputBox);
            $selectBtn.qqFace({
                assign: inputBox,
                path: facePath
            });

            var self = {
                convertData: function(str) {
                    //提交数据时调用，转换存储数据，参数：输入框value, string
                    str = str.replace(/\</g, '&lt;');
                    str = str.replace(/\>/g, '&gt;');
                    str = str.replace(/\n/g, '<br>');
                    //str = str.replace(/\[em_([0-9]*)\]/g,'[$1]');
                    return str;
                },
                getImg: function(str) {
                    //页面展示时调用，转换数据为表情包图片或转换html标签，参数：待转换内容，string
                    if (str && ((str.indexOf('[') != -1 && str.indexOf(']') != -1) || str.indexOf('&lt;') != -1)) {
                        var strNew = '', _html = '', _html1 = '', _html2 = '', _html3 = '';
                        strNew = str.replace(/[a-z]+\_/g, '');
                        _html = strNew.replace(/\[/g, ('<img src="' + facePath));
                        _html1 = _html.replace(/\]/g, '.gif" />');
                        _html2 = _html1.replace(/&lt;/g, '<');
                        _html3 = _html2.replace(/&gt;/g, '>');
                        return _html3;
                    } else {
                        return str;
                    }
                }
            };
            return self;
        },
        zoneDetail: function(zoneid, imgIndex, callback, others) {
            /* 动态详情
             * 参数1: 动态ID
             * 参数2: 所点击图片的下标
             * 参数3：可选，回调函数
             * 参数4：可选，其他设置，包括以下设置：
                      1、isAcross，是否需要跨动态，布尔值
                      2、isReverse，控制左右切换的方向，默认 左：上一条(张) 右：下一条(张)，设置true后相反
                      3、photoArr，curPhoto，针对照片墙图片的设置，同时存在
                      4、showLink, 置顶动态详情弹窗，链接是否解析
             * 返回：null              
             */
            var zoneId = zoneid;
            var gagaId;
            var language = 'zh-cn';
            var isLove = 0;
            var temp = '';
            var page = 1;
            var initImgIndex = imgIndex;
            var zoneTextLenght = 0;
            var returnData = {
                obj: []
            };
            var isGetComplete = true;

            //获取模板

            if ($('#zoneDetailBox').length) {
                getDetail();
            } else {
                $.get(staticUrl + '/js/common_template.html', function(data) {
                    temp = data;
                    $('body').append(temp);
                    $('body').append('<div id="zoneDetailBox" class="hide"></div>');
                    getDetail();
                });                
            }

            //加载数据
            function getDetail() {
                if (isGetComplete) {
                    isGetComplete = false;
                    $._post("http://localhost:8080" + '/zone/get', {
                        "zoneId": zoneId
                    }, function(data) {
                        isGetComplete = true;
                        if (data.success && data.obj.zone) {
                            gagaId = data.obj.zone.zoneGagaid;
                            zoneText = data.obj.zone.zoneContent ? data.obj.zone.zoneContent.replace(/\[[a-z]+\_([0-9]*)\]/g, '') : '';
                            if (others && others.curPhoto) {
                                initDetail(data, undefined, others.curPhoto);
                            } else {
                                initDetail(data);
                            }
                        } else {
                            layer.msg(data.msg || $.t('global.zoneApiError'), {
                                time: 1000
                            });
                        }
                    }, function(reason, text) {
                        isGetComplete = true;
                        layer.msg(reason.statusText, {
                            time: 1000
                        });
                    });
                }                
            }

            function initDetail(data, isReplace, curimg) {
                var $container = $('#zoneDetailBox');               
                var html = $.template($('#zone-tmpl').html(), {
                    datalist: data
                });
                language = data.obj.publishMem.membLanguage || language;
                isLove = data.obj.isLove;
                $container.html(html);
                var $zoneContent = $container.find('.detail_txt');
                var $zoneTransTxt = $container.find('.text.js_detail_trans');
                if ($.trim($zoneContent.html())) {            
                    if (others && others.showLink) {
                        $zoneContent.html($.string.decodeHtml($.IM.replace_em($zoneContent.html().replace(/\&amp;/g, '&'))));
                    } else {
                        $zoneContent.html($.IM.replace_em($zoneContent.html()));
                    }                    
                }
                if ($.trim($zoneTransTxt.html())) {
                    if (others && others.showLink) {
                        $zoneTransTxt.html($.string.decodeHtml($.IM.replace_em($zoneTransTxt.html().replace(/\&amp;/g, '&'))));
                    } else {
                        $zoneTransTxt.html($.IM.replace_em($zoneTransTxt.html()));
                    }                    
                }              
                if (isReplace) {
                    $('.common-zone-detail .layui-layer-content').html($container.html());
                    initLayerDetail(curimg);
                } else {
                    layer.open({
                        area: ['860px', '630px'],
                        type: 1,
                        title: false,
                        skin: 'common-zone-detail',
                        content: $container.html(),
                        shadeClose: true,
                        success: function() {
                            initLayerDetail(curimg);
                        },
                        cancel: function() {
                            returnData.zone_likecount = $('.common-zone-detail .detail_onlike span').html();
                            returnData.isLove = $('.common-zone-detail .detail_onlike i').hasClass('on') ? 1 : 0;
                            returnData.zone_commentcount = $('.common-zone-detail .onreply span').html();
                            if (callback) {
                                callback(returnData);
                            }                            
                        },
                        end: function() {
                            $('html').removeClass('no-scroll-overflow no-scroll-margin');
                            $('.head').removeClass('no-scroll-right no-scroll-head');
                            $('#IM').removeClass('no-scroll-right');
                        }
                    });
                }
            }

            //弹窗各功能初始化
            function initLayerDetail(curimg) {
                if (document.documentElement.scrollHeight> document.documentElement.clientHeight) {
                   $('html').addClass('no-scroll-overflow no-scroll-margin');
                    $('.head').addClass('no-scroll-right no-scroll-head');
                    $('#IM').addClass('no-scroll-right'); 
                }                
                var $layerBox = $('.common-zone-detail .dynamic_detail');
                var $contentDiv = $layerBox.find('.detail-content-div');
                /*if (zoneText.indexOf('br/') != -1 || zoneText.length > 38) {
                    $layerBox.find('.layer_detail_content').mCustomScrollbar();
                }*/                
                $contentDiv.mCustomScrollbar();
                $layerBox.find('.layer_detail_content').mCustomScrollbar();


                //图片展示相关
                var $imgBox = $layerBox.find('.bd');
                var $prevCell;
                var $nextCell;
                var $bigBtn = $layerBox.find('.bigger');
                var $resetBtn = $layerBox.find('.normal');
                if (others && others.isReverse) {
                    $prevCell = $layerBox.find('.next_btn');
                    $nextCell = $layerBox.find('.prev_btn');
                } else {
                    $prevCell = $layerBox.find('.prev_btn');
                    $nextCell = $layerBox.find('.next_btn');
                }
                var $lis = $imgBox.find('.slide_item');
                if (!others || (others && !others.photoArr)) {
                    var isFirstZone = false;
                    var isLastZone = false;
                    $lis.hide();
                    $lis.eq(initImgIndex || 0).show().addClass('on');
                    $lis.eq(initImgIndex || 0).find('img').load(function() {
                        $imgBox.find('.detail-img-load').fadeOut('normal', function() {
                            $(this).remove();
                        });
                    });
                    if ($lis.length <= 1 && (!others || (others && !others.isAcross))) {
                        $prevCell.hide();
                        $nextCell.hide();
                    }
                    $prevCell.click(function() {
                        var index = $imgBox.find('.on').index() - 1;
                        if (index < 0) {
                            if (others && others.isAcross) {
                                if (isLastZone) {
                                    layer.msg($.t('global.nodata'), {
                                        time: 1000
                                    });
                                    return;
                                }
                                $._post(apiUrl + '/Zone/oneInfo', {
                                    gagaId: gagaId,
                                    zoneId: zoneId,
                                    type: -1
                                }, function(data) {
                                    if (data.success) {
                                        if (data.obj.zone) {
                                            zoneId = data.obj.zone.zoneId;
                                            initImgIndex = data.obj.imgList.length - 1;
                                            zoneText = data.obj.zone.zoneContent ? data.obj.zone.zoneContent.replace(/\[[a-z]+\_([0-9]*)\]/g, '') : '';
                                            initDetail(data, true);
                                        } else {
                                            isLastZone = true;
                                            layer.msg($.t('global.nodata'), {
                                                time: 1000
                                            });
                                        }
                                    } else {
                                        layer.msg($.t('global.zoneApiError'), {
                                            time: 1000
                                        });
                                    }
                                });
                            } else {
                                $lis.hide().removeClass('on');
                                $lis.last().show().addClass('on');
                            }
                        } else {
                            $lis.hide().removeClass('on');
                            $lis.eq(index).show().addClass('on');
                        }
                        clearImg();
                    });
                    $nextCell.click(function() {
                        var index = $imgBox.find('.on').index() + 1;
                        if (index >= $lis.length) {
                            if (others && others.isAcross) {
                                if (isFirstZone) {
                                    layer.msg($.t('global.nodata'), {
                                        time: 1000
                                    });
                                    return;
                                }
                                $._post(apiUrl + '/Zone/oneInfo', {
                                    gagaId: gagaId,
                                    zoneId: zoneId,
                                    type: 1
                                }, function(data) {
                                    if (data.success) {
                                        if (data.obj.zone) {
                                            zoneId = data.obj.zone.zoneId;
                                            initImgIndex = 0;
                                            zoneText = data.obj.zone.zoneContent ? data.obj.zone.zoneContent.replace(/\[[a-z]+\_([0-9]*)\]/g, '') : '';
                                            initDetail(data, true);
                                        } else {
                                            isFirstZone = true;
                                            layer.msg($.t('global.nodata'), {
                                                time: 1000
                                            });
                                        }
                                    } else {
                                        layer.msg($.t('global.zoneApiError'), {
                                            time: 1000
                                        });
                                    }
                                });
                            } else {
                                $lis.hide().removeClass('on');
                                $lis.first().show().addClass('on');
                            }
                        } else {
                            $lis.hide().removeClass('on');
                            $lis.eq(index).show().addClass('on');
                        }
                        clearImg();
                    });
                } else {
                    $prevCell = $layerBox.find('.prev_btn');
                    $nextCell = $layerBox.find('.next_btn');
                    var currentId = curimg;
                    $imgBox.find('.slide_item:not([imgid="' + currentId.imgid + '"])').remove();
                    $imgBox.find('.slide_item img').load(function() {
                        $imgBox.find('.detail-img-load').fadeOut('normal', function() {
                            $(this).remove();
                        });
                    });
                    var currentZoneIndex;
                    others.photoArr.forEach(function(item, i) {
                        if (item.zoneid == currentId.zoneid && item.imgid == currentId.imgid) {
                            currentZoneIndex = i;
                        }
                    });
                    var nextIndex = currentZoneIndex + 1;
                    var prevIndex = currentZoneIndex - 1;
                    if (nextIndex > others.photoArr.length - 1) {
                        nextIndex = 0;
                    }
                    if (prevIndex < 0) {
                        prevIndex = others.photoArr.length - 1;
                    }
                    $prevCell.click(function() {
                        $._post(apiUrl + '/Zone/get', {
                            zoneId: others.photoArr[prevIndex].zoneid
                        }, function(data) {
                            if (data.success) {
                                if (data.obj.zone) {
                                    zoneId = data.obj.zone.zoneId;
                                    initImgIndex = data.obj.imgList.length - 1;
                                    zoneText = data.obj.zone.zoneContent ? data.obj.zone.zoneContent.replace(/\[[a-z]+\_([0-9]*)\]/g, '') : '';
                                    initDetail(data, true, others.photoArr[prevIndex]);
                                } else {
                                    isLastZone = true;
                                    layer.msg($.t('global.nodata'), {
                                        time: 1000
                                    });
                                }
                            } else {
                                layer.msg($.t('global.zoneApiError'), {
                                    time: 1000
                                });
                            }
                        });
                        clearImg();
                    });
                    $nextCell.click(function() {
                        $._post(apiUrl + '/Zone/get', {
                            zoneId: others.photoArr[nextIndex].zoneid
                        }, function(data) {
                            if (data.success) {
                                if (data.obj.zone) {
                                    zoneId = data.obj.zone.zoneId;
                                    initImgIndex = data.obj.imgList.length - 1;
                                    zoneText = data.obj.zone.zoneContent ? data.obj.zone.zoneContent.replace(/\[[a-z]+\_([0-9]*)\]/g, '') : '';
                                    initDetail(data, true, others.photoArr[nextIndex]);
                                } else {
                                    isLastZone = true;
                                    layer.msg($.t('global.nodata'), {
                                        time: 1000
                                    });
                                }
                            } else {
                                layer.msg($.t('global.zoneApiError'), {
                                    time: 1000
                                });
                            }
                        });
                        clearImg();
                    });
                }
                $bigBtn.click(function() {
                    var $thisImg;
                    if (others && others.photoArr) {
                        $thisImg = $layerBox.find('.slide_item img');
                    } else {
                        $thisImg = $layerBox.find('.slide_item.on img');
                    }                    
                    var oldUrl = $thisImg.attr('src');
                    var bigUrl = oldUrl.split('?')[0];
                    $resetBtn.attr({
                        'data-url': oldUrl,
                        'data-i': $thisImg.closest('.slide_item').attr('imgid')
                    });
                    $thisImg.attr('src', bigUrl);
                    $thisImg.css({
                        'position': 'relative',
                        'left': 0,
                        'top': 0
                    });
                    $thisImg.addClass('primal-size');
                    var oBoolean = false,
                        oLeftSpace = 0,
                        oTopSpace = 0;
                    $thisImg.mousemove(function(e) {
                        if (oBoolean) {
                            $thisImg.css({
                                'left': e.clientX - oLeftSpace,
                                'top': e.clientY - oTopSpace
                            });
                            return false;
                        }
                    });
                    $thisImg.mousedown(function(e) {
                        mStart();
                    }).mouseup(function(e) {
                        mEnd();
                    });
                    $imgBox.mouseleave(function() {
                        mEnd();
                    });
                    $bigBtn.addClass('hide');
                    $resetBtn.removeClass('hide');

                    function mStart() {
                        oBoolean = true;
                        if (oBoolean) {
                            oLeftSpace = window.event.clientX - Number($thisImg.css('left').replace('px', ''));
                            oTopSpace = window.event.clientY - Number($thisImg.css('top').replace('px', ''));
                        }
                    }

                    function mEnd() {
                        oBoolean = false;
                    }
                });
                $resetBtn.click(function() {
                    if ($(this).attr('data-url') && $(this).attr('data-i')) {
                        var $targetImg = $layerBox.find('[imgid="' + $(this).attr('data-i') + '"] img');
                        $targetImg.attr('src', $(this).attr('data-url'));
                        clearImg();
                    }
                });

                function clearImg() {
                    $resetBtn.attr({
                        'data-url': '',
                        'data-i': ''
                    });
                    $layerBox.find('.slide_item img').removeClass('primal-size').css({
                        'position': 'relative',
                        'left': 0,
                        'top': 0
                    }).unbind('mousemove').unbind('mousedown').unbind('mouseup');
                    $bigBtn.removeClass('hide');
                    $resetBtn.addClass('hide');
                }

                //动态翻译与展示
                var $transBtn = $layerBox.find('.dt_tranS_btn');
                var $langae = $transBtn.find('.language_obj_detail li');
                var $transBox = $layerBox.find('.detail_info .detail_trans');
                if ($transBtn && $transBtn.attr('istrans') == 0) {
                    $langae.unbind('click').click(function() {
                        var transType = $(this).attr('langs-lang');
                        $.fn.checkTrans($layerBox.find('.detail_txt').html(), function() {
                            $transBtn.addClass('trans_londing');
                            $._post(apiUrl + '/Zone/translate', {
                                zoneId: zoneId,
                                translatType: transType
                            }, function(data) {                                                            
                                if (data.success) {
                                    returnData.zoneTrans = data.obj;
                                    layer.msg($.t('global.zoneApiSucc'), {
                                        time: 1000
                                    });
                                    if (zoneText.indexOf('br/') != -1 || zoneText.length > 37) {
                                        $layerBox.find('.layer_detail_content').mCustomScrollbar();
                                    }
                                    if (data.obj.zotrCompletime) {
                                       $transBox.removeClass('hide').find('.text').html($.IM.replace_em(data.obj.zotrTranslathigh || data.obj.zotrTranslat)); //data.obj.zmtrTranslathigh || data.obj.zmtrTranslat                                    
                                       $transBtn.remove(); 
                                       $transBtn.removeClass('trans_londing'); 
                                    } else {
                                        $transBtn.find('.language_obj_detail').remove();
                                    }                                    
                                    $transBtn.attr('istrans', '1');
                                } else {
                                    $transBtn.removeClass('trans_londing');
                                    layer.msg($.t('global.zoneApiError'), {
                                        time: 1000
                                    });
                                }
                            }, function() {
                                $transBtn.removeClass('trans_londing');
                                layer.msg($.t('global.zoneApiError'), {
                                    time: 1000
                                });
                            });
                        });
                    });
                }
                if ($transBtn && $transBtn.attr('istrans') == 1) {
                    $transBtn.click(function() {
                        if (zoneText.indexOf('br/') != -1 || zoneText.length > 37) {
                            $layerBox.find('.layer_detail_content').mCustomScrollbar();
                        }
                        if ($transBox.is(':visible')) {
                            $transBox.addClass('hide');
                        } else {
                            $transBox.removeClass('hide');
                        }
                    });
                }

                //点赞、取消点赞
                var lickBtn = $layerBox.find('.detail_onlike i');
                var lickCount = $layerBox.find('.detail_onlike span');
                lickBtn.unbind('click').click(function() {
                    var likeApi = isLove == 0 ? '/Zone/love' : '/Zone/cancelLove';
                    if (isLove == 0) {
                        $.zone.likeAct($(this));
                    }
                    $._post(apiUrl + likeApi, {
                        zoneId: zoneId
                    }, function(data) {
                        if (data.success) {
							/*
                            layer.msg($.t('global.zoneApiSucc'), {
                                time: 1000
                            });*/
                            if (isLove == 0) {
                                isLove = 1;
                                lickBtn.addClass('on');
                                lickCount.html(Number(lickCount.html()) + 1);
                            } else {
                                isLove = 0;
                                lickBtn.removeClass('on');
                                lickCount.html(Number(lickCount.html()) - 1);
                            }
                        } else {
                            layer.msg($.t('global.zoneApiError'), {
                                time: 1000
                            });
                        }
                    });
                });

                //举报
                var $reportBtn = $layerBox.find('.report');
                $reportBtn.report(function(_reason) {
                    var reportData = {
                        type: 'Z',
                        id: zoneId,
                        reason: _reason
                    };
                    $._post(apiUrl + '/Report/report', reportData, function(data) {
                        layer.msg($.t('global.zoneApiSucc'), {
                            time: 1000
                        });
                    }, function(request, errorText) {
                        layer.msg($.t('global.zoneApiError'), {
                            time: 1000
                        });
                    });
                }, 'other-zone-report');

                //评论初始化，以及加载更多detail_comment
                var $detailBox = $layerBox.find('.detail_comment');
                var $subReply = $layerBox.find('.comment-temp .comment_item');
                var $moreComment = $layerBox.find('.detail_more');
                var isLast = false;
                //$detailBox.mCustomScrollbar();
                if ($.trim($detailBox.html())) {
                    $subReply.each(function() {
                        var parentId = $(this).attr('parent-id');
                        var parentItem = $detailBox.find('.comment_item[zoco-id="' + parentId + '"]');
                        var nextItem = parentItem.next();
                        if (nextItem.hasClass('sub')) {
                            parentItem.nextAll('.sub[parent-id="' + parentId + '"]:last').after($(this));
                        } else {
                            parentItem.after($(this));
                        }
                    });
                    $detailBox.find('.reply-name').each(function() {
                        var parentId = $(this).attr('parent-id');
                        var parentName = $detailBox.find('.user_home[zoco-id="' + parentId + '"]').html();
                        $(this).html(parentName);
                    });
                } else {
                    $detailBox.addClass('hide');
                }
                if ($detailBox.find('.comment_item').length < 10) {
                    $moreComment.addClass('hide');
                } else {
                    $moreComment.removeClass('hide');
                }
                $moreComment.click(function() {
                    if (isLast) {
                        layer.msg($.t('zone.nomorecomment'), {
                            time: 1000
                        });
                        $moreComment.addClass('hide');
                        return;
                    }
                    var itemNum = $detailBox.find('.comment_item').length - $detailBox.find('.comment_item.new').length;
                    $._post(apiUrl + '/ZoneComment/list', {
                        zoneId: zoneId,
                        pageNum: Math.ceil(itemNum / 10 + 1)
                    }, function(data) {
                        if (data.success && data.obj.length > 0) {
                            var comData = {
                                attributes: {
                                    imgUrlPre: data.attributes.imgUrlPre
                                },
                                obj: []
                            };
                            var replyData = {
                                attributes: {
                                    imgUrlPre: data.attributes.imgUrlPre
                                },
                                obj: []
                            };
                            comData.obj = $.grep(data.obj, function(item) {                               
                                return !item.zoco_parentid && !$detailBox.find('.comment_item[zoco-id="' + item.zoco_id + '"]').length;
                            });
                            replyData.obj = $.grep(data.obj, function(item) {
                                return item.zoco_parentid && !$detailBox.find('.comment_item[zoco-id="' + item.zoco_id + '"]').length;
                            });
                            var $newDetailBox = $detailBox;
                            if (comData.obj.length) {
                                var comHtml = $.template($('#zoneDetail-commont-temp').html(), {
                                    datalist: comData
                                });                            
                                $(comHtml).each(function(i, n) {
                                    if ($(n).hasClass('comment_item')) {
                                        if ($newDetailBox.find('.r.new').length) {
                                            $newDetailBox.find('.r.new:first').before(n);
                                        } else {
                                            $newDetailBox.append(n);
                                        }
                                    }                                
                                });      
                            }                            
                            var replyHtml = $.template($('#zoneDetail-reply-temp').html(), {
                                datalist: replyData
                            });
                            $layerBox.find('.comment-temp').html(replyHtml);
                            $layerBox.find('.comment-temp .comment_item').each(function() {
                                var parentId = $(this).attr('parent-id');
                                var parentItem = $newDetailBox.find('.comment_item[zoco-id="' + parentId + '"]');
                                var nextItem = parentItem.next();
                                if (nextItem.hasClass('sub')) {
                                    var $lastReply = parentItem.nextAll('.sub[parent-id="' + parentId + '"]:last')
                                    if ($lastReply.hasClass('new')) {
                                        $lastReply.before($(this));
                                    } else {
                                        $lastReply.after($(this));
                                    }                                    
                                } else {
                                    parentItem.after($(this));
                                }
                            });
                            $newDetailBox.find('.reply-name').each(function() {
                                var parentId = $(this).attr('parent-id');
                                var parentName = $newDetailBox.find('.user_home[zoco-id="' + parentId + '"]').html();
                                $(this).html(parentName);
                            });

                            initComTrans();
                            //$contentDiv.mCustomScrollbar('scrollTo', 'bottom');
                            if (data.obj.length < 10) {
                                isLast = true;
                                $moreComment.addClass('hide');
                            }
                        } else {
                            isLast = true;
                            $moreComment.addClass('hide');
                            layer.msg($.t('zone.nomorecomment'), {
                                time: 1000
                            });
                        }
                    });
                });

                //评论翻译与展示
                initComTrans();

                function initComTrans() {
                    var $transBtn2 = $layerBox.find('.dt_tranS_btn2');
                    $transBtn2.each(function() {
                        var $thisTrans = $(this);
                        if ($(this).attr('istrans') == 0) {
                            var $langae2 = $thisTrans.find('.language_obj_detail');
                            $langae2.find('li').unbind('click').click(function() {
                                var transType = $(this).attr('langs-lang');
                                var $thisStransBtn = $(this).closest('.dt_tranS_btn2');
                                var $transBox2 = $thisTrans.parent().next();
                                var zocoId = $thisStransBtn.attr('zoco-id');
                                $.fn.checkTrans($thisStransBtn.prev('span').html(), function() {
                                    $thisStransBtn.addClass('sub_trans_londing');
                                    $._post(apiUrl + '/ZoneComment/translate', {
                                        zocoId: zocoId,
                                        translatType: transType
                                    }, function(data) {                                        
                                        if (data.success) {
                                            layer.msg($.t('global.zoneApiSucc'));
                                            if (data.obj.zmtrCompletime) {
                                                $transBox2.removeClass('hide').html(data.obj.zmtrTranslathigh || data.obj.zmtrTranslat);
                                                $thisStransBtn.remove();                                                
                                            } else {           
                                                $thisStransBtn.find('.language_obj_detail').remove();                                     
                                            }                                                                                                                        
                                            $thisStransBtn.attr('istrans', '1');

                                            returnData.comTrans = returnData.comTrans || [];
                                            returnData.comTrans.push(data.obj);
                                        } else {
                                            $thisStransBtn.removeClass('sub_trans_londing');
                                            layer.msg($.t('global.zoneApiError'), {
                                                time: 1000
                                            });
                                        }
                                    }, function() {
                                        $thisStransBtn.removeClass('sub_trans_londing');
                                        layer.msg($.t('global.zoneApiError'), {
                                            time: 1000
                                        });
                                    });
                                });
                            });
                            $(this).hover(function() {
                                if ($(this).position().left >= 100) {
                                    var _left = Math.ceil($(this).position().left) - 100;
                                    $langae2.css('left', (-30 - _left + 'px'));
                                    $langae2.find('.lanI').css('left', (_left + 30 + 'px'));
                                }
                            }, function() {

                            });
                        }
                        if ($(this).attr('istrans') == 1) {
                            $(this).click(function() {
                                var $transBox2 = $(this).parent().next();
                                if ($transBox2.is(':visible')) {
                                    $transBox2.addClass('hide');
                                } else {
                                    $transBox2.removeClass('hide');
                                }
                            });
                        }
                    });
                }

                //评论删除
                var delNum = 0;
                $layerBox.find('.detail_comment').delegate('.del_comment', 'click', function() {
                    var delId = $(this).attr('del-id');
                    var $comItem = $(this).closest('.comment_item');
                    $._post(apiUrl + '/ZoneComment/delete', {
                        zocoId: delId
                    }, function(data) {
                        if (data.success) {
                            $layerBox.find('.detail_comment').find('.comment_item[zoco-id="' + delId + '"]').remove();
                            $layerBox.find('.detail_comment').find('.comment_item[parent-id="' + delId + '"]').remove();
                            //layer.msg($.t('global.zoneApiSucc'));
                            if (!$comItem.hasClass('sub')) {
                                $commentNum.html(Number($commentNum.html()) - 1);
                            }
                            returnData.delArr = returnData.delArr || [];
                            returnData.delArr.push(delId);
                        } else {
                            layer.msg($.t('global.zoneApiError'), {
                                time: 1000
                            });
                        }
                    });
                });

                //对动态评论
                var $detailPushBtn = $layerBox.find('.detail_comment_input');
                var $detailPushBox = $layerBox.find('.reply_box');
                var $pushInput = $detailPushBox.find('textarea');
                var $commentNum = $layerBox.find('.detail_info .onreply span');
                var $textLeng = $layerBox.find('.reply-lens');
                $layerBox.find('.detail_info .onreply').click(function() {
                    detailZonePush($(this).attr('zone-id'));
                });
                $layerBox.find('.detail_comment_input').click(function() {
                    detailZonePush($(this).attr('zone-id'));
                });

                //对评论的回复
                $layerBox.find('.detail_comment').delegate('.dt_reply_btn2', 'click', function() {
                    detailZonePush($(this).attr('reply-id'), 'reply');
                });


                function detailZonePush(id, type) {
                    $detailPushBtn.hide();
                    $detailPushBox.removeClass('hide');
                    $pushInput.blur(function() {
                        if ($pushInput.val() === '') {
                            $detailPushBtn.show();
                            $detailPushBox.addClass('hide');
                        }
                    }).keyup(function() {
                        var val = $pushInput.val();
                        if ($.trim(val)) {
                            if (val.length >= 240) {
                                $pushInput.val(val.substring(0, 240));
                            }
                            $textLeng.html($pushInput.val().length + '/240');
                        } else {
                            $pushInput.val('');
                            $textLeng.html('0/240');
                        }
                    }).focus();
                    var $pushBtn = $layerBox.find('.reply_send');
                    $pushBtn.unbind('click').click(function() {
                        var value = $.fn.xss($pushInput.val());
                        if (value) {
                            $._post(apiUrl + '/ZoneComment/publish', {
                                zoneId: zoneId,
                                zocoParentid: type == 'reply' ? id : undefined,
                                content: value
                            }, function(data) {
                                if (data.success) {
                                    if ($detailBox.is(':hidden')) {
                                        $detailBox.removeClass('hide');
                                    }
                                    var comData = {
                                        attributes: data.attributes,
                                        obj: [data.obj]
                                    };
                                    returnData.attributes = data.attributes;
                                    returnData.obj.push(data.obj);
                                    var newOne;
                                    if (type == 'reply') {
                                        var replyHtml = $.template($('#zoneDetail-reply-temp').html(), {
                                            datalist: comData
                                        });
                                        newOne = $(replyHtml).addClass('new');
                                        var $newDetailBox = $detailBox;
                                        $layerBox.find('.comment-temp').html(newOne);
                                        $layerBox.find('.comment-temp .comment_item').each(function() {
                                            var parentId = $(this).attr('parent-id');
                                            var parentItem = $newDetailBox.find('.comment_item[zoco-id="' + parentId + '"]');
                                            var nextItem = parentItem.next();
                                            if (nextItem.hasClass('sub')) {
                                                parentItem.nextAll('.sub[parent-id="' + parentId + '"]:last').after($(this));
                                            } else {
                                                parentItem.after($(this));
                                            }
                                        });
                                        $newDetailBox.find('.reply-name').each(function() {
                                            var parentId = $(this).attr('parent-id');
                                            var parentName = $newDetailBox.find('.user_home[zoco-id="' + parentId + '"]').html();
                                            $(this).html(parentName);
                                        });
                                    } else {
                                        var comHtml = $.template($('#zoneDetail-commont-temp').html(), {
                                            datalist: comData
                                        });
                                        newOne = $(comHtml).addClass('new');
                                        $layerBox.find('.detail_comment').append(newOne);
                                        $commentNum.html(Number($commentNum.html()) + 1);
                                    }
                                    initComTrans();
                                    $contentDiv.mCustomScrollbar('scrollTo', 'bottom');
                                    //layer.msg($.t('global.zoneApiSucc'));
                                    $detailPushBox.addClass('hide');
                                    $pushInput.val('');
                                    $textLeng.html('0/240');
                                    $detailPushBtn.show();
                                } else { //$.t('global.zoneApiError')
                                    layer.msg(data.msg, {
                                        time: 1000
                                    });
                                }
                            });
                        }
                    });
                }

            }
        },
        uploadImg: function(callback) {
            var BASE_URL = '..';
            var isUp = true,

                $wrap = $('#uploader'),

                // 图片容器
                $queue = $('<ul class="filelist"></ul>').appendTo($wrap.find('.queueList')),

                // 状态栏，包括进度和控制按钮
                $statusBar = $wrap.find('.statusBar'),

                // 文件总体选择信息。
                $info = $wrap.find('.info'),

                // 上传按钮
                $upload = $wrap.find('.uploadBtn'),

                // 没选择文件之前的内容。
                $placeHolder = $wrap.find('.placeholder'),

                // 总体进度条
                $progress = $statusBar.find('.progress').hide(),

                // 添加的文件数量
                fileCount = 0,

                //剩余上传的数量
                fileSurplus = 9,

                // 添加的文件总大小
                fileSize = 0,

                // 优化retina, 在retina下这个值是2
                ratio = window.devicePixelRatio || 1,

                // 缩略图大小
                thumbnailWidth = 78 * ratio,
                thumbnailHeight = 78 * ratio,

                // 可能有pedding, ready, uploading, confirm, done.
                state = 'pedding',

                // 所有文件的进度信息，key为file id
                percentages = {},
                token, key,

                supportTransition = (function() {
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
            if (!WebUploader.Uploader.support()) {
                alert('Web Uploader 不支持您的浏览器！如果你使用的是IE浏览器，请尝试升级 flash 播放器');
                throw new Error('WebUploader does not support the browser you are using.');
            }
            if (uploader) {
                uploader.destroy();
            }
            // 实例化
            uploader = WebUploader.create({
                auto: false,
                pick: {
                    id: '#filePicker',
                    label: ''
                },
                dnd: '#uploader .queueList',
                paste: document.body,
                thumb: {
                    quality: 100
                },
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                },

                // swf文件路径
                swf: path + '/common/js/Uploader.swf',

                disableGlobalDnd: true,

                chunked: true,
                server: 'http://up.qiniu.com/',
                fileNumLimit: 9,
                fileSizeLimit: 50 * 1024 * 1024, // 
                fileSingleSizeLimit: 5 * 1024 * 1024 // 5 M
            });

            // 添加“添加文件”的按钮，
            uploader.addButton({
                id: '#filePicker2',
                label: '继续添加'
            });

            // 当有文件添加进来时执行，负责view的创建
            function addFile(file) {
                if ($queue.find("li").size() >= 8) {
                    $("#filePicker2").hide();
                } else {
                    $("#filePicker2").show();
                }
                var $li = $('<li id="' + file.id + '">' +
                        '<p class="title">' + file.name + '</p>' +
                        '<p class="imgWrap"></p>' +
                        '<p class="progress"><span></span></p>' +
                        '</li>'),

                    $btns = $('<div class="file-panel">' +
                        '<span class="cancel">删除</span>').appendTo($li),
                    $prgress = $li.find('p.progress span'),
                    $wrap = $li.find('p.imgWrap'),
                    $info = $('<p class="error"></p>'),

                    showError = function(code) {
                        switch (code) {
                            case 'exceed_size':
                                text = $.t('global.uploadBig');
                                break;

                            case 'interrupt':
                                text = $.t('global.uploadHold');
                                break;

                            default:
                                text = $.t('global.uploadfailed');
                                break;
                        }

                        $info.text(text).appendTo($li);
                    };

                if (file.getStatus() === 'invalid') {
                    showError(file.statusText);
                } else {
                    // @todo lazyload
                    $wrap.text('预览中');
                    uploader.makeThumb(file, function(error, src) {
                        if (error) {
                            $wrap.text('不能预览');
                            return;
                        }

                        var img = $('<img src="' + src + '">');
                        $wrap.empty().append(img);
                    }, thumbnailWidth, thumbnailHeight);

                    percentages[file.id] = [file.size, 0];
                    file.rotation = 0;
                }

                file.on('statuschange', function(cur, prev) {
                    if (prev === 'progress') {
                        $prgress.hide().width(0);
                    } else if (prev === 'queued') {
                        $li.off('mouseenter mouseleave');
                        $btns.remove();
                    }

                    // 成功
                    if (cur === 'error' || cur === 'invalid') {
                        // console.log( file.statusText );
                        showError(file.statusText);
                        percentages[file.id][1] = 1;
                    } else if (cur === 'interrupt') {
                        showError('interrupt');
                    } else if (cur === 'queued') {
                        percentages[file.id][1] = 0;
                    } else if (cur === 'progress') {
                        $info.remove();
                        $prgress.css('display', 'block');
                    } else if (cur === 'complete') {
                        $li.append('<span class="success"></span>');
                    }

                    $li.removeClass('state-' + prev).addClass('state-' + cur);
                });

                $li.on('mouseenter', function() {
                    $btns.stop().animate({
                        height: 87
                    });
                });

                $li.on('mouseleave', function() {
                    $btns.stop().animate({
                        height: 0
                    });
                });

                $btns.on('click', 'span', function() {
                    var index = $(this).index(),
                        deg;

                    switch (index) {
                        case 0:
                            uploader.removeFile(file);
                            return;

                        case 1:
                            file.rotation += 90;
                            break;

                        case 2:
                            file.rotation -= 90;
                            break;
                    }

                    if (supportTransition) {
                        deg = 'rotate(' + file.rotation + 'deg)';
                        $wrap.css({
                            '-webkit-transform': deg,
                            '-mos-transform': deg,
                            '-o-transform': deg,
                            'transform': deg
                        });
                    } else {
                        $wrap.css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + (~~((file.rotation / 90) % 4 + 4) % 4) + ')');
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

                $li.appendTo($queue);
                // console.log( file);
                // console.log( percentages);

            }

            // 负责view的销毁
            function removeFile(file) {
                var $li = $('#' + file.id);
                delete percentages[file.id];
                updateTotalProgress();
                $li.off().find('.file-panel').off().end().remove();
                if ($queue.find("li").size() > 8) {
                    $("#filePicker2").hide();
                } else {
                    $("#filePicker2").show();
                    $("#filePicker").hide();
                }
            }

            function updateTotalProgress() {
                var loaded = 0,
                    total = 0,
                    spans = $progress.children(),
                    percent;

                $.each(percentages, function(k, v) {
                    total += v[0];
                    loaded += v[0] * v[1];
                });

                percent = total ? loaded / total : 0;

                spans.eq(0).text(Math.round(percent * 100) + '%');
                spans.eq(1).css('width', Math.round(percent * 100) + '%');
                updateStatus();
            }

            function updateStatus() {
                var text = '',
                    stats;

                if (state === 'ready') {
                    text = $.t('zone.upImgWord', {'max': fileCount, 'surplus': fileSurplus});
                } else if (state === 'confirm') {
                    stats = uploader.getStats();
                    if (stats.uploadFailNum) {
                        text = $.t("home.uploadResultTip", {
                                uploaded: stats.successNum,
                                failed: stats.uploadFailNum
                            }) +
                            '<a class="retry c-2d57a1 curPor mr10" href="#"> ' + $.t("home.reupload") + '</a>' + $.t("home.or") + '<a class="ignore c-2d57a1 curPor ml10" href="#">' + $.t("home.ignore") + '</a>';
                    }

                } else {
                    stats = uploader.getStats();
                    text = $.t('zone.upImgWord', {'max': fileCount, 'surplus': fileSurplus});
                }

                $info.html(text);
            }

            function setState(val) {
                var file, stats;

                if (val === state) {
                    return;
                }

                $upload.removeClass('state-' + state);
                $upload.addClass('state-' + val);
                state = val;

                switch (state) {
                    case 'pedding':
                        $placeHolder.removeClass('element-invisible');
                        $queue.parent().removeClass('filled');
                        $queue.hide();
                        $statusBar.addClass('element-invisible');
                        uploader.refresh();
                        break;

                    case 'ready':
                        $placeHolder.addClass('element-invisible');
                        $('#filePicker2').removeClass('element-invisible');
                        $queue.parent().addClass('filled');
                        $queue.show();
                        $statusBar.removeClass('element-invisible');
                        uploader.refresh();
                        break;

                    case 'uploading':
                        $('#filePicker2').addClass('element-invisible');
                        $progress.show();
                        $upload.text($.t('global.uploadHold'));
                        var loadIndex = layer.load(0, {
                            shade: 0.1
                        });
                        break;

                    case 'paused':
                        $progress.show();
                        $upload.text($.t('global.uploadContinue'));
                        break;

                    case 'confirm':
                        $progress.hide();
                        $upload.text($.t('global.uploadStart')).addClass('disabled');

                        stats = uploader.getStats();
                        if (stats.successNum && !stats.uploadFailNum) {
                            setState('finish');
                            return;
                        }
                        break;
                    case 'finish':
                        stats = uploader.getStats();
                        if (stats.successNum) {
                            layer.msg($.t('global.uploadSucc'));
                            layer.closeAll('loading');
                            if (callback) {
                                callback();
                            }
                        } else {
                            // 没有成功的图片，重设
                            state = 'done';
                            location.reload();
                        }
                        break;
                }

                updateStatus();
            }

            uploader.onUploadProgress = function(file, percentage) {
                var $li = $('#' + file.id),
                    $percent = $li.find('.progress span');

                $percent.css('width', percentage * 100 + '%');
                percentages[file.id][1] = percentage;
                updateTotalProgress();
            };

            uploader.onFileQueued = function(file) {
                fileCount++;
                fileSurplus--;
                fileSize += file.size;

                if (fileCount === 1) {
                    $placeHolder.addClass('element-invisible');
                    $statusBar.show();
                    $("#filePicker2").show();
                }

                addFile(file);

                setState('ready');
                updateTotalProgress();

            };

            var index = 0;
            uploader.on('uploadBeforeSend', function(block, data) {
                // console.log('as:' +block)
                key = $("#upLoad_box").attr("data-key").split(",");
                token = $("#upLoad_box").attr("data-upToken");
                data.key = key[index];
                data.token = token;
                index++;
            });

            uploader.on('uploadAccept', function(block, data) {

            });
            uploader.onFileDequeued = function(file) {
                fileCount--;
                fileSurplus++;
                fileSize -= file.size;

                if (!fileCount) {
                    setState('pedding');
                }

                removeFile(file);
                updateTotalProgress();

            };

            uploader.on('all', function(type) {
                var stats;
                switch (type) {
                    case 'uploadFinished':
                        setState('confirm');
                        break;

                    case 'startUpload':
                        key = $("#upLoad_box").attr("data-key");
                        token = $("#upLoad_box").attr("data-upToken");
                        setState('uploading');
                        break;

                    case 'stopUpload':
                        setState('paused');
                        break;

                }
            });

            uploader.onError = function(code) {
                console.log('Eroor: ' + code);
                if (code == "Q_EXCEED_NUM_LIMIT") {
                    layer.msg($.t('global.uploadMax'));
                }
                if (code == "F_DUPLICATE") {
                    layer.msg($.t('global.uploadRepeat'));
                }
                if (code == "F_EXCEED_SIZE") {
                    layer.msg($.t('global.uploadBig'));
                }
                if (code == "Q_TYPE_DENIED") {
                    layer.msg($.t('global.uploadTypeError'));
                }
            };

            $upload.on('click', function() {
                if ($(this).hasClass('disabled')) {
                    return false;
                }

                if (state === 'ready') {
                    uploader.upload();
                } else if (state === 'paused') {
                    uploader.upload();
                } else if (state === 'uploading') {
                    uploader.stop();
                }
            });

            $info.on('click', '.retry', function() {
                uploader.retry();
            });

            $info.on('click', '.ignore', function() {
                layer.msg('todo');
            });

            $upload.addClass('state-' + state);
            updateTotalProgress();
        },
        checkTrans: function(str, callback, error, cancelCallback) {
            var newStr = str.replace(/<\s?img[^>]*>/gi, '') // /<img\s*src=\"([^\"]*?)\"\s*\/>/gi            
            $._post(apiUrl + '/pm/getTranGold', {
                msg: newStr
            }, function(data) {
                if (data.success && (data.obj != -1)) {
                    if (data.obj == 0) {
                        if (callback) {
                            callback();
                        }
                    } else { //area: ['300px', '174px'],    <br/><a href="' + apiUrl + '/pay/translationPack">' + $.t('im.buyPackageMoreCost-effective') + '</a>
                        layer.open({
                            skin: 'tran-gold-layer',
                            title: false,
                            content: '<p>' + $.t('im.translationNeeds') + $.t('im.goldContinue') + '</p>',
                            btn: [$.t('global.ok'), $.t('global.cancel')],
                            yes: function(index, layero) {
                                if (callback) {
                                    callback();
                                }
                                layer.close(index);
                            },
                            cancel: function() {
                            	if (cancelCallback) {
                            		cancelCallback();
                                }
                            }
                        });
                    }

                } else {
                    if (error) {
                        error();
                    }
                    layer.open({ //area: ['300px', '174px'],                        
                        skin: 'tran-gold-layer',
                        title: false,
                        content: '<p>' + $.t('im.goldLack') + $.t('im.ToRecharge') + '</p>',
                        btn: $.t('im.ToRecharge'),
                        yes: function(index, layero) {
                            window.location = apiUrl + '/pay/recharge';
                        },
                        cancel: function() {}
                    });
                }
            });
        }
    });

    $.zone = $.zone || {};
    $.zone = {
        changeZoneTrans: function(transObj) {
            //console.log('动态翻译', transObj);
            if (!transObj) return;
            var locationUrl = window.location.pathname;
            var isZonePage = locationUrl.indexOf('/Zone') != -1;
            var $zoneItem = isZonePage ? $('#zone_list .dynamic_item[data-zoneid="' + transObj.zotrZoneid + '"] .js_detail_trans') : $('#gerendongtai li[zone-id="' + transObj.zotrZoneid + '"] .translate_content');
            if (isZonePage) {
                $('.trans_londing[data-id="' + transObj.zotrZoneid + '"]').remove();
                $zoneItem.parent().removeClass('hide');
            } else {
                $zoneItem.closest('.dynamic-top').find('.dt_tranS_box.zones').remove();
                $zoneItem.parent().show();
            }            
            $zoneItem.html(transObj.zotrTranslat);

            if ($('.layui-layer-content .trans_londing[data-id="' + transObj.zotrZoneid + '"]')) {
                var $layerTransBtn = $('.layui-layer-content .trans_londing[data-id="' + transObj.zotrZoneid + '"]');
                var $layerTransBox = $('.layui-layer-content .detail_trans');
                $layerTransBtn.remove();
                $layerTransBox.removeClass('hide').find('.text').html(transObj.zotrTranslat);
            }
        },
        changeCommentTrans: function(transObj) {
            //console.log('评论翻译', transObj);
            if (!transObj) return;
            var locationUrl = window.location.pathname;
            var isZonePage = locationUrl.indexOf('/Zone') != -1;
            var $commentItem = isZonePage ? $('#zone_list .dynamic_item .comment_item[reply-id="' + transObj.zmtrCommentid + '"] .sub-trans span') : $('#gerendongtai .commont-content-out[data-id="' + transObj.zmtrCommentid + '"] .zoco_content-translate');
            if (isZonePage) {
                $commentItem.closest('.comment_item').find('.dt_tranS_btn2').remove();
                $commentItem.parent().removeClass('hide');
            } else {
                $commentItem.closest('.commont-content-out').find('.dt_tranS_box').remove();
                $commentItem.parent().show();
            }            
            $commentItem.html(transObj.zmtrTranslat);

            if ($('.layui-layer-content .sub_trans_londing[zoco-id="' + transObj.zmtrCommentid + '"]')) {
                var $layerTransBtn = $('.layui-layer-content .sub_trans_londing[zoco-id="' + transObj.zmtrCommentid + '"]');
                var $layerTransBox = $layerTransBtn.parent().next();
                $layerTransBtn.remove();
                $layerTransBox.removeClass('hide').html(transObj.zmtrTranslat);
            }
        },
        filterZone: function(str) {
            if (str) {
                var _str = $.string.decodeHtml(str);
                return _str.replace(/\[[a-z]+\_[0-9]+\]/g, '').replace(/<[^>]*>/g, '').replace(/\[[0-9]+\]/g, '');
            } else {
                return '';          
            }            
        },
        getBrIndex: function(str) {
            if (str) {
                 var i = 0;
                var rows = 0;
                var index;
                while (i != -1) {
                    i = str.indexOf('<br', i);
                    if (i != -1) {
                        if (rows == 3) break;
                        index = i;
                        i++;
                        rows++;
                    }
                };
                return index;
            }           
        },
        likeAct: function(obj,from) {
            var img = '<em class="like-style"></em>';
            $(obj).append(img);
            if (from) {
                $('.like-style').css(from);
            }            
            $('.like-style').stop(false, true).animate({
                top: "-40px",
                opacity: "0"
            }, 500, undefined, function() {
                $('.like-style').remove();
            });
        }
    };
})(jQuery);
