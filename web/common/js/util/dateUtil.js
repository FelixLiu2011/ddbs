var dateUtil = {};

dateUtil.getAgeByBirthDay = function(birthday){
    var age=-1;
    var today=new Date();
    var todayYear=today.getFullYear();
    var todayMonth=today.getMonth()+1;
    var todayDay=today.getDate();
    var birthday=parseDate(birthday);
    if(parseDate(birthday)!='时间转换发生错误！')
    {
        birthdayYear=birthday.getFullYear();
        birthdayMonth=birthday.getMonth();
        birthdayDay=birthday.getDate();
        if(todayYear-birthdayYear<0)
        {
            alert("出生日期选择错误!");
        }
        else
        {
            if(todayMonth*1-birthdayMonth*1<0)
            {
                age = (todayYear*1-birthdayYear*1)-1;
            }
            else
            {
                if(todayDay-birthdayDay>=0)
                {//alert(thisDay+'-'+brithd+"_ddd");
                    age = (todayYear*1-birthdayYear*1);
                }
                else
                {
                    age = (todayYear*1-birthdayYear*1)-1;
                }
            }
        }
        return age*1;
    }
    else
    {
        return -1;
    }
};

function parseDate(str){
    var birthday = "";
    birthday = birthday + str;
    if(birthday.match(/^\d{4}[\-\/\s+]\d{1,2}[\-\/\s+]\d{1,2}$/)){
        return new Date(birthday.replace(/[\-\/\s+]/i,'/'));
    }
}