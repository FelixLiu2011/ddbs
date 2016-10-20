package com.ddas.common.util.date;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by liuchen6 on 2016/7/5.
 */
public class DateUtil {
	/**
	 * 拿到当前系统的时间
	 *@param
	 *@return java.lang.String
	 *@Author liuchen6
	 *@Date 2016/7/5 15:09
	 *@since JDK1.7
	 */
	public static String getCurrentDateString() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String currentDateString = df.format(new Date());// new Date()为获取当前系统时间

		return currentDateString;
	}
}
