package com.ddas.common.util.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {
	/**
	 * 获取文件的参数
	 * @param key Propertiese文件KEY
	 * @return VALUE
	 */
   public static String getPropertiesValueByKey(String key,String filePath){
	   Properties prop = new Properties(); 
		try {	
			InputStream in = new FileInputStream(new File(filePath));
			prop.load(in);
			in.close();
			return prop.getProperty(key);
		} catch (Exception e) {
			e.printStackTrace();
			return "";	
		}	
	}
    
}
