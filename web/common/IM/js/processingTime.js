function TimeDifference(time2, time1) {
    //定义两个变量time1,time2分别保存开始和结束
    //var time1 = "2009-12-02 12:25";
    //var time2 = "2009-12-03 12:35";


    //判断开始时间是否大于结束日期
    //if (time1 > time2) {
    //    //alert("开始时间不能大于结束时间！");
    //    return false;
    //}
    if (time1=="") {
        //alert("结束时间");
       // console.log("a");
        return time2.substr(0, 16);
      //  return "年月日时分";
    }
    //截取年份
    var year1 = time1.substr(0, 4);
    var year2 = time2.substr(0, 4);
   // console.log("bb");
    if ((year2 - year1) > 0) {
       // console.log("b");
        return time1.substr(0, 16);
       // return "年月日时分";
    }

    //截取字符串，得到日期部分"2009-12-02",用split把字符串分隔成数组
    var begin1 = time1.substr(0, 10).split("-");
    var end1 = time2.substr(0, 10).split("-");

    //将拆分的数组重新组合，并实例成化新的日期对象
    /*var date1 = new Date(begin1[1] + - +begin1[2] + - +begin1[0]);
    var date2 = new Date(end1[1] + - +end1[2] + - +end1[0]);*/
    var date1 = new Date(begin1[1],begin1[2],begin1[0]);
    var date2 = new Date(end1[1],end1[2],end1[0]);

    //得到两个日期之间的差值m，以分钟为单位
    //Math.abs(date2-date1)计算出以毫秒为单位的差值
    //Math.abs(date2-date1)/1000得到以秒为单位的差值
    //Math.abs(date2-date1)/1000/60得到以分钟为单位的差值
    var m = parseInt(Math.abs(date2 - date1) / 1000 / 60);
    //console.log("cc");
    if (m > 0) {
      //  console.log("c");
        return time1.substr(5, 11);
       // return "月日时分";
    }


    //小时数和分钟数相加得到总的分钟数
    //time1.substr(11,2)截取字符串得到时间的小时数
    //parseInt(time1.substr(11,2))*60把小时数转化成为分钟
    var min1 = parseInt(time1.substr(11, 2)) * 60 + parseInt(time1.substr(14, 2));
    var min2 = parseInt(time2.substr(11, 2)) * 60 + parseInt(time2.substr(14, 2));

    //两个分钟数相减得到时间部分的差值，以分钟为单位
    var n = min2 - min1;
  //  console.log("n:"+n);
  //  console.log("dd");
    if (n >0) {
       // console.log(min2 + "||" + min1);
        return time1.substr(11, 5);
        //return "时分";
    } else {
        return "";
    }

    //将日期和时间两个部分计算出来的差值相加，即得到两个时间相减后的分钟数
   // var minutes = m + n;
    // document.writeln(minutes);

    

    //if (!endTime) {
    //    return "年月日时分";
    //}
    //var startTime = new Date(startTime);
    //var yearStart = startTime.getFullYear();
    //var monthStart = startTime.getMonth();
    //var dayStart = startTime.getDate();
    //var hStart = startTime.getHours();
    //var mStart = startTime.getMinutes();

    //var endTime = new Date(endTime);
    //var yearEnd = endTime.getFullYear();
    //var monthEnd = endTime.getMonth();
    //var dayEnd = endTime.getDate();
    //var hEnd = endTime.getHours();
    //var mEnd = endTime.getMinutes();
    //console.log(yearEnd + "||" + yearStart);
    //if ((yearEnd - yearStart) > 0) {
    //    return "年月日时分";
    //}
    //if ((monthEnd - monthStart) > 0) {
    //    return "月日时分";
    //}
    //if ((dayEnd - dayStart) > 0) {
    //    return "月日时分";
    //}
    //if ((hEnd * 60 + mEnd - hStart * 60 - mStart) > 0) {
    //    return "时分";
    //}
    //return "";
}
/*---newTime < oldTime----newTime---*/
function TimeDifference2(newTime, oldTime,nowTime) {
    //定义两个变量oldTime,newTime分别保存开始和结束
    //var oldTime = "2009-12-02 12:25";
    //var newTime = "2009-12-03 12:35";
    //截取年份
    var oldYear = oldTime.substr(0, 4);
    var newYear = newTime.substr(0, 4);
    var nowYear = null;
    var nowDate = null;
    var nowm = null;
    var end = newTime.substr(0, 10).split("-");
    var newDate = new Date(end[1],end[2],end[0]);
    if(nowTime){
        nowYear = nowTime.substr(0, 4);
        var nowYMR = nowTime.substr(0, 10).split("-");
        nowDate = new Date(nowYMR[1],nowYMR[2],nowYMR[0]);
        nowm = parseInt(Math.abs(nowDate - newDate) / 1000 / 60);
    } 

    //判断开始时间是否大于结束日期
    if (oldTime == "" ) {
        if(nowTime && (nowYear == newYear)){
            if(nowm ==0){
                return newTime.substr(11, 5);
                // return "时分"; 
            }else{
               return newTime.substr(5, 11);
               // return "月日时分"; 
            } 
        }else{
             return newTime.substr(0, 16); 
             // return "年月日时分";
        }  
    }
    
    if((newYear - oldYear) > 0){
        if(nowTime && (nowYear == newYear)){
             return newTime.substr(5, 11);
             // return "月日时分";
        }else{
             return newTime.substr(0, 16);
             // return "年月日时分";
        }
    }
     //截取字符串，得到日期部分"2009-12-02",用split把字符串分隔成数组
    var begin = oldTime.substr(0, 10).split("-");
    //将拆分的数组重新组合，并实例成化新的日期对象
    var oldDate = new Date(begin[1],begin[2],begin[0]);
   

    //得到两个日期之间的差值m，以分钟为单位
    //Math.abs(newDate-oldDate)计算出以毫秒为单位的差值
    //Math.abs(newDate-oldDate)/1000得到以秒为单位的差值
    //Math.abs(newDate-oldDate)/1000/60得到以分钟为单位的差值
    var m = parseInt(Math.abs(newDate - oldDate) / 1000 / 60);
    if (m > 0) {
        if(nowTime && nowm == 0){
            return newTime.substr(11, 5);
            //return "时分";
        }else{
            return newTime.substr(5, 11);
            //return "月日时分"
        }
    }
    
    
    
    //小时数和分钟数相加得到总的分钟数
    //oldTime.substr(11,2)截取字符串得到时间的小时数
    //parseInt(oldTime.substr(11,2))*60把小时数转化成为分钟
    var oldMin = parseInt(oldTime.substr(11, 2)) * 60 + parseInt(oldTime.substr(14, 2));
    var newMin = parseInt(newTime.substr(11, 2)) * 60 + parseInt(newTime.substr(14, 2));

    //两个分钟数相减得到时间部分的差值，以分钟为单位
    var n = newMin - oldMin;    
    if(n >0){
        if(nowTime && nowm == 0){
            return newTime.substr(11, 5);
            //return "时分";
        }else{
            return newTime.substr(5, 11);
            //return "月日时分"
        }
    }else{
        return "";
    }  
}
function jsonDateFormat(jsonDate) {//json日期格式转换为正常格式
    try {//出自http://www.cnblogs.com/ahjesus 尊重作者辛苦劳动成果,转载请注明出处,谢谢!
        var date = new Date(parseInt(jsonDate.replace("/Date(", "").replace(")/", ""), 10));
        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
        var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
       // var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
       // var milliseconds = date.getMilliseconds();
        return date.getFullYear() + "-" + month + "-" + day + " " + hours + ":" + minutes;// + ":" + seconds+ "." + milliseconds;
    } catch (ex) {//出自http://www.cnblogs.com/ahjesus 尊重作者辛苦劳动成果,转载请注明出处,谢谢!
        return "";
    }
}
function jsonDateFormatReceive(jsonDate) {//json日期格式转换为正常格式
    try {//出自http://www.cnblogs.com/ahjesus 尊重作者辛苦劳动成果,转载请注明出处,谢谢!
        jsonDate = jsonDate.replace("T", " ").split(".")[0];
        jsonDate = jsonDate.substr(0, 16);
        return jsonDate;
    } catch (ex) {//出自http://www.cnblogs.com/ahjesus 尊重作者辛苦劳动成果,转载请注明出处,谢谢!
        return "";
    }
}
function formatTime(t) {
    if (t < 9) {
        t = "0" + t;
    }
    return t;
}
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}