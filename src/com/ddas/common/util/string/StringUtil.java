package com.ddas.common.util.string;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串处理共通
 * 
 * @version 1.0
 */
public class StringUtil extends StringUtils {

	public StringUtil() {
		super();
	}

	public static boolean isNull(String data) {
		return (data == null || data.trim().length() < 1);
	}

	public static boolean isNotNull(String data) {
		return !isNull(data);
	}

	public static String toNull(String data) {
		return isNull(data) ? null : data;
	}

	public static String toString(String data) {
		return isNull(data) ? "" : data;
	}

	public static String toString(BigDecimal data) {
		return data == null ? "" : data.toString();
	}

	public static BigDecimal nulltoZero(String data) {
		BigDecimal rtData = new BigDecimal(0);
		if (!isNull(data)) {
			rtData = new BigDecimal(data);
		}
		return rtData;
	}

	public static BigDecimal nulltoZero(BigDecimal data) {
		BigDecimal rtData = new BigDecimal(0);
		if (data != null) {
			rtData = data;
		}
		return rtData;
	}

	/**
	 * 生成随机字符串
	 * 
	 * @param size
	 * @return
	 */
	public static String getRandomString(int size) {
		char[] c = { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o',
				'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm' };
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < size; i++) {
			sb.append(c[Math.abs(random.nextInt()) % c.length]);
		}
		return sb.toString();
	}

	/**
	 * 格式化数字
	 * 
	 * @param str
	 * @return
	 */
	public static String toNumberFormat(String str) {
		NumberFormat n = NumberFormat.getNumberInstance();
		n.setGroupingUsed(true);
		double d;
		String outStr = null;
		try {
			d = Double.parseDouble(str);
			outStr = n.format(d);
		} catch (Exception e) {
		}
		return outStr;
	}

	/**
	 * 格式化数字
	 * 
	 * @param str
	 * @return
	 */
	public static String toDecimalFormat(String str) {
		return toDecimalFormat(str, "##,###,###,###,##0.00000");
	}

	/**
	 * 格式化数字
	 * 
	 * @param str
	 * @param pattern
	 * @return
	 */
	public static String toDecimalFormat(String str, String pattern) {
		if (StringUtil.isEmpty(pattern)) {
			return str;
		}
		DecimalFormat fmt = new DecimalFormat(pattern);
		fmt.setGroupingUsed(true);
		String outStr = null;
		double d;
		try {
			d = Double.parseDouble(str);
			outStr = fmt.format(d);
		} catch (Exception e) {
		}
		return outStr;
	}

	/**
	 * 格式化金额
	 * 
	 * @param str
	 * @return
	 */
	public static String toCurrencyFormat(String str) {
		NumberFormat n = NumberFormat.getCurrencyInstance(Locale.CHINA);
		n.setGroupingUsed(true);
		double d;
		String outStr = null;
		try {
			d = Double.parseDouble(str);
			outStr = n.format(d);
		} catch (Exception e) {
		}
		return outStr;
	}

	/**
	 * 格式化百分比
	 * 
	 * @param str
	 * @return
	 */
	public static String toPercentFormat(String str) {
		NumberFormat n = NumberFormat.getPercentInstance();
		n.setGroupingUsed(true);
		n.setMinimumFractionDigits(2);
		n.setMinimumIntegerDigits(1);
		double d;
		String outStr = null;
		try {
			d = Double.parseDouble(str);
			outStr = n.format(d);
		} catch (Exception e) {
		}
		return outStr;
	}

	/**
	 * 转大小写模式为大写下划线模式(非首大写转下划线，全大写)
	 * @param source 不带下划线的参数
	 * @return
	 */
	public static String unCamelUpperCase(String source) {
		if (StringUtil.isEmpty(source)) {
			return "";
		}
		String[] parts = split(source, "_");
		StringBuilder sb = new StringBuilder();
		for (String part : parts) {
			sb.append(capitalize(part));
		}
		source = capitalize(sb.toString());
		Pattern p = Pattern.compile("([A-Z]?[a-z0-9]*)");
		Matcher m = p.matcher(source);
		sb = new StringBuilder();
		while (m.find()) {
			sb.append(upperCase(m.group())).append("_");
		}
		return substringBefore(sb.toString(), "__");
	}

	/**
	 * 转大小写模式为小写下划线模式(非首大写转下划线，全小写)
	 * @param source
	 * @return
	 */
	public static String unCamelLowerCase(String source) {
		if (StringUtil.isEmpty(source)) {
			return "";
		}
		String[] parts = split(source, "_");
		StringBuilder sb = new StringBuilder();
		for (String part : parts) {
			sb.append(capitalize(part));
		}
		source = capitalize(sb.toString());
		Pattern p = Pattern.compile("([A-Z]?[a-z0-9]*)");
		Matcher m = p.matcher(source);
		sb = new StringBuilder();
		while (m.find()) {
			sb.append(lowerCase(m.group())).append("_");
		}
		return substringBefore(sb.toString(), "__");
	}

	/**
	 * 转下划线模式为大小写模式(大写开头)(下划线后第一个字母改为大写，首字母大写其余全小写)
	 * @param source
	 * @return
	 */
	public static String camelUpperCase(String source) {
		if (StringUtil.isEmpty(source)) {
			return "";
		}
		String[] parts = split(source, "_");
		StringBuilder sb = new StringBuilder();
		for (String part : parts) {
			sb.append(capitalize(lowerCase(part)));
		}
		return sb.toString();
	}
	
	/**
	 * 转成大写字符
	 * @param source
	 * @return
	 */
	public static String UpperCase(String source) {
		if (StringUtil.isEmpty(source)) {
			return "";
		}
		
		return source.toUpperCase();
	}
	
	/**
	 * 转成小写字符
	 * @param source
	 * @return
	 */
	public static String LowerCase(String source) {
		if (StringUtil.isEmpty(source)) {
			return "";
		}
		return source.toLowerCase();
	}

	/**
	 * 转下划线模式为大小写模式(小写开头)(下划线后第一个字母改为大写，其余全小写)
	 * @param source
	 * @return
	 */
	public static String camelLowerCase(String source) {
		if (StringUtil.isEmpty(source)) {
			return "";
		}
		String[] parts = split(source, "_");
		StringBuilder sb = new StringBuilder();
		for (String part : parts) {
			sb.append(capitalize(lowerCase(part)));
		}
		return uncapitalize(sb.toString());
	}

	public static String fixPath(String path) {
		String tempPath = path;
		if (isNotEmpty(tempPath)) {
			tempPath = StringUtil.replace(tempPath, "\\", "/");
			tempPath = StringUtil.endsWithIgnoreCase(tempPath, "/") ? tempPath : (tempPath + "/");
		}
		return tempPath;
	}
	
	/**
	 * Xml字符转换
	 * @param text
	 * @return
	 */
	public static String transToXmlStr(String text) {
		if (text == null)
			return "";
		String tmp = text.replace(">", "&rt;");
		tmp = tmp.replace("\"", "&quot;");
		tmp = tmp.replace("<", "&lt;");
		tmp = tmp.replace("\r", "&#13;");
		tmp = tmp.replace("\n", "&#10;");
		tmp = tmp.replace("&", "&amp;");
		return tmp;
	}
	/**
	 * Xml字符转换
	 * @param text
	 * @return
	 */
	public static String transFromXmlStr(String text) {
		if (text == null)
			return "";
		String tmp = text.replace("&rt;", ">");
		tmp = tmp.replace("&quot;", "\"");
		tmp = tmp.replace("&lt;", "<");
		tmp = tmp.replace("&#13;", "\r");
		tmp = tmp.replace("&#10;", "\n");
		tmp = tmp.replace("&amp;", "&");
		return tmp;
	}
	
	/**
	 * 测试
	 * 
	 * @param args
	 */
	public static void main(String args[]) {
		String userName = "1' or '1'='1";
		String password = "123456";
		userName = StringEscapeUtils.escapeSql(userName);
		password = StringEscapeUtils.escapeSql(password);
		String sql = "SELECT COUNT(userId) FROM t_user WHERE userName='"
				+ userName + "' AND password ='" + password + "'";
		System.out.println(sql);
		// System.out.println(StringUtil.getRandomString(32));
		// System.out.println(StringUtil.insertUnderLineBeforeUpperCase("U"));
		// System.out.println(StringUtil.insertUnderLineBeforeUpperCase("UU"));
		// System.out.println(StringUtil.insertUnderLineBeforeUpperCase("userId"));
		// System.out.println(StringUtil.insertUnderLineBeforeUpperCase("userID"));
		// System.out.println(StringUtil.insertUnderLineBeforeUpperCase("UserIdNameAA"));
		// System.out.println(StringUtil.insertUnderLineBeforeUpperCase("UserIdNameAAa"));
		//
		// String str = "0600450625465.5626";
		// System.out.println(StringUtil.toNumberFormat(str));
		// System.out.println(StringUtil.toDecimalFormat(str));
		// System.out.println(StringUtil.toCurrencyFormat(str));
		// System.out.println(StringUtil.toPercentFormat("0.8568"));
		// System.out.println(StringUtil.toPercentFormat("0.00308"));

		System.out.println("1:"+StringUtil.unCamelUpperCase("A"));
		System.out.println("2:"+StringUtil.unCamelUpperCase("Aa"));
		System.out.println("3:"+StringUtil.unCamelUpperCase("AA"));
		System.out.println("4:"+StringUtil.unCamelUpperCase("AAa2"));
		System.out.println("5:"+StringUtil.unCamelUpperCase("Aa1aB1"));
		System.out.println("6:"+StringUtil.unCamelUpperCase("AaaB2a_"));
		System.out.println("7:"+StringUtil.unCamelUpperCase("Abc1Def"));
		System.out.println("8:"+StringUtil.unCamelUpperCase("abcDef"));
		System.out.println("9:"+StringUtil.unCamelLowerCase("ABcDef"));
		System.out.println("10:"+StringUtil.unCamelLowerCase("ABcDef_"));
		System.out.println("11:"+StringUtil.unCamelLowerCase("ABc_Def_"));
		System.out.println("12:"+StringUtil.unCamelLowerCase("A_Bc_de_f1_"));
		System.out.println("13:"+StringUtil.camelUpperCase("ABCC_DEF"));
		System.out.println("14:"+StringUtil.camelLowerCase("ABCC_DEF"));
		// System.out.println(StringUtil.camelUpperCase("ABcc_DEF_"));
		// System.out.println(StringUtil.camelUpperCase("_ABcc_DEFe_"));
		// System.out.println(StringUtil.camelUpperCase("_ABc_c_DEF_"));
		// System.out.println(StringUtil.camelUpperCase("_ABc_1_c_DEF_"));
	}
}
