package com.ddas.common.util.uuid;

import java.util.UUID;

/**
 * UUID生成转换
 *
 */
public class UUIDUtil {
	public static void main(String arg[]){
		createUUID(32);
	}
	/**
	 * 生成uuid(20位)
	 * @return
	 */
	public static String createUUID20(){
		return createUUID(20);
	}

	/**
	 *a uuid string which length is 16
	 *@Author shaojunxiang
	 *@Date 2016/7/2 14:17
	 *@return java.lang.String
	 *@since JDK1.6
	 */
	public static String createUUID16(){
		return createUUID(16);
	}

    /**
     *get a uuid string which length depend on the parameter
     *@param length the uuid string length (0,32]
     *@Author shaojunxiang
     *@Date 2016/7/2 14:22
     *@return java.lang.String
     *@since JDK1.6
     */
	public static String createUUID(int length){
		if(length<=0||length>32){//if length is 0 ,so return will be "",this is meaningless.
            throw new IllegalArgumentException("request uuid length is error!length between(0,32]!");
        }
        String uuid;
        int index=(int)Math.round(Math.random()*10);
        uuid=UUID.randomUUID().toString().replaceAll("-","").substring(index,index+length);
		return uuid;
	}
}
