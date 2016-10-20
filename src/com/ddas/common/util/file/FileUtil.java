package com.ddas.common.util.file;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;


public class FileUtil {
	/**
	 * 根据路径获取文件 字符串
	 * @param path 文件路径
	 * @return 文件字符串
	 */
  public static String getFileByPath(String path){
	  String fileString="";
	  BufferedReader reader = null;
	 try {
		File file=new File(path);
		  reader = new BufferedReader(new FileReader(file));
		  String temp="";
		 while ((temp=reader.readLine())!=null) {
			 fileString+=temp;
         }
	} catch (Exception e) {
		e.printStackTrace();
	}
	  return fileString;
  }
}
