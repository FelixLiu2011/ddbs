/**
 * 项目名称:	SelfCreation
 * 文件名称:	MD5Util.java
 * 包名:		 com.ddas.common.util.crypto
 * 创建人 ：	shaojunxiang
 * 创建日期:	2016/7/6
 * Copyright (c) 2016, All Rights Reserved.
 */
package com.ddas.common.util.crypto;

import java.security.MessageDigest;

/**
 * ClassName:	MD5Util
 * Function: 	MD5加密
 *
 * @author shaojunxiang
 * @date 11:33
 * @since JDK 1.6
 */
public abstract class MD5Util {
    private MD5Util() {
    }


    /**
     *MD5加密，返回加密后的字符串
     *@param src 加密字符串
     *@Author shaojunxiang
     *@Date 2016/7/6 12:13
     *@return java.lang.String 加密后的字符串
     *@since JDK1.6
     */
    public static String hash(String src) {
        MessageDigest md5;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        char[] charArray = src.toCharArray();
        byte[] byteArray = new byte[charArray.length];

        for (int i = 0; i < charArray.length; i++)
            byteArray[i] = (byte) charArray[i];
        byte[] md5Bytes = md5.digest(byteArray);
        StringBuilder hexValue = new StringBuilder();
        for (byte md5Byte : md5Bytes) {
            int val = ((int) md5Byte) & 0xff;
            if (val < 16)
                hexValue.append("0");
            hexValue.append(Integer.toHexString(val));
        }
        return hexValue.toString();
    }

    public static void main(String[] args) {
        String hash = MD5Util.hash("12345");
        System.out.println(hash);
        System.out.println("827ccb0eea8a706c4c34a16891f84e7b".equals(hash));
    }

}
