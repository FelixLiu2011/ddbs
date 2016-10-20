package com.ddas.sns.util;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * ClassName:	MD5Util
 * Function: 	MD5 加密工具类
 *
 * @author shaojx
 * @date 2016/9/8 21:10
 * @since JDK 1.6
 */
public final class MD5Util {
    private MD5Util(){}

    /**
     * 对字符串md5加密
     * @param str
     * @return
     */
    public static String getMD5(String str) {
        try {
            // 生成一个MD5加密计算摘要
            MessageDigest md = MessageDigest.getInstance("MD5");
            // 计算md5函数
            md.update(str.getBytes());
            // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
            // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
            return new BigInteger(1, md.digest()).toString(16);
        } catch (Exception e) {
            throw new RuntimeException("MD5加密出现错误");
        }
    }

    public static void main(String[] args) {
        String str="Zzadmin~";
        System.out.println(getMD5(str));
        System.out.println(getMD5(str).equals("827ccb0eea8a706c4c34a16891f84e7b"));
    }

}
